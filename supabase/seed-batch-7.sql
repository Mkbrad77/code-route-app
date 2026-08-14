-- ============================================
-- RENFORCEMENT DU CONTENU : batch 7/9
-- +2 questions pour 14 notions (priorités, signalisation, dépassements,
-- vitesse, distances, conducteur/état, usagers vulnérables, autoroute)
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='priorite-a-droite'), 'Deux véhicules arrivent en même temps à une intersection sans aucune signalisation, l''un venant de la gauche, l''autre de la droite. Qui doit céder ?', 'qcm', 2, 'priorité à droite', 'hésiter sur qui cède réellement', 'Celui qui vient de la gauche doit céder le passage à celui qui vient de la droite.'),
((select id from subtopics where slug='priorite-a-droite'), 'La priorité à droite s''applique-t-elle aussi dans un lotissement résidentiel sans panneau ?', 'vrai_faux', 1, 'priorité à droite', 'penser que les petites voies résidentielles font exception', 'Vrai, la règle par défaut s''applique partout en l''absence de signalisation contraire.'),

((select id from subtopics where slug='cedez-le-passage'), 'Un panneau cédez-le-passage impose-t-il toujours un arrêt complet du véhicule ?', 'vrai_faux', 2, 'cédez le passage', 'confondre systématiquement avec le Stop', 'Faux, l''arrêt n''est obligatoire que si la sécurité l''exige, contrairement au Stop.'),
((select id from subtopics where slug='cedez-le-passage'), 'À un cédez-le-passage, une voiture prioritaire approche. Que devez-vous faire ?', 'qcm', 2, 'cédez le passage', 'accélérer pour passer avant elle', 'Ralentir et céder le passage si nécessaire, sans forcer le passage.'),

((select id from subtopics where slug='panneaux-danger'), 'Un panneau de danger permanent et un panneau de danger temporaire (chantier) se contredisent. Lequel appliquer ?', 'qcm', 3, 'hiérarchie des panneaux', 'suivre le panneau permanent par habitude', 'Le panneau temporaire prime toujours sur le panneau permanent équivalent.'),
((select id from subtopics where slug='panneaux-danger'), 'Les panneaux de danger sont-ils de forme triangulaire à fond blanc bordé de rouge ?', 'vrai_faux', 1, 'forme des panneaux de danger', 'confondre avec les panneaux d''obligation ronds bleus', 'Vrai, c''est la forme caractéristique des panneaux de danger en France.'),

((select id from subtopics where slug='depassement-deux-roues'), 'Hors agglomération, quelle distance latérale minimale respecter pour dépasser un cycliste ?', 'qcm', 3, 'distance de dépassement hors agglo', 'appliquer la distance de la ville (1m) partout', 'La distance minimale hors agglomération est de 1,5 mètre, contre 1 mètre en agglomération.'),
((select id from subtopics where slug='depassement-deux-roues'), 'La distance latérale de dépassement d''un cycliste est-elle la même en ville et hors ville ?', 'vrai_faux', 2, 'distance de dépassement', 'penser que la règle est uniforme partout', 'Faux, elle est de 1 mètre en agglomération et 1,5 mètre hors agglomération.'),

((select id from subtopics where slug='vitesse-agglomeration'), 'Dans une zone de rencontre, la vitesse maximale est de :', 'qcm', 2, 'zone de rencontre', 'confondre avec la zone 30', 'La vitesse maximale en zone de rencontre est de 20 km/h, avec priorité totale aux piétons.'),
((select id from subtopics where slug='vitesse-agglomeration'), 'Dans une zone 30, les piétons sont-ils prioritaires sur toute la largeur de la voie comme en zone de rencontre ?', 'vrai_faux', 2, 'zone 30 vs zone de rencontre', 'confondre les deux dispositifs', 'Faux, cette priorité totale caractérise la zone de rencontre, pas la zone 30 qui garde des trottoirs classiques.'),

((select id from subtopics where slug='vitesse-conditions-degradees'), 'Sur une route hors agglomération limitée à 90 km/h, par temps de pluie, la vitesse maximale devient :', 'qcm', 2, 'réduction de vitesse par pluie', 'oublier que la réduction s''applique aussi hors autoroute', 'La vitesse maximale devient 80 km/h, la pluie réduisant toutes les limites de 10 km/h.'),
((select id from subtopics where slug='vitesse-conditions-degradees'), 'La réduction de vitesse par temps de pluie ne s''applique-t-elle que sur autoroute ?', 'vrai_faux', 2, 'réduction de vitesse par pluie', 'limiter la règle à l''autoroute', 'Faux, elle s''applique à toutes les routes, quelle que soit la limite normale.'),

