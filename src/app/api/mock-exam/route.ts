import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

/**
 * POST /api/mock-exam
 * body: { totalQuestions, correctCount }
 * Enregistre le résultat d'un examen blanc terminé.
 */
export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user }, error: authError } = await supabase.auth.getUser();
  if (authError || !user) {
    return NextResponse.json({ error: "Non authentifié" }, { status: 401 });
  }

  const { totalQuestions, correctCount, isFinal } = await req.json();
  if (!totalQuestions || typeof correctCount !== "number") {
    return NextResponse.json({ error: "Paramètres manquants" }, { status: 400 });
  }

  // Seuil de réussite proportionnel à 35/40 (87,5%), comme le vrai examen
  const score = Math.round((correctCount / totalQuestions) * 100);
  const passed = correctCount / totalQuestions >= 35 / 40;

  const { error } = await supabase.from("mock_exams").insert({
    user_id: user.id,
    score,
    total_questions: totalQuestions,
    correct_count: correctCount,
    passed,
    is_final: !!isFinal,
  });

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ score, passed });
}
