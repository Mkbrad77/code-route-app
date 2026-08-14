/**
 * Programme fixe de 10 jours : quels thèmes étudier chaque jour.
 * Le jour 1 démarre à la date d'inscription de l'utilisateur (voir dayNumber calculé ailleurs).
 * 23 thèmes répartis sur les jours 1 à 9, le jour 10 est réservé à la révision + l'examen final.
 */

export interface CurriculumDay {
  day: number;
  label: string;
  topics: string[]; // slugs des thèmes
  isReviewDay?: boolean;
}

export const CURRICULUM: CurriculumDay[] = [
  { day: 1, label: "Les fondamentaux de la priorité", topics: ["priorites", "signalisation"] },
  { day: 2, label: "Dépassements et intersections", topics: ["depassements", "intersections-ronds-points"] },
  { day: 3, label: "Vitesse et distances de sécurité", topics: ["vitesse", "distances-securite"] },
  { day: 4, label: "Le conducteur et son comportement", topics: ["conducteur-etat", "conducteur-comportement"] },
  { day: 5, label: "Les usagers vulnérables", topics: ["usagers-vulnerables", "pietons", "cyclistes"] },
  { day: 6, label: "Deux-roues et autoroute", topics: ["deux-roues-motorises", "autoroute"] },
  { day: 7, label: "Nuit et conditions difficiles", topics: ["conduite-nuit", "meteo-conditions-difficiles"] },
  { day: 8, label: "Stationnement et véhicule", topics: ["stationnement", "securite-vehicule", "equipements-obligatoires"] },
  { day: 9, label: "Le reste du programme", topics: ["premiers-secours", "securite-passagers", "environnement-eco-conduite", "documents-reglementation", "situations-particulieres"] },
  { day: 10, label: "Révision générale + examen final", topics: [], isReviewDay: true },
];

export const TOTAL_DAYS = 10;

export function curriculumForDay(day: number): CurriculumDay {
  return CURRICULUM.find((d) => d.day === day) ?? CURRICULUM[CURRICULUM.length - 1];
}
