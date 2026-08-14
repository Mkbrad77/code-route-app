"use client";

import { useState } from "react";
import Link from "next/link";
import { fetchJson } from "@/lib/fetchJson";
import { useToast } from "@/components/ToastProvider";

interface Card {
  emoji: string;
  label: string;
  content: string;
}
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
  answers: Answer[];
}
interface Props {
  topicSlug: string;
  subtopicId: number;
  cards: Card[];
  questions: Question[];
  userId: string | null;
  initialScore: number | null;
}

function levelFor(score: number) {
  if (score < 40) return { emoji: "🔴", label: "Non maîtrisé", color: "var(--danger)" };
  if (score < 60) return { emoji: "🟠", label: "Fragile", color: "#a3690f" };
  if (score < 80) return { emoji: "🟡", label: "En cours", color: "#a3830f" };
  if (score < 95) return { emoji: "🟢", label: "Maîtrisé", color: "var(--success)" };
  return { emoji: "⭐", label: "Très bien maîtrisé", color: "var(--accent)" };
}

function sameSet(a: number[], b: number[]) {
  if (a.length !== b.length) return false;
  const sa = [...a].sort((x, y) => x - y);
  const sb = [...b].sort((x, y) => x - y);
  return sa.every((v, i) => v === sb[i]);
}

