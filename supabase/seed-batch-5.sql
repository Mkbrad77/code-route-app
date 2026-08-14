-- ============================================
-- EXTENSION DU CONTENU : batch 5/6 — 4 thèmes
-- Météo difficile, Piétons, Cyclistes, Deux-roues motorisés
-- ============================================

insert into topics (slug, name, "order") values
('meteo-conditions-difficiles', 'Météo et conditions difficiles', 16),
('pietons', 'Piétons', 17),
('cyclistes', 'Cyclistes', 18),
('deux-roues-motorises', 'Deux-roues motorisés', 19);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values

((select id from topics where slug='meteo-conditions-difficiles'), 'brouillard-visibilite',
 'Conduire dans le brouillard',
 'Dès que la visibilité descend sous 50 mètres, la vitesse est limitée à 50 km/h sur toutes les routes, autoroute comprise. Les feux de brouillard avant peuvent être utilisés en complément des feux de croisement, les feux arrière uniquement si la visibilité est très réduite.',
 'Piège fréquent : garder les feux de brouillard arrière allumés une fois la visibilité redevenue correcte — ils éblouissent alors les conducteurs derrière vous, c''est une infraction.',
 'Feux de brouillard avant (utilisables largement dès brouillard léger) ≠ feux arrière (réservés aux situations de visibilité vraiment très réduite, à éteindre dès que possible).',
 'Visibilité < 50m = 50 km/h maximum, sur toutes les routes. Éteindre les feux arrière dès que la visibilité s''améliore.',
 'Vous roulez sur autoroute (130 km/h) et un épais brouillard réduit soudain la visibilité à 40 mètres.',
 'Vous devez immédiatement réduire votre vitesse à 50 km/h maximum, quelle que soit la limite habituelle de la route.'),

((select id from topics where slug='meteo-conditions-difficiles'), 'neige-verglas',
 'Conduire sur neige et verglas',
 'Sur chaussée enneigée ou verglacée, la distance de freinage peut être multipliée par 2 à 10 selon l''adhérence. Dans les zones de montagne concernées par la "loi Montagne", l''équipement hiver (pneus neige ou chaînes) est obligatoire en période hivernale.',
 'Piège : sous-estimer à quel point la distance de freinage augmente sur le verglas — beaucoup de candidats pensent qu''une réduction de vitesse modérée suffit, alors que la marge de sécurité doit être considérablement plus grande.',
 'Neige (adhérence réduite mais progressive) ≠ verglas (perte d''adhérence brutale, souvent invisible, notamment sur les ponts qui gèlent en premier).',
 'Distance de freinage x2 à x10 sur neige/verglas selon l''adhérence. Ponts et zones ombragées gèlent en premier.',
 'Vous roulez en hiver et abordez un pont par temps très froid, la route semble sèche.',
 'Restez prudent : les ponts gèlent avant le reste de la route et peuvent être verglacés même si la chaussée environnante semble sèche.'),

((select id from topics where slug='pietons'), 'priorite-absolue-canne-blanche',
 'Priorité absolue : personnes malvoyantes',
 'Une personne tenant une canne blanche (éventuellement munie d''un dispositif électronique) ou accompagnée d''un chien guide bénéficie d''une priorité de passage absolue, y compris hors passage piéton signalé.',
 'Certains candidats pensent que la priorité au piéton ne s''applique que sur un passage piéton matérialisé — pour une personne malvoyante identifiée par sa canne blanche, la priorité s''applique même en dehors.',
 'Priorité piéton "classique" (sur passage protégé) ≠ priorité absolue (personne malvoyante identifiable), qui s''applique quel que soit l''endroit où elle traverse.',
 'Canne blanche ou chien guide = priorité absolue de passage, même hors passage piéton.',
 'Une personne avec une canne blanche s''apprête à traverser en dehors d''un passage piéton.',
 'Vous devez vous arrêter et la laisser traverser : sa priorité est absolue, peu importe l''absence de passage piéton à cet endroit.'),

((select id from topics where slug='pietons'), 'abords-ecoles',
 'Aux abords des écoles',
 'Aux abords des écoles, la prudence doit être maximale : la vitesse y est souvent limitée à 30 km/h (zone 30 fréquente), et les enfants peuvent surgir de manière imprévisible entre des véhicules stationnés.',
 'Piège : penser que le risque ne concerne que les heures d''entrée/sortie des classes — un enfant peut être présent aux abords d''une école à tout moment (récréation, activité périscolaire).',
 'La limitation de vitesse abaissée (souvent 30 km/h) est une mesure permanente de la zone, pas seulement active aux heures de sortie d''école.',
 'Redoubler de prudence aux abords des écoles, quelle que soit l''heure — pas seulement à la sortie des classes.',
 'Vous passez devant une école en dehors des horaires de sortie, aucun enfant visible.',
 'Restez prudent et respectez la limitation de vitesse de la zone : un enfant peut surgir à tout moment, pas seulement à la sortie des cours.'),

