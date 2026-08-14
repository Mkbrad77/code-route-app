-- ============================================
-- QUESTIONS AVEC SCHÉMA SVG
-- Schémas simples (pas des photos officielles) pour illustrer
-- des situations spatiales difficiles à décrire en texte seul.
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation, diagram_svg) values

((select id from subtopics where slug='priorite-a-droite'),
 'Sur le schéma, aucun panneau n''est présent à cette intersection. Le véhicule A et le véhicule B arrivent en même temps. Qui est prioritaire ?',
 'qcm', 2, 'priorité à droite (schéma)', 'confondre la position gauche/droite',
 'B arrive de la droite de A : c''est donc B qui est prioritaire, A doit céder le passage.',
 '<svg viewBox="0 0 300 220" xmlns="http://www.w3.org/2000/svg"><rect x="0" y="90" width="300" height="40" fill="#e5e7eb"/><rect x="130" y="0" width="40" height="220" fill="#e5e7eb"/><rect x="20" y="100" width="34" height="20" rx="4" fill="var(--accent)"/><text x="25" y="135" font-size="14" fill="#14171f">A</text><rect x="150" y="160" width="20" height="34" rx="4" fill="#e5484d"/><text x="178" y="180" font-size="14" fill="#14171f">B</text></svg>'),

((select id from subtopics where slug='cedez-le-passage'),
 'Lequel de ces deux panneaux impose un arrêt total obligatoire, même si la voie semble libre ?',
 'qcm', 1, 'stop vs cédez le passage', 'confondre les deux formes',
 'Le panneau octogonal rouge (Stop) impose un arrêt total. Le triangle (cédez le passage) impose seulement de ralentir et de céder si nécessaire.',
 '<svg viewBox="0 0 300 160" xmlns="http://www.w3.org/2000/svg"><polygon points="150,20 175,30 185,55 175,80 150,90 125,80 115,55 125,30" fill="#e5484d"/><text x="128" y="60" font-size="12" fill="white" font-weight="bold">STOP</text><polygon points="30,30 70,100 -10,100" fill="none" stroke="#e5484d" stroke-width="4" transform="translate(230,0)"/></svg>'),

((select id from subtopics where slug='panneaux-danger'),
 'Sur le schéma, quelle forme correspond toujours à un panneau de danger ?',
 'qcm', 1, 'forme panneau danger', 'confondre triangle et rond',
 'Le triangle à bordure rouge signale toujours un danger. Le rond bleu est un panneau d''obligation, jamais de danger.',
 '<svg viewBox="0 0 300 140" xmlns="http://www.w3.org/2000/svg"><polygon points="70,20 120,110 20,110" fill="white" stroke="#e5484d" stroke-width="6"/><text x="55" y="70" font-size="30">!</text><circle cx="220" cy="65" r="50" fill="var(--accent)"/><text x="200" y="75" font-size="14" fill="white">OBLIG.</text></svg>'),

((select id from subtopics where slug='priorite-rond-point'),
 'Sur ce rond-point, un panneau cédez-le-passage est présent à l''entrée où se trouve le véhicule B. Le véhicule A circule déjà dans l''anneau. Qui est prioritaire ?',
 'qcm', 2, 'priorité rond-point (schéma)', 'penser que celui qui entre a la priorité',
 'A est déjà engagé dans l''anneau : il est prioritaire. B doit céder le passage avant d''entrer.',
 '<svg viewBox="0 0 300 220" xmlns="http://www.w3.org/2000/svg"><circle cx="150" cy="110" r="70" fill="none" stroke="#e5e7eb" stroke-width="24"/><rect x="130" y="180" width="40" height="40" fill="#e5e7eb"/><rect x="100" y="60" width="30" height="18" rx="4" fill="var(--accent)" transform="rotate(-30 115 69)"/><text x="70" y="55" font-size="14" fill="#14171f">A</text><polygon points="150,210 140,195 160,195" fill="#e5484d"/><rect x="140" y="195" width="20" height="20" rx="3" fill="#e5484d"/><text x="165" y="215" font-size="14" fill="#14171f">B</text></svg>'),

((select id from subtopics where slug='depassement-deux-roues'),
 'Sur le schéma, la voiture dépasse un cycliste en agglomération. Quelle distance latérale minimale "d" doit être respectée ?',
 'qcm', 2, 'distance dépassement (schéma)', 'confondre avec la distance hors agglomération',
 'En agglomération, la distance latérale minimale est de 1 mètre (1,5 mètre hors agglomération).',
 '<svg viewBox="0 0 300 140" xmlns="http://www.w3.org/2000/svg"><rect x="0" y="60" width="300" height="10" fill="#9ca3af" stroke-dasharray="10,8"/><circle cx="60" cy="90" r="12" fill="#f2a93b"/><rect x="150" y="40" width="60" height="26" rx="6" fill="var(--accent)"/><line x1="60" y1="70" x2="60" y2="45" stroke="#14171f" stroke-width="1"/><line x1="150" y1="45" x2="150" y2="70" stroke="#14171f" stroke-width="1"/><line x1="62" y1="50" x2="148" y2="50" stroke="#14171f" stroke-width="1"/><text x="90" y="45" font-size="14" fill="#14171f">d ?</text></svg>'),

