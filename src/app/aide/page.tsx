import Link from "next/link";

const sections = [
  {
    icon: "📅",
    title: "Le programme sur 10 jours",
    text: "À partir du jour où tu t'inscris, l'app te donne un programme précis pour 10 jours. Chaque jour couvre 1 à 5 thèmes définis à l'avance — pas besoin de choisir quoi réviser, ouvre juste l'app et suis le programme du jour affiché sur \"Aujourd'hui\". Le jour 10 est réservé à la révision générale et à un examen blanc final.",
  },
  {
    icon: "📘",
    title: "Les cours en cartes courtes",
    text: "Chaque notion se découvre en petites cartes (pas de pavé de texte) : la règle à connaître, le piège classique de l'examen, ce qu'on confond souvent, ce qu'il faut mémoriser, une astuce de calcul ou d'élimination, puis une situation réelle. À la fin, un quiz de quelques questions.",
  },
  {
    icon: "🟢",
    title: "Le score de maîtrise",
    text: "Chaque notion a un score de 0 à 100 (🔴 Non maîtrisé → ⭐ Très bien maîtrisé). Il monte quand tu réponds juste, descend quand tu te trompes. Une notion mal maîtrisée revient plus souvent dans tes révisions grâce à la répétition espacée — pas besoin d'y penser, l'app s'en charge.",
  },
  {
    icon: "🔁",
    title: "La répétition espacée",
    text: "Une notion ratée revient dès le lendemain. Une notion bien maîtrisée revient plus tard (3 à 7 jours). Tu les retrouves chaque jour dans le bloc \"À réviser aujourd'hui\" sur la page Aujourd'hui.",
  },
  {
    icon: "⚠️",
    title: "Mes erreurs",
    text: "Cette page liste les notions que tu rates le plus souvent, triées par nombre d'erreurs. Utile pour un rattrapage ciblé avant l'examen.",
  },
  {
    icon: "📝",
    title: "Les examens blancs",
    text: "40 questions mélangées, 30 minutes chronométrées, aucune correction avant la fin — exactement les conditions réelles. Le seuil de réussite est calé sur le vrai examen (35/40, soit 87,5%). Fais-en plusieurs dans les derniers jours pour prendre le rythme.",
  },
  {
    icon: "🌙",
    title: "Terminer sa journée",
    text: "En bas de la page Aujourd'hui, le bouton \"Terminer ma journée\" calcule ton score sur les questions du jour et te dit si la journée est validée (🟢 ≥80%), partiellement validée (🟠 60-79%) ou à refaire (🔴 <60%).",
  },
  {
    icon: "🏆",
    title: "XP, niveau et badges",
    text: "Chaque bonne réponse rapporte de l'XP, qui fait monter ton niveau. Des badges se débloquent en cours de route (première session, 7 jours de suite, premier examen blanc réussi...). Tout ça est visible sur la page Progression.",
  },
];

export default function AidePage() {
  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-4 pb-20">
      <Link href="/profil" className="text-sm" style={{ color: "var(--ink-muted)" }}>← Profil</Link>
      <h1 className="text-2xl font-bold">Comment utiliser l&apos;app</h1>
      <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
        Tout ce qu&apos;il faut savoir pour bien démarrer, en quelques lignes par fonctionnalité.
      </p>
      <div className="route-divider" />

      <div className="flex flex-col gap-3">
        {sections.map((s) => (
          <div key={s.title} className="card p-5 flex gap-4">
            <span className="text-2xl shrink-0">{s.icon}</span>
            <div>
              <h2 className="font-semibold text-sm mb-1">{s.title}</h2>
              <p className="text-sm" style={{ color: "var(--ink-muted)" }}>{s.text}</p>
            </div>
          </div>
        ))}
      </div>

      <Link href="/aujourdhui" className="btn-primary py-3.5 text-center mt-2">
        C&apos;est parti
      </Link>
    </main>
  );
}
