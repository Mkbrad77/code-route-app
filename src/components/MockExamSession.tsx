"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import { fetchJson } from "@/lib/fetchJson";
import { useToast } from "@/components/ToastProvider";

interface Answer {
  id: number;
  text: string;
  is_correct: boolean;
}
interface Question {
  id: number;
  text: string;
  type: string;
  difficulty: number;
  explanation: string;
  diagramSvg?: string | null;
  subtopicId: number;
  topicName: string;
  answers: Answer[];
}

const DURATION_SECONDS = 30 * 60;

function sameSet(a: number[], b: number[]) {
  if (a.length !== b.length) return false;
  const sa = [...a].sort((x, y) => x - y);
  const sb = [...b].sort((x, y) => x - y);
  return sa.every((v, i) => v === sb[i]);
}

function isCorrectAnswer(q: Question, chosenIds: number[]) {
  const correctIds = q.answers.filter((a) => a.is_correct).map((a) => a.id);
  return sameSet(chosenIds, correctIds);
}

export default function MockExamSession({ questions, isFinal = false }: { questions: Question[]; isFinal?: boolean }) {
  const router = useRouter();
  const { showToast } = useToast();
  const [index, setIndex] = useState(0);
  const [chosen, setChosen] = useState<Record<number, number[]>>({});
  const [secondsLeft, setSecondsLeft] = useState(DURATION_SECONDS);
  const [finished, setFinished] = useState(false);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState<{ score: number; passed: boolean } | null>(null);

  const finish = useCallback(async () => {
    setFinished(true);
    const correctCount = questions.filter((q) => isCorrectAnswer(q, chosen[q.id] ?? [])).length;

    setSaving(true);
    try {
      const attemptResults = await Promise.all(
        questions.map((q) => {
          const ids = chosen[q.id];
          if (!ids || ids.length === 0) return Promise.resolve<{ error: string | null }>({ error: null });
          return fetchJson("/api/attempt", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
              questionId: q.id,
              subtopicId: q.subtopicId,
              isCorrect: isCorrectAnswer(q, ids),
              difficulty: q.difficulty,
            }),
          });
        })
      );
      const failedAttempts = attemptResults.filter((r) => r.error).length;
      if (failedAttempts > 0) {
        showToast(`${failedAttempts} réponse(s) non enregistrée(s) dans ta progression. Ton score final reste correct.`);
      }

      const { data, error } = await fetchJson<{ score: number; passed: boolean }>("/api/mock-exam", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ totalQuestions: questions.length, correctCount, isFinal }),
      });

      if (error || !data) {
        // Le score reste affichable même si l'enregistrement en base a échoué
        const score = Math.round((correctCount / questions.length) * 100);
        const passed = correctCount / questions.length >= 35 / 40;
        setSaved({ score, passed });
        showToast("Ton résultat n'a pas pu être sauvegardé (connexion). Il ne sera pas dans ton historique.");
      } else {
        setSaved(data);
      }
    } finally {
      setSaving(false);
    }
  }, [chosen, questions, isFinal, showToast]);

  useEffect(() => {
    if (finished) return;
    if (secondsLeft <= 0) {
      finish();
      return;
    }
    const t = setTimeout(() => setSecondsLeft((s) => s - 1), 1000);
    return () => clearTimeout(t);
  }, [secondsLeft, finished, finish]);

  function toggle(answerId: number) {
    const q = questions[index];
    setChosen((c) => {
      const current = c[q.id] ?? [];
      if (q.type === "multi") {
        const next = current.includes(answerId)
          ? current.filter((i) => i !== answerId)
          : [...current, answerId];
        return { ...c, [q.id]: next };
      }
      return { ...c, [q.id]: [answerId] };
    });
  }

  function formatTime(s: number) {
    const m = Math.floor(s / 60);
    const sec = s % 60;
    return `${m}:${sec.toString().padStart(2, "0")}`;
  }

  if (finished) {
    if (saving || !saved) {
      return (
        <main className="max-w-md mx-auto p-6 text-center mt-20" style={{ color: "var(--ink-muted)" }}>
          Correction en cours…
        </main>
      );
    }
    const correctCount = questions.filter((q) => isCorrectAnswer(q, chosen[q.id] ?? [])).length;

    return (
      <main className="max-w-md mx-auto p-6 flex flex-col gap-4 mt-8 pb-20">
        <div className="card p-7 flex flex-col items-center gap-2 text-center">
          {isFinal && (
            <span className="pill mb-1" style={{ background: "var(--amber-soft)", color: "#a3690f" }}>
              🏁 Examen final du programme
            </span>
          )}
          <div className="text-5xl">{saved.passed ? "✅" : "❌"}</div>
          <div className="dash-number text-3xl">{correctCount}/{questions.length}</div>
          <div style={{ color: "var(--ink-muted)" }}>
            <span className="dash-number">{saved.score}%</span> — {saved.passed ? "Examen réussi" : "Examen échoué"}
          </div>
        </div>

        <h2 className="text-sm font-semibold mt-2" style={{ color: "var(--ink-muted)" }}>CORRECTIONS</h2>
        <div className="flex flex-col gap-3">
          {questions.map((q, i) => {
            const chosenIds = chosen[q.id] ?? [];
            const wasCorrect = isCorrectAnswer(q, chosenIds);
            const correctAnswers = q.answers.filter((a) => a.is_correct);
            return (
              <div
                key={q.id}
                className="card p-4"
                style={{ borderLeft: `4px solid ${wasCorrect ? "var(--success)" : "var(--danger)"}` }}
              >
                <div className="text-xs dash-number mb-1" style={{ color: "var(--ink-muted)" }}>
                  Q{i + 1} · {q.topicName}
                </div>
                {q.diagramSvg && (
                  <div className="rounded-lg p-2 mb-2" style={{ background: "var(--bg)" }} dangerouslySetInnerHTML={{ __html: q.diagramSvg }} />
                )}
                <p className="font-medium text-sm mb-2">{q.text}</p>
                {!wasCorrect && (
                  <p className="text-sm mb-1" style={{ color: "var(--danger)" }}>
                    Ta réponse : {q.answers.filter((a) => chosenIds.includes(a.id)).map((a) => a.text).join(", ") || "Sans réponse"}
                  </p>
                )}
                <p className="text-sm mb-1" style={{ color: "var(--success)" }}>
                  Bonne réponse : {correctAnswers.map((a) => a.text).join(", ")}
                </p>
                <p className="text-xs" style={{ color: "var(--ink-muted)" }}>💡 {q.explanation}</p>
              </div>
            );
          })}
        </div>

        <button onClick={() => router.push("/examens-blancs")} className="btn-primary py-3.5 mt-2">
          Retour aux examens blancs
        </button>
      </main>
    );
  }

  const q = questions[index];
  const chosenIds = chosen[q.id] ?? [];
  const isMulti = q.type === "multi";
  const progress = ((index + 1) / questions.length) * 100;

  return (
    <main className="max-w-md mx-auto p-6 flex flex-col gap-4 min-h-screen justify-center pb-20">
      <div className="flex items-center justify-between text-sm dash-number" style={{ color: "var(--ink-muted)" }}>
        <span>Q{index + 1}/{questions.length}</span>
        <span style={{ color: secondsLeft < 60 ? "var(--danger)" : "var(--ink-muted)" }}>⏱ {formatTime(secondsLeft)}</span>
      </div>
      <div className="w-full h-1.5 rounded-full overflow-hidden" style={{ background: "#e5e7eb" }}>
        <div className="h-full transition-all" style={{ width: `${progress}%`, background: "var(--accent)" }} />
      </div>

      <div className="card p-6 flex flex-col gap-4">
        {q.diagramSvg && (
          <div className="rounded-xl p-3" style={{ background: "var(--bg)" }} dangerouslySetInnerHTML={{ __html: q.diagramSvg }} />
        )}
        <p className="font-medium">{q.text}</p>
        {isMulti && <p className="text-xs" style={{ color: "var(--accent)" }}>☑️ Plusieurs réponses possibles</p>}
        <div className="flex flex-col gap-2">
          {q.answers.map((a) => {
            const isPicked = chosenIds.includes(a.id);
            return (
              <button
                key={a.id}
                onClick={() => toggle(a.id)}
                className="text-left rounded-xl border px-4 py-3 transition flex items-center gap-2"
                style={
                  isPicked
                    ? { background: "var(--accent)", color: "white", borderColor: "var(--accent)" }
                    : { borderColor: "#e5e7eb" }
                }
              >
                {isMulti && (
                  <span
                    className="w-4 h-4 rounded shrink-0 border flex items-center justify-center text-[10px]"
                    style={{ borderColor: isPicked ? "white" : "#9ca3af", background: isPicked ? "white" : "transparent", color: "var(--accent)" }}
                  >
                    {isPicked ? "✓" : ""}
                  </span>
                )}
                {a.text}
              </button>
            );
          })}
        </div>
      </div>

      <div className="flex gap-2">
        {index > 0 && (
          <button onClick={() => setIndex((i) => i - 1)} className="flex-1 btn-secondary py-3.5">
            ← Précédent
          </button>
        )}
        {index < questions.length - 1 ? (
          <button onClick={() => setIndex((i) => i + 1)} className="flex-1 btn-primary py-3.5">
            Suivant →
          </button>
        ) : (
          <button onClick={finish} className="flex-1 btn-primary py-3.5">
            Terminer l&apos;examen
          </button>
        )}
      </div>
    </main>
  );
}
