-- ============================================
-- EXTENSION DU CONTENU : 5 nouveaux thèmes
-- ============================================

insert into topics (slug, name, "order") values
('vitesse', 'Vitesse', 4),
('distances-securite', 'Distances de sécurité', 5),
('conducteur-etat', 'Alcool, drogues et fatigue', 6),
('usagers-vulnerables', 'Usagers vulnérables', 7),
('autoroute', 'Autoroute et voies rapides', 8);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values
((select id from topics where slug='vitesse'), 'vitesse-agglomeration',
 'La vitesse en agglomération',
 'La vitesse est limitée à 50 km/h dès le panneau d''entrée d''agglomération, sauf indication contraire (zone 30, zone de rencontre à 20).',
 'Beaucoup de candidats pensent qu''en l''absence de panneau à l''intérieur de la ville, il n''y a pas de limite. Faux : le panneau d''entrée d''agglomération fixe 50 km/h pour toute la zone, jusqu''au panneau de sortie.',
 'Zone 30 ≠ zone de rencontre : la zone 30 limite à 30 km/h avec trottoirs classiques, la zone de rencontre (20 km/h) donne priorité totale aux piétons qui peuvent circuler sur la chaussée.',
 '50 km/h par défaut en agglomération. Zone 30 = 30 km/h. Zone de rencontre = 20 km/h, piéton prioritaire partout.',
 'Vous roulez en ville, aucun panneau de vitesse n''est visible depuis un moment.',
 'La limite reste 50 km/h : elle s''applique dès l''entrée d''agglomération et jusqu''à la sortie, sans besoin de rappel.'),

((select id from topics where slug='vitesse'), 'vitesse-conditions-degradees',
 'Vitesse par conditions dégradées',
 'Par temps de pluie, toutes les vitesses maximales autorisées sont réduites de 10 km/h (ex : 130→110 sur autoroute). Par brouillard avec visibilité < 50 m, la vitesse est limitée à 50 km/h sur toutes les routes.',
 'Le piège classique : penser que la réduction de vitesse par pluie ne concerne que l''autoroute. Elle s''applique aussi sur route à 90/80 km/h (ramenée à 80/70).',
 'Réduction "pluie" (-10 km/h partout) ≠ réduction "brouillard" (50 km/h fixe, quelle que soit la route, dès que la visibilité passe sous 50 m).',
 'Pluie : -10 km/h sur la limite normale. Brouillard <50m de visibilité : 50 km/h partout, sans exception.',
 'Vous roulez sur autoroute (130 km/h) et il commence à pleuvoir fortement.',
 'Vous devez réduire votre vitesse à 110 km/h maximum tant que la pluie persiste.'),

((select id from topics where slug='distances-securite'), 'regle-2-secondes',
 'La règle des 2 secondes',
 'Le Code impose de laisser un intervalle d''au moins 2 secondes avec le véhicule qui précède (article R.412-12), pour avoir le temps de réagir et freiner sans collision.',
 'Beaucoup de candidats pensent en mètres fixes plutôt qu''en secondes : la bonne distance dépend de la vitesse, pas d''un nombre de mètres unique.',
 'Ne pas confondre distance de sécurité (avant/arrière, entre véhicules qui se suivent) et distance latérale (sur le côté, lors d''un dépassement ou croisement).',
 '2 secondes minimum, à doubler par temps de pluie ou faible adhérence. Non-respect = 135€ d''amende et 3 points en moins.',
 'Vous suivez un véhicule sur autoroute et un panneau fixe (pont) sert de repère.',
 'Comptez le temps entre le passage du véhicule devant vous à ce repère et votre propre passage : il doit être d''au moins 2 secondes.'),

((select id from topics where slug='distances-securite'), 'distance-par-mauvais-temps',
 'Distances par mauvais temps',
 'Sur chaussée mouillée, la distance de freinage augmente fortement : il faut doubler l''intervalle de sécurité habituel (passer de 2 à 4 secondes).',
 'Le piège : garder la même distance qu''en conditions sèches en pensant que "rouler moins vite" suffit — la distance de sécurité doit elle aussi augmenter, pas seulement la vitesse diminuer.',
 'Réduire la vitesse ET augmenter la distance sont deux actions complémentaires, pas une alternative l''une à l''autre.',
 'Chaussée mouillée = distance de sécurité doublée (4 secondes au lieu de 2).',
 'Il pleut fort, la chaussée est glissante, vous suivez un véhicule.',
 'Vous devez à la fois ralentir et augmenter votre distance de sécurité à environ 4 secondes.'),

