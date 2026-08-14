/**
 * Calcule le "jour" du programme à partir de l'activité réelle de l'utilisateur,
 * pas de la date d'inscription. Un jour ne compte comme "passé" que si l'utilisateur
 * y a répondu à au moins une question. Si l'utilisateur saute plusieurs jours sans
 * ouvrir l'app, le programme ne bouge pas — il reprend exactement là où il s'était arrêté.
 */
export function computeDayNumber(
  attemptDates: { answered_at: string }[] | null | undefined,
  totalDays = 10
): number {
  const todayStr = new Date().toISOString().split("T")[0];
  const pastActiveDays = new Set(
    (attemptDates ?? [])
      .map((a) => new Date(a.answered_at).toISOString().split("T")[0])
      .filter((d) => d < todayStr)
  );
  return Math.min(totalDays, pastActiveDays.size + 1);
}
