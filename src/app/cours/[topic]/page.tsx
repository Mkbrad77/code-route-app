import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { iconForTopic } from "@/lib/topicIcons";

export default async function TopicPage({ params }: { params: Promise<{ topic: string }> }) {
  const { topic: topicSlug } = await params;
  const supabase = await createClient();

  const { data: topic } = await supabase
    .from("topics")
    .select("id, name")
    .eq("slug", topicSlug)
    .maybeSingle();

  if (!topic) notFound();

  const { data: subtopics } = await supabase
    .from("subtopics")
    .select("id, slug, title")
    .eq("topic_id", topic.id);

  const { data: { user } } = await supabase.auth.getUser();
  let masteryBySubtopic: Record<number, number> = {};
  if (user && subtopics) {
    const { data: mastery } = await supabase
      .from("mastery")
      .select("subtopic_id, score")
      .eq("user_id", user.id)
      .in("subtopic_id", subtopics.map((s) => s.id));
    masteryBySubtopic = Object.fromEntries((mastery ?? []).map((m) => [m.subtopic_id, m.score]));
  }

  function levelStyle(score: number | undefined) {
    if (score === undefined) return { emoji: "⚪", bg: "#f3f4f6", color: "var(--ink-muted)" };
    if (score < 40) return { emoji: "🔴", bg: "#fdeaea", color: "var(--danger)" };
    if (score < 60) return { emoji: "🟠", bg: "var(--amber-soft)", color: "#a3690f" };
    if (score < 80) return { emoji: "🟡", bg: "#fef9e7", color: "#a3830f" };
    if (score < 95) return { emoji: "🟢", bg: "#e9f9ee", color: "var(--success)" };
    return { emoji: "⭐", bg: "var(--accent-soft)", color: "var(--accent)" };
  }

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-4 pb-20">
      <Link href="/cours" className="text-sm" style={{ color: "var(--ink-muted)" }}>← Thèmes</Link>
      <div className="flex items-center gap-3">
        <div
          className="w-12 h-12 rounded-xl flex items-center justify-center text-2xl shrink-0"
          style={{ background: "var(--accent-soft)" }}
        >
          {iconForTopic(topicSlug)}
        </div>
        <h1 className="text-2xl font-bold">{topic.name}</h1>
      </div>
      <div className="route-divider" />
      <div className="grid gap-2.5">
        {subtopics?.map((s) => {
          const style = levelStyle(masteryBySubtopic[s.id]);
          return (
            <Link
              key={s.id}
              href={`/cours/${topicSlug}/${s.slug}`}
              className="card p-4 flex items-center justify-between transition hover:-translate-y-0.5"
            >
              <span className="font-medium">{s.title}</span>
              <span className="pill" style={{ background: style.bg, color: style.color }}>
                {style.emoji}
              </span>
            </Link>
          );
        })}
      </div>
    </main>
  );
}
