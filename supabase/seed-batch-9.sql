-- ============================================
-- RENFORCEMENT DU CONTENU : batch 9/9
-- +2 questions pour 13 notions (piétons, cyclistes, deux-roues,
-- sécurité véhicule, comportement, documents, situations particulières)
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='abords-ecoles'), 'La limitation de vitesse aux abords d''une école est souvent de :', 'qcm', 1, 'vitesse zone école', 'sous-estimer la limitation typique', '30 km/h, dans le cadre fréquent d''une zone 30 autour des établissements scolaires.'),
((select id from subtopics where slug='abords-ecoles'), 'Le risque lié aux enfants aux abords d''une école existe-t-il uniquement aux heures de sortie de classe ?', 'vrai_faux', 2, 'risque permanent zone école', 'penser que le risque est limité aux heures de sortie', 'Faux, il existe à tout moment, notamment lors d''activités périscolaires.'),

((select id from subtopics where slug='sas-velo'), 'Une voiture peut-elle s''arrêter dans le sas vélo si elle reste prudente ?', 'vrai_faux', 2, 'interdiction du sas aux voitures', 'penser qu''une prudence suffit à justifier l''infraction', 'Faux, le sas est strictement réservé aux cyclistes, quelle que soit la prudence du conducteur.'),
((select id from subtopics where slug='sas-velo'), 'À quoi sert principalement le sas vélo ?', 'qcm', 1, 'utilité du sas vélo', 'penser qu''il sert seulement à décorer le marquage au sol', 'À permettre aux cyclistes de démarrer en avance et d''être plus visibles des automobilistes.'),

((select id from subtopics where slug='ouverture-portiere'), 'Quel geste permet de vérifier correctement l''absence de cycliste avant d''ouvrir sa portière ?', 'qcm', 2, 'vérification angle mort portière', 'se fier uniquement au rétroviseur', 'Se retourner physiquement pour vérifier l''angle mort, le rétroviseur seul étant insuffisant.'),
((select id from subtopics where slug='ouverture-portiere'), 'L''accident causé par une ouverture de portière imprudente porte-t-il un nom spécifique ("dooring") ?', 'vrai_faux', 1, 'terme dooring', 'ne pas connaître ce terme utilisé en prévention routière', 'Vrai, ce terme est couramment utilisé pour désigner ce type d''accident.'),

((select id from subtopics where slug='casque-obligatoire'), 'Le port du casque est-il obligatoire pour le passager d''un scooter ?', 'qcm', 1, 'casque passager', 'penser que seul le conducteur est concerné', 'Oui, l''obligation concerne le conducteur ET tout passager, sans exception.'),
((select id from subtopics where slug='casque-obligatoire'), 'Un casque non attaché respecte-t-il l''obligation légale ?', 'vrai_faux', 1, 'casque attaché', 'penser qu''un casque simplement posé suffit', 'Faux, il doit être attaché pour être conforme, sinon c''est comme une absence de casque.'),

((select id from subtopics where slug='controle-technique-2rm'), 'Depuis quand le contrôle technique est-il obligatoire pour les deux-roues motorisés en France ?', 'qcm', 2, 'date contrôle technique 2RM', 'confondre avec la date d''obligation pour les voitures', 'Depuis 2024, suite à la réforme réglementaire sur les véhicules de catégorie L.'),
((select id from subtopics where slug='controle-technique-2rm'), 'La périodicité du contrôle technique moto est-elle généralement de 3 ans ?', 'vrai_faux', 2, 'périodicité contrôle technique moto', 'confondre avec la périodicité des voitures (2 ans)', 'Vrai, une fois le premier contrôle passé, la périodicité est généralement triennale.'),

