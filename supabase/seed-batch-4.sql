-- ============================================
-- EXTENSION DU CONTENU : 3 thèmes supplémentaires
-- ============================================

insert into topics (slug, name, "order") values
('stationnement', 'Arrêt et stationnement', 13),
('intersections-ronds-points', 'Intersections et ronds-points', 14),
('conduite-nuit', 'Conduite de nuit et visibilité', 15);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values

((select id from topics where slug='stationnement'), 'lignes-jaunes-stationnement',
 'Les lignes jaunes au sol',
 'Une ligne jaune discontinue au sol interdit le stationnement (l''arrêt bref reste toléré). Une ligne jaune continue interdit à la fois l''arrêt et le stationnement.',
 'Piège fréquent : penser qu''une ligne jaune discontinue autorise un arrêt prolongé "juste le temps de descendre quelqu''un" — seul un arrêt bref, conducteur au volant prêt à repartir, est toléré.',
 'Ligne discontinue (stationnement interdit, arrêt bref toléré) ≠ ligne continue (ni arrêt, ni stationnement, même bref).',
 'Discontinue = stationnement interdit. Continue = arrêt ET stationnement interdits.',
 'Vous voulez déposer un passager rapidement le long d''une ligne jaune continue.',
 'C''est interdit : sur une ligne continue, même un arrêt bref n''est pas autorisé, contrairement à la ligne discontinue.'),

((select id from topics where slug='stationnement'), 'stationnement-genant-dangereux',
 'Stationnement gênant vs dangereux',
 'Le stationnement gênant (ex : devant un garage) est sanctionné à 35€. Le stationnement très gênant ou dangereux (trottoir, piste cyclable, passage piéton, virage sans visibilité) est sanctionné à 135€, avec parfois un retrait de points et une mise en fourrière.',
 'Piège : sous-estimer la gravité de se garer sur un passage piéton ou une piste cyclable, en pensant que c''est juste "gênant" — c''est en réalité classé dangereux, avec une amende bien plus lourde.',
 'Stationnement gênant (amende 35€, gêne la circulation) ≠ stationnement dangereux (amende 135€ + points, met en danger la sécurité, ex : sommet de côte, virage).',
 'Gênant = 35€. Dangereux/très gênant = 135€ (+ retrait de points selon le cas).',
 'Vous vous garez sur une piste cyclable "juste 5 minutes" pour aller chercher du pain.',
 'C''est un stationnement très gênant, sanctionné à 135€ : la durée courte ne change rien à la qualification de l''infraction.'),

((select id from topics where slug='intersections-ronds-points'), 'priorite-rond-point',
 'La priorité dans un rond-point',
 'Dans un rond-point classique (sans panneau), la priorité à droite s''applique : les véhicules déjà engagés doivent céder le passage à ceux qui arrivent depuis leur droite. Dans un carrefour à sens giratoire (avec panneaux "Cédez le passage"), ce sont les véhicules déjà engagés dans l''anneau qui sont prioritaires.',
 'La grande majorité des ronds-points en France sont des carrefours à sens giratoire avec cédez-le-passage à l''entrée — le piège est de croire que la priorité à droite classique s''applique partout, alors que c''est l''inverse dans la plupart des cas rencontrés.',
 'Rond-point classique (rare, priorité à droite) ≠ carrefour à sens giratoire (fréquent, priorité à l''anneau, panneaux cédez-le-passage à l''entrée).',
 'Panneau cédez-le-passage à l''entrée = les véhicules déjà dans l''anneau sont prioritaires. Refuser cette priorité = 135€ et 4 points.',
 'Vous arrivez à un rond-point avec un panneau "Cédez le passage" à l''entrée, un véhicule circule déjà dans l''anneau à votre gauche.',
 'Vous devez le laisser passer : les véhicules déjà engagés dans l''anneau sont prioritaires sur ceux qui entrent.'),

((select id from topics where slug='intersections-ronds-points'), 'sortie-rond-point',
 'Sortir d''un rond-point',
 'Pour sortir d''un rond-point, il est interdit de couper la priorité d''un autre usager déjà engagé dans l''anneau, même en ayant mis son clignotant à temps.',
 'Le clignotant signale une intention, il ne donne jamais de priorité : certains candidats pensent qu''avoir clignoté "à l''avance" les autorise à couper la route à un véhicule ou un cycliste déjà présent dans l''anneau.',
 'Signaler son intention (clignotant) ≠ obtenir la priorité : ce sont deux choses différentes, le clignotant n''annule jamais la priorité d''un usager déjà engagé.',
 'Le clignotant informe, il ne donne jamais priorité. Ne jamais couper la route à un usager déjà dans l''anneau, y compris un cycliste.',
 'Vous voulez sortir du rond-point à la prochaine sortie, un cycliste roule dans l''anneau juste à côté de vous.',
 'Vous devez le laisser passer avant de sortir, même si vous avez mis votre clignotant : il est prioritaire tant qu''il est engagé dans l''anneau.'),

((select id from topics where slug='conduite-nuit'), 'eclairage-nuit',
 'L''éclairage de nuit',
 'Les feux de croisement sont obligatoires dès la tombée de la nuit ou dès que la visibilité est insuffisante (pluie forte, brouillard). Les feux de route doivent être éteints dès qu''un autre véhicule est visible, pour éviter de l''éblouir.',
 'Piège : oublier de repasser en feux de croisement suffisamment tôt en croisant un véhicule, ce qui peut éblouir le conducteur en face à une distance dangereuse.',
 'Feux de croisement (toujours utilisables, y compris avec d''autres usagers) ≠ feux de route (uniquement quand aucun autre usager n''est visible devant ou en face).',
 'Feux de croisement dès la nuit tombée ou faible visibilité. Feux de route interdits dès qu''un autre usager est visible.',
 'Vous roulez de nuit en feux de route sur une route dégagée, et vous apercevez les phares d''un véhicule en face au loin.',
 'Vous devez repasser en feux de croisement suffisamment tôt pour ne pas éblouir le conducteur qui arrive en face.'),

