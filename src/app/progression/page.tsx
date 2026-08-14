import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import TopicMasteryChart from "@/components/TopicMasteryChart";
import { getMasteryLevel } from "@/lib/mastery";
import { levelFromXp, xpToNextLevel, computeBadges } from "@/lib/gamification";
import { computeDayNumber } from "@/lib/dayNumber";

function daysBetween(a: Date, b: Date) {
  const ms = b.setHours(0, 0, 0, 0) - a.setHours(0, 0, 0, 0);
  return Math.floor(ms / (1000 * 60 * 60 * 24));
}

export default async function ProgressionPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: mastery } = await supabase
    .from("mastery")
    .select("score, subtopic_id, subtopics(topic_id, topics(name))")
    .eq("user_id", user.id);

  const { count: totalSubtopics } = await supabase
    .from("subtopics")
    .select("id", { count: "exact", head: true });

  const { data: attempts } = await supabase
    .from("attempts")
    .select("is_correct")
    .eq("user_id", user.id);

  const { data: xpRows } = await supabase
    .from("xp_log")
    .select("amount")
    .eq("user_id", user.id);

  const { data: mockExams } = await supabase
    .from("mock_exams")
    .select("passed")
    .eq("user_id", user.id);

  const { data: attemptDates } = await supabase
    .from("attempts")
    .select("answered_at")
    .eq("user_id", user.id)
    .order("answered_at", { ascending: false })
    .limit(500);

  type MasteryRow = { score: number; subtopic_id: number; subtopics: { topic_id: number; topics: { name: string } | null } | null };
  const masteryRows = (mastery ?? []) as unknown as MasteryRow[];

  const byTopic = new Map<string, number[]>();
  for (const row of masteryRows) {
    const topicName = row.subtopics?.topics?.name ?? "Autre";
    if (!byTopic.has(topicName)) byTopic.set(topicName, []);
    byTopic.get(topicName)!.push(row.score);
  }
  const chartData = Array.from(byTopic.entries())
    .map(([name, scores]) => ({ name, score: Math.round(scores.reduce((a, b) => a + b, 0) / scores.length) }))
    .sort((a, b) => b.score - a.score);

  const notionsPratiquees = masteryRows.length;
  const globalScore = notionsPratiquees > 0
    ? Math.round(masteryRows.reduce((sum, r) => sum + r.score, 0) / notionsPratiquees)
    : 0;
  const couverture = totalSubtopics ? Math.round((notionsPratiquees / totalSubtopics) * 100) : 0;

  const totalAttempts = attempts?.length ?? 0;
  const correctAttempts = attempts?.filter((a) => a.is_correct).length ?? 0;
  const successRate = totalAttempts > 0 ? Math.round((correctAttempts / totalAttempts) * 100) : 0;
  const totalXp = xpRows?.reduce((sum, r) => sum + r.amount, 0) ?? 0;
  const notionsMaitrisees = masteryRows.filter((r) => r.score >= 80).length;
  const notionsFragiles = masteryRows.filter((r) => r.score < 60).length;
  const level = getMasteryLevel(globalScore);

  const uniqueDays = Array.from(
    new Set((attemptDates ?? []).map((a) => new Date(a.answered_at).toISOString().split("T")[0]))
  ).sort((a, b) => (a < b ? 1 : -1));
  let streak = 0;
  if (uniqueDays.length > 0) {
    const todayStr = new Date().toISOString().split("T")[0];
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const yesterdayStr = yesterday.toISOString().split("T")[0];
    if (uniqueDays[0] === todayStr || uniqueDays[0] === yesterdayStr) {
      streak = 1;
      let prev = new Date(uniqueDays[0]);
      for (let i = 1; i < uniqueDays.length; i++) {
        const d = new Date(uniqueDays[i]);
        if (daysBetween(d, new Date(prev)) === 1) {
          streak += 1;
          prev = d;
        } else break;
      }
    }
  }

  const dayNumber = computeDayNumber(attemptDates);

  const gamLevel = levelFromXp(totalXp);
  const { progress: xpProgress, needed: xpNeeded } = xpToNextLevel(totalXp);
  const bestSubtopicScore = masteryRows.reduce((max, r) => Math.max(max, r.score), 0);
  const badges = computeBadges({
    totalAttempts,
    streak,
    mockExamsPassed: mockExams?.filter((e) => e.passed).length ?? 0,
    mockExamsTaken: mockExams?.length ?? 0,
    bestSubtopicScore,
    dayNumber,
  });

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-5 pb-20">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Progression</h1>
        <Link href="/cours" className="text-sm" style={{ color: "var(--ink-muted)" }}>Cours →</Link>
      </div>

      {/* Score global — bandeau tableau de bord */}
      <div className="dash-header p-6 flex flex-col items-center gap-1 text-center">
        <div className="text-4xl">{level.emoji}</div>
        <div className="dash-number text-4xl text-white">{globalScore}%</div>
        <div className="text-sm" style={{ color: "rgba(255,255,255,0.6)" }}>de maîtrise sur les notions pratiquées</div>
        <div className="route-divider on-dark mt-2 mb-1 w-2/3" />
        <div className="text-xs dash-number" style={{ color: "rgba(255,255,255,0.5)" }}>
          {couverture}% du programme · {notionsPratiquees}/{totalSubtopics ?? "?"} notions
        </div>
      </div>

      <div className="grid grid-cols-2 gap-3">
        <StatCard label="Questions répondues" value={totalAttempts} />
        <StatCard label="Taux de réussite" value={`${successRate}%`} />
        <StatCard label="Notions maîtrisées 🟢⭐" value={notionsMaitrisees} />
        <StatCard label="Notions fragiles 🔴🟠" value={notionsFragiles} />
      </div>

      {/* Niveau / XP */}
      <div className="card p-5 flex items-center justify-between" style={{ background: "var(--amber-soft)" }}>
        <div>
          <div className="text-lg font-bold">Niveau {gamLevel}</div>
          <div className="text-xs dash-number" style={{ color: "var(--ink-muted)" }}>{totalXp} XP au total</div>
        </div>
        <div className="w-28">
          <div className="h-2 bg-white rounded-full overflow-hidden">
            <div className="h-full" style={{ width: `${(xpProgress / xpNeeded) * 100}%`, background: "var(--amber)" }} />
          </div>
          <div className="text-[10px] dash-number text-right mt-1" style={{ color: "var(--ink-muted)" }}>{xpProgress}/{xpNeeded} XP</div>
        </div>
      </div>

      {/* Badges */}
      <div className="card p-5">
        <h2 className="text-sm font-semibold mb-3" style={{ color: "var(--ink-muted)" }}>BADGES</h2>
        <div className="grid grid-cols-3 gap-3">
          {badges.map((b) => (
            <div
              key={b.code}
              className="flex flex-col items-center gap-1 text-center p-2 rounded-xl"
              style={{ background: b.unlocked ? "var(--bg)" : "transparent", opacity: b.unlocked ? 1 : 0.3 }}
            >
              <span className="text-2xl">{b.emoji}</span>
              <span className="text-[10px]" style={{ color: "var(--ink-muted)" }}>{b.label}</span>
            </div>
          ))}
        </div>
      </div>

      {chartData.length > 0 ? (
        <div className="card p-5">
          <h2 className="text-sm font-semibold mb-3" style={{ color: "var(--ink-muted)" }}>MAÎTRISE PAR THÈME</h2>
          <TopicMasteryChart data={chartData} />
        </div>
      ) : (
        <div className="card p-6 text-center text-sm" style={{ color: "var(--ink-muted)" }}>
          Aucune notion pratiquée pour l&apos;instant — commence un cours pour voir ta progression ici.
        </div>
      )}

      <Link href="/cours" className="btn-primary py-3.5 text-center">
        Continuer les cours
      </Link>
    </main>
  );
}

function StatCard({ label, value }: { label: string; value: string | number }) {
  return (
    <div className="card p-4 flex flex-col gap-1">
      <div className="text-2xl font-bold dash-number">{value}</div>
      <div className="text-xs" style={{ color: "var(--ink-muted)" }}>{label}</div>
    </div>
  );
}
