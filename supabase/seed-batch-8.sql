-- ============================================
-- RENFORCEMENT DU CONTENU : batch 8/9
-- +2 questions pour 14 notions (premiers secours, équipements, passagers,
-- éco-conduite, stationnement, ronds-points, nuit, météo, piétons)
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='triangle-gilet-panne'), 'À quelle distance minimale placer le triangle de présignalisation ?', 'qcm', 2, 'distance triangle', 'sous-estimer la distance nécessaire', 'Le triangle doit être placé à au moins 30 mètres en amont du véhicule.'),
((select id from subtopics where slug='triangle-gilet-panne'), 'Le gilet doit-il être enfilé avant de sortir du véhicule ?', 'vrai_faux', 1, 'ordre gilet avant sortie', 'sortir avant d''enfiler le gilet', 'Vrai, il doit être mis avant de sortir, y compris sur la bande d''arrêt d''urgence.'),

((select id from subtopics where slug='conduite-a-tenir-accident'), 'Que signifie la première étape "Protéger" face à un accident ?', 'qcm', 2, 'étape protéger', 'confondre avec secourir directement', 'Sécuriser la zone pour éviter un sur-accident, avant toute autre action.'),
((select id from subtopics where slug='conduite-a-tenir-accident'), 'Faut-il toujours déplacer un blessé pour le mettre plus confortablement ?', 'vrai_faux', 2, 'déplacement d''un blessé', 'vouloir aider en déplaçant la victime', 'Faux, un déplacement mal fait peut aggraver une blessure, sauf danger immédiat.'),

((select id from subtopics where slug='gilet-triangle-obligation'), 'Le triangle de présignalisation doit-il être homologué ?', 'vrai_faux', 1, 'homologation du triangle', 'penser qu''un triangle quelconque suffit', 'Vrai, il doit respecter une norme d''homologation pour être conforme.'),
((select id from subtopics where slug='gilet-triangle-obligation'), 'La non-présentation du triangle et du gilet lors d''un contrôle peut entraîner :', 'qcm', 1, 'sanction non-présentation', 'penser qu''il n''y a aucune sanction', 'Une amende, même si l''équipement existe réellement dans le véhicule mais n''est pas présenté.'),

((select id from subtopics where slug='ceinture-securite'), 'La ceinture de sécurité est-elle obligatoire pour un trajet très court ?', 'vrai_faux', 1, 'ceinture trajet court', 'penser qu''un trajet court en dispense', 'Vrai, elle reste obligatoire quelle que soit la distance du trajet.'),
((select id from subtopics where slug='ceinture-securite'), 'La ceinture est-elle obligatoire uniquement si le véhicule roule à plus de 50 km/h ?', 'vrai_faux', 1, 'ceinture et vitesse', 'penser qu''une faible vitesse dispense de la ceinture', 'Faux, elle est obligatoire à toute vitesse, y compris en dessous de 50 km/h.'),

((select id from subtopics where slug='eco-conduite-principes'), 'Quelle pratique correspond le mieux à l''éco-conduite ?', 'qcm', 2, 'pratique éco-conduite', 'confondre avec le simple ralentissement', 'Anticiper et lever le pied tôt plutôt que de freiner fort au dernier moment.'),
((select id from subtopics where slug='eco-conduite-principes'), 'Un régime moteur élevé en permanence est-il recommandé pour l''éco-conduite ?', 'vrai_faux', 1, 'régime moteur éco-conduite', 'penser qu''un régime élevé aide à avancer plus vite donc à économiser du temps', 'Faux, un régime modéré et stable réduit la consommation et l''usure du véhicule.'),

((select id from subtopics where slug='lignes-jaunes-stationnement'), 'Une ligne jaune discontinue le long du trottoir interdit :', 'qcm', 2, 'ligne jaune discontinue', 'penser qu''elle interdit aussi l''arrêt bref', 'Le stationnement, mais un arrêt bref reste toléré, contrairement à la ligne continue.'),
((select id from subtopics where slug='lignes-jaunes-stationnement'), 'Une ligne jaune continue autorise-t-elle un arrêt bref pour déposer un passager ?', 'vrai_faux', 2, 'ligne jaune continue et arrêt', 'penser qu''un arrêt très bref est toléré', 'Faux, ni l''arrêt ni le stationnement ne sont autorisés sur une ligne continue.'),