((select id from subtopics where slug='etat-pneus'), 'Un pneu trop lisse augmente le risque de :', 'qcm', 1, 'risque pneu usé', 'sous-estimer les conséquences d''un pneu lisse', 'Aquaplaning et allongement de la distance de freinage.'),
((select id from subtopics where slug='etat-pneus'), 'Les témoins d''usure intégrés aux pneus permettent-ils de vérifier la profondeur des sculptures ?', 'vrai_faux', 1, 'témoins d''usure', 'ne pas connaître l''existence de ces témoins', 'Vrai, ils indiquent visuellement quand la limite légale d''usure est atteinte.'),

((select id from subtopics where slug='controle-technique-voiture'), 'Après le premier contrôle technique d''une voiture (à 4 ans), la fréquence suivante est :', 'qcm', 2, 'fréquence contrôle technique voiture', 'confondre avec la périodicité moto (3 ans)', 'Tous les 2 ans, contrairement à la périodicité de 3 ans pour les deux-roues motorisés.'),
((select id from subtopics where slug='controle-technique-voiture'), 'Le contrôle technique d''une voiture n''est-il nécessaire qu''en cas de vente du véhicule ?', 'vrai_faux', 2, 'contrôle technique indépendant de la vente', 'penser que ce n''est nécessaire qu''en cas de revente', 'Faux, c''est une obligation périodique indépendante de toute intention de vendre.'),

((select id from subtopics where slug='telephone-tenu-en-main'), 'Quelle sanction encourt un conducteur tenant son téléphone en main ?', 'qcm', 2, 'sanction téléphone en main', 'sous-estimer la gravité de la sanction', '135€ d''amende et un retrait de 3 points sur le permis.'),
((select id from subtopics where slug='telephone-tenu-en-main'), 'Un kit mains-libres intégré au véhicule est-il autorisé ?', 'vrai_faux', 1, 'kit mains-libres intégré', 'confondre avec le téléphone tenu en main', 'Vrai, contrairement au téléphone tenu en main qui reste strictement interdit.'),

((select id from subtopics where slug='controle-routier-attitude'), 'Ralentir sans s''arrêter complètement lors d''un contrôle peut-il être assimilé à un refus d''obtempérer ?', 'vrai_faux', 2, 'arrêt incomplet et refus d''obtempérer', 'penser qu''un ralentissement suffit toujours', 'Vrai, selon les circonstances, un arrêt incomplet peut être requalifié en refus d''obtempérer.'),
((select id from subtopics where slug='controle-routier-attitude'), 'Que doit faire un conducteur lors d''un contrôle routier ?', 'qcm', 1, 'attitude au contrôle', 'penser qu''il peut discuter la légitimité du contrôle sur place', 'S''arrêter complètement et présenter les documents demandés sans contester sur place.'),

((select id from subtopics where slug='documents-obligatoires'), 'Quels documents doivent être présentables lors d''un contrôle routier ?', 'qcm', 1, 'documents à présenter', 'oublier l''un des trois documents essentiels', 'Le permis de conduire, la carte grise et l''attestation d''assurance.'),
((select id from subtopics where slug='documents-obligatoires'), 'Posséder un document chez soi suffit-il, sans pouvoir le présenter lors d''un contrôle ?', 'vrai_faux', 2, 'possession vs présentation', 'penser que la possession suffit sans présentation immédiate', 'Faux, la non-présentation immédiate peut être sanctionnée même si le document existe réellement.'),

((select id from subtopics where slug='assurance-obligatoire'), 'Quel est le niveau d''assurance minimum obligatoire pour un véhicule ?', 'qcm', 1, 'assurance minimum légale', 'penser qu''une assurance tous risques est obligatoire', 'L''assurance responsabilité civile (au tiers), qui couvre les dommages causés à autrui.'),
((select id from subtopics where slug='assurance-obligatoire'), 'Un véhicule garé et jamais utilisé a-t-il besoin d''être assuré ?', 'vrai_faux', 2, 'assurance véhicule non utilisé', 'penser qu''un véhicule à l''arrêt n''a pas besoin d''assurance', 'Vrai, l''obligation s''applique dès lors que le véhicule est susceptible de circuler.'),