((select id from topics where slug='conducteur-etat'), 'alcool-taux-legal',
 'Le taux d''alcool légal',
 'Le taux légal maximal est de 0,5 g/L de sang pour un permis classique, et de 0,2 g/L (quasi zéro) pour un permis probatoire.',
 'Piège fréquent : croire que "un verre" reste toujours sous la limite. Le taux dépend du poids, du sexe, de la quantité d''alcool et du temps écoulé — il n''y a pas de règle universelle.',
 'Permis classique (0,5 g/L) ≠ permis probatoire (0,2 g/L) : un jeune conducteur n''a quasiment aucune marge.',
 '0,5 g/L permis classique. 0,2 g/L permis probatoire (6 points). Dépassement = infraction, retrait de points et amende.',
 'Vous êtes en permis probatoire et avez bu un seul verre il y a une heure.',
 'Vous risquez déjà de dépasser 0,2 g/L : mieux vaut ne pas conduire, la marge est quasiment nulle.'),

((select id from topics where slug='conducteur-etat'), 'fatigue-signes',
 'Les signes de fatigue au volant',
 'La fatigue diminue la vigilance et allonge le temps de réaction, un facteur majeur d''accidents sur autoroute. Une pause de 15-20 minutes est recommandée toutes les 2 heures de conduite.',
 'Les candidats sous-estiment souvent les signes précoces (bâillements répétés, picotements des yeux, difficulté à maintenir sa trajectoire) en pensant qu''il faut attendre une somnolence franche pour s''arrêter.',
 'Fatigue ≠ endormissement : il faut agir dès les premiers signes, pas seulement quand on manque de s''endormir au volant.',
 'Pause recommandée toutes les 2h de conduite, 15-20 minutes minimum.',
 'Vous conduisez depuis 2h sur autoroute et commencez à bâiller fréquemment.',
 'C''est le moment de vous arrêter sur une aire, même si vous ne vous sentez pas encore somnolent.'),

((select id from topics where slug='usagers-vulnerables'), 'pietons-passage',
 'Priorité aux piétons',
 'Un piéton engagé ou qui manifeste clairement l''intention de traverser sur un passage piéton est prioritaire ; le conducteur doit s''arrêter.',
 'Piège classique : penser qu''il faut seulement céder le passage à un piéton déjà "sur" le passage, alors que la loi couvre aussi celui qui manifeste l''intention de s''y engager.',
 'Passage piéton avec feu ≠ sans feu : avec feu, c''est la couleur qui prime ; sans feu, la priorité au piéton est automatique dès qu''il s''engage.',
 'Piéton engagé ou sur le point de s''engager sur un passage sans feu = prioritaire, arrêt obligatoire.',
 'Un piéton s''approche du bord du trottoir, visiblement prêt à traverser sur un passage piéton sans feu.',
 'Vous devez ralentir et vous arrêter pour le laisser traverser, même s''il n''a pas encore posé le pied sur la chaussée.'),

((select id from topics where slug='usagers-vulnerables'), 'angles-morts',
 'Les angles morts',
 'Les poids lourds, bus et cars ont d''importants angles morts, notamment à l''avant droit et sur les côtés — un cycliste ou piéton peut y devenir invisible.',
 'Les candidats associent souvent l''angle mort uniquement aux voitures particulières, en sous-estimant le risque bien plus grand avec les poids lourds au moment d''un virage.',
 'Angle mort du poids lourd (zone large, surtout à droite) ≠ angle mort d''une voiture (zone réduite, arrière latéral).',
 'Ne jamais se placer dans l''angle mort d''un poids lourd, surtout à l''approche d''un carrefour ou rond-point.',
 'Vous êtes à vélo à côté d''un camion à l''arrêt à un feu, prêt à tourner à droite.',
 'Ne vous placez jamais à sa droite : vous êtes probablement invisible pour le chauffeur, un camion qui tourne peut vous percuter.'),

