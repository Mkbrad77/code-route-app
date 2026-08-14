-- ============================================
-- EXTENSION DU CONTENU : 4 thèmes supplémentaires
-- ============================================

insert into topics (slug, name, "order") values
('premiers-secours', 'Premiers secours', 9),
('equipements-obligatoires', 'Équipements et documents obligatoires', 10),
('securite-passagers', 'Sécurité des passagers', 11),
('environnement-eco-conduite', 'Environnement et éco-conduite', 12);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values

((select id from topics where slug='premiers-secours'), 'triangle-gilet-panne',
 'Panne ou accident : gilet et triangle',
 'En cas d''arrêt d''urgence, il faut d''abord enfiler le gilet de haute visibilité avant de sortir du véhicule, allumer les feux de détresse, puis placer le triangle à au moins 30 mètres en amont.',
 'Le piège classique : sortir du véhicule et aller placer le triangle avant d''avoir mis le gilet. L''ordre exact est : gilet d''abord (dans l''habitacle), puis sortie, puis triangle.',
 'Le gilet est obligatoire dès qu''on sort du véhicule immobilisé, y compris sur la bande d''arrêt d''urgence ; le triangle, lui, n''est utile que si le véhicule constitue un danger pour la circulation.',
 'Triangle à 30 m minimum en amont. Gilet à enfiler avant de sortir, même sur la bande d''arrêt d''urgence.',
 'Vous tombez en panne sur une route à double sens, votre véhicule reste partiellement sur la chaussée.',
 'Enfilez le gilet avant de sortir, allumez les feux de détresse, puis placez le triangle à 30 m en amont pour prévenir les autres usagers.'),

((select id from topics where slug='premiers-secours'), 'conduite-a-tenir-accident',
 'Que faire en cas d''accident',
 'La conduite à tenir suit 3 étapes dans l''ordre : Protéger (sécuriser la zone, éviter le sur-accident), Alerter (appeler les secours en donnant la localisation précise), Secourir (dans la limite de ses compétences, sans déplacer un blessé sauf danger immédiat).',
 'Le piège fréquent : vouloir déplacer immédiatement une personne blessée pour "l''aider", alors qu''un déplacement mal fait peut aggraver une blessure (notamment de la colonne vertébrale).',
 'Protéger la zone (sécuriser) est différent de Secourir (agir sur la victime) : il faut sécuriser avant tout, même si cela retarde l''aide directe à la victime.',
 'Ordre à respecter : Protéger → Alerter → Secourir. Ne jamais déplacer un blessé sauf danger immédiat (incendie, sur-accident).',
 'Vous arrivez sur les lieux d''un accident où une personne est allongée au sol, consciente.',
 'Sécurisez d''abord la zone (feux de détresse, triangle), puis alertez les secours en précisant la localisation, avant d''agir directement auprès du blessé.'),

((select id from topics where slug='equipements-obligatoires'), 'gilet-triangle-obligation',
 'Équipements obligatoires à bord',
 'Tout véhicule doit disposer d''un triangle de présignalisation homologué et d''un gilet de haute visibilité, accessibles sans sortir du véhicule.',
 'Piège : penser qu''il suffit d''avoir ces équipements "quelque part dans le coffre". Le gilet doit être accessible depuis l''habitacle (boîte à gants), pas seulement présent dans la voiture.',
 'L''absence de présentation lors d''un contrôle (même si l''équipement existe mais est mal rangé) peut être sanctionnée, différent du simple défaut d''équipement.',
 'Triangle homologué + gilet de haute visibilité obligatoires, gilet accessible sans sortir du véhicule.',
 'Lors d''un contrôle routier, un agent vous demande de présenter votre triangle et votre gilet.',
 'Vous devez pouvoir les présenter immédiatement ; ne pas pouvoir les présenter est sanctionné par une amende.'),

((select id from topics where slug='securite-passagers'), 'ceinture-securite',
 'Le port de la ceinture',
 'La ceinture de sécurité est obligatoire pour tous les occupants du véhicule, à toutes les places (avant et arrière), dès que le véhicule en est équipé.',
 'Piège fréquent : penser que seuls les passagers avant sont concernés, ou qu''un trajet très court en dispense.',
 'L''obligation de ceinture pour les passagers arrière est parfois oubliée par les candidats qui pensent qu''elle ne concerne que les places avant.',
 'Ceinture obligatoire à toutes les places, à l''avant comme à l''arrière, quelle que soit la distance du trajet.',
 'Vous avez un passager assis à l''arrière qui refuse de mettre sa ceinture pour un "petit trajet".',
 'C''est une infraction : la ceinture est obligatoire à l''arrière aussi, quelle que soit la durée du trajet.'),

