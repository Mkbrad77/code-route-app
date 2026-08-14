-- ============================================
-- EXTENSION DU CONTENU : batch 6/6 — 4 thèmes
-- Sécurité du véhicule, Conducteur/comportement,
-- Documents et réglementation, Situations particulières
-- ============================================

insert into topics (slug, name, "order") values
('securite-vehicule', 'Sécurité du véhicule', 20),
('conducteur-comportement', 'Conducteur et comportement', 21),
('documents-reglementation', 'Documents et réglementation', 22),
('situations-particulieres', 'Situations particulières', 23);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values

((select id from topics where slug='securite-vehicule'), 'etat-pneus',
 'L''état des pneus',
 'La profondeur minimale légale des sculptures d''un pneu est de 1,6 mm sur toute la bande de roulement. Un pneu trop lisse augmente fortement le risque d''aquaplaning et allonge la distance de freinage.',
 'Piège : penser qu''un pneu "visuellement correct" est forcément conforme — l''usure doit être vérifiée précisément (témoins d''usure intégrés au pneu), pas seulement à l''œil rapide.',
 'Usure normale et progressive ≠ usure irrégulière (souvent due à un problème de parallélisme ou de pression), qui doit alerter même si la profondeur semble suffisante par endroits.',
 '1,6 mm = profondeur minimale légale des sculptures. En dessous, le pneu est non conforme.',
 'Vous remarquez que les témoins d''usure de vos pneus commencent à affleurer la surface de la bande de roulement.',
 'Vos pneus approchent de la limite légale de 1,6 mm : il est temps de prévoir leur remplacement rapidement.'),

((select id from topics where slug='securite-vehicule'), 'controle-technique-voiture',
 'Le contrôle technique automobile',
 'Le premier contrôle technique d''une voiture particulière doit être réalisé dans les 6 mois précédant le 4e anniversaire de sa première mise en circulation, puis il est renouvelé tous les 2 ans.',
 'Piège : penser que le contrôle technique n''est nécessaire qu''en cas de vente du véhicule — c''est une obligation périodique indépendante de toute transaction.',
 'Contrôle technique voiture (4 ans puis tous les 2 ans) ≠ contrôle technique deux-roues motorisé (périodicité différente, généralement triennale).',
 'Voiture : 1er contrôle à 4 ans, puis tous les 2 ans, quelle que soit l''intention de vendre ou non.',
 'Votre voiture a 4 ans et vous ne comptez pas la vendre prochainement.',
 'Vous devez quand même passer le contrôle technique : c''est une obligation périodique, pas seulement liée à la revente.'),

((select id from topics where slug='conducteur-comportement'), 'telephone-tenu-en-main',
 'Le téléphone tenu en main',
 'L''usage d''un téléphone tenu en main est interdit pour tout conducteur en circulation, y compris à l''arrêt à un feu rouge ou dans un embouteillage moteur allumé. Un kit mains-libres intégré au véhicule reste autorisé.',
 'Piège fréquent : penser qu''être à l''arrêt (feu rouge, bouchon) autorise à prendre son téléphone en main — le véhicule "en circulation" inclut ces arrêts temporaires, moteur tournant.',
 'Kit mains-libres intégré au véhicule (autorisé) ≠ téléphone tenu en main même via écouteur/oreillette (interdit et sanctionné).',
 'Téléphone tenu en main = 135€ d''amende et 3 points, même à l''arrêt à un feu rouge.',
 'Vous êtes arrêté à un feu rouge, moteur allumé, et attrapez votre téléphone pour lire un message.',
 'C''est une infraction : le véhicule est considéré en circulation même à l''arrêt à un feu, moteur tournant.'),

((select id from topics where slug='conducteur-comportement'), 'controle-routier-attitude',
 'Face à un contrôle routier',
 'Lors d''un contrôle, le conducteur doit s''arrêter dès que les forces de l''ordre le lui indiquent, présenter les documents demandés (permis, carte grise, attestation d''assurance) et se comporter de manière coopérative.',
 'Piège : penser que refuser de s''arrêter ou accélérer pour "gagner du temps" reste sans conséquence — le refus d''obtempérer est une infraction grave, bien plus sévèrement sanctionnée que le contrôle initial.',
 'Ralentir sans s''arrêter complètement ≠ s''arrêter réellement : un arrêt incomplet peut être assimilé à un refus d''obtempérer selon les circonstances.',
 'S''arrêter complètement et présenter les documents demandés : le refus d''obtempérer est une infraction grave.',
 'Des forces de l''ordre vous font signe de vous arrêter sur le bas-côté.',
 'Vous devez vous arrêter complètement et de manière visible, puis présenter les documents demandés sans discuter leur légitimité sur place.'),

