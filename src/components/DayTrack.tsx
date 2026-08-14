export default function DayTrack({ day, total = 10 }: { day: number; total?: number }) {
  return (
    <div className="flex gap-1 w-full">
      {Array.from({ length: total }).map((_, i) => (
        <div
          key={i}
          className="h-1.5 flex-1 rounded-full"
          style={{ background: i < day ? "var(--accent)" : "rgba(255,255,255,0.15)" }}
        />
      ))}
    </div>
  );
}
