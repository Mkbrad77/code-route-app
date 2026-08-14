// Service worker minimal : met en cache la coquille de l'app (pages déjà visitées,
// icônes, manifest) pour un chargement plus rapide et une tolérance basique au hors-ligne.
// Les données (cours, scores, examens) viennent de Supabase et nécessitent une connexion :
// ce service worker ne les met pas en cache, il évite juste un écran blanc si le réseau coupe
// brièvement ou si tu rouvres une page déjà visitée dans le métro.

const CACHE_NAME = "code-route-shell-v1";
const PRECACHE_URLS = ["/manifest.json", "/icon-192.png", "/icon-512.png"];

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(PRECACHE_URLS))
  );
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE_NAME).map((k) => caches.delete(k)))
    )
  );
  self.clients.claim();
});

self.addEventListener("fetch", (event) => {
  const { request } = event;

  // Ne jamais intercepter les appels API (données dynamiques, toujours en direct)
  if (request.method !== "GET" || request.url.includes("/api/") || request.url.includes("supabase")) {
    return;
  }

  // Stale-while-revalidate pour les pages et assets statiques
  event.respondWith(
    caches.open(CACHE_NAME).then(async (cache) => {
      const cached = await cache.match(request);
      const networkFetch = fetch(request)
        .then((response) => {
          if (response.ok) cache.put(request, response.clone());
          return response;
        })
        .catch(() => cached);
      return cached || networkFetch;
    })
  );
});
