"use client";

import { useState } from "react";
import { applyAttempt, getMasteryLevel, nextReviewDate, MasteryState } from "@/lib/mastery";

const INITIAL: MasteryState = { score: 0, correctStreak: 0, timesTested: 0, lastErrorAt: null };

export default function TestScoring() {
  const [state, setState] = useState<MasteryState>(INITIAL);
  const [log, setLog] = useState<string[]>([]);

  function answer(isCorrect: boolean, difficulty: 1 | 2 | 3) {
    const newState = applyAttempt(state, { isCorrect, difficulty });
    const level = getMasteryLevel(newState.score);
    const review = nextReviewDate(newState);
    setState(newState);
    setLog((l) => [
      `${isCorrect ? "✅" : "❌"} difficulté ${difficulty} → score ${newState.score} ${level.emoji} ${level.label} · revoir le ${review.toLocaleDateString("fr-FR")}`,
      ...l,
    ]);
  }

  const level = getMasteryLevel(state.score);

  return (
    <main className="max-w-xl mx-auto p-8 flex flex-col gap-6">
      <h1 className="text-2xl font-semibold">Démo — moteur de maîtrise</h1>

      <div className="rounded-xl border p-6 flex flex-col items-center gap-2">
        <div className="text-5xl">{level.emoji}</div>
        <div className="text-3xl font-bold">{state.score}/100</div>
        <div className="text-gray-600">{level.label}</div>
        <div className="text-sm text-gray-400">Série actuelle : {state.correctStreak} bonnes réponses</div>
      </div>

      <div className="grid grid-cols-3 gap-2">
        {[1, 2, 3].map((d) => (
          <div key={d} className="flex flex-col gap-2">
            <button
              onClick={() => answer(true, d as 1 | 2 | 3)}
              className="rounded-lg bg-green-600 text-white py-2 text-sm"
            >
              ✅ Bonne (diff. {d})
            </button>
            <button
              onClick={() => answer(false, d as 1 | 2 | 3)}
              className="rounded-lg bg-red-600 text-white py-2 text-sm"
            >
              ❌ Mauvaise (diff. {d})
            </button>
          </div>
        ))}
      </div>

      <button
        onClick={() => { setState(INITIAL); setLog([]); }}
        className="text-sm text-gray-500 underline"
      >
        Réinitialiser
      </button>

      <div className="flex flex-col gap-1 text-sm font-mono">
        {log.map((line, i) => (
          <div key={i}>{line}</div>
        ))}
      </div>
    </main>
  );
}
