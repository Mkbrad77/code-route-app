"use client";

import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from "recharts";

interface TopicScore {
  name: string;
  score: number;
}

function colorFor(score: number) {
  if (score < 40) return "#ef4444"; // rouge
  if (score < 60) return "#f97316"; // orange
  if (score < 80) return "#eab308"; // jaune
  if (score < 95) return "#22c55e"; // vert
  return "#6366f1"; // indigo (excellent)
}

export default function TopicMasteryChart({ data }: { data: TopicScore[] }) {
  return (
    <ResponsiveContainer width="100%" height={Math.max(260, data.length * 34)}>
      <BarChart data={data} layout="vertical" margin={{ left: 8, right: 24 }}>
        <XAxis type="number" domain={[0, 100]} hide />
        <YAxis
          type="category"
          dataKey="name"
          width={170}
          tick={{ fontSize: 12 }}
          axisLine={false}
          tickLine={false}
        />
        <Tooltip formatter={(v) => [`${v}/100`, "Maîtrise"]} />
        <Bar dataKey="score" radius={[0, 6, 6, 0]} barSize={16}>
          {data.map((d, i) => (
            <Cell key={i} fill={colorFor(d.score)} />
          ))}
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  );
}
