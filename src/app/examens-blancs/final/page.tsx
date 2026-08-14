import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export default async function ExamenFinalIntroPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  return (
    <main className="max-w-md mx-auto p-6 flex flex-col gap-5 mt-10 pb-20">
      <div className="dash-header p-7 flex flex-col items-center gap-3 text-center">
        <div className="text-5xl">🏁</div>
        <h1 className="text-xl font-bold text-white">Jour 10 — Examen final</h1>
        <p className="text-sm" style={{ color: "rgba(255,255,255,0.7)" }}>
          C&apos;est le moment de mettre à l&apos;épreuve tout ce que tu as appris ces 10 derniers jours,
          dans les conditions exactes de l&apos;examen réel.
        </p>
      </div>

      <div className="card p-5 flex flex-col gap-2 text-sm" style={{ color: "var(--ink-muted)" }}>
        <p>📝 40 questions mélangées (ou moins selon le stock disponible)</p>
        <p>⏱️ 30 minutes chronométrées</p>
        <p>🚫 Aucune correction avant la fin</p>
        <p>✅ Seuil de réussite : 35/40 (87,5%), comme le vrai examen</p>
      </div>

      <Link href="/examens-blancs/nouveau?final=true" className="btn-primary py-3.5 text-center">
        Commencer l&apos;examen final
      </Link>
      <Link href="/examens-blancs" className="text-sm text-center" style={{ color: "var(--ink-muted)" }}>
        Pas maintenant
      </Link>
    </main>
  );
}
