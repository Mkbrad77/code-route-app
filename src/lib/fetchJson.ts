/**
 * Wrapper fetch centralisé : gère les échecs réseau (coupure, timeout) ET les réponses
 * HTTP non-OK de façon uniforme, pour qu'aucun appel API ne puisse échouer en silence.
 */
export async function fetchJson<T>(
  url: string,
  options?: RequestInit
): Promise<{ data: T | null; error: string | null }> {
  let res: Response;
  try {
    res = await fetch(url, options);
  } catch {
    return { data: null, error: "Connexion impossible. Vérifie ton réseau et réessaie." };
  }

  let body: unknown = null;
  try {
    body = await res.json();
  } catch {
    // Réponse sans corps JSON exploitable
  }

  if (!res.ok) {
    const message =
      body && typeof body === "object" && "error" in body && typeof (body as { error: unknown }).error === "string"
        ? (body as { error: string }).error
        : "Une erreur est survenue. Réessaie dans un instant.";
    return { data: null, error: message };
  }

  return { data: body as T, error: null };
}