((select id from subtopics where slug='regle-2-secondes'), 'À 90 km/h, la distance de sécurité (règle des 2 secondes) représente environ :', 'qcm', 2, 'distance de sécurité en mètres', 'sous-estimer la distance réelle à haute vitesse', 'Environ 54 mètres à 90 km/h, la distance augmentant avec la vitesse.'),
((select id from subtopics where slug='regle-2-secondes'), 'La règle des 2 secondes s''adapte-t-elle automatiquement à la vitesse ?', 'vrai_faux', 1, 'avantage de la règle des 2 secondes', 'penser qu''il faut recalculer une distance fixe à chaque vitesse', 'Vrai, c''est justement l''avantage de cette règle par rapport à une distance fixe en mètres.'),

((select id from subtopics where slug='distance-par-mauvais-temps'), 'Par temps de pluie, l''intervalle de sécurité recommandé passe de 2 secondes à :', 'qcm', 2, 'distance par mauvais temps', 'sous-estimer le doublement nécessaire', 'Il est recommandé de doubler l''intervalle, soit environ 4 secondes.'),
((select id from subtopics where slug='distance-par-mauvais-temps'), 'Ralentir suffit-il, sans besoin d''augmenter la distance de sécurité par temps de pluie ?', 'vrai_faux', 2, 'distance par mauvais temps', 'penser que réduire la vitesse seule suffit', 'Faux, il faut à la fois ralentir et augmenter la distance de sécurité.'),

((select id from subtopics where slug='alcool-taux-legal'), 'Le taux d''alcool légal maximal pour un permis classique est de :', 'qcm', 2, 'taux légal classique', 'confondre avec le taux probatoire', 'Le taux maximal autorisé est de 0,5 gramme par litre de sang pour un permis classique.'),
((select id from subtopics where slug='alcool-taux-legal'), 'Le taux légal d''alcool est-il identique pour un permis probatoire et un permis classique ?', 'vrai_faux', 2, 'taux légal probatoire vs classique', 'penser que la règle est la même pour tous', 'Faux, il est de 0,2 g/L en probatoire contre 0,5 g/L en permis classique.'),

((select id from subtopics where slug='fatigue-signes'), 'Quel est un signe précoce de fatigue au volant ?', 'qcm', 1, 'signes précoces de fatigue', 'ne reconnaître que la somnolence franche', 'Des bâillements répétés sont un signe précoce à ne pas ignorer.'),
((select id from subtopics where slug='fatigue-signes'), 'Faut-il attendre d''être somnolent pour faire une pause au volant ?', 'vrai_faux', 2, 'moment de la pause', 'attendre les signes les plus graves', 'Faux, il faut agir dès les premiers signes de fatigue, sans attendre la somnolence franche.'),

((select id from subtopics where slug='pietons-passage'), 'Sur un passage piéton réglé par un feu, que devez-vous respecter en priorité ?', 'qcm', 2, 'passage piéton avec feu', 'appliquer la règle du passage sans feu', 'C''est la couleur du feu qui prime, contrairement à un passage sans feu où le piéton engagé est prioritaire.'),
((select id from subtopics where slug='pietons-passage'), 'Un piéton doit-il être totalement engagé sur la chaussée pour être prioritaire sur un passage sans feu ?', 'vrai_faux', 2, 'engagement du piéton', 'attendre qu''il soit déjà sur la chaussée', 'Faux, la priorité s''applique dès qu''il manifeste l''intention de traverser.'),

((select id from subtopics where slug='angles-morts'), 'Quel type de véhicule a généralement les angles morts les plus dangereux ?', 'qcm', 2, 'angles morts poids lourd', 'sous-estimer les poids lourds par rapport aux voitures', 'Les poids lourds et les bus ont des angles morts particulièrement étendus, surtout à l''avant droit.'),
((select id from subtopics where slug='angles-morts'), 'Un cycliste peut-il devenir invisible dans l''angle mort d''un poids lourd ?', 'vrai_faux', 1, 'invisibilité en angle mort', 'sous-estimer ce risque', 'Vrai, c''est une cause fréquente d''accidents graves lors des virages de poids lourds.'),