((select id from subtopics where slug='sas-velo'),
 'Le marquage au sol montre un vélo peint entre la ligne d''arrêt et le feu. Où la voiture doit-elle s''arrêter au feu rouge ?',
 'qcm', 2, 'sas vélo (schéma)', 'avancer jusqu''au feu en empiétant sur le sas',
 'La voiture doit s''arrêter avant le sas (la zone réservée aux vélos), jamais à l''intérieur.',
 '<svg viewBox="0 0 300 140" xmlns="http://www.w3.org/2000/svg"><rect x="0" y="50" width="300" height="40" fill="#e5e7eb"/><rect x="180" y="50" width="40" height="40" fill="var(--accent-soft)" stroke="var(--accent)" stroke-dasharray="4,3"/><text x="188" y="75" font-size="18">🚲</text><rect x="260" y="55" width="10" height="30" fill="#e5484d"/><line x1="180" y1="45" x2="180" y2="95" stroke="#14171f" stroke-width="2"/><line x1="130" y1="45" x2="130" y2="95" stroke="#14171f" stroke-width="2" stroke-dasharray="3,3"/></svg>'),

((select id from subtopics where slug='angles-morts'),
 'La zone ombrée représente l''angle mort d''un poids lourd. Le cycliste s''y trouve. Que doit-il faire ?',
 'qcm', 2, 'angle mort (schéma)', 'rester dans la zone en pensant être visible',
 'Le cycliste doit sortir de cette zone : s''il ne voit pas les rétroviseurs du camion, le chauffeur ne le voit probablement pas non plus.',
 '<svg viewBox="0 0 300 160" xmlns="http://www.w3.org/2000/svg"><rect x="40" y="40" width="120" height="50" fill="var(--ink)"/><polygon points="160,40 260,90 260,130 160,90" fill="#fdeaea" opacity="0.8"/><circle cx="200" cy="100" r="10" fill="#f2a93b"/><text x="190" y="140" font-size="12" fill="#14171f">zone invisible</text></svg>'),

((select id from subtopics where slug='lignes-jaunes-stationnement'),
 'Sur le trottoir de gauche, la ligne est continue. Sur celui de droite, elle est discontinue. Sur laquelle un arrêt bref est-il toléré ?',
 'qcm', 2, 'ligne continue vs discontinue (schéma)', 'penser que les deux interdisent tout arrêt',
 'Seule la ligne discontinue (à droite) tolère un arrêt bref. La ligne continue interdit l''arrêt et le stationnement.',
 '<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg"><rect x="0" y="0" width="140" height="20" fill="#f2a93b"/><text x="30" y="45" font-size="12" fill="#14171f">Continue</text><rect x="160" y="0" width="20" height="20" fill="#f2a93b"/><rect x="195" y="0" width="20" height="20" fill="#f2a93b"/><rect x="230" y="0" width="20" height="20" fill="#f2a93b"/><text x="170" y="45" font-size="12" fill="#14171f">Discontinue</text></svg>');

-- Réponses des 8 questions à schéma
insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Sur le schéma, aucun panneau n''est présent%'), 'A est prioritaire', false),
((select id from questions where text like 'Sur le schéma, aucun panneau n''est présent%'), 'B est prioritaire', true),
((select id from questions where text like 'Sur le schéma, aucun panneau n''est présent%'), 'Celui qui roule le plus vite passe', false),

((select id from questions where text like 'Lequel de ces deux panneaux impose un arrêt total%'), 'Le panneau octogonal rouge (Stop)', true),
((select id from questions where text like 'Lequel de ces deux panneaux impose un arrêt total%'), 'Le triangle (cédez le passage)', false),

((select id from questions where text like 'Sur le schéma, quelle forme correspond toujours à un panneau de danger%'), 'Le triangle à bordure rouge', true),
((select id from questions where text like 'Sur le schéma, quelle forme correspond toujours à un panneau de danger%'), 'Le rond bleu', false),

((select id from questions where text like 'Sur ce rond-point, un panneau cédez-le-passage%'), 'A (déjà dans l''anneau)', true),
((select id from questions where text like 'Sur ce rond-point, un panneau cédez-le-passage%'), 'B (qui entre)', false),

((select id from questions where text like 'Sur le schéma, la voiture dépasse un cycliste en agglomération%'), '1 mètre', true),
((select id from questions where text like 'Sur le schéma, la voiture dépasse un cycliste en agglomération%'), '1,5 mètre', false),
((select id from questions where text like 'Sur le schéma, la voiture dépasse un cycliste en agglomération%'), '50 centimètres', false),

((select id from questions where text like 'Le marquage au sol montre un vélo peint%'), 'Avant le sas (première ligne)', true),
((select id from questions where text like 'Le marquage au sol montre un vélo peint%'), 'Dans le sas, au plus près du feu', false),

((select id from questions where text like 'La zone ombrée représente l''angle mort d''un poids lourd%'), 'Sortir de cette zone au plus vite', true),
((select id from questions where text like 'La zone ombrée représente l''angle mort d''un poids lourd%'), 'Rester, il est prioritaire', false),

((select id from questions where text like 'Sur le trottoir de gauche, la ligne est continue%'), 'Sur la ligne continue (gauche)', false),
((select id from questions where text like 'Sur le trottoir de gauche, la ligne est continue%'), 'Sur la ligne discontinue (droite)', true);
