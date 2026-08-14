/** Calcule le niveau à partir de l'XP total (paliers de 500 XP). */
export function levelFromXp(xp: number) {
  return Math.floor(xp / 500) + 1;
}

export function xpToNextLevel(xp: number) {
  const level = levelFromXp(xp);
  const currentLevelFloor = (level - 1) * 500;
  const progress = xp - currentLevelFloor;
  return { level, progress, needed: 500 };
}

export interface BadgeInput {
  totalAttempts: number;
  streak: number;
  mockExamsPassed: number;
  mockExamsTaken: number;
  bestSubtopicScore: number;
  dayNumber: number;
}

export interface Badge {
  code: string;
  emoji: string;
  label: string;
  unlocked: boolean;
}

/** Calcule dynamiquement les badges débloqués à partir des stats de l'utilisateur. */
export function computeBadges(input: BadgeInput): Badge[] {
  return [
    { code: "first_session", emoji: "🏆", label: "Première session", unlocked: input.totalAttempts > 0 },
    { code: "streak_7", emoji: "🔥", label: "7 jours de suite", unlocked: input.streak >= 7 },
    { code: "first_mock_exam", emoji: "📝", label: "Premier examen blanc", unlocked: input.mockExamsTaken >= 1 },
    { code: "mock_exam_passed", emoji: "✅", label: "Examen blanc réussi", unlocked: input.mockExamsPassed >= 1 },
    { code: "notion_master", emoji: "🧠", label: "Notion maîtrisée à ⭐", unlocked: input.bestSubtopicScore >= 95 },
    { code: "program_complete", emoji: "🚗", label: "Programme 10 jours", unlocked: input.dayNumber >= 10 },
  ];
}