((select id from subtopics where slug='vitesse-autoroute'), 'Par visibilité inférieure à 50 mètres sur autoroute, la vitesse maximale est :', 'qcm', 2, 'vitesse autoroute brouillard', 'penser que la limite normale de 130 s''applique encore', 'La vitesse maximale devient 50 km/h, quelle que soit la limite habituelle de l''autoroute.'),
((select id from subtopics where slug='vitesse-autoroute'), 'Un permis probatoire peut-il rouler à 130 km/h sur autoroute par temps sec ?', 'vrai_faux', 2, 'limite probatoire autoroute', 'penser que la limite générale s''applique en probatoire', 'Faux, la limite en probatoire est de 110 km/h, même par temps sec.'),

((select id from subtopics where slug='bande-urgence'), 'Dans quel cas est-il autorisé de s''arrêter sur la bande d''arrêt d''urgence ?', 'qcm', 2, 'usage légitime de la bande d''urgence', 'penser qu''un motif de confort peut suffire', 'Uniquement en cas d''urgence réelle : panne, malaise, accident.'),
((select id from subtopics where slug='bande-urgence'), 'La bande d''arrêt d''urgence peut-elle servir de voie de circulation en cas d''embouteillage ?', 'vrai_faux', 2, 'bande d''urgence comme voie', 'penser qu''un embouteillage justifie son usage', 'Faux, sauf signalisation explicite l''autorisant temporairement, ce qui reste exceptionnel.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Deux véhicules arrivent en même temps à une intersection%'), 'Celui de gauche cède le passage', true),
((select id from questions where text like 'Deux véhicules arrivent en même temps à une intersection%'), 'Celui de droite cède le passage', false),
((select id from questions where text like 'Deux véhicules arrivent en même temps à une intersection%'), 'Aucun des deux ne cède', false),

((select id from questions where text like 'La priorité à droite s''applique-t-elle aussi dans un lotissement%'), 'Vrai', true),
((select id from questions where text like 'La priorité à droite s''applique-t-elle aussi dans un lotissement%'), 'Faux', false),

((select id from questions where text like 'Un panneau cédez-le-passage impose-t-il toujours%'), 'Vrai', false),
((select id from questions where text like 'Un panneau cédez-le-passage impose-t-il toujours%'), 'Faux', true),

((select id from questions where text like 'À un cédez-le-passage, une voiture prioritaire approche%'), 'Ralentir et céder si nécessaire', true),
((select id from questions where text like 'À un cédez-le-passage, une voiture prioritaire approche%'), 'Accélérer pour passer avant', false),
((select id from questions where text like 'À un cédez-le-passage, une voiture prioritaire approche%'), 'Klaxonner et continuer', false),

((select id from questions where text like 'Un panneau de danger permanent et un panneau de danger temporaire%'), 'Le panneau permanent', false),
((select id from questions where text like 'Un panneau de danger permanent et un panneau de danger temporaire%'), 'Le panneau temporaire', true),

((select id from questions where text like 'Les panneaux de danger sont-ils de forme triangulaire%'), 'Vrai', true),
((select id from questions where text like 'Les panneaux de danger sont-ils de forme triangulaire%'), 'Faux', false),

((select id from questions where text like 'Hors agglomération, quelle distance latérale minimale%'), '1 mètre', false),
((select id from questions where text like 'Hors agglomération, quelle distance latérale minimale%'), '1,5 mètre', true),
((select id from questions where text like 'Hors agglomération, quelle distance latérale minimale%'), '2,5 mètres', false),

((select id from questions where text like 'La distance latérale de dépassement d''un cycliste est-elle la même%'), 'Vrai', false),
((select id from questions where text like 'La distance latérale de dépassement d''un cycliste est-elle la même%'), 'Faux', true),

((select id from questions where text like 'Dans une zone de rencontre, la vitesse maximale%'), '30 km/h', false),
((select id from questions where text like 'Dans une zone de rencontre, la vitesse maximale%'), '20 km/h', true),
((select id from questions where text like 'Dans une zone de rencontre, la vitesse maximale%'), '50 km/h', false),

((select id from questions where text like 'Dans une zone 30, les piétons sont-ils prioritaires%'), 'Vrai', false),
((select id from questions where text like 'Dans une zone 30, les piétons sont-ils prioritaires%'), 'Faux', true),

((select id from questions where text like 'Sur une route hors agglomération limitée à 90 km/h, par temps de pluie%'), '90 km/h', false),
((select id from questions where text like 'Sur une route hors agglomération limitée à 90 km/h, par temps de pluie%'), '80 km/h', true),
((select id from questions where text like 'Sur une route hors agglomération limitée à 90 km/h, par temps de pluie%'), '70 km/h', false),

((select id from questions where text like 'La réduction de vitesse par temps de pluie ne s''applique-t-elle que sur autoroute%'), 'Vrai', false),
((select id from questions where text like 'La réduction de vitesse par temps de pluie ne s''applique-t-elle que sur autoroute%'), 'Faux', true),

