const ICONS: Record<string, string> = {
  "priorites": "🔀",
  "signalisation": "🚸",
  "depassements": "🏎️",
  "vitesse": "⚡",
  "distances-securite": "📏",
  "conducteur-etat": "🧠",
  "usagers-vulnerables": "🚶",
  "autoroute": "🛣️",
  "premiers-secours": "🩹",
  "equipements-obligatoires": "🦺",
  "securite-passagers": "🔒",
  "environnement-eco-conduite": "🌱",
  "stationnement": "🅿️",
  "intersections-ronds-points": "🔄",
  "conduite-nuit": "🌙",
  "meteo-conditions-difficiles": "🌧️",
  "pietons": "🚶‍♂️",
  "cyclistes": "🚲",
  "deux-roues-motorises": "🏍️",
  "securite-vehicule": "🔧",
  "conducteur-comportement": "📵",
  "documents-reglementation": "📄",
  "situations-particulieres": "🚧",
};

export function iconForTopic(slug: string) {
  return ICONS[slug] ?? "🚗";
}
