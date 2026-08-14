-- ============================================
-- QUESTIONS À RÉPONSES MULTIPLES (type = 'multi')
-- Plusieurs réponses correctes à cocher, comme au vrai examen
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='documents-obligatoires'), 'Quels documents dois-tu pouvoir présenter lors d''un contrôle routier ? (plusieurs réponses)', 'multi', 2, 'documents à présenter', 'oublier un des trois documents', 'Permis de conduire, carte grise et attestation d''assurance sont les trois documents à toujours pouvoir présenter.'),

((select id from subtopics where slug='gilet-triangle-obligation'), 'Quels équipements sont légalement obligatoires à bord de ton véhicule ? (plusieurs réponses)', 'multi', 2, 'équipements obligatoires', 'penser que tout équipement de sécurité est obligatoire', 'Seuls le triangle de présignalisation et le gilet de haute visibilité sont légalement obligatoires en France.'),

((select id from subtopics where slug='vehicules-prioritaires'), 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention ? (plusieurs réponses)', 'multi', 1, 'véhicules prioritaires', 'confondre avec des véhicules de service public non prioritaires', 'Police, gendarmerie, pompiers et SAMU/ambulances en intervention sont prioritaires. Un taxi ou un bus de ligne ne le sont jamais.'),

((select id from subtopics where slug='priorite-absolue-canne-blanche'), 'Lesquelles de ces personnes bénéficient d''une priorité de passage absolue, même hors passage piéton ? (plusieurs réponses)', 'multi', 2, 'priorité absolue piéton', 'étendre cette priorité à tous les piétons', 'Seules les personnes avec une canne blanche ou un chien guide bénéficient de cette priorité absolue.'),

((select id from subtopics where slug='conduite-a-tenir-accident'), 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident ? (plusieurs réponses)', 'multi', 2, 'protéger alerter secourir', 'inclure des actions qui ne font pas partie de la méthode officielle', 'Protéger, Alerter et Secourir sont les 3 étapes officielles. Filmer la scène ou déplacer systématiquement les blessés n''en font pas partie.'),

((select id from subtopics where slug='controle-technique-2rm'), 'Quels types de véhicules sont soumis à un contrôle technique périodique en France ? (plusieurs réponses)', 'multi', 2, 'véhicules soumis au contrôle technique', 'penser que seules les voitures sont concernées', 'Les voitures particulières et, depuis 2024, les deux-roues motorisés immatriculés sont soumis à un contrôle technique. Vélos et trottinettes ne le sont pas.'),

((select id from subtopics where slug='distance-par-mauvais-temps'), 'Que dois-tu faire par temps de pluie ? (plusieurs réponses)', 'multi', 2, 'adaptation à la pluie', 'se concentrer sur un seul des deux ajustements nécessaires', 'Réduire ta vitesse (-10 km/h) ET augmenter ta distance de sécurité (la doubler) sont les deux ajustements nécessaires.'),

((select id from subtopics where slug='stationnement-genant-dangereux'), 'Lesquelles de ces situations constituent un stationnement dangereux (pas seulement gênant) ? (plusieurs réponses)', 'multi', 3, 'stationnement dangereux', 'confondre avec un simple stationnement gênant', 'Se garer sur une piste cyclable ou dans un virage sans visibilité est dangereux (135€). Devant un garage, c''est seulement gênant (35€).'),

((select id from subtopics where slug='eco-conduite-principes'), 'Lesquelles de ces pratiques relèvent de l''éco-conduite ? (plusieurs réponses)', 'multi', 2, 'pratiques éco-conduite', 'inclure des pratiques qui augmentent la consommation', 'Anticiper les ralentissements et maintenir un régime moteur modéré réduisent la consommation. Accélérer puis freiner fort fait l''inverse.'),

((select id from subtopics where slug='vitesse-autoroute'), 'Dans quelles situations la vitesse maximale sur autoroute descend-elle à 110 km/h ? (plusieurs réponses)', 'multi', 2, 'vitesse autoroute 110', 'ne retenir qu''un seul des deux cas', 'Par temps de pluie (pour tous) et en permis probatoire (même par temps sec), la limite est de 110 km/h.'),

((select id from subtopics where slug='casque-obligatoire'), 'Qu''est-ce qui est légalement obligatoire pour circuler en deux-roues motorisé ? (plusieurs réponses)', 'multi', 2, 'obligations deux-roues motorisé', 'inclure des obligations qui ne s''appliquent qu''en cas d''arrêt', 'Le casque homologué et attaché, ainsi que le contrôle technique (depuis 2024), sont obligatoires. Le gilet n''est requis qu''en cas d''arrêt d''urgence.'),

((select id from subtopics where slug='telephone-tenu-en-main'), 'Dans quels cas l''usage du téléphone tenu en main est-il interdit au volant ? (plusieurs réponses)', 'multi', 2, 'interdiction téléphone en main', 'penser que seule la conduite active est concernée', 'En circulation normale ET à l''arrêt à un feu rouge moteur allumé, l''interdiction s''applique — pas seulement au-dessus d''une certaine vitesse.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Quels documents dois-tu pouvoir présenter lors d''un contrôle routier%'), 'Permis de conduire', true),
((select id from questions where text like 'Quels documents dois-tu pouvoir présenter lors d''un contrôle routier%'), 'Carte grise', true),
((select id from questions where text like 'Quels documents dois-tu pouvoir présenter lors d''un contrôle routier%'), 'Attestation d''assurance', true),
((select id from questions where text like 'Quels documents dois-tu pouvoir présenter lors d''un contrôle routier%'), 'Carte Vitale', false),

((select id from questions where text like 'Quels équipements sont légalement obligatoires à bord%'), 'Triangle de présignalisation', true),
((select id from questions where text like 'Quels équipements sont légalement obligatoires à bord%'), 'Gilet de haute visibilité', true),
((select id from questions where text like 'Quels équipements sont légalement obligatoires à bord%'), 'Extincteur', false),
((select id from questions where text like 'Quels équipements sont légalement obligatoires à bord%'), 'Trousse de secours', false),

((select id from questions where text like 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention%'), 'Police', true),
((select id from questions where text like 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention%'), 'Pompiers', true),
((select id from questions where text like 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention%'), 'SAMU', true),
((select id from questions where text like 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention%'), 'Taxi', false),
((select id from questions where text like 'Lesquels de ces véhicules bénéficient d''une priorité absolue en intervention%'), 'Bus de ligne', false),

((select id from questions where text like 'Lesquelles de ces personnes bénéficient d''une priorité de passage absolue%'), 'Personne avec canne blanche', true),
((select id from questions where text like 'Lesquelles de ces personnes bénéficient d''une priorité de passage absolue%'), 'Personne avec chien guide', true),
((select id from questions where text like 'Lesquelles de ces personnes bénéficient d''une priorité de passage absolue%'), 'Coureur à pied', false),
((select id from questions where text like 'Lesquelles de ces personnes bénéficient d''une priorité de passage absolue%'), 'Personne avec poussette', false),

((select id from questions where text like 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident%'), 'Protéger', true),
((select id from questions where text like 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident%'), 'Alerter', true),
((select id from questions where text like 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident%'), 'Secourir', true),
((select id from questions where text like 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident%'), 'Filmer la scène', false),
((select id from questions where text like 'Parmi ces actions, lesquelles font partie de la conduite à tenir face à un accident%'), 'Déplacer systématiquement les blessés', false),

((select id from questions where text like 'Quels types de véhicules sont soumis à un contrôle technique périodique%'), 'Voitures particulières', true),
((select id from questions where text like 'Quels types de véhicules sont soumis à un contrôle technique périodique%'), 'Deux-roues motorisés', true),
((select id from questions where text like 'Quels types de véhicules sont soumis à un contrôle technique périodique%'), 'Vélos', false),
((select id from questions where text like 'Quels types de véhicules sont soumis à un contrôle technique périodique%'), 'Trottinettes électriques', false),

((select id from questions where text like 'Que dois-tu faire par temps de pluie%'), 'Réduire ta vitesse', true),
((select id from questions where text like 'Que dois-tu faire par temps de pluie%'), 'Augmenter ta distance de sécurité', true),
((select id from questions where text like 'Que dois-tu faire par temps de pluie%'), 'Réduire la pression des pneus', false),
((select id from questions where text like 'Que dois-tu faire par temps de pluie%'), 'Limiter le nombre de passagers', false),

((select id from questions where text like 'Lesquelles de ces situations constituent un stationnement dangereux%'), 'Sur une piste cyclable', true),
((select id from questions where text like 'Lesquelles de ces situations constituent un stationnement dangereux%'), 'Dans un virage sans visibilité', true),
((select id from questions where text like 'Lesquelles de ces situations constituent un stationnement dangereux%'), 'Devant un garage privé', false),
((select id from questions where text like 'Lesquelles de ces situations constituent un stationnement dangereux%'), 'Sur une place non marquée', false),

((select id from questions where text like 'Lesquelles de ces pratiques relèvent de l''éco-conduite%'), 'Anticiper les ralentissements', true),
((select id from questions where text like 'Lesquelles de ces pratiques relèvent de l''éco-conduite%'), 'Maintenir un régime moteur modéré', true),
((select id from questions where text like 'Lesquelles de ces pratiques relèvent de l''éco-conduite%'), 'Accélérer fort puis freiner fort', false),
((select id from questions where text like 'Lesquelles de ces pratiques relèvent de l''éco-conduite%'), 'Rouler fenêtres ouvertes à vitesse élevée', false),

((select id from questions where text like 'Dans quelles situations la vitesse maximale sur autoroute descend-elle à 110 km/h%'), 'Temps de pluie', true),
((select id from questions where text like 'Dans quelles situations la vitesse maximale sur autoroute descend-elle à 110 km/h%'), 'Permis probatoire', true),
((select id from questions where text like 'Dans quelles situations la vitesse maximale sur autoroute descend-elle à 110 km/h%'), 'Trafic dense mais fluide', false),
((select id from questions where text like 'Dans quelles situations la vitesse maximale sur autoroute descend-elle à 110 km/h%'), 'Véhicule récent', false),

((select id from questions where text like 'Qu''est-ce qui est légalement obligatoire pour circuler en deux-roues motorisé%'), 'Casque homologué et attaché', true),
((select id from questions where text like 'Qu''est-ce qui est légalement obligatoire pour circuler en deux-roues motorisé%'), 'Contrôle technique (depuis 2024)', true),
((select id from questions where text like 'Qu''est-ce qui est légalement obligatoire pour circuler en deux-roues motorisé%'), 'Gilet porté en permanence sur soi', false),
((select id from questions where text like 'Qu''est-ce qui est légalement obligatoire pour circuler en deux-roues motorisé%'), 'Permis voiture suffisant pour toute cylindrée', false),

((select id from questions where text like 'Dans quels cas l''usage du téléphone tenu en main est-il interdit%'), 'En circulation normale', true),
((select id from questions where text like 'Dans quels cas l''usage du téléphone tenu en main est-il interdit%'), 'À l''arrêt à un feu rouge, moteur allumé', true),
((select id from questions where text like 'Dans quels cas l''usage du téléphone tenu en main est-il interdit%'), 'Uniquement au-dessus de 50 km/h', false),
((select id from questions where text like 'Dans quels cas l''usage du téléphone tenu en main est-il interdit%'), 'Uniquement hors agglomération', false);