((select id from topics where slug='documents-reglementation'), 'documents-obligatoires',
 'Les documents obligatoires',
 'Le conducteur doit être en mesure de présenter à tout moment : son permis de conduire, la carte grise du véhicule (certificat d''immatriculation) et l''attestation d''assurance en cours de validité.',
 'Piège : penser qu''avoir ces documents "chez soi" suffit — ils doivent être présentables lors d''un contrôle, la non-présentation immédiate peut être sanctionnée même si le document existe bien.',
 'Ne pas posséder le document (infraction plus grave) ≠ ne pas pouvoir le présenter immédiatement lors d''un contrôle (infraction différente, souvent régularisable).',
 'Permis + carte grise + attestation d''assurance : à pouvoir présenter à tout moment lors d''un contrôle.',
 'Lors d''un contrôle, vous n''avez pas votre carte grise sur vous mais elle existe bel et bien chez vous.',
 'Vous risquez une sanction pour non-présentation, même si le document existe réellement — mieux vaut toujours l''avoir avec vous.'),

((select id from topics where slug='documents-reglementation'), 'assurance-obligatoire',
 'L''assurance obligatoire',
 'Tout véhicule motorisé en circulation doit être couvert au minimum par une assurance responsabilité civile, qui couvre les dommages causés aux tiers. Rouler sans assurance est une infraction grave.',
 'Piège : penser qu''un véhicule rarement utilisé ou "juste garé" n''a pas besoin d''assurance — l''obligation s''applique dès lors que le véhicule est susceptible de circuler, pas seulement pendant les trajets.',
 'Assurance au tiers (minimum légal, couvre les dommages causés à autrui) ≠ assurance tous risques (facultative, couvre aussi son propre véhicule).',
 'Assurance responsabilité civile = minimum légal obligatoire pour tout véhicule en circulation.',
 'Vous possédez une vieille voiture que vous n''utilisez presque jamais, garée dans la rue.',
 'Elle doit rester assurée au moins au tiers tant qu''elle est susceptible de circuler, même si vous l''utilisez rarement.'),

((select id from topics where slug='situations-particulieres'), 'passage-a-niveau',
 'Le passage à niveau',
 'À l''approche d''un passage à niveau, il ne faut jamais s''engager si les feux clignotent ou si la barrière commence à descendre, et ne jamais s''arrêter sur les voies, même en cas de ralentissement en aval.',
 'Piège grave : s''engager sur un passage à niveau alors que la circulation est ralentie de l''autre côté, en pensant "avoir le temps" — il ne faut jamais s''engager si on n''est pas certain de pouvoir dégager complètement les voies.',
 'Feux clignotants seuls (déjà interdiction de s''engager) ≠ barrière en train de descendre (danger imminent, situation encore plus critique).',
 'Ne jamais s''engager sur un passage à niveau si on n''est pas certain de pouvoir le dégager complètement, feux éteints ou pas.',
 'Vous approchez d''un passage à niveau sans barrière ni feu actif, mais la circulation est dense juste après.',
 'Ne vous engagez pas si vous n''êtes pas certain de pouvoir dégager complètement les voies de l''autre côté.'),