((select id from topics where slug='cyclistes'), 'sas-velo',
 'Le sas vélo',
 'Le sas vélo est un espace réservé aux cyclistes, situé entre la ligne d''arrêt des voitures et le feu tricolore, qui leur permet de démarrer en avance et d''être plus visibles des automobilistes.',
 'Piège : un conducteur qui avance jusqu''à la ligne d''arrêt classique sans remarquer qu''un sas vélo existe plus loin empiète alors sur cet espace, ce qui est interdit.',
 'Ligne d''arrêt des voitures (avant le sas) ≠ ligne d''arrêt des vélos (après le sas, juste avant le feu) : les voitures doivent s''arrêter à la première ligne, pas empiéter sur le sas.',
 'Le sas vélo est réservé aux cyclistes : les voitures doivent s''arrêter avant, jamais dedans.',
 'Vous arrivez à un feu rouge et voyez un marquage au sol avec un vélo peint entre votre ligne d''arrêt et le feu.',
 'C''est un sas vélo : vous devez vous arrêter avant cet espace, réservé aux cyclistes pour démarrer en avance.'),

((select id from topics where slug='cyclistes'), 'ouverture-portiere',
 'Le risque de l''ouverture de portière',
 'Avant d''ouvrir une portière côté circulation, le conducteur ou le passager doit impérativement vérifier qu''aucun cycliste n''arrive, pour éviter un accident grave ("dooring").',
 'Piège : ouvrir la portière rapidement en sortant sans se retourner, en pensant qu''un simple coup d''œil dans le rétroviseur suffit — il faut se retourner physiquement pour vérifier l''angle mort.',
 'Vérifier dans le rétroviseur (insuffisant seul) ≠ se retourner pour vérifier l''angle mort avant d''ouvrir la portière : le rétroviseur seul ne couvre pas la zone où arrive un cycliste proche.',
 'Toujours se retourner avant d''ouvrir une portière côté circulation, pour vérifier l''absence de cycliste.',
 'Vous venez de vous garer en ville et voulez sortir du côté de la circulation.',
 'Retournez-vous pour vérifier qu''aucun cycliste n''arrive avant d''ouvrir votre portière, le rétroviseur seul ne suffit pas.'),

((select id from topics where slug='deux-roues-motorises'), 'casque-obligatoire',
 'Le port du casque',
 'Le port d''un casque homologué est obligatoire pour le conducteur et tout passager d''un deux-roues motorisé (moto, scooter, cyclomoteur), attaché et de la bonne taille.',
 'Piège : penser qu''un casque simplement posé sur la tête sans être attaché respecte l''obligation — un casque non attaché n''offre aucune protection réelle et peut être sanctionné comme une absence de casque.',
 'Casque porté mais non attaché ≠ casque correctement porté : seul un casque attaché et homologué respecte l''obligation légale.',
 'Casque homologué et attaché obligatoire, conducteur ET passager, sans exception.',
 'Un passager monte sur votre scooter avec un casque mais sans attacher la jugulaire.',
 'Ce n''est pas conforme : le casque doit être attaché pour respecter l''obligation, sinon c''est comme s''il n''était pas porté.'),

