import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export default async function ErreursPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: attempts } = await supabase
    .from("attempts")
    .select("is_correct, questions(subtopic_id, subtopics(slug, title, topics(slug, name)))")
    .eq("user_id", user.id);

  type Row = {
    is_correct: boolean;
    questions: { subtopic_id: number; subtopics: { slug: string; title: string; topics: { slug: string; name: string } } } | null;
  };
  const rows = (attempts ?? []) as unknown as Row[];

  type Agg = { slug: string; title: string; topicSlug: string; topicName: string; total: number; wrong: number };
  const bySubtopic = new Map<number, Agg>();
  for (const r of rows) {
    const sub = r.questions?.subtopics;
    const subtopicId = r.questions?.subtopic_id;
    if (!sub || !subtopicId) continue;
    if (!bySubtopic.has(subtopicId)) {
      bySubtopic.set(subtopicId, { slug: sub.slug, title: sub.title, topicSlug: sub.topics.slug, topicName: sub.topics.name, total: 0, wrong: 0 });
    }
    const agg = bySubtopic.get(subtopicId)!;
    agg.total += 1;
    if (!r.is_correct) agg.wrong += 1;
  }

  const weakest = Array.from(bySubtopic.values())
    .filter((a) => a.wrong > 0)
    .sort((a, b) => b.wrong - a.wrong || b.wrong / b.total - a.wrong / a.total);

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-4 pb-20">
      <h1 className="text-2xl font-bold">Mes erreurs</h1>
      <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
        Les notions que tu rates le plus souvent — clique dessus pour revoir la règle et retenter.
      </p>
      <div className="route-divider" />

      {weakest.length === 0 ? (
        <div className="card p-6 text-center text-sm" style={{ color: "var(--ink-muted)" }}>
          Aucune erreur enregistrée pour l&apos;instant — continue comme ça, ou reviens ici après quelques
          sessions de cours.
        </div>
      ) : (
        <div className="flex flex-col gap-2.5">
          {weakest.map((a) => (
            <Link key={a.slug} href={`/cours/${a.topicSlug}/${a.slug}`} className="card p-4 flex items-center justify-between">
              <div>
                <div className="font-medium">⚠️ {a.title}</div>
                <div className="text-xs" style={{ color: "var(--ink-muted)" }}>{a.topicName}</div>
              </div>
              <span className="pill dash-number" style={{ background: "#fdeaea", color: "var(--danger)" }}>
                {a.wrong}/{a.total}
              </span>
            </Link>
          ))}
        </div>
      )}
    </main>
  );
}
