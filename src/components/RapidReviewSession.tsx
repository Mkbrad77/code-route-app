"use client";

import { useState } from "react";
import Link from "next/link";

export interface ReviewItem {
  topicName: string;
  title: string;
  aConnaitre: string | null;
  pieges: string | null;
  memoriser: string | null;
  astuce: string | null;
}

export default function RapidReviewSession({ items }: { items: ReviewItem[] }) {
  const [index, setIndex] = useState(0);
  const finished = index >= items.length;

  if (items.length === 0) {
    return (
      <main className="max-w-md mx-auto p-6 text-center mt-16" style={{ color: "var(--ink-muted)" }}>
        Aucune notion à réviser dans cette sélection.
      </main>
    );
  }

  if (finished) {
    return (
      <main className="max-w-md mx-auto p-6 flex flex-col items-center gap-4 text-center mt-16">
        <div className="text-5xl">✅</div>
        <h1 className="text-xl font-bold">Balayage terminé</h1>
        <p style={{ color: "var(--ink-muted)" }}>
          Tu as revu <span className="dash-number">{items.length}</span> notion{items.length > 1 ? "s" : ""}.
        </p>
        <div className="flex gap-2 mt-2">
          <button onClick={() => setIndex(0)} className="btn-secondary px-6 py-3">Recommencer</button>
          <Link href="/aujourdhui" className="btn-primary px-6 py-3">Aujourd&apos;hui</Link>
        </div>
      </main>
    );
  }

  const item = items[index];
  const progress = ((index + 1) / items.length) * 100;

  return (
    <main className="max-w-md mx-auto p-6 flex flex-col gap-4 min-h-screen justify-center pb-20">
      <div className="flex items-center justify-between text-xs dash-number" style={{ color: "var(--ink-muted)" }}>
        <span>{index + 1}/{items.length}</span>
        <span>{item.topicName}</span>
      </div>
      <div className="w-full h-1.5 rounded-full overflow-hidden" style={{ background: "#e5e7eb" }}>
        <div className="h-full transition-all" style={{ width: `${progress}%`, background: "var(--accent)" }} />
      </div>

      <div className="card p-6 flex flex-col gap-4">
        <h2 className="font-bold text-lg">{item.title}</h2>

        {item.aConnaitre && (
          <div>
            <div className="text-xs font-semibold mb-1" style={{ color: "var(--success)" }}>✅ À CONNAÎTRE</div>
            <p className="text-sm">{item.aConnaitre}</p>
          </div>
        )}
        {item.pieges && (
          <div>
            <div className="text-xs font-semibold mb-1" style={{ color: "var(--danger)" }}>⚠️ LE PIÈGE</div>
            <p className="text-sm">{item.pieges}</p>
          </div>
        )}
        {item.memoriser && (
          <div>
            <div className="text-xs font-semibold mb-1" style={{ color: "var(--accent)" }}>🧠 À MÉMORISER</div>
            <p className="text-sm">{item.memoriser}</p>
          </div>
        )}
        {item.astuce && (
          <div>
            <div className="text-xs font-semibold mb-1" style={{ color: "#a3690f" }}>🧮 ASTUCE</div>
            <p className="text-sm">{item.astuce}</p>
          </div>
        )}
      </div>

      <div className="flex gap-2">
        {index > 0 && (
          <button onClick={() => setIndex((i) => i - 1)} className="flex-1 btn-secondary py-3.5">← Précédent</button>
        )}
        <button onClick={() => setIndex((i) => i + 1)} className="flex-1 btn-primary py-3.5">
          {index === items.length - 1 ? "Terminer →" : "Suivant →"}
        </button>
      </div>
    </main>
  );
}