((select id from topics where slug='deux-roues-motorises'), 'controle-technique-2rm',
 'Le contrôle technique des deux-roues',
 'Depuis 2024, le contrôle technique est obligatoire pour tous les deux-roues motorisés immatriculés, avec une périodicité qui dépend de l''ancienneté du véhicule (généralement tous les 3 ans une fois le premier contrôle passé).',
 'Piège pour les candidats qui pensent (à tort) que seules les voitures sont soumises au contrôle technique — cette idée reçue est dépassée depuis la réforme de 2024.',
 'Contrôle technique voiture (1er contrôle à 4 ans, puis tous les 2 ans) ≠ contrôle technique deux-roues motorisé (périodicité généralement triennale une fois le premier contrôle effectué).',
 'Depuis 2024, contrôle technique obligatoire aussi pour les deux-roues motorisés immatriculés.',
 'Vous entendez dire qu''un scooter n''a jamais besoin de contrôle technique.',
 'C''est faux depuis la réforme de 2024 : les deux-roues motorisés immatriculés y sont désormais soumis, comme les voitures.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='brouillard-visibilite'), 'Avec une visibilité inférieure à 50 mètres, quelle est la vitesse maximale autorisée ?', 'qcm', 2, 'vitesse brouillard', 'penser que la limite habituelle de la route s''applique toujours', 'La vitesse est limitée à 50 km/h dès que la visibilité descend sous 50 mètres, quelle que soit la route.'),
((select id from subtopics where slug='neige-verglas'), 'Sur chaussée verglacée, la distance de freinage peut être multipliée par :', 'qcm', 3, 'distance de freinage verglas', 'sous-estimer l''augmentation réelle de la distance', 'La distance de freinage peut être multipliée par 2 à 10 selon l''état de la chaussée verglacée.'),
((select id from subtopics where slug='priorite-absolue-canne-blanche'), 'Une personne avec une canne blanche traverse en dehors d''un passage piéton. Que faites-vous ?', 'qcm', 2, 'priorité personne malvoyante', 'penser que la priorité ne s''applique que sur un passage piéton', 'Vous devez vous arrêter : sa priorité de passage est absolue, même en dehors d''un passage piéton signalé.'),
((select id from subtopics where slug='abords-ecoles'), 'Le risque lié aux enfants aux abords d''une école concerne :', 'qcm', 1, 'prudence zone école', 'penser que le risque n''existe qu''aux heures de sortie', 'Il existe à tout moment, pas seulement aux heures d''entrée et de sortie des classes.'),
((select id from subtopics where slug='sas-velo'), 'Un marquage au sol avec un vélo peint est visible avant le feu tricolore. Où devez-vous vous arrêter ?', 'qcm', 2, 'sas vélo', 'avancer jusqu''au feu en empiétant sur le sas', 'Vous devez vous arrêter avant ce sas réservé aux cyclistes, pas à l''intérieur.'),
((select id from subtopics where slug='ouverture-portiere'), 'Avant d''ouvrir votre portière côté circulation, le rétroviseur seul suffit-il pour vérifier la présence d''un cycliste ?', 'vrai_faux', 2, 'ouverture de portière', 'se fier uniquement au rétroviseur', 'Faux : il faut se retourner pour vérifier l''angle mort, le rétroviseur seul ne couvre pas toute la zone.'),
((select id from subtopics where slug='casque-obligatoire'), 'Un casque de deux-roues motorisé porté mais non attaché respecte-t-il l''obligation légale ?', 'vrai_faux', 1, 'casque attaché', 'penser qu''un casque simplement posé suffit', 'Faux : le casque doit être attaché pour être conforme à l''obligation, sinon c''est comme une absence de casque.'),
((select id from subtopics where slug='controle-technique-2rm'), 'Depuis 2024, le contrôle technique est-il obligatoire pour les deux-roues motorisés ?', 'vrai_faux', 1, 'contrôle technique 2RM', 'penser que seules les voitures sont concernées', 'Vrai : depuis la réforme de 2024, les deux-roues motorisés immatriculés sont eux aussi soumis au contrôle technique.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Avec une visibilité inférieure à 50 mètres%'), '50 km/h', true),
((select id from questions where text like 'Avec une visibilité inférieure à 50 mètres%'), 'La limite habituelle de la route', false),
((select id from questions where text like 'Avec une visibilité inférieure à 50 mètres%'), '90 km/h', false),

((select id from questions where text like 'Sur chaussée verglacée, la distance de freinage%'), '1,5 fois', false),
((select id from questions where text like 'Sur chaussée verglacée, la distance de freinage%'), '2 à 10 fois', true),
((select id from questions where text like 'Sur chaussée verglacée, la distance de freinage%'), 'Elle ne change pas significativement', false),

((select id from questions where text like 'Une personne avec une canne blanche traverse%'), 'Continuer, elle n''est pas sur un passage piéton', false),
((select id from questions where text like 'Une personne avec une canne blanche traverse%'), 'Vous arrêter, sa priorité est absolue', true),
((select id from questions where text like 'Une personne avec une canne blanche traverse%'), 'Klaxonner pour la prévenir et continuer', false),

((select id from questions where text like 'Le risque lié aux enfants aux abords d''une école%'), 'Uniquement aux heures d''entrée et de sortie', false),
((select id from questions where text like 'Le risque lié aux enfants aux abords d''une école%'), 'À tout moment', true),

((select id from questions where text like 'Un marquage au sol avec un vélo peint est visible%'), 'Avant le sas, à la première ligne', true),
((select id from questions where text like 'Un marquage au sol avec un vélo peint est visible%'), 'Dans le sas, au plus près du feu', false),
((select id from questions where text like 'Un marquage au sol avec un vélo peint est visible%'), 'Peu importe, il n''y a pas de règle', false),

((select id from questions where text like 'Avant d''ouvrir votre portière côté circulation%'), 'Vrai', false),
((select id from questions where text like 'Avant d''ouvrir votre portière côté circulation%'), 'Faux', true),

((select id from questions where text like 'Un casque de deux-roues motorisé porté mais non attaché%'), 'Vrai', false),
((select id from questions where text like 'Un casque de deux-roues motorisé porté mais non attaché%'), 'Faux', true),

((select id from questions where text like 'Depuis 2024, le contrôle technique est-il obligatoire pour les deux-roues%'), 'Vrai', true),
((select id from questions where text like 'Depuis 2024, le contrôle technique est-il obligatoire pour les deux-roues%'), 'Faux', false);