((select id from topics where slug='conduite-nuit'), 'adaptation-vitesse-nuit',
 'Adapter sa vitesse à la nuit',
 'De nuit, la distance de visibilité est limitée à la portée de vos feux : vous devez pouvoir vous arrêter dans la distance éclairée par vos phares, ce qui impose souvent de réduire votre vitesse par rapport au jour.',
 'Piège : garder la même vitesse qu''en plein jour sur une route qu''on connaît bien, en sous-estimant qu''un obstacle imprévu (piéton, animal) sera visible beaucoup plus tard la nuit.',
 'Bien connaître une route ≠ pouvoir y rouler à la même vitesse de nuit : la connaissance du trajet ne compense pas la réduction réelle de la distance de visibilité.',
 'Vitesse adaptée = pouvoir s''arrêter dans la distance éclairée par ses feux, pas au-delà.',
 'Vous roulez de nuit sur une route de campagne que vous empruntez tous les jours, à la même vitesse que le jour.',
 'C''est risqué : votre distance de visibilité est réduite à la portée de vos phares, il faut adapter votre vitesse en conséquence, même sur une route familière.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='lignes-jaunes-stationnement'), 'Une ligne jaune continue le long du trottoir autorise-t-elle un arrêt bref ?', 'vrai_faux', 2, 'ligne jaune continue', 'confondre avec la ligne discontinue', 'Faux : la ligne continue interdit à la fois l''arrêt et le stationnement, contrairement à la ligne discontinue qui tolère un arrêt bref.'),
((select id from subtopics where slug='stationnement-genant-dangereux'), 'Se garer sur une piste cyclable est considéré comme :', 'qcm', 2, 'stationnement dangereux', 'sous-estimer la gravité par rapport à un stationnement simplement gênant', 'C''est un stationnement très gênant, sanctionné à 135€, bien plus qu''un simple stationnement gênant à 35€.'),
((select id from subtopics where slug='priorite-rond-point'), 'Dans un carrefour à sens giratoire avec panneaux cédez-le-passage, qui est prioritaire ?', 'qcm', 2, 'priorité rond-point', 'appliquer la priorité à droite classique au mauvais type de rond-point', 'Les véhicules déjà engagés dans l''anneau sont prioritaires sur ceux qui souhaitent y entrer.'),
((select id from subtopics where slug='sortie-rond-point'), 'Avoir mis son clignotant vous donne-t-il la priorité pour sortir d''un rond-point ?', 'vrai_faux', 2, 'clignotant et priorité', 'penser que le clignotant donne une priorité', 'Faux : le clignotant signale une intention, il ne donne jamais la priorité sur un usager déjà engagé dans l''anneau.'),
((select id from subtopics where slug='eclairage-nuit'), 'Que devez-vous faire en feux de route si un véhicule arrive en face ?', 'qcm', 2, 'éblouissement feux de route', 'attendre d''être trop proche pour changer de feux', 'Vous devez repasser en feux de croisement suffisamment tôt pour ne pas éblouir le conducteur qui arrive en face.'),
((select id from subtopics where slug='adaptation-vitesse-nuit'), 'De nuit, votre vitesse doit permettre de vous arrêter dans quelle distance ?', 'qcm', 2, 'distance de visibilité nocturne', 'garder la même vitesse que le jour sur route connue', 'Dans la distance éclairée par vos propres feux, même sur une route que vous connaissez bien.');

insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Une ligne jaune continue le long du trottoir autorise%'), 'Vrai', false),
((select id from questions where text like 'Une ligne jaune continue le long du trottoir autorise%'), 'Faux', true),

((select id from questions where text like 'Se garer sur une piste cyclable est considéré%'), 'Stationnement gênant (35€)', false),
((select id from questions where text like 'Se garer sur une piste cyclable est considéré%'), 'Stationnement très gênant (135€)', true),
((select id from questions where text like 'Se garer sur une piste cyclable est considéré%'), 'Ce n''est pas sanctionné', false),

((select id from questions where text like 'Dans un carrefour à sens giratoire avec panneaux cédez-le-passage%'), 'Les véhicules qui entrent', false),
((select id from questions where text like 'Dans un carrefour à sens giratoire avec panneaux cédez-le-passage%'), 'Les véhicules déjà engagés dans l''anneau', true),
((select id from questions where text like 'Dans un carrefour à sens giratoire avec panneaux cédez-le-passage%'), 'Celui qui arrive le plus vite', false),

((select id from questions where text like 'Avoir mis son clignotant vous donne-t-il la priorité%'), 'Vrai', false),
((select id from questions where text like 'Avoir mis son clignotant vous donne-t-il la priorité%'), 'Faux', true),

((select id from questions where text like 'Que devez-vous faire en feux de route si un véhicule arrive en face%'), 'Garder les feux de route', false),
((select id from questions where text like 'Que devez-vous faire en feux de route si un véhicule arrive en face%'), 'Repasser en feux de croisement à temps', true),
((select id from questions where text like 'Que devez-vous faire en feux de route si un véhicule arrive en face%'), 'Éteindre tous les feux', false),

((select id from questions where text like 'De nuit, votre vitesse doit permettre de vous arrêter%'), 'La distance habituelle de jour', false),
((select id from questions where text like 'De nuit, votre vitesse doit permettre de vous arrêter%'), 'La distance éclairée par vos feux', true),
((select id from questions where text like 'De nuit, votre vitesse doit permettre de vous arrêter%'), 'Peu importe, la route est connue', false);
