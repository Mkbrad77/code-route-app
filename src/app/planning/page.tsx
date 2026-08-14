import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { CURRICULUM } from "@/lib/curriculum";
import { iconForTopic } from "@/lib/topicIcons";
import { computeDayNumber } from "@/lib/dayNumber";

export default async function PlanningPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: attemptDates } = await supabase
    .from("attempts")
    .select("answered_at")
    .eq("user_id", user.id)
    .order("answered_at", { ascending: false })
    .limit(500);

  const { data: topics } = await supabase.from("topics").select("slug, name");
  const nameBySlug = new Map((topics ?? []).map((t) => [t.slug, t.name]));

  const dayNumber = computeDayNumber(attemptDates);

  return (
    <main className="max-w-2xl mx-auto p-4 flex flex-col gap-4 pb-20">
      <Link href="/aujourdhui" className="text-sm" style={{ color: "var(--ink-muted)" }}>← Aujourd&apos;hui</Link>
      <h1 className="text-2xl font-bold">Programme sur 10 jours</h1>
      <p className="text-sm" style={{ color: "var(--ink-muted)" }}>
        Le jour 1 démarre à ta première session. Chaque jour couvre un ou plusieurs thèmes précis, et
        n&apos;avance que quand tu as vraiment travaillé — si tu sautes un jour, le programme t&apos;attend.
        Le jour 10 est réservé à la révision générale et à l&apos;examen final.
      </p>
      <div className="route-divider" />

      <div className="flex flex-col gap-2.5">
        {CURRICULUM.map((d) => {
          const isPast = d.day < dayNumber;
          const isToday = d.day === dayNumber;
          return (
            <div
              key={d.day}
              className="card p-4 flex gap-3"
              style={isToday ? { boxShadow: "0 0 0 2px var(--accent), var(--shadow-card)" } : undefined}
            >
              <div
                className="dash-number w-9 h-9 shrink-0 rounded-full flex items-center justify-center text-sm"
                style={{
                  background: isToday ? "var(--accent)" : isPast ? "#e9f9ee" : "var(--bg)",
                  color: isToday ? "white" : isPast ? "var(--success)" : "var(--ink-muted)",
                }}
              >
                {isPast ? "✓" : d.day}
              </div>
              <div className="flex-1">
                <div className="flex items-center gap-2">
                  <p className="font-medium text-sm">{d.label}</p>
                  {isToday && (
                    <span className="pill" style={{ background: "var(--accent-soft)", color: "var(--accent)" }}>
                      Aujourd&apos;hui
                    </span>
                  )}
                </div>
                {d.isReviewDay ? (
                  <p className="text-xs mt-1" style={{ color: "var(--ink-muted)" }}>
                    Révision des notions faibles + examen blanc final
                  </p>
                ) : (
                  <div className="flex flex-wrap gap-1.5 mt-2">
                    {d.topics.map((slug) => (
                      <span key={slug} className="pill" style={{ background: "var(--bg)", color: "var(--ink-muted)" }}>
                        {iconForTopic(slug)} {nameBySlug.get(slug) ?? slug}
                      </span>
                    ))}
                  </div>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </main>
  );
}
