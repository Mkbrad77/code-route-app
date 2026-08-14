import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { iconForTopic } from "@/lib/topicIcons";

export default async function CoursIndex() {
  const supabase = await createClient();
  const { data: topics } = await supabase
    .from("topics")
    .select("id, slug, name, subtopics(count)")
    .order("order");

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-4 pb-20">
      <h1 className="text-2xl font-bold">Les cours</h1>
      <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
        {topics?.length ?? 0} thèmes, format court — une carte à la fois.
      </p>
      <Link href="/revision-rapide" className="card p-4 flex items-center gap-3">
        <span className="text-xl">⚡</span>
        <span className="font-medium flex-1">Révision rapide (sans quiz)</span>
        <span style={{ color: "var(--ink-muted)" }}>→</span>
      </Link>
      <div className="route-divider" />
      <div className="grid gap-2.5">
        {topics?.map((t) => (
          <Link
            key={t.id}
            href={`/cours/${t.slug}`}
            className="card p-4 flex items-center gap-3 transition hover:-translate-y-0.5"
          >
            <div
              className="w-11 h-11 rounded-xl flex items-center justify-center text-xl shrink-0"
              style={{ background: "var(--accent-soft)" }}
            >
              {iconForTopic(t.slug)}
            </div>
            <span className="font-medium flex-1">{t.name}</span>
            <span className="text-xs dash-number" style={{ color: "var(--ink-muted)" }}>
              {(t.subtopics as unknown as { count: number }[])?.[0]?.count ?? 0} notions
            </span>
          </Link>
        ))}
      </div>
    </main>
  );
}
