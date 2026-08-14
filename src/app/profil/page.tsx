import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import ProfileForm from "@/components/ProfileForm";

export default async function ProfilPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("exam_date, daily_goal_minutes")
    .eq("id", user.id)
    .maybeSingle();

  return (
    <main className="max-w-md mx-auto p-4 flex flex-col gap-5 pb-20">
      <div className="dash-header p-6 flex flex-col items-center gap-2 text-center">
        <div
          className="w-14 h-14 rounded-full flex items-center justify-center text-2xl"
          style={{ background: "var(--accent)" }}
        >
          👤
        </div>
        <p className="text-sm" style={{ color: "rgba(255,255,255,0.7)" }}>{user.email}</p>
      </div>
      <div className="card p-6">
        <ProfileForm
          initialExamDate={profile?.exam_date ?? ""}
          initialGoalMinutes={profile?.daily_goal_minutes ?? 45}
        />
      </div>
      <Link href="/aide" className="card p-4 flex items-center gap-3">
        <span className="text-xl">❓</span>
        <span className="font-medium flex-1">Comment utiliser l&apos;app</span>
        <span style={{ color: "var(--ink-muted)" }}>→</span>
      </Link>
      <Link href="/planning" className="card p-4 flex items-center gap-3">
        <span className="text-xl">📅</span>
        <span className="font-medium flex-1">Voir le programme des 10 jours</span>
        <span style={{ color: "var(--ink-muted)" }}>→</span>
      </Link>
    </main>
  );
}
