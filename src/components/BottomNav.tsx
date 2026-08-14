"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const items = [
  { href: "/aujourdhui", label: "Jour", icon: "📅" },
  { href: "/cours", label: "Cours", icon: "📘" },
  { href: "/erreurs", label: "Erreurs", icon: "⚠️" },
  { href: "/examens-blancs", label: "Examens", icon: "📝" },
  { href: "/progression", label: "Progrès", icon: "📊" },
  { href: "/profil", label: "Profil", icon: "👤" },
];

export default function BottomNav() {
  const pathname = usePathname();
  if (pathname === "/login") return null;

  return (
    <nav
      className="fixed bottom-0 left-0 right-0 flex justify-around py-2 z-10"
      style={{ background: "var(--ink)" }}
    >
      {items.map((item) => {
        const active = pathname === item.href || pathname.startsWith(item.href + "/");
        return (
          <Link
            key={item.href}
            href={item.href}
            className="flex flex-col items-center text-[11px] gap-0.5 px-3 py-1.5 rounded-xl transition"
            style={{
              color: active ? "white" : "rgba(255,255,255,0.45)",
              background: active ? "var(--accent)" : "transparent",
            }}
          >
            <span className="text-base leading-none">{item.icon}</span>
            {item.label}
          </Link>
        );
      })}
    </nav>
  );
}
