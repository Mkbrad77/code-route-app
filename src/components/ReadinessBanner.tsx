interface Exam {
  correct_count: number;
  total_questions: number;
}

export default function ReadinessBanner({ exams }: { exams: Exam[] }) {
  if (exams.length === 0) return null;

  const ratios = exams.map((e) => e.correct_count / e.total_questions);
  const avgRatio = ratios.reduce((a, b) => a + b, 0) / ratios.length;
  const equivOn40 = Math.round(avgRatio * 40);

  let status: { emoji: string; label: string; color: string; bg: string };
  if (avgRatio >= 35 / 40) {
    status = { emoji: "✅", label: "Tu es prêt", color: "var(--success)", bg: "#e9f9ee" };
  } else if (avgRatio >= 0.7) {
    status = { emoji: "🟠", label: "Presque prêt", color: "#a3690f", bg: "var(--amber-soft)" };
  } else {
    status = { emoji: "🔴", label: "Encore du travail", color: "var(--danger)", bg: "#fdeaea" };
  }

  return (
    <div className="card p-5 flex items-center gap-4" style={{ background: status.bg }}>
      <span className="text-3xl">{status.emoji}</span>
      <div>
        <div className="font-semibold text-sm" style={{ color: status.color }}>{status.label}</div>
        <div className="text-xs dash-number" style={{ color: "var(--ink-muted)" }}>
          Moyenne sur tes {exams.length} dernier{exams.length > 1 ? "s" : ""} examen{exams.length > 1 ? "s" : ""} : {equivOn40}/40 ({Math.round(avgRatio * 100)}%)
        </div>
      </div>
    </div>
  );
}