((select id from topics where slug='autoroute'), 'vitesse-autoroute',
 'Les vitesses sur autoroute',
 'La vitesse maximale sur autoroute est de 130 km/h par temps sec (110 km/h par temps de pluie, 50 km/h si visibilité < 50 m). Un permis probatoire est limité à 110 km/h même par temps sec.',
 'Piège : un jeune conducteur qui roule à 125 km/h par temps sec pense être dans la limite générale (130), alors qu''il est déjà en excès par rapport à sa propre limite (110).',
 'Limite générale (130 km/h) ≠ limite permis probatoire (110 km/h) : elles ne sont identiques qu''en cas de pluie.',
 '130 km/h temps sec (110 en probatoire). 110 km/h si pluie (pour tous). 50 km/h si visibilité < 50m.',
 'Vous êtes en permis probatoire, il fait beau, vous roulez sur autoroute.',
 'Votre limite est 110 km/h, pas 130 — la limite générale ne s''applique pas à vous en période probatoire.'),

((select id from topics where slug='autoroute'), 'bande-urgence',
 'La bande d''arrêt d''urgence',
 'La bande d''arrêt d''urgence est réservée aux arrêts d''urgence, aux véhicules de secours et, ponctuellement, aux voies dédiées aux bus si signalé. Y circuler ou s''y arrêter sans motif valable est interdit.',
 'Certains candidats pensent qu''il est toléré de s''y arrêter brièvement "pour vérifier son itinéraire" ou répondre au téléphone — c''est une infraction, pas une urgence réelle.',
 'Bande d''arrêt d''urgence (interdite sauf urgence) ≠ voie de circulation additionnelle temporairement ouverte (signalée explicitement par panneau).',
 'Bande d''arrêt d''urgence = urgence réelle uniquement (panne, malaise, accident). Jamais pour confort ou consultation de GPS.',
 'Vous voulez vérifier votre itinéraire sur votre téléphone pendant un trajet autoroutier.',
 'Vous ne devez pas vous arrêter sur la bande d''arrêt d''urgence pour ça : prenez la prochaine aire de repos.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='vitesse-agglomeration'), 'Sans panneau visible depuis un moment en ville, la vitesse maximale est :', 'qcm', 2, 'vitesse en agglomération', 'penser qu''il n''y a plus de limite', 'La limite de 50 km/h fixée à l''entrée d''agglomération reste valable jusqu''au panneau de sortie, sans besoin de rappel.'),
((select id from subtopics where slug='vitesse-conditions-degradees'), 'Sur autoroute (130 km/h), par forte pluie, la vitesse maximale autorisée est :', 'qcm', 2, 'vitesse par pluie', 'oublier la réduction de 10 km/h par pluie', 'La pluie réduit la vitesse maximale autorisée de 10 km/h, soit 110 km/h au lieu de 130.'),
((select id from subtopics where slug='regle-2-secondes'), 'La distance de sécurité minimale à respecter avec le véhicule qui précède correspond à :', 'qcm', 2, 'distance de sécurité', 'penser en mètres fixes plutôt qu''en secondes', 'La règle officielle est un intervalle de 2 secondes minimum, qui s''adapte automatiquement à la vitesse.'),
((select id from subtopics where slug='distance-par-mauvais-temps'), 'Sur chaussée mouillée, la distance de sécurité doit être :', 'qcm', 3, 'distance par mauvais temps', 'ne réduire que la vitesse sans augmenter la distance', 'Il faut doubler la distance de sécurité habituelle, la faisant passer d''environ 2 à 4 secondes.'),
((select id from subtopics where slug='alcool-taux-legal'), 'Le taux d''alcool maximal autorisé pour un conducteur en permis probatoire est de :', 'qcm', 2, 'taux d''alcool légal', 'confondre avec le taux du permis classique (0,5)', 'En période probatoire, le taux maximal autorisé est de 0,2 g/L de sang, soit quasiment zéro tolérance.'),
((select id from subtopics where slug='fatigue-signes'), 'Après combien de temps de conduite est-il recommandé de faire une pause ?', 'qcm', 1, 'fatigue au volant', 'attendre des signes francs de somnolence', 'Une pause de 15 à 20 minutes est recommandée toutes les 2 heures de conduite, avant l''apparition de signes francs de fatigue.'),
((select id from subtopics where slug='pietons-passage'), 'Un piéton s''apprête à s''engager sur un passage piéton sans feu. Que devez-vous faire ?', 'qcm', 2, 'priorité piéton', 'attendre qu''il soit déjà engagé sur la chaussée', 'Vous devez vous arrêter dès qu''il manifeste l''intention de traverser, pas seulement une fois qu''il est engagé.'),
((select id from subtopics where slug='angles-morts'), 'À l''arrêt à un feu à côté d''un poids lourd, où ne devez-vous jamais vous positionner à vélo ?', 'qcm', 2, 'angle mort poids lourd', 'sous-estimer la taille de l''angle mort d''un camion', 'Ne vous placez jamais sur le côté droit d''un poids lourd : vous êtes probablement invisible pour le conducteur.'),
((select id from subtopics where slug='vitesse-autoroute'), 'En permis probatoire, par temps sec, la vitesse maximale sur autoroute est :', 'qcm', 2, 'vitesse autoroute probatoire', 'appliquer la limite générale de 130 km/h', 'En période probatoire, la limite est de 110 km/h même par temps sec, contre 130 km/h pour un permis classique.'),
((select id from subtopics where slug='bande-urgence'), 'Peut-on s''arrêter sur la bande d''arrêt d''urgence pour consulter son GPS ?', 'vrai_faux', 1, 'bande d''arrêt d''urgence', 'penser qu''un arrêt bref et sans danger est toléré', 'Non, la bande d''arrêt d''urgence est réservée aux urgences réelles (panne, malaise, accident), jamais au confort ou à la consultation d''un GPS.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Sans panneau visible depuis un moment en ville%'), '50 km/h', true),
((select id from questions where text like 'Sans panneau visible depuis un moment en ville%'), 'Pas de limite', false),
((select id from questions where text like 'Sans panneau visible depuis un moment en ville%'), '70 km/h', false),

