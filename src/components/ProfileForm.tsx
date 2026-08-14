"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { useToast } from "@/components/ToastProvider";

export default function ProfileForm({
  initialExamDate,
  initialGoalMinutes,
}: {
  initialExamDate: string;
  initialGoalMinutes: number;
}) {
  const router = useRouter();
  const supabase = createClient();
  const { showToast } = useToast();
  const [examDate, setExamDate] = useState(initialExamDate);
  const [goalMinutes, setGoalMinutes] = useState(initialGoalMinutes);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const [loggingOut, setLoggingOut] = useState(false);

  async function save() {
    setSaving(true);
    setSaved(false);
    try {
      const { data: { user }, error: authError } = await supabase.auth.getUser();
      if (authError || !user) {
        showToast("Session expirée, reconnecte-toi pour enregistrer.");
        return;
      }
      const { error } = await supabase
        .from("profiles")
        .update({ exam_date: examDate || null, daily_goal_minutes: goalMinutes })
        .eq("id", user.id);
      if (error) {
        showToast("Impossible d'enregistrer : vérifie ta connexion et réessaie.");
      } else {
        setSaved(true);
      }
    } catch {
      showToast("Connexion impossible. Vérifie ton réseau et réessaie.");
    } finally {
      setSaving(false);
    }
  }

  async function logout() {
    setLoggingOut(true);
    try {
      const { error } = await supabase.auth.signOut();
      if (error) {
        showToast("La déconnexion a échoué, réessaie.");
        return;
      }
      router.push("/login");
      router.refresh();
    } catch {
      showToast("Connexion impossible. Vérifie ton réseau et réessaie.");
    } finally {
      setLoggingOut(false);
    }
  }

  const daysUntilExam = examDate
    ? Math.ceil((new Date(examDate).getTime() - new Date().setHours(0, 0, 0, 0)) / (1000 * 60 * 60 * 24))
    : null;

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-col gap-1.5">
        <label className="text-sm font-medium">Date de mon examen</label>
        <input
          type="date"
          value={examDate}
          onChange={(e) => setExamDate(e.target.value)}
          className="border rounded-xl px-4 py-3 text-sm dash-number"
          style={{ borderColor: "#e5e7eb" }}
        />
        {daysUntilExam !== null && daysUntilExam >= 0 && (
          <p className="text-xs" style={{ color: "var(--accent)" }}>
            Plus que <span className="dash-number">{daysUntilExam}</span> jour{daysUntilExam > 1 ? "s" : ""} !
          </p>
        )}
      </div>

      <div className="flex flex-col gap-1.5">
        <label className="text-sm font-medium">Objectif quotidien (minutes)</label>
        <input
          type="number"
          min={10}
          step={5}
          value={goalMinutes}
          onChange={(e) => setGoalMinutes(Number(e.target.value))}
          className="border rounded-xl px-4 py-3 text-sm dash-number"
          style={{ borderColor: "#e5e7eb" }}
        />
      </div>

      <button onClick={save} disabled={saving} className="btn-primary py-3.5">
        {saving ? "..." : saved ? "Enregistré ✓" : "Enregistrer"}
      </button>

      <button onClick={logout} disabled={loggingOut} className="text-sm text-center mt-2 disabled:opacity-50" style={{ color: "var(--danger)" }}>
        {loggingOut ? "..." : "Se déconnecter"}
      </button>
    </div>
  );
}
