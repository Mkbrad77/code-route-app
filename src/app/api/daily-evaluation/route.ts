import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

/**
 * POST /api/daily-evaluation
 * body: { dayNumber }
 * Calcule le bilan de la journée à partir des tentatives du jour et l'enregistre.
 */
export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user }, error: authError } = await supabase.auth.getUser();
  if (authError || !user) {
    return NextResponse.json({ error: "Non authentifié" }, { status: 401 });
  }

  const { dayNumber } = await req.json();
  if (!dayNumber) {
    return NextResponse.json({ error: "Paramètres manquants" }, { status: 400 });
  }

  const startOfDay = new Date();
  startOfDay.setHours(0, 0, 0, 0);

  const { data: todaysAttempts } = await supabase
    .from("attempts")
    .select("is_correct, questions(subtopic_id, subtopics(title))")
    .eq("user_id", user.id)
    .gte("answered_at", startOfDay.toISOString());

  type Row = { is_correct: boolean; questions: { subtopic_id: number; subtopics: { title: string } } | null };
  const rows = (todaysAttempts ?? []) as unknown as Row[];

  if (rows.length === 0) {
    return NextResponse.json({ error: "Aucune activité aujourd'hui" }, { status: 400 });
  }

  const correct = rows.filter((r) => r.is_correct).length;
  const score = Math.round((correct / rows.length) * 100);

  // Regrouper par notion pour identifier faibles/fortes du jour
  const bySubtopic = new Map<number, { title: string; total: number; correct: number }>();
  for (const r of rows) {
    const subId = r.questions?.subtopic_id;
    const title = r.questions?.subtopics?.title;
    if (!subId || !title) continue;
    if (!bySubtopic.has(subId)) bySubtopic.set(subId, { title, total: 0, correct: 0 });
    const agg = bySubtopic.get(subId)!;
    agg.total += 1;
    if (r.is_correct) agg.correct += 1;
  }
  const weakIds: number[] = [];
  const strongIds: number[] = [];
  const weak: string[] = [];
  const strong: string[] = [];
  for (const [subId, agg] of bySubtopic) {
    const rate = agg.correct / agg.total;
    if (rate < 0.6) {
      weak.push(agg.title);
      weakIds.push(subId);
    } else if (rate >= 0.8) {
      strong.push(agg.title);
      strongIds.push(subId);
    }
  }

  const status = score >= 80 ? "validated" : score >= 60 ? "partial" : "failed";

  const { error } = await supabase.from("daily_evaluations").insert({
    user_id: user.id,
    day_number: dayNumber,
    score,
    weak_subtopics: weakIds,
    strong_subtopics: strongIds,
  });
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ score, status, weak, strong, questionsAnswered: rows.length });
}
