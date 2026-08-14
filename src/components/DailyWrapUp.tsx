"use client";

import { useState } from "react";
import { fetchJson } from "@/lib/fetchJson";

interface Result {
  score: number;
  status: "validated" | "partial" | "failed";
  weak: string[];
  strong: string[];
  questionsAnswered: number;
}

const statusMeta = {
  validated: { emoji: "🟢", label: "Journée validée", advice: "Continue sur cette lancée, tu peux enchaîner sur des notions plus difficiles demain.", color: "var(--success)" },
  partial: { emoji: "🟠", label: "Journée partiellement validée", advice: "Reviens demain sur les notions faibles listées ci-dessous avant d'avancer.", color: "var(--amber)" },
  failed: { emoji: "🔴", label: "Journée non validée", advice: "Une session supplémentaire est recommandée sur les notions du jour avant de continuer.", color: "var(--danger)" },
};

export default function DailyWrapUp({ dayNumber }: { dayNumber: number }) {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<Result | null>(null);
  const [error, setError] = useState<string | null>(null);

  async function endDay() {
    setLoading(true);
    setError(null);
    try {
      const { data, error } = await fetchJson<Result>("/api/daily-evaluation", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ dayNumber }),
      });
      if (error) {
        setError(error);
      } else if (data) {
        setResult(data);
      }
    } finally {
      setLoading(false);
    }
  }

  if (result) {
    const meta = statusMeta[result.status];
    return (
      <div className="card p-5 flex flex-col gap-3">
        <div className="flex items-center gap-3">
          <span className="text-3xl">{meta.emoji}</span>
          <div>
            <div className="font-semibold">{meta.label}</div>
            <div className="text-sm dash-number" style={{ color: "var(--ink-muted)" }}>
              {result.score}% · {result.questionsAnswered} question{result.questionsAnswered > 1 ? "s" : ""}
            </div>
          </div>
        </div>
        <p className="text-sm" style={{ color: "var(--ink-muted)" }}>{meta.advice}</p>
        {result.weak.length > 0 && (
          <p className="text-sm" style={{ color: "var(--danger)" }}>⚠️ À revoir : {result.weak.join(", ")}</p>
        )}
        {result.strong.length > 0 && (
          <p className="text-sm" style={{ color: "var(--success)" }}>✅ Bien maîtrisé aujourd&apos;hui : {result.strong.join(", ")}</p>
        )}
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-2">
      {error && <p className="text-sm" style={{ color: "var(--danger)" }}>{error}</p>}
      <button onClick={endDay} disabled={loading} className="btn-secondary py-3 text-sm">
        {loading ? "Calcul en cours…" : "Terminer ma journée"}
      </button>
    </div>
  );
}
