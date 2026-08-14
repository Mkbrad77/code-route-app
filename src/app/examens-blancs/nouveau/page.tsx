import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import MockExamSession from "@/components/MockExamSession";

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

export default async function NouvelExamenPage({
  searchParams,
}: {
  searchParams: Promise<{ final?: string }>;
}) {
  const { final } = await searchParams;
  const isFinal = final === "true";

  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: questions } = await supabase
    .from("questions")
    .select("id, text, type, difficulty, explanation, diagram_svg, subtopic_id, answers(id, text, is_correct), subtopics(topic_id, topics(name))");

  if (!questions || questions.length === 0) {
    redirect("/examens-blancs");
  }

  type Row = {
    id: number;
    text: string;
    type: string;
    difficulty: number;
    explanation: string;
    diagram_svg: string | null;
    subtopic_id: number;
    answers: { id: number; text: string; is_correct: boolean }[];
    subtopics: { topic_id: number; topics: { name: string } | null } | null;
  };

  const rows = questions as unknown as Row[];
  const shuffled = shuffle(rows).slice(0, 40);

  const formatted = shuffled.map((q) => ({
    id: q.id,
    text: q.text,
    type: q.type,
    difficulty: q.difficulty,
    explanation: q.explanation,
    diagramSvg: q.diagram_svg,
    subtopicId: q.subtopic_id,
    topicName: q.subtopics?.topics?.name ?? "Thème",
    answers: shuffle(q.answers),
  }));

  return <MockExamSession questions={formatted} isFinal={isFinal} />;
}