((select id from subtopics where slug='stationnement-genant-dangereux'), 'Se garer devant un garage privé est considéré comme un stationnement :', 'qcm', 1, 'stationnement gênant simple', 'confondre avec un stationnement dangereux', 'Gênant, sanctionné à 35€, moins grave qu''un stationnement dangereux.'),
((select id from subtopics where slug='stationnement-genant-dangereux'), 'Un stationnement dangereux peut-il entraîner un retrait de points ?', 'vrai_faux', 2, 'retrait de points stationnement dangereux', 'penser que seul le stationnement gênant simple existe comme sanction', 'Vrai, contrairement au stationnement simplement gênant qui n''entraîne qu''une amende.'),

((select id from subtopics where slug='priorite-rond-point'), 'Dans un rond-point sans aucun panneau (rare), quelle règle s''applique ?', 'qcm', 2, 'rond-point sans panneau', 'appliquer la règle des carrefours à sens giratoire courants', 'La priorité à droite classique s''applique, contrairement à la majorité des ronds-points avec cédez-le-passage.'),
((select id from subtopics where slug='priorite-rond-point'), 'La majorité des ronds-points en France sont-ils des carrefours à sens giratoire avec cédez-le-passage ?', 'vrai_faux', 2, 'fréquence des carrefours giratoires', 'penser que le rond-point classique à priorité à droite est le plus fréquent', 'Vrai, c''est la configuration la plus répandue, avec priorité aux véhicules déjà engagés.'),

((select id from subtopics where slug='sortie-rond-point'), 'En sortant d''un rond-point, devez-vous céder le passage à un piéton qui traverse la sortie ?', 'qcm', 2, 'priorité piéton sortie rond-point', 'penser que la priorité du rond-point prime sur celle du piéton', 'Oui, la priorité au piéton s''applique aussi en sortie de rond-point.'),
((select id from subtopics where slug='sortie-rond-point'), 'Le clignotant donne-t-il la priorité pour sortir du rond-point ?', 'vrai_faux', 1, 'clignotant et priorité de sortie', 'penser que signaler son intention donne un droit de passage', 'Faux, le clignotant informe seulement, il ne donne jamais la priorité.'),

((select id from subtopics where slug='eclairage-nuit'), 'Quand les feux de croisement sont-ils obligatoires ?', 'qcm', 1, 'obligation feux de croisement', 'penser qu''ils ne sont utiles qu''en pleine nuit noire', 'Dès la tombée de la nuit ou dès que la visibilité est insuffisante, même de jour.'),
((select id from subtopics where slug='eclairage-nuit'), 'Les feux de route peuvent-ils être utilisés en permanence de nuit, même en présence d''autres véhicules ?', 'vrai_faux', 2, 'feux de route et autres usagers', 'garder les feux de route trop longtemps en croisant un véhicule', 'Faux, ils doivent être éteints dès qu''un autre usager est visible, pour ne pas l''éblouir.'),

((select id from subtopics where slug='adaptation-vitesse-nuit'), 'De nuit, votre vitesse doit vous permettre de vous arrêter dans :', 'qcm', 2, 'distance de visibilité nocturne', 'se fier à la connaissance de la route plutôt qu''à la distance éclairée', 'La distance éclairée par vos propres feux, quelle que soit votre connaissance du trajet.'),
((select id from subtopics where slug='adaptation-vitesse-nuit'), 'Bien connaître une route dispense-t-elle d''adapter sa vitesse la nuit ?', 'vrai_faux', 2, 'connaissance de la route et vitesse nocturne', 'penser que la familiarité compense la visibilité réduite', 'Faux, la distance de visibilité reste réduite la nuit, indépendamment de la connaissance du trajet.'),

((select id from subtopics where slug='brouillard-visibilite'), 'Les feux de brouillard arrière doivent être éteints :', 'qcm', 2, 'extinction des feux arrière', 'les garder allumés par précaution excessive', 'Dès que la visibilité redevient correcte, pour ne pas éblouir les autres conducteurs.'),
((select id from subtopics where slug='brouillard-visibilite'), 'Par temps de brouillard léger, les feux de brouillard avant peuvent-ils être utilisés en complément des feux de croisement ?', 'vrai_faux', 1, 'usage des feux de brouillard avant', 'penser qu''ils sont réservés au brouillard très dense uniquement', 'Vrai, ils peuvent être utilisés plus largement que les feux arrière.'),

