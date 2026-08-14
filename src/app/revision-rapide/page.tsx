import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import RapidReviewSession from "@/components/RapidReviewSession";
import { iconForTopic } from "@/lib/topicIcons";

export default async function RevisionRapidePage({
  searchParams,
}: {
  searchParams: Promise<{ topic?: string }>;
}) {
  const { topic: topicFilter } = await searchParams;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: topics } = await supabase.from("topics").select("slug, name").order("order");

  let query = supabase
    .from("subtopics")
    .select("title, a_connaitre, pieges, a_memoriser, astuce, topics!inner(slug, name)");

  if (topicFilter) {
    query = query.eq("topics.slug", topicFilter);
  }

  const { data: subtopics } = await query;

  type Row = { title: string; a_connaitre: string; pieges: string; a_memoriser: string; astuce: string | null; topics: { slug: string; name: string } };
  const items = ((subtopics ?? []) as unknown as Row[]).map((s) => ({
    topicName: s.topics.name,
    title: s.title,
    aConnaitre: s.a_connaitre,
    pieges: s.pieges,
    memoriser: s.a_memoriser,
    astuce: s.astuce,
  }));

  return (
    <div className="pb-20">
      <div className="max-w-md mx-auto px-6 pt-6 flex flex-col gap-3">
        <Link href="/cours" className="text-sm" style={{ color: "var(--ink-muted)" }}>← Cours</Link>
        <h1 className="text-xl font-bold">Révision rapide</h1>
        <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
          Repasse en revue l&apos;essentiel de chaque notion, sans quiz — idéal la veille de l&apos;examen.
        </p>
        <div className="flex gap-2 overflow-x-auto pb-1">
          <Link
            href="/revision-rapide"
            className="pill shrink-0"
            style={!topicFilter ? { background: "var(--accent)", color: "white" } : { background: "var(--bg)", color: "var(--ink-muted)" }}
          >
            Tous les thèmes
          </Link>
          {topics?.map((t) => (
            <Link
              key={t.slug}
              href={`/revision-rapide?topic=${t.slug}`}
              className="pill shrink-0"
              style={topicFilter === t.slug ? { background: "var(--accent)", color: "white" } : { background: "var(--bg)", color: "var(--ink-muted)" }}
            >
              {iconForTopic(t.slug)} {t.name}
            </Link>
          ))}
        </div>
      </div>

      <RapidReviewSession items={items} />
    </div>
  );
}
