import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import ReadinessBanner from "@/components/ReadinessBanner";

export default async function ExamensBlancsPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: exams } = await supabase
    .from("mock_exams")
    .select("score, total_questions, correct_count, passed, is_final, created_at")
    .eq("user_id", user.id)
    .order("created_at", { ascending: false })
    .limit(10);

  const { count: poolSize } = await supabase
    .from("questions")
    .select("id", { count: "exact", head: true });

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-5 pb-20">
      <h1 className="text-2xl font-bold">Examens blancs</h1>

      {exams && exams.length > 0 && <ReadinessBanner exams={exams.slice(0, 3)} />}

      <div className="dash-header p-6 flex flex-col gap-3">
        <p className="text-sm" style={{ color: "rgba(255,255,255,0.7)" }}>
          Conditions réelles : 40 questions (ou moins si le stock est limité), 30 minutes, 35 bonnes
          réponses minimum pour réussir.
        </p>
        <Link href="/examens-blancs/nouveau" className="btn-primary py-3.5 text-center">
          Commencer un examen blanc
        </Link>
        {poolSize !== null && poolSize < 40 && (
          <p className="text-xs" style={{ color: "var(--amber)" }}>
            ⚠️ Stock actuel : {poolSize} questions (au lieu de 40), en attendant plus de contenu.
          </p>
        )}
      </div>

      <div className="flex flex-col gap-2">
        <h2 className="text-sm font-semibold" style={{ color: "var(--ink-muted)" }}>HISTORIQUE</h2>
        {(!exams || exams.length === 0) && (
          <p className="text-sm" style={{ color: "var(--ink-muted)" }}>Aucun examen blanc passé pour l&apos;instant.</p>
        )}
        {exams?.map((e, i) => (
          <div key={i} className="card p-4 flex items-center justify-between">
            <div>
              <div className="font-medium dash-number flex items-center gap-2">
                {e.correct_count}/{e.total_questions} — {e.score}%
                {e.is_final && (
                  <span className="pill" style={{ background: "var(--amber-soft)", color: "#a3690f" }}>🏁 Final</span>
                )}
              </div>
              <div className="text-xs" style={{ color: "var(--ink-muted)" }}>
                {new Date(e.created_at).toLocaleDateString("fr-FR", { day: "numeric", month: "long", year: "numeric" })}
              </div>
            </div>
            <span
              className="pill"
              style={{
                background: e.passed ? "#e9f9ee" : "#fdeaea",
                color: e.passed ? "var(--success)" : "var(--danger)",
              }}
            >
              {e.passed ? "✅ Réussi" : "❌ Échoué"}
            </span>
          </div>
        ))}
      </div>
    </main>
  );
}