((select id from subtopics where slug='passage-a-niveau'), 'Peut-on s''engager sur un passage à niveau si les feux ne clignotent pas encore, même si la circulation est ralentie après ?', 'vrai_faux', 3, 'engagement prudent passage à niveau', 'penser qu''on a le temps si les feux ne clignotent pas encore', 'Faux, il ne faut jamais s''engager si on n''est pas certain de pouvoir dégager complètement les voies.'),
((select id from subtopics where slug='passage-a-niveau'), 'Que ne devez-vous jamais faire sur un passage à niveau ?', 'qcm', 2, 'interdiction absolue passage à niveau', 'sous-estimer le danger d''un arrêt sur les voies', 'Vous arrêter sur les voies, quelle que soit la raison.'),

((select id from subtopics where slug='vehicules-prioritaires'), 'Quels véhicules bénéficient d''une priorité absolue en intervention ?', 'qcm', 1, 'liste des véhicules prioritaires', 'oublier certaines catégories concernées', 'Police, gendarmerie, sapeurs-pompiers et SAMU/ambulances en intervention.'),
((select id from subtopics where slug='vehicules-prioritaires'), 'Refuser la priorité à un véhicule prioritaire est-il sanctionné ?', 'vrai_faux', 2, 'sanction refus de priorité', 'sous-estimer la sanction encourue', 'Vrai, cela entraîne une amende de 135€ et un retrait de 4 points sur le permis.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'La limitation de vitesse aux abords d''une école%'), '30 km/h', true),
((select id from questions where text like 'La limitation de vitesse aux abords d''une école%'), '50 km/h', false),

((select id from questions where text like 'Le risque lié aux enfants aux abords d''une école existe-t-il uniquement%'), 'Vrai', false),
((select id from questions where text like 'Le risque lié aux enfants aux abords d''une école existe-t-il uniquement%'), 'Faux', true),

((select id from questions where text like 'Une voiture peut-elle s''arrêter dans le sas vélo%'), 'Vrai', false),
((select id from questions where text like 'Une voiture peut-elle s''arrêter dans le sas vélo%'), 'Faux', true),

((select id from questions where text like 'À quoi sert principalement le sas vélo%'), 'Démarrage en avance et visibilité des cyclistes', true),
((select id from questions where text like 'À quoi sert principalement le sas vélo%'), 'Uniquement à décorer le marquage', false),

((select id from questions where text like 'Quel geste permet de vérifier correctement l''absence de cycliste%'), 'Se retourner physiquement', true),
((select id from questions where text like 'Quel geste permet de vérifier correctement l''absence de cycliste%'), 'Regarder le rétroviseur uniquement', false),

((select id from questions where text like 'L''accident causé par une ouverture de portière imprudente%'), 'Vrai', true),
((select id from questions where text like 'L''accident causé par une ouverture de portière imprudente%'), 'Faux', false),

((select id from questions where text like 'Le port du casque est-il obligatoire pour le passager d''un scooter%'), 'Oui, toujours', true),
((select id from questions where text like 'Le port du casque est-il obligatoire pour le passager d''un scooter%'), 'Non, seulement le conducteur', false),

((select id from questions where text like 'Un casque non attaché respecte-t-il l''obligation légale%'), 'Vrai', false),
((select id from questions where text like 'Un casque non attaché respecte-t-il l''obligation légale%'), 'Faux', true),

((select id from questions where text like 'Depuis quand le contrôle technique est-il obligatoire pour les deux-roues%'), 'Depuis 2020', false),
((select id from questions where text like 'Depuis quand le contrôle technique est-il obligatoire pour les deux-roues%'), 'Depuis 2024', true),

((select id from questions where text like 'La périodicité du contrôle technique moto est-elle généralement de 3 ans%'), 'Vrai', true),
((select id from questions where text like 'La périodicité du contrôle technique moto est-elle généralement de 3 ans%'), 'Faux', false),

((select id from questions where text like 'Un pneu trop lisse augmente le risque de%'), 'Aquaplaning', true),
((select id from questions where text like 'Un pneu trop lisse augmente le risque de%'), 'Surconsommation uniquement', false),

((select id from questions where text like 'Les témoins d''usure intégrés aux pneus permettent-ils%'), 'Vrai', true),
((select id from questions where text like 'Les témoins d''usure intégrés aux pneus permettent-ils%'), 'Faux', false),

((select id from questions where text like 'Après le premier contrôle technique d''une voiture%'), 'Tous les 2 ans', true),
((select id from questions where text like 'Après le premier contrôle technique d''une voiture%'), 'Tous les 3 ans', false),

((select id from questions where text like 'Le contrôle technique d''une voiture n''est-il nécessaire qu''en cas de vente%'), 'Vrai', false),
((select id from questions where text like 'Le contrôle technique d''une voiture n''est-il nécessaire qu''en cas de vente%'), 'Faux', true),

((select id from questions where text like 'Quelle sanction encourt un conducteur tenant son téléphone en main%'), '135€ et 3 points', true),
((select id from questions where text like 'Quelle sanction encourt un conducteur tenant son téléphone en main%'), 'Un simple avertissement', false),

((select id from questions where text like 'Un kit mains-libres intégré au véhicule est-il autorisé%'), 'Vrai', true),
((select id from questions where text like 'Un kit mains-libres intégré au véhicule est-il autorisé%'), 'Faux', false),

((select id from questions where text like 'Ralentir sans s''arrêter complètement lors d''un contrôle%'), 'Vrai', true),
((select id from questions where text like 'Ralentir sans s''arrêter complètement lors d''un contrôle%'), 'Faux', false),

((select id from questions where text like 'Que doit faire un conducteur lors d''un contrôle routier%'), 'S''arrêter et présenter les documents', true),
((select id from questions where text like 'Que doit faire un conducteur lors d''un contrôle routier%'), 'Discuter la légitimité du contrôle sur place', false),

((select id from questions where text like 'Quels documents doivent être présentables lors d''un contrôle routier%'), 'Permis, carte grise, attestation d''assurance', true),
((select id from questions where text like 'Quels documents doivent être présentables lors d''un contrôle routier%'), 'Seulement le permis', false),

((select id from questions where text like 'Posséder un document chez soi suffit-il, sans pouvoir le présenter%'), 'Vrai', false),
((select id from questions where text like 'Posséder un document chez soi suffit-il, sans pouvoir le présenter%'), 'Faux', true),

((select id from questions where text like 'Quel est le niveau d''assurance minimum obligatoire%'), 'Responsabilité civile (au tiers)', true),
((select id from questions where text like 'Quel est le niveau d''assurance minimum obligatoire%'), 'Tous risques', false),

((select id from questions where text like 'Un véhicule garé et jamais utilisé a-t-il besoin d''être assuré%'), 'Vrai', true),
((select id from questions where text like 'Un véhicule garé et jamais utilisé a-t-il besoin d''être assuré%'), 'Faux', false),

((select id from questions where text like 'Peut-on s''engager sur un passage à niveau si les feux ne clignotent pas encore%'), 'Vrai', false),
((select id from questions where text like 'Peut-on s''engager sur un passage à niveau si les feux ne clignotent pas encore%'), 'Faux', true),

((select id from questions where text like 'Que ne devez-vous jamais faire sur un passage à niveau%'), 'Vous arrêter sur les voies', true),
((select id from questions where text like 'Que ne devez-vous jamais faire sur un passage à niveau%'), 'Ralentir à l''approche', false),

((select id from questions where text like 'Quels véhicules bénéficient d''une priorité absolue en intervention%'), 'Police, pompiers, SAMU en intervention', true),
((select id from questions where text like 'Quels véhicules bénéficient d''une priorité absolue en intervention%'), 'Tous les véhicules de service public', false),

((select id from questions where text like 'Refuser la priorité à un véhicule prioritaire est-il sanctionné%'), 'Vrai', true),
((select id from questions where text like 'Refuser la priorité à un véhicule prioritaire est-il sanctionné%'), 'Faux', false);