((select id from questions where text like 'À 90 km/h, la distance de sécurité%'), '30 mètres', false),
((select id from questions where text like 'À 90 km/h, la distance de sécurité%'), '54 mètres', true),
((select id from questions where text like 'À 90 km/h, la distance de sécurité%'), '78 mètres', false),

((select id from questions where text like 'La règle des 2 secondes s''adapte-t-elle automatiquement%'), 'Vrai', true),
((select id from questions where text like 'La règle des 2 secondes s''adapte-t-elle automatiquement%'), 'Faux', false),

((select id from questions where text like 'Par temps de pluie, l''intervalle de sécurité recommandé%'), '3 secondes', false),
((select id from questions where text like 'Par temps de pluie, l''intervalle de sécurité recommandé%'), '4 secondes', true),
((select id from questions where text like 'Par temps de pluie, l''intervalle de sécurité recommandé%'), '2 secondes (inchangé)', false),

((select id from questions where text like 'Ralentir suffit-il, sans besoin d''augmenter la distance%'), 'Vrai', false),
((select id from questions where text like 'Ralentir suffit-il, sans besoin d''augmenter la distance%'), 'Faux', true),

((select id from questions where text like 'Le taux d''alcool légal maximal pour un permis classique%'), '0,2 g/L', false),
((select id from questions where text like 'Le taux d''alcool légal maximal pour un permis classique%'), '0,5 g/L', true),
((select id from questions where text like 'Le taux d''alcool légal maximal pour un permis classique%'), '0,8 g/L', false),

((select id from questions where text like 'Le taux légal d''alcool est-il identique pour un permis probatoire%'), 'Vrai', false),
((select id from questions where text like 'Le taux légal d''alcool est-il identique pour un permis probatoire%'), 'Faux', true),

((select id from questions where text like 'Quel est un signe précoce de fatigue au volant%'), 'Bâillements répétés', true),
((select id from questions where text like 'Quel est un signe précoce de fatigue au volant%'), 'Endormissement complet', false),

((select id from questions where text like 'Faut-il attendre d''être somnolent pour faire une pause%'), 'Vrai', false),
((select id from questions where text like 'Faut-il attendre d''être somnolent pour faire une pause%'), 'Faux', true),

((select id from questions where text like 'Sur un passage piéton réglé par un feu%'), 'La couleur du feu', true),
((select id from questions where text like 'Sur un passage piéton réglé par un feu%'), 'La règle du passage sans feu', false),

((select id from questions where text like 'Un piéton doit-il être totalement engagé sur la chaussée%'), 'Vrai', false),
((select id from questions where text like 'Un piéton doit-il être totalement engagé sur la chaussée%'), 'Faux', true),

((select id from questions where text like 'Quel type de véhicule a généralement les angles morts les plus dangereux%'), 'Poids lourd ou bus', true),
((select id from questions where text like 'Quel type de véhicule a généralement les angles morts les plus dangereux%'), 'Voiture particulière', false),

((select id from questions where text like 'Un cycliste peut-il devenir invisible dans l''angle mort%'), 'Vrai', true),
((select id from questions where text like 'Un cycliste peut-il devenir invisible dans l''angle mort%'), 'Faux', false),

((select id from questions where text like 'Par visibilité inférieure à 50 mètres sur autoroute%'), '130 km/h', false),
((select id from questions where text like 'Par visibilité inférieure à 50 mètres sur autoroute%'), '50 km/h', true),
((select id from questions where text like 'Par visibilité inférieure à 50 mètres sur autoroute%'), '90 km/h', false),

((select id from questions where text like 'Un permis probatoire peut-il rouler à 130 km/h%'), 'Vrai', false),
((select id from questions where text like 'Un permis probatoire peut-il rouler à 130 km/h%'), 'Faux', true),

((select id from questions where text like 'Dans quel cas est-il autorisé de s''arrêter sur la bande d''arrêt%'), 'Urgence réelle uniquement', true),
((select id from questions where text like 'Dans quel cas est-il autorisé de s''arrêter sur la bande d''arrêt%'), 'Pour consulter son itinéraire', false),
((select id from questions where text like 'Dans quel cas est-il autorisé de s''arrêter sur la bande d''arrêt%'), 'Pour une courte pause', false),

((select id from questions where text like 'La bande d''arrêt d''urgence peut-elle servir de voie de circulation%'), 'Vrai', false),
((select id from questions where text like 'La bande d''arrêt d''urgence peut-elle servir de voie de circulation%'), 'Faux', true);
