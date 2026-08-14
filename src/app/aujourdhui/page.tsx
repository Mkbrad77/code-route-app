import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import DailyWrapUp from "@/components/DailyWrapUp";
import DayTrack from "@/components/DayTrack";
import { iconForTopic } from "@/lib/topicIcons";
import { curriculumForDay } from "@/lib/curriculum";
import { computeDayNumber } from "@/lib/dayNumber";

function daysBetween(a: Date, b: Date) {
  const ms = b.setHours(0, 0, 0, 0) - a.setHours(0, 0, 0, 0);
  return Math.floor(ms / (1000 * 60 * 60 * 24));
}

export default async function AujourdhuiPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("exam_date, daily_goal_minutes")
    .eq("id", user.id)
    .maybeSingle();

  // Récupéré une seule fois, utilisé à la fois pour le jour du programme et le streak
  const { data: attemptDates } = await supabase
    .from("attempts")
    .select("answered_at")
    .eq("user_id", user.id)
    .order("answered_at", { ascending: false })
    .limit(500);

  const dayNumber = computeDayNumber(attemptDates);

  const today = new Date().toISOString().split("T")[0];

  const { data: dueReviews } = await supabase
    .from("mastery")
    .select("score, subtopic_id, next_review_date, subtopics(slug, title, topics(slug, name))")
    .eq("user_id", user.id)
    .lte("next_review_date", today)
    .order("score", { ascending: true })
    .limit(6);

  const { data: allSubtopics } = await supabase
    .from("subtopics")
    .select("id, topic_id, topics(slug, name)");

  const { data: allMastery } = await supabase
    .from("mastery")
    .select("subtopic_id, score")
    .eq("user_id", user.id);

  const masteryBySubtopic = new Map((allMastery ?? []).map((m) => [m.subtopic_id, m.score]));

  type TopicAgg = { slug: string; name: string; total: number; started: number; sumScore: number };
  const topicMap = new Map<number, TopicAgg>();
  for (const s of allSubtopics ?? []) {
    const topic = (s as unknown as { topics: { slug: string; name: string } }).topics;
    const topicId = s.topic_id;
    if (!topicMap.has(topicId)) {
      topicMap.set(topicId, { slug: topic.slug, name: topic.name, total: 0, started: 0, sumScore: 0 });
    }
    const agg = topicMap.get(topicId)!;
    agg.total += 1;
    const score = masteryBySubtopic.get(s.id);
    if (score !== undefined) {
      agg.started += 1;
      agg.sumScore += score;
    }
  }
  const topicsByMap = Array.from(topicMap.values())
    .map((t) => ({ ...t, avgScore: t.started > 0 ? Math.round(t.sumScore / t.started) : -1 }));

  const todaysCurriculum = curriculumForDay(dayNumber);

  const topicPriority = todaysCurriculum.isReviewDay
    ? [...topicsByMap]
        .sort((a, b) => {
          if (a.avgScore === -1 && b.avgScore !== -1) return -1;
          if (b.avgScore === -1 && a.avgScore !== -1) return 1;
          return a.avgScore - b.avgScore;
        })
        .slice(0, 3)
    : todaysCurriculum.topics
        .map((slug) => topicsByMap.find((t) => t.slug === slug))
        .filter((t): t is NonNullable<typeof t> => !!t);

  const uniqueDays = Array.from(
    new Set((attemptDates ?? []).map((a) => new Date(a.answered_at).toISOString().split("T")[0]))
  ).sort((a, b) => (a < b ? 1 : -1));

  let streak = 0;
  if (uniqueDays.length > 0) {
    const cursor = new Date();
    const todayStr = cursor.toISOString().split("T")[0];
    const yesterday = new Date(cursor);
    yesterday.setDate(yesterday.getDate() - 1);
    const yesterdayStr = yesterday.toISOString().split("T")[0];

    if (uniqueDays[0] === todayStr || uniqueDays[0] === yesterdayStr) {
      streak = 1;
      let prev = new Date(uniqueDays[0]);
      for (let i = 1; i < uniqueDays.length; i++) {
        const d = new Date(uniqueDays[i]);
        const diff = daysBetween(d, new Date(prev));
        if (diff === 1) {
          streak += 1;
          prev = d;
        } else {
          break;
        }
      }
    }
  }

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-5 pb-20">
      {/* Bandeau tableau de bord */}
      <div className="dash-header p-6 flex flex-col gap-4">
        <div className="flex items-end justify-between">
          <div>
            <div className="text-xs uppercase tracking-wide" style={{ color: "rgba(255,255,255,0.5)" }}>
              Jour
            </div>
            <div className="dash-number text-5xl text-white leading-none">{dayNumber}<span className="text-xl" style={{ color: "rgba(255,255,255,0.4)" }}>/10</span></div>
          </div>
          {streak > 0 && (
            <div className="flex items-center gap-1.5 px-3 py-1.5 rounded-full" style={{ background: "var(--amber)" }}>
              <span>🔥</span>
              <span className="dash-number text-sm text-white">{streak}</span>
            </div>
          )}
        </div>
        <DayTrack day={dayNumber} />
        <div className="route-divider on-dark" />
        <p className="text-sm" style={{ color: "rgba(255,255,255,0.6)" }}>
          ⏱️ {profile?.daily_goal_minutes ?? 45} min recommandées aujourd&apos;hui
        </p>
      </div>

      {/* Objectif du jour */}
      <div className="card p-5 flex flex-col gap-3">
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-semibold" style={{ color: "var(--ink-muted)" }}>🎯 PROGRAMME DU JOUR</h2>
          <Link href="/planning" className="text-xs" style={{ color: "var(--accent)" }}>Voir les 10 jours →</Link>
        </div>
        <p className="text-sm font-medium">{todaysCurriculum.label}</p>

        {todaysCurriculum.isReviewDay ? (
          <div className="flex flex-col gap-2">
            <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
              Pas de nouveau thème aujourd&apos;hui : repasse sur tes notions les plus faibles, puis lance
              un examen blanc complet dans les conditions réelles.
            </p>
            {topicPriority.map((t) => (
              <Link
                key={t.slug}
                href={`/cours/${t.slug}`}
                className="rounded-xl px-4 py-3 flex items-center gap-3 transition"
                style={{ background: "var(--bg)" }}
              >
                <span className="text-xl">{iconForTopic(t.slug)}</span>
                <span className="font-medium flex-1">{t.name}</span>
                <span className="pill" style={{ background: "var(--amber-soft)", color: "#a3690f" }}>
                  {t.avgScore === -1 ? "Nouveau" : `${t.avgScore}%`}
                </span>
              </Link>
            ))}
            <Link href="/examens-blancs/final" className="btn-primary py-3.5 text-center mt-1">
              Lancer l&apos;examen final
            </Link>
          </div>
        ) : (
          <div className="flex flex-col gap-2">
            {topicPriority.map((t) => (
              <Link
                key={t.slug}
                href={`/cours/${t.slug}`}
                className="rounded-xl px-4 py-3 flex items-center gap-3 transition"
                style={{ background: "var(--bg)" }}
              >
                <span className="text-xl">{iconForTopic(t.slug)}</span>
                <span className="font-medium flex-1">{t.name}</span>
                <span
                  className="pill"
                  style={{
                    background: t.avgScore === -1 ? "var(--accent-soft)" : "var(--amber-soft)",
                    color: t.avgScore === -1 ? "var(--accent)" : "#a3690f",
                  }}
                >
                  {t.avgScore === -1 ? "Nouveau" : `${t.avgScore}%`}
                </span>
              </Link>
            ))}
          </div>
        )}
      </div>

      {/* Révisions dues */}
      {dueReviews && dueReviews.length > 0 && (
        <div className="card p-5 flex flex-col gap-3">
          <h2 className="text-sm font-semibold" style={{ color: "var(--ink-muted)" }}>🔁 À RÉVISER AUJOURD&apos;HUI</h2>
          <div className="flex flex-col gap-2">
            {dueReviews.map((r) => {
              const sub = (r as unknown as { subtopics: { slug: string; title: string; topics: { slug: string } } }).subtopics;
              return (
                <Link
                  key={r.subtopic_id}
                  href={`/cours/${sub.topics.slug}/${sub.slug}`}
                  className="rounded-xl px-4 py-3 flex items-center justify-between transition"
                  style={{ background: "var(--bg)" }}
                >
                  <span className="text-sm font-medium">{sub.title}</span>
                  <span className="dash-number text-xs" style={{ color: "var(--ink-muted)" }}>{r.score}/100</span>
                </Link>
              );
            })}
          </div>
        </div>
      )}

      <div className="flex flex-col gap-2">
        <Link href={topicPriority[0] ? `/cours/${topicPriority[0].slug}` : "/cours"} className="btn-primary py-3.5 text-center">
          Commencer ma session
        </Link>
        <Link href="/examens-blancs" className="btn-secondary py-3 text-center text-sm">
          Faire un test du jour (examen blanc)
        </Link>
      </div>

      <DailyWrapUp dayNumber={dayNumber} />
    </main>
  );
}
