"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function LoginPage() {
  const router = useRouter();
  const supabase = createClient();

  const [mode, setMode] = useState<"login" | "signup">("login");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [info, setInfo] = useState<string | null>(null);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setInfo(null);
    setLoading(true);

    try {
      if (mode === "signup") {
        const { data, error } = await supabase.auth.signUp({ email, password });
        if (error) {
          setError(error.message);
        } else if (data.user) {
          if (data.session) {
            router.push("/aujourdhui");
            router.refresh();
          } else {
            setInfo("Compte créé ! Vérifie ta boîte mail pour confirmer ton adresse, puis connecte-toi.");
          }
        }
      } else {
        const { error } = await supabase.auth.signInWithPassword({ email, password });
        if (error) {
          setError(error.message);
        } else {
          router.push("/aujourdhui");
          router.refresh();
        }
      }
    } catch {
      setError("Connexion impossible. Vérifie ton réseau et réessaie.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <main className="min-h-screen flex items-center justify-center p-6" style={{ background: "var(--ink)" }}>
      <div className="w-full max-w-sm flex flex-col gap-6">
        <div className="text-center flex flex-col items-center gap-3">
          <div
            className="w-16 h-16 rounded-2xl flex items-center justify-center text-3xl"
            style={{ background: "var(--accent)" }}
          >
            🚗
          </div>
          <div>
            <h1 className="text-2xl font-bold text-white">Code Route</h1>
            <p className="text-sm" style={{ color: "rgba(255,255,255,0.5)" }}>
              10 jours pour être prêt
            </p>
          </div>
        </div>

        <div className="card p-6 flex flex-col gap-4">
          <h2 className="font-semibold text-lg">
            {mode === "login" ? "Connexion" : "Créer un compte"}
          </h2>

          <form onSubmit={handleSubmit} className="flex flex-col gap-3">
            <input
              type="email"
              placeholder="Email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="border rounded-xl px-4 py-3 text-sm"
              style={{ borderColor: "#e5e7eb" }}
            />
            <input
              type="password"
              placeholder="Mot de passe (6 caractères min.)"
              required
              minLength={6}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="border rounded-xl px-4 py-3 text-sm"
              style={{ borderColor: "#e5e7eb" }}
            />

            {error && <p className="text-sm" style={{ color: "var(--danger)" }}>{error}</p>}
            {info && <p className="text-sm" style={{ color: "var(--success)" }}>{info}</p>}

            <button type="submit" disabled={loading} className="btn-primary py-3 mt-1">
              {loading ? "..." : mode === "login" ? "Se connecter" : "S'inscrire"}
            </button>
          </form>

          <button
            onClick={() => setMode(mode === "login" ? "signup" : "login")}
            className="text-sm text-center"
            style={{ color: "var(--ink-muted)" }}
          >
            {mode === "login" ? "Pas encore de compte ? S'inscrire" : "Déjà un compte ? Se connecter"}
          </button>
        </div>
      </div>
    </main>
  );
}