export default function FlashcardSession({ topicSlug, subtopicId, cards, questions, userId, initialScore }: Props) {
  const { showToast } = useToast();
  const [step, setStep] = useState(0);
  const [quizIndex, setQuizIndex] = useState(0);
  const [selectedIds, setSelectedIds] = useState<number[]>([]);
  const [revealed, setRevealed] = useState(false);
  const [score, setScore] = useState(initialScore ?? 0);
  const [xpEarned, setXpEarned] = useState(0);
  const [saving, setSaving] = useState(false);

  const inCards = step < cards.length;
  const finished = !inCards && quizIndex >= questions.length;

  async function grade(finalSelection: number[]) {
    setRevealed(true);
    const q = questions[quizIndex];
    const correctIds = q.answers.filter((a) => a.is_correct).map((a) => a.id);
    const isCorrect = sameSet(finalSelection, correctIds);

    if (userId) {
      setSaving(true);
      try {
        const { data, error } = await fetchJson<{ newScore: number; xpGained: number }>("/api/attempt", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ questionId: q.id, subtopicId, isCorrect, difficulty: q.difficulty }),
        });
        if (error) {
          showToast(`Réponse non enregistrée : ${error}`);
        } else if (data) {
          if (typeof data.newScore === "number") setScore(data.newScore);
          if (typeof data.xpGained === "number") setXpEarned((x) => x + data.xpGained);
        }
      } finally {
        setSaving(false);
      }
    }
  }

  function pick(answer: Answer) {
    if (revealed) return;
    const q = questions[quizIndex];
    if (q.type === "multi") {
      setSelectedIds((ids) =>
        ids.includes(answer.id) ? ids.filter((i) => i !== answer.id) : [...ids, answer.id]
      );
    } else {
      setSelectedIds([answer.id]);
      grade([answer.id]);
    }
  }

  function nextQuizQuestion() {
    setSelectedIds([]);
    setRevealed(false);
    setQuizIndex((i) => i + 1);
  }

  if (finished) {
    const lvl = levelFor(score);
    return (
      <main className="max-w-md mx-auto p-6 flex flex-col items-center gap-4 text-center mt-16">
        <div
          className="w-20 h-20 rounded-full flex items-center justify-center text-4xl"
          style={{ background: "var(--accent-soft)" }}
        >
          {lvl.emoji}
        </div>
        <h1 className="text-xl font-bold">Notion terminée</h1>
        <p style={{ color: "var(--ink-muted)" }}>
          Maîtrise actuelle : <span className="dash-number" style={{ color: lvl.color }}>{score}/100</span> — {lvl.label}
        </p>
        {xpEarned > 0 && (
          <p className="text-sm dash-number" style={{ color: "var(--amber)" }}>+{xpEarned} XP gagné</p>
        )}
        <Link href={`/cours/${topicSlug}`} className="btn-primary mt-4 px-8 py-3">
          Retour aux notions
        </Link>
      </main>
    );
  }

  if (inCards) {
    const card = cards[step];
    const progress = ((step + 1) / (cards.length + questions.length)) * 100;
    return (
      <main className="max-w-md mx-auto p-6 flex flex-col gap-4 min-h-screen justify-center pb-20">
        <div className="w-full h-1.5 rounded-full overflow-hidden" style={{ background: "#e5e7eb" }}>
          <div className="h-full transition-all" style={{ width: `${progress}%`, background: "var(--accent)" }} />
        </div>

        <div className="card p-7 flex flex-col gap-3 min-h-[220px] justify-center">
          <div className="text-3xl">{card.emoji}</div>
          <div className="text-xs uppercase tracking-wide font-semibold" style={{ color: "var(--accent)" }}>
            {card.label}
          </div>
          <p className="text-lg leading-snug">{card.content}</p>
        </div>

        <button onClick={() => setStep((s) => s + 1)} className="btn-primary py-3.5">
          {step === cards.length - 1 ? "Passer au quiz →" : "Suivant →"}
        </button>
      </main>
    );
  }

  const q = questions[quizIndex];
  const progress = ((cards.length + quizIndex + 1) / (cards.length + questions.length)) * 100;
  const isMulti = q.type === "multi";

  return (
    <main className="max-w-md mx-auto p-6 flex flex-col gap-4 min-h-screen justify-center pb-20">
      <div className="w-full h-1.5 rounded-full overflow-hidden" style={{ background: "#e5e7eb" }}>
        <div className="h-full transition-all" style={{ width: `${progress}%`, background: "var(--accent)" }} />
      </div>

      <div className="card p-6 flex flex-col gap-4">
        {q.diagramSvg && (
          <div
            className="rounded-xl p-3"
            style={{ background: "var(--bg)" }}
            dangerouslySetInnerHTML={{ __html: q.diagramSvg }}
          />
        )}
        <p className="font-medium">{q.text}</p>
        {isMulti && !revealed && (
          <p className="text-xs" style={{ color: "var(--accent)" }}>☑️ Plusieurs réponses possibles</p>
        )}
        <div className="flex flex-col gap-2">
          {q.answers.map((a) => {
            const isPicked = selectedIds.includes(a.id);
            const showCorrect = revealed && a.is_correct;
            const showWrong = revealed && isPicked && !a.is_correct;
            const showMissed = revealed && !isPicked && a.is_correct;
            return (
              <button
                key={a.id}
                onClick={() => pick(a)}
                disabled={revealed}
                className="text-left rounded-xl border px-4 py-3 transition flex items-center gap-2"
                style={{
                  background: showCorrect ? "#e9f9ee" : showWrong ? "#fdeaea" : isPicked ? "var(--accent-soft)" : "white",
                  borderColor: showCorrect ? "var(--success)" : showWrong ? "var(--danger)" : isPicked ? "var(--accent)" : "#e5e7eb",
                }}
              >
                {isMulti && (
                  <span
                    className="w-4 h-4 rounded shrink-0 border flex items-center justify-center text-[10px]"
                    style={{ borderColor: isPicked ? "var(--accent)" : "#9ca3af", background: isPicked ? "var(--accent)" : "transparent", color: "white" }}
                  >
                    {isPicked ? "✓" : ""}
                  </span>
                )}
                <span>{a.text}{showMissed ? " (à cocher aussi)" : ""}</span>
              </button>
            );
          })}
        </div>

        {isMulti && !revealed && (
          <button
            onClick={() => grade(selectedIds)}
            disabled={selectedIds.length === 0}
            className="btn-secondary py-2.5 disabled:opacity-40"
          >
            Valider mes réponses
          </button>
        )}

        {revealed && (
          <div className="text-sm rounded-xl p-3" style={{ background: "var(--bg)", color: "var(--ink-muted)" }}>
            💡 {q.explanation}
          </div>
        )}
      </div>

      {revealed && (
        <button onClick={nextQuizQuestion} disabled={saving} className="btn-primary py-3.5">
          {quizIndex === questions.length - 1 ? "Terminer →" : "Question suivante →"}
        </button>
      )}
    </main>
  );
}
