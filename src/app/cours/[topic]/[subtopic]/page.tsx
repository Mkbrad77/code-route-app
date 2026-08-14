import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import FlashcardSession from "@/components/FlashcardSession";

export default async function SubtopicPage({
  params,
}: {
  params: Promise<{ topic: string; subtopic: string }>;
}) {
  const { topic: topicSlug, subtopic: subtopicSlug } = await params;
  const supabase = await createClient();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: subtopic } = await supabase
    .from("subtopics")
    .select("*, astuce")
    .eq("slug", subtopicSlug)
    .maybeSingle();

  if (!subtopic) notFound();

  const { data: questions } = await supabase
    .from("questions")
    .select("id, text, type, difficulty, explanation, diagram_svg, answers(id, text, is_correct)")
    .eq("subtopic_id", subtopic.id);

  const formattedQuestions = (questions ?? []).map((q) => ({
    id: q.id,
    text: q.text,
    type: q.type,
    difficulty: q.difficulty,
    explanation: q.explanation,
    diagramSvg: q.diagram_svg,
    answers: q.answers,
  }));

  const { data: mastery } = await supabase
    .from("mastery")
    .select("score")
    .eq("user_id", user.id)
    .eq("subtopic_id", subtopic.id)
    .maybeSingle();

  // On découpe les 5 sections A-E en cartes courtes plutôt qu'un bloc de texte
  const cards = [
    { emoji: "✅", label: "À connaître absolument", content: subtopic.a_connaitre },
    { emoji: "⚠️", label: "Le piège de l'examen", content: subtopic.pieges },
    { emoji: "🔀", label: "Ce qu'on confond souvent", content: subtopic.confusions },
    { emoji: "🧠", label: "À mémoriser", content: subtopic.a_memoriser },
    { emoji: "🧮", label: "Astuce pour répondre vite", content: subtopic.astuce },
    { emoji: "🚗", label: "Situation réelle", content: subtopic.situation_reelle },
    { emoji: "💡", label: "Réponse", content: subtopic.situation_reponse },
  ].filter((c) => c.content);

  return (
    <FlashcardSession
      topicSlug={topicSlug}
      subtopicId={subtopic.id}
      cards={cards}
      questions={formattedQuestions}
      userId={user.id}
      initialScore={mastery?.score ?? null}
    />
  );
}