((select id from questions where text like 'Sur autoroute (130 km/h), par forte pluie%'), '130 km/h', false),
((select id from questions where text like 'Sur autoroute (130 km/h), par forte pluie%'), '110 km/h', true),
((select id from questions where text like 'Sur autoroute (130 km/h), par forte pluie%'), '90 km/h', false),

((select id from questions where text like 'La distance de sécurité minimale%'), '1 seconde', false),
((select id from questions where text like 'La distance de sécurité minimale%'), '2 secondes', true),
((select id from questions where text like 'La distance de sécurité minimale%'), '5 mètres fixes', false),

((select id from questions where text like 'Sur chaussée mouillée, la distance de sécurité%'), 'Inchangée si on ralentit', false),
((select id from questions where text like 'Sur chaussée mouillée, la distance de sécurité%'), 'Doublée (environ 4 secondes)', true),
((select id from questions where text like 'Sur chaussée mouillée, la distance de sécurité%'), 'Réduite de moitié', false),

((select id from questions where text like 'Le taux d''alcool maximal autorisé pour un conducteur en permis probatoire%'), '0,5 g/L', false),
((select id from questions where text like 'Le taux d''alcool maximal autorisé pour un conducteur en permis probatoire%'), '0,2 g/L', true),
((select id from questions where text like 'Le taux d''alcool maximal autorisé pour un conducteur en permis probatoire%'), '0,8 g/L', false),

((select id from questions where text like 'Après combien de temps de conduite%'), 'Toutes les 30 minutes', false),
((select id from questions where text like 'Après combien de temps de conduite%'), 'Toutes les 2 heures', true),
((select id from questions where text like 'Après combien de temps de conduite%'), 'Seulement en cas de somnolence', false),

((select id from questions where text like 'Un piéton s''apprête à s''engager%'), 'Attendre qu''il soit sur la chaussée', false),
((select id from questions where text like 'Un piéton s''apprête à s''engager%'), 'S''arrêter dès qu''il manifeste l''intention de traverser', true),
((select id from questions where text like 'Un piéton s''apprête à s''engager%'), 'Klaxonner pour le prévenir et continuer', false),

((select id from questions where text like 'À l''arrêt à un feu à côté d''un poids lourd%'), 'Devant lui', false),
((select id from questions where text like 'À l''arrêt à un feu à côté d''un poids lourd%'), 'Sur son côté droit', true),
((select id from questions where text like 'À l''arrêt à un feu à côté d''un poids lourd%'), 'Derrière lui', false),

((select id from questions where text like 'En permis probatoire, par temps sec%'), '130 km/h', false),
((select id from questions where text like 'En permis probatoire, par temps sec%'), '110 km/h', true),
((select id from questions where text like 'En permis probatoire, par temps sec%'), '90 km/h', false),

((select id from questions where text like 'Peut-on s''arrêter sur la bande d''arrêt d''urgence%'), 'Vrai', false),
((select id from questions where text like 'Peut-on s''arrêter sur la bande d''arrêt d''urgence%'), 'Faux', true);
