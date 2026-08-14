/**
 * MOTEUR DE MAITRISE — le coeur du système de progression.
 *
 * Chaque notion (subtopic) a un score de 0 à 100 par utilisateur.
 * Ce fichier ne touche jamais à la base de données : ce sont des fonctions
 * pures, faciles à tester, réutilisées ensuite par l'API qui, elle,
 * lit/écrit dans Supabase.
 */

export type MasteryLevel = "non_maitrise" | "fragile" | "en_cours" | "maitrise" | "excellent";

export interface MasteryState {
  score: number;           // 0-100
  correctStreak: number;   // bonnes réponses d'affilée
  timesTested: number;
  lastErrorAt: Date | null;
}

export interface AttemptResult {
  isCorrect: boolean;
  difficulty: 1 | 2 | 3; // facile, moyen, difficile
}

/** Détermine le niveau (et l'emoji) à partir du score. */
export function getMasteryLevel(score: number): { level: MasteryLevel; emoji: string; label: string } {
  if (score < 40) return { level: "non_maitrise", emoji: "🔴", label: "Non maîtrisé" };
  if (score < 60) return { level: "fragile", emoji: "🟠", label: "Fragile" };
  if (score < 80) return { level: "en_cours", emoji: "🟡", label: "En cours d'acquisition" };
  if (score < 95) return { level: "maitrise", emoji: "🟢", label: "Maîtrisé" };
  return { level: "excellent", emoji: "⭐", label: "Très bien maîtrisé" };
}

/** Points de base gagnés/perdus selon la difficulté de la question. */
const GAIN_BY_DIFFICULTY: Record<number, number> = { 1: 8, 2: 11, 3: 15 };
const LOSS_BY_DIFFICULTY: Record<number, number> = { 1: -15, 2: -20, 3: -25 };
const STREAK_BONUS_THRESHOLD = 3;
const STREAK_BONUS = 5;
const RECENCY_ERROR_WINDOW_DAYS = 3;
const RECENCY_CAP = 70; // si erreur récente, le score ne peut pas dépasser ce plafond

/**
 * Calcule le nouvel état de maîtrise après une tentative.
 * C'est la fonction appelée à chaque réponse à une question.
 */
export function applyAttempt(current: MasteryState, attempt: AttemptResult, now: Date = new Date()): MasteryState {
  let { score, correctStreak } = current;
  const timesTested = current.timesTested + 1;
  let lastErrorAt = current.lastErrorAt;

  if (attempt.isCorrect) {
    score += GAIN_BY_DIFFICULTY[attempt.difficulty];
    correctStreak += 1;
    if (correctStreak > 0 && correctStreak % STREAK_BONUS_THRESHOLD === 0) {
      score += STREAK_BONUS;
    }
  } else {
    score += LOSS_BY_DIFFICULTY[attempt.difficulty];
    correctStreak = 0;
    lastErrorAt = now;
  }

  // Plafond si erreur récente (moins de 3 jours) : la notion reste "surveillée"
  if (lastErrorAt) {
    const daysSinceError = (now.getTime() - lastErrorAt.getTime()) / (1000 * 60 * 60 * 24);
    if (daysSinceError < RECENCY_ERROR_WINDOW_DAYS) {
      score = Math.min(score, RECENCY_CAP);
    }
  }

  score = Math.max(0, Math.min(100, Math.round(score)));

  return { score, correctStreak, timesTested, lastErrorAt };
}

/**
 * Répétition espacée simplifiée (inspirée de SM-2).
 * Retourne la prochaine date à laquelle la notion doit revenir en révision.
 */
export function nextReviewDate(state: MasteryState, now: Date = new Date()): Date {
  const level = getMasteryLevel(state.score).level;
  const next = new Date(now);

  if (level === "non_maitrise" || level === "fragile") {
    next.setDate(next.getDate() + 1); // revoir demain
  } else if (level === "en_cours" || level === "maitrise") {
    next.setDate(next.getDate() + 3); // revoir dans 3 jours
  } else {
    next.setDate(next.getDate() + 7); // excellent : revoir dans 7 jours
  }
  return next;
}

/** XP gagné pour une bonne réponse, selon la difficulté. */
export function xpForAttempt(attempt: AttemptResult): number {
  if (!attempt.isCorrect) return 0;
  return attempt.difficulty === 3 ? 20 : 10;
}
