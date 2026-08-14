import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { applyAttempt, nextReviewDate, xpForAttempt, MasteryState } from "@/lib/mastery";

/**
 * POST /api/attempt
 * body: { userId, questionId, subtopicId, isCorrect, difficulty }
 *
 * Enregistre une tentative, met à jour la maîtrise de la notion concernée
 * et attribue de l'XP. C'est le point d'entrée unique pour "répondre à une question".
 */
export async function POST(req: NextRequest) {
  const supabase = await createClient();

  // Vérifie la session réelle (cookies) plutôt que de faire confiance au userId envoyé par le client
  const { data: { user }, error: authError } = await supabase.auth.getUser();
  if (authError || !user) {
    return NextResponse.json({ error: "Non authentifié" }, { status: 401 });
  }

  const { questionId, subtopicId, isCorrect, difficulty } = await req.json();
  const userId = user.id;

  if (!questionId || !subtopicId || typeof isCorrect !== "boolean" || !difficulty) {
    return NextResponse.json({ error: "Paramètres manquants" }, { status: 400 });
  }

  // 1. Enregistrer la tentative brute (historique complet)
  const { error: attemptError } = await supabase.from("attempts").insert({
    user_id: userId,
    question_id: questionId,
    is_correct: isCorrect,
  });
  if (attemptError) {
    return NextResponse.json({ error: attemptError.message }, { status: 500 });
  }

  // 2. Récupérer l'état actuel de maîtrise pour cette notion (ou créer un état neutre)
  const { data: existing } = await supabase
    .from("mastery")
    .select("*")
    .eq("user_id", userId)
    .eq("subtopic_id", subtopicId)
    .maybeSingle();

  const currentState: MasteryState = existing
    ? {
        score: existing.score,
        correctStreak: existing.correct_streak,
        timesTested: existing.times_tested,
        lastErrorAt: existing.last_error_at ? new Date(existing.last_error_at) : null,
      }
    : { score: 0, correctStreak: 0, timesTested: 0, lastErrorAt: null };

  // 3. Appliquer la logique de maîtrise (fonction pure testée séparément)
  const newState = applyAttempt(currentState, { isCorrect, difficulty });
  const reviewDate = nextReviewDate(newState);

  // 4. Sauvegarder le nouvel état (upsert : crée ou met à jour)
  const { error: masteryError } = await supabase.from("mastery").upsert(
    {
      user_id: userId,
      subtopic_id: subtopicId,
      score: newState.score,
      correct_streak: newState.correctStreak,
      times_tested: newState.timesTested,
      last_error_at: newState.lastErrorAt,
      next_review_date: reviewDate.toISOString().split("T")[0],
      updated_at: new Date().toISOString(),
    },
    { onConflict: "user_id,subtopic_id" }
  );
  if (masteryError) {
    return NextResponse.json({ error: masteryError.message }, { status: 500 });
  }

  // 5. Attribuer l'XP correspondant
  const xp = xpForAttempt({ isCorrect, difficulty });
  if (xp > 0) {
    await supabase.from("xp_log").insert({
      user_id: userId,
      amount: xp,
      reason: isCorrect ? "bonne_reponse" : "tentative",
    });
  }

  return NextResponse.json({ newScore: newState.score, xpGained: xp });
}