((select id from topics where slug='environnement-eco-conduite'), 'eco-conduite-principes',
 'Les principes de l''éco-conduite',
 'L''éco-conduite repose sur l''anticipation (lever le pied tôt plutôt que de freiner fort), le maintien d''un régime moteur modéré, et une vitesse stabilisée — cela réduit la consommation de carburant et l''usure du véhicule.',
 'Piège : penser que l''éco-conduite se limite à rouler plus lentement. En réalité, c''est surtout une question d''anticipation et de fluidité (moins de freinages et accélérations brusques).',
 'Éco-conduite (anticipation et fluidité) ≠ conduite simplement "lente" : on peut rouler à la vitesse autorisée tout en éco-conduisant, l''essentiel est d''éviter les à-coups.',
 'Anticiper, lever le pied tôt, éviter les accélérations et freinages brusques : c''est le cœur de l''éco-conduite.',
 'Vous voyez un feu passer au orange loin devant vous alors que vous roulez à allure normale.',
 'Le bon réflexe éco-conduite est de lever le pied progressivement pour anticiper un arrêt probable, plutôt que d''accélérer puis freiner fort.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='triangle-gilet-panne'), 'En cas de panne, que devez-vous faire avant de sortir du véhicule ?', 'qcm', 2, 'ordre gilet/triangle', 'sortir avant d''enfiler le gilet', 'Il faut enfiler le gilet de haute visibilité avant de sortir du véhicule, y compris sur la bande d''arrêt d''urgence.'),
((select id from subtopics where slug='conduite-a-tenir-accident'), 'Quel est l''ordre correct des 3 étapes face à un accident ?', 'qcm', 2, 'protéger alerter secourir', 'vouloir secourir avant de sécuriser la zone', 'L''ordre est Protéger, puis Alerter, puis Secourir — sécuriser la zone est toujours la première priorité.'),
((select id from subtopics where slug='gilet-triangle-obligation'), 'Le gilet de haute visibilité doit être rangé :', 'qcm', 1, 'accessibilité du gilet', 'penser qu''il suffit qu''il soit "dans la voiture"', 'Il doit être accessible depuis l''habitacle (par exemple boîte à gants), sans avoir à sortir du véhicule pour l''attraper.'),
((select id from subtopics where slug='ceinture-securite'), 'La ceinture de sécurité est-elle obligatoire pour un passager assis à l''arrière ?', 'vrai_faux', 1, 'ceinture arrière', 'penser que seuls les passagers avant sont concernés', 'Vrai : la ceinture est obligatoire à toutes les places du véhicule, avant comme arrière.'),
((select id from subtopics where slug='eco-conduite-principes'), 'Quel est le principe central de l''éco-conduite ?', 'qcm', 1, 'éco-conduite', 'confondre avec le simple fait de rouler lentement', 'L''anticipation et la fluidité (éviter les accélérations et freinages brusques), pas seulement une vitesse réduite.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'En cas de panne, que devez-vous faire avant de sortir%'), 'Enfiler le gilet de haute visibilité', true),
((select id from questions where text like 'En cas de panne, que devez-vous faire avant de sortir%'), 'Placer le triangle', false),
((select id from questions where text like 'En cas de panne, que devez-vous faire avant de sortir%'), 'Appeler un dépanneur', false),

((select id from questions where text like 'Quel est l''ordre correct des 3 étapes%'), 'Alerter, Protéger, Secourir', false),
((select id from questions where text like 'Quel est l''ordre correct des 3 étapes%'), 'Protéger, Alerter, Secourir', true),
((select id from questions where text like 'Quel est l''ordre correct des 3 étapes%'), 'Secourir, Protéger, Alerter', false),

((select id from questions where text like 'Le gilet de haute visibilité doit être rangé%'), 'Dans le coffre, peu importe où', false),
((select id from questions where text like 'Le gilet de haute visibilité doit être rangé%'), 'Accessible depuis l''habitacle', true),
((select id from questions where text like 'Le gilet de haute visibilité doit être rangé%'), 'Sur la plage arrière uniquement', false),

((select id from questions where text like 'La ceinture de sécurité est-elle obligatoire pour un passager assis à l''arrière%'), 'Vrai', true),
((select id from questions where text like 'La ceinture de sécurité est-elle obligatoire pour un passager assis à l''arrière%'), 'Faux', false),

((select id from questions where text like 'Quel est le principe central de l''éco-conduite%'), 'Rouler le plus lentement possible', false),
((select id from questions where text like 'Quel est le principe central de l''éco-conduite%'), 'Anticiper pour une conduite fluide', true),
((select id from questions where text like 'Quel est le principe central de l''éco-conduite%'), 'Rouler à régime moteur élevé', false);