((select id from subtopics where slug='neige-verglas'), 'Quelle zone gèle en premier par temps froid ?', 'qcm', 2, 'zones à risque de gel', 'penser que toute la route gèle de manière uniforme', 'Les ponts, qui refroidissent plus vite que le reste de la chaussée.'),
((select id from subtopics where slug='neige-verglas'), 'Sur neige, la distance de freinage reste-t-elle comparable à une route sèche ?', 'vrai_faux', 2, 'distance de freinage sur neige', 'sous-estimer l''augmentation de la distance de freinage', 'Faux, elle peut être multipliée par 2 à 10 selon l''adhérence.'),

((select id from subtopics where slug='priorite-absolue-canne-blanche'), 'Une personne avec un chien guide bénéficie-t-elle de la même priorité qu''une personne avec une canne blanche ?', 'vrai_faux', 1, 'chien guide et priorité', 'penser que seule la canne blanche est reconnue', 'Vrai, les deux situations bénéficient d''une priorité de passage absolue.'),
((select id from subtopics where slug='priorite-absolue-canne-blanche'), 'La priorité d''une personne malvoyante avec canne blanche s''applique :', 'qcm', 2, 'étendue de la priorité absolue', 'limiter cette priorité aux passages piétons signalés', 'Même hors passage piéton, contrairement à la priorité piéton classique.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'À quelle distance minimale placer le triangle%'), '10 mètres', false),
((select id from questions where text like 'À quelle distance minimale placer le triangle%'), '30 mètres', true),
((select id from questions where text like 'À quelle distance minimale placer le triangle%'), '100 mètres', false),

((select id from questions where text like 'Le gilet doit-il être enfilé avant de sortir%'), 'Vrai', true),
((select id from questions where text like 'Le gilet doit-il être enfilé avant de sortir%'), 'Faux', false),

((select id from questions where text like 'Que signifie la première étape "Protéger"%'), 'Sécuriser la zone', true),
((select id from questions where text like 'Que signifie la première étape "Protéger"%'), 'Appeler immédiatement les secours', false),
((select id from questions where text like 'Que signifie la première étape "Protéger"%'), 'Déplacer le blessé', false),

((select id from questions where text like 'Faut-il toujours déplacer un blessé%'), 'Vrai', false),
((select id from questions where text like 'Faut-il toujours déplacer un blessé%'), 'Faux', true),

((select id from questions where text like 'Le triangle de présignalisation doit-il être homologué%'), 'Vrai', true),
((select id from questions where text like 'Le triangle de présignalisation doit-il être homologué%'), 'Faux', false),

((select id from questions where text like 'La non-présentation du triangle et du gilet%'), 'Une amende', true),
((select id from questions where text like 'La non-présentation du triangle et du gilet%'), 'Aucune sanction', false),

((select id from questions where text like 'La ceinture de sécurité est-elle obligatoire pour un trajet très court%'), 'Vrai', true),
((select id from questions where text like 'La ceinture de sécurité est-elle obligatoire pour un trajet très court%'), 'Faux', false),

((select id from questions where text like 'La ceinture est-elle obligatoire uniquement si le véhicule roule%'), 'Vrai', false),
((select id from questions where text like 'La ceinture est-elle obligatoire uniquement si le véhicule roule%'), 'Faux', true),

((select id from questions where text like 'Quelle pratique correspond le mieux à l''éco-conduite%'), 'Anticiper et lever le pied tôt', true),
((select id from questions where text like 'Quelle pratique correspond le mieux à l''éco-conduite%'), 'Rouler le plus lentement possible', false),

((select id from questions where text like 'Un régime moteur élevé en permanence est-il recommandé%'), 'Vrai', false),
((select id from questions where text like 'Un régime moteur élevé en permanence est-il recommandé%'), 'Faux', true),

((select id from questions where text like 'Une ligne jaune discontinue le long du trottoir interdit%'), 'Le stationnement uniquement', true),
((select id from questions where text like 'Une ligne jaune discontinue le long du trottoir interdit%'), 'L''arrêt et le stationnement', false),

((select id from questions where text like 'Une ligne jaune continue autorise-t-elle un arrêt bref%'), 'Vrai', false),
((select id from questions where text like 'Une ligne jaune continue autorise-t-elle un arrêt bref%'), 'Faux', true),

((select id from questions where text like 'Se garer devant un garage privé est considéré%'), 'Stationnement gênant (35€)', true),
((select id from questions where text like 'Se garer devant un garage privé est considéré%'), 'Stationnement dangereux (135€)', false),

((select id from questions where text like 'Un stationnement dangereux peut-il entraîner un retrait de points%'), 'Vrai', true),
((select id from questions where text like 'Un stationnement dangereux peut-il entraîner un retrait de points%'), 'Faux', false),

((select id from questions where text like 'Dans un rond-point sans aucun panneau%'), 'La priorité à droite', true),
((select id from questions where text like 'Dans un rond-point sans aucun panneau%'), 'La priorité à l''anneau', false),

((select id from questions where text like 'La majorité des ronds-points en France sont-ils des carrefours%'), 'Vrai', true),
((select id from questions where text like 'La majorité des ronds-points en France sont-ils des carrefours%'), 'Faux', false),

((select id from questions where text like 'En sortant d''un rond-point, devez-vous céder le passage à un piéton%'), 'Oui', true),
((select id from questions where text like 'En sortant d''un rond-point, devez-vous céder le passage à un piéton%'), 'Non', false),

((select id from questions where text like 'Le clignotant donne-t-il la priorité pour sortir du rond-point%'), 'Vrai', false),
((select id from questions where text like 'Le clignotant donne-t-il la priorité pour sortir du rond-point%'), 'Faux', true),

((select id from questions where text like 'Quand les feux de croisement sont-ils obligatoires%'), 'Nuit ou visibilité insuffisante', true),
((select id from questions where text like 'Quand les feux de croisement sont-ils obligatoires%'), 'Uniquement en pleine nuit noire', false),

((select id from questions where text like 'Les feux de route peuvent-ils être utilisés en permanence de nuit%'), 'Vrai', false),
((select id from questions where text like 'Les feux de route peuvent-ils être utilisés en permanence de nuit%'), 'Faux', true),

((select id from questions where text like 'De nuit, votre vitesse doit vous permettre de vous arrêter dans%'), 'La distance éclairée par vos feux', true),
((select id from questions where text like 'De nuit, votre vitesse doit vous permettre de vous arrêter dans%'), 'La distance habituelle de jour', false),

((select id from questions where text like 'Bien connaître une route dispense-t-elle d''adapter%'), 'Vrai', false),
((select id from questions where text like 'Bien connaître une route dispense-t-elle d''adapter%'), 'Faux', true),

((select id from questions where text like 'Les feux de brouillard arrière doivent être éteints%'), 'Dès que la visibilité redevient correcte', true),
((select id from questions where text like 'Les feux de brouillard arrière doivent être éteints%'), 'Jamais, ils peuvent rester allumés', false),

((select id from questions where text like 'Par temps de brouillard léger, les feux de brouillard avant%'), 'Vrai', true),
((select id from questions where text like 'Par temps de brouillard léger, les feux de brouillard avant%'), 'Faux', false),

((select id from questions where text like 'Quelle zone gèle en premier par temps froid%'), 'Les ponts', true),
((select id from questions where text like 'Quelle zone gèle en premier par temps froid%'), 'Les grandes lignes droites', false),

((select id from questions where text like 'Sur neige, la distance de freinage reste-t-elle comparable%'), 'Vrai', false),
((select id from questions where text like 'Sur neige, la distance de freinage reste-t-elle comparable%'), 'Faux', true),

((select id from questions where text like 'Une personne avec un chien guide bénéficie-t-elle de la même priorité%'), 'Vrai', true),
((select id from questions where text like 'Une personne avec un chien guide bénéficie-t-elle de la même priorité%'), 'Faux', false),

((select id from questions where text like 'La priorité d''une personne malvoyante avec canne blanche s''applique%'), 'Même hors passage piéton', true),
((select id from questions where text like 'La priorité d''une personne malvoyante avec canne blanche s''applique%'), 'Uniquement sur passage piéton signalé', false);