((select id from topics where slug='situations-particulieres'), 'vehicules-prioritaires',
 'Les véhicules prioritaires',
 'Police, gendarmerie, sapeurs-pompiers et SAMU/ambulances en intervention, annonçant leur approche par avertisseurs spéciaux (gyrophares et sirènes), doivent être laissés passer en toutes circonstances, y compris en dérogeant si besoin à d''autres règles (feu rouge franchi prudemment).',
 'Piège : penser qu''il faut rester strictement immobile au feu rouge même pour laisser passer un véhicule prioritaire — il est en réalité autorisé, prudemment, de franchir un feu rouge si c''est nécessaire pour dégager le passage.',
 'Véhicule prioritaire (police, pompiers, SAMU en intervention : priorité absolue) ≠ véhicule à facilités de passage (peut déroger à certaines règles mais n''a pas priorité absolue sur les autres usagers).',
 'Céder le passage aux véhicules prioritaires = obligatoire ; refuser = 135€ d''amende et 4 points.',
 'Un véhicule de police, gyrophares et sirène allumés, arrive derrière vous alors que vous êtes à un feu rouge et qu''aucun passage n''est possible sans avancer.',
 'Vous pouvez avancer prudemment pour dégager le passage, même si le feu est rouge, à condition de le faire lentement et en sécurité.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='etat-pneus'), 'Quelle est la profondeur minimale légale des sculptures d''un pneu ?', 'qcm', 2, 'usure des pneus', 'juger l''usure seulement à l''œil, sans vérifier les témoins d''usure', 'La profondeur minimale légale est de 1,6 mm sur toute la bande de roulement.'),
((select id from subtopics where slug='controle-technique-voiture'), 'Le premier contrôle technique d''une voiture doit être réalisé avant :', 'qcm', 2, 'contrôle technique voiture', 'penser que ce n''est nécessaire qu''en cas de vente', 'Le premier contrôle doit être réalisé avant le 4e anniversaire de la première mise en circulation, puis tous les 2 ans.'),
((select id from subtopics where slug='telephone-tenu-en-main'), 'Peut-on tenir son téléphone en main à un feu rouge, moteur allumé ?', 'vrai_faux', 2, 'téléphone au feu rouge', 'penser qu''être à l''arrêt autorise à prendre le téléphone', 'Faux : le véhicule est considéré en circulation même à l''arrêt à un feu, l''infraction s''applique donc.'),
((select id from subtopics where slug='controle-routier-attitude'), 'Que risque un conducteur qui refuse de s''arrêter lors d''un contrôle routier ?', 'qcm', 3, 'refus d''obtempérer', 'penser que ralentir sans s''arrêter est sans risque', 'Le refus d''obtempérer est une infraction grave, sanctionnée bien plus sévèrement que le simple contrôle initial.'),
((select id from subtopics where slug='documents-obligatoires'), 'Que risquez-vous si vous ne pouvez pas présenter votre carte grise lors d''un contrôle, même si elle existe chez vous ?', 'qcm', 2, 'présentation des documents', 'penser que posséder le document suffit sans pouvoir le présenter', 'Vous risquez une sanction pour non-présentation, même si le document existe réellement chez vous.'),
((select id from subtopics where slug='assurance-obligatoire'), 'Un véhicule rarement utilisé mais garé sur la voie publique doit-il rester assuré ?', 'vrai_faux', 2, 'assurance obligatoire', 'penser qu''un véhicule peu utilisé n''a pas besoin d''assurance', 'Vrai : l''obligation d''assurance s''applique dès lors que le véhicule est susceptible de circuler.'),
((select id from subtopics where slug='passage-a-niveau'), 'Pouvez-vous vous engager sur un passage à niveau si la circulation est dense juste après ?', 'vrai_faux', 3, 'engagement passage à niveau', 'penser qu''on a le temps de passer avant que ça bloque', 'Faux : il ne faut jamais s''engager si on n''est pas certain de pouvoir dégager complètement les voies.'),
((select id from subtopics where slug='vehicules-prioritaires'), 'Un véhicule de police prioritaire arrive derrière vous à un feu rouge sans possibilité de vous ranger. Que faites-vous ?', 'qcm', 2, 'céder passage véhicule prioritaire', 'penser qu''il faut rester immobile même pour un véhicule prioritaire', 'Vous pouvez avancer prudemment pour dégager le passage, même au feu rouge, en toute sécurité.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Quelle est la profondeur minimale légale%'), '1,6 mm', true),
((select id from questions where text like 'Quelle est la profondeur minimale légale%'), '3 mm', false),
((select id from questions where text like 'Quelle est la profondeur minimale légale%'), '0,5 mm', false),

((select id from questions where text like 'Le premier contrôle technique d''une voiture%'), 'Son 2e anniversaire', false),
((select id from questions where text like 'Le premier contrôle technique d''une voiture%'), 'Son 4e anniversaire', true),
((select id from questions where text like 'Le premier contrôle technique d''une voiture%'), 'Son 6e anniversaire', false),

((select id from questions where text like 'Peut-on tenir son téléphone en main à un feu rouge%'), 'Vrai', false),
((select id from questions where text like 'Peut-on tenir son téléphone en main à un feu rouge%'), 'Faux', true),

((select id from questions where text like 'Que risque un conducteur qui refuse de s''arrêter%'), 'Rien de plus que le contrôle initial', false),
((select id from questions where text like 'Que risque un conducteur qui refuse de s''arrêter%'), 'Une infraction grave (refus d''obtempérer)', true),
((select id from questions where text like 'Que risque un conducteur qui refuse de s''arrêter%'), 'Un simple avertissement', false),

((select id from questions where text like 'Que risquez-vous si vous ne pouvez pas présenter votre carte grise%'), 'Rien, puisqu''elle existe', false),
((select id from questions where text like 'Que risquez-vous si vous ne pouvez pas présenter votre carte grise%'), 'Une sanction pour non-présentation', true),

((select id from questions where text like 'Un véhicule rarement utilisé mais garé sur la voie publique%'), 'Vrai', true),
((select id from questions where text like 'Un véhicule rarement utilisé mais garé sur la voie publique%'), 'Faux', false),

((select id from questions where text like 'Pouvez-vous vous engager sur un passage à niveau si la circulation%'), 'Vrai', false),
((select id from questions where text like 'Pouvez-vous vous engager sur un passage à niveau si la circulation%'), 'Faux', true),

((select id from questions where text like 'Un véhicule de police prioritaire arrive derrière vous à un feu rouge%'), 'Rester immobile jusqu''au feu vert', false),
((select id from questions where text like 'Un véhicule de police prioritaire arrive derrière vous à un feu rouge%'), 'Avancer prudemment pour dégager le passage', true),
((select id from questions where text like 'Un véhicule de police prioritaire arrive derrière vous à un feu rouge%'), 'Klaxonner et ne pas bouger', false);
