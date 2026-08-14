-- Ajoute une colonne pour stocker un schéma SVG optionnel par question
alter table questions add column diagram_svg text;
