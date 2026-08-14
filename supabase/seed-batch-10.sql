-- ============================================
-- RENFORCEMENT DU CONTENU : batch 10
-- +1 question sur chacune des 41 notions, pour réduire encore
-- le risque de répétition dans les examens blancs
-- ============================================

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
((select id from subtopics where slug='priorite-a-droite'), 'Tu circules sur une petite route sans aucun panneau et arrives à un carrefour identique. Une voiture surgit sur ta droite.', 'vrai_faux', 2, 'priorité à droite', 'penser qu''une petite route fait exception', 'Tu dois la laisser passer : la règle de priorité à droite s''applique même entre deux routes de gabarit similaire.'),
((select id from subtopics where slug='cedez-le-passage'), 'Un panneau cédez-le-passage se trouve à la sortie d''un parking privé donnant sur une route. Que dois-tu faire ?', 'qcm', 2, 'cédez le passage', 'penser que sortir d''un parking dispense de cette règle', 'Céder le passage à toute la circulation sur la route, comme pour n''importe quel cédez-le-passage.'),
((select id from subtopics where slug='panneaux-danger'), 'Un panneau de danger annonçant un virage est présent, mais tu ne vois aucun virage dans l''immédiat. Faut-il rester vigilant ?', 'vrai_faux', 1, 'anticipation du danger', 'relâcher son attention trop tôt', 'Oui, le panneau annonce un danger à venir, pas forcément immédiat — reste prudent sur la distance suivante.'),
((select id from subtopics where slug='depassement-deux-roues'), 'Peux-tu réduire la distance de dépassement d''un cycliste si tu roules lentement ?', 'vrai_faux', 2, 'distance dépassement et vitesse', 'penser que la lenteur compense la distance', 'Non, la distance minimale (1m ou 1,5m selon la zone) s''applique quelle que soit ta vitesse de dépassement.'),
((select id from subtopics where slug='vitesse-agglomeration'), 'Le panneau de sortie d''agglomération vient d''apparaître. La limite de 50 km/h s''applique-t-elle encore juste après ?', 'vrai_faux', 1, 'fin de la limite agglomération', 'continuer à respecter 50 km/h après la sortie', 'Non, dès le panneau de sortie franchi, la limite générale hors agglomération (souvent 80 ou 90 km/h) s''applique.'),
((select id from subtopics where slug='vitesse-conditions-degradees'), 'Sur autoroute à 130 km/h, un brouillard réduit la visibilité à 40 mètres. Quelle vitesse appliquer ?', 'qcm', 3, 'vitesse et brouillard', 'appliquer seulement la réduction "pluie" (-10km/h)', '50 km/h : la règle du brouillard (visibilité <50m) prime sur la simple réduction de 10 km/h liée à la pluie.'),
((select id from subtopics where slug='regle-2-secondes'), 'La règle des 2 secondes s''applique-t-elle aussi en ville, à faible vitesse ?', 'vrai_faux', 1, 'distance de sécurité en ville', 'penser que la règle ne concerne que la route/autoroute', 'Oui, la règle des 2 secondes s''applique à toute vitesse, y compris en ville.'),
((select id from subtopics where slug='distance-par-mauvais-temps'), 'Sur autoroute mouillée, tu roules à 110 km/h. Combien de temps environ dois-tu laisser avec le véhicule qui précède ?', 'qcm', 3, 'distance par mauvais temps chiffrée', 'garder 2 secondes comme par temps sec', 'Environ 4 secondes, puisque l''intervalle recommandé est doublé par temps de pluie.'),
((select id from subtopics where slug='alcool-taux-legal'), 'Un conducteur en permis classique est contrôlé à 0,6 g/L. Est-il en infraction ?', 'vrai_faux', 1, 'dépassement du taux légal', 'confondre les seuils entre permis', 'Oui, il dépasse le taux légal de 0,5 g/L autorisé en permis classique.'),
((select id from subtopics where slug='fatigue-signes'), 'Tu ressens une légère lourdeur des paupières après 1h30 de route. Faut-il déjà envisager une pause ?', 'vrai_faux', 2, 'anticipation de la fatigue', 'attendre la pause programmée à 2h pile', 'Oui, mieux vaut s''arrêter dès les premiers signes plutôt que d''attendre un chiffre rond comme "2 heures".'),
((select id from subtopics where slug='pietons-passage'), 'Un feu piéton est au orange clignotant à côté d''un feu voiture au vert. Qui a la priorité ?', 'qcm', 3, 'feu piéton orange clignotant', 'penser que le feu voiture vert prime toujours', 'Le piéton déjà engagé garde la priorité ; le feu orange clignotant invite les nouveaux piétons à la prudence, pas à un arrêt strict.'),
((select id from subtopics where slug='angles-morts'), 'Un vélo est visible dans ton rétroviseur central mais pas dans le rétroviseur latéral droit. Où se trouve-t-il probablement ?', 'qcm', 2, 'repérage angle mort', 'ignorer un rétroviseur manquant comme signal', 'Probablement dans ton angle mort côté droit — vérifie en tournant la tête avant toute manœuvre.'),
((select id from subtopics where slug='vitesse-autoroute'), 'Un permis probatoire circule à 108 km/h par temps sec sur autoroute. Est-il en infraction ?', 'vrai_faux', 2, 'marge sous la limite probatoire', 'penser qu''être proche de la limite est risqué', 'Non, 108 km/h reste sous la limite de 110 km/h applicable en permis probatoire.'),
((select id from subtopics where slug='bande-urgence'), 'Un accident vient de se produire devant toi sur autoroute et la voie est bloquée. Peux-tu utiliser la bande d''arrêt d''urgence pour continuer ta route ?', 'vrai_faux', 2, 'usage bande d''urgence en cas d''accident', 'confondre "situation d''urgence autour de moi" et "urgence justifiant l''usage de la bande"', 'Non, sauf indication des forces de l''ordre : la bande reste réservée aux véhicules d''urgence et aux arrêts, pas à contourner un bouchon.'),
((select id from subtopics where slug='triangle-gilet-panne'), 'Ta panne se produit de nuit sur une route mal éclairée. Le placement du triangle change-t-il ?', 'vrai_faux', 2, 'triangle et visibilité nocturne', 'penser que la distance de 30m suffit toujours', 'La distance de 30m reste la base, mais il est recommandé de l''augmenter si la visibilité est réduite (nuit, virage).'),
((select id from subtopics where slug='conduite-a-tenir-accident'), 'Une victime consciente d''un accident te demande de l''aider à se relever immédiatement. Que fais-tu ?', 'qcm', 2, 'prudence avant de déplacer une victime', 'céder à la demande de la victime sans évaluer le risque', 'Tu la rassures mais évites de la déplacer sauf danger immédiat, en attendant les secours qualifiés.'),
((select id from subtopics where slug='gilet-triangle-obligation'), 'Ton triangle est présent mais rangé dans une valise fermée à clé dans le coffre. Cela pose-t-il un problème lors d''un contrôle ?', 'vrai_faux', 2, 'accessibilité rapide de l''équipement', 'penser que la simple présence suffit', 'Oui, l''équipement doit rester rapidement accessible pour être utile en cas d''urgence réelle.'),
((select id from subtopics where slug='ceinture-securite'), 'Un enfant est assis sur les genoux d''un adulte à l''arrière, sans ceinture propre. Est-ce autorisé ?', 'vrai_faux', 2, 'transport d''enfant sans dispositif adapté', 'penser qu''être tenu par un adulte suffit', 'Non, ce n''est pas autorisé : chaque occupant doit avoir son propre système de retenue adapté.'),
((select id from subtopics where slug='eco-conduite-principes'), 'Changer de vitesse à bas régime (sans forcer le moteur) fait-il partie de l''éco-conduite ?', 'vrai_faux', 1, 'changement de rapport et éco-conduite', 'penser que seul le style de conduite compte, pas la boîte de vitesses', 'Oui, monter les rapports tôt à bas régime réduit la consommation de carburant.'),
((select id from subtopics where slug='lignes-jaunes-stationnement'), 'Une ligne jaune discontinue est peinte devant une boulangerie. Peux-tu y stationner 20 minutes pour faire des courses ?', 'vrai_faux', 2, 'durée tolérée sur ligne discontinue', 'confondre arrêt bref et stationnement prolongé', 'Non, 20 minutes constitue un stationnement, pas un arrêt bref — c''est interdit même sur ligne discontinue.'),
((select id from subtopics where slug='stationnement-genant-dangereux'), 'Te garer juste avant un passage piéton, à moins de 5 mètres, est-il autorisé ?', 'vrai_faux', 2, 'distance minimale avant un passage piéton', 'penser que seule la présence de piétons compte, pas la distance', 'Non, stationner à moins de 5 mètres avant un passage piéton est interdit, ça réduit la visibilité mutuelle.'),
((select id from subtopics where slug='priorite-rond-point'), 'Un panneau "Vous n''avez pas la priorité" est présent à l''entrée d''un rond-point. Que signifie-t-il concrètement ?', 'qcm', 1, 'panneau priorité rond-point', 'ignorer ce panneau spécifique', 'Il confirme que les véhicules déjà engagés dans l''anneau sont prioritaires sur toi.'),
((select id from subtopics where slug='sortie-rond-point'), 'Un piéton traverse la sortie du rond-point que tu t''apprêtes à emprunter. Dois-tu t''arrêter même si tu es déjà dans l''anneau ?', 'vrai_faux', 2, 'priorité piéton en sortant de l''anneau', 'penser que la priorité de l''anneau prévaut sur celle du piéton', 'Oui, la priorité au piéton s''applique aussi lorsque tu sors de l''anneau, peu importe ta priorité dans le rond-point.'),
((select id from subtopics where slug='eclairage-nuit'), 'Tu roules de nuit sur une route bien éclairée par l''éclairage public. Les feux de croisement restent-ils obligatoires ?', 'vrai_faux', 1, 'feux et éclairage public', 'penser que l''éclairage public dispense d''allumer ses feux', 'Oui, les feux de croisement restent obligatoires de nuit, même sur une route éclairée.'),
((select id from subtopics where slug='adaptation-vitesse-nuit'), 'Peux-tu compenser une vitesse trop élevée de nuit en utilisant tes feux de route en permanence ?', 'vrai_faux', 2, 'feux de route et vitesse excessive', 'penser que les feux de route compensent une vitesse inadaptée', 'Non, les feux de route ne peuvent pas être utilisés en présence d''autres usagers, donc ils ne compensent pas une vitesse trop élevée en trafic.'),
((select id from subtopics where slug='brouillard-visibilite'), 'Peux-tu utiliser tes feux de route pour mieux voir dans le brouillard ?', 'vrai_faux', 2, 'feux de route dans le brouillard', 'penser que plus de lumière aide toujours à voir', 'Non, les feux de route se reflètent sur le brouillard et réduisent ta visibilité au lieu de l''améliorer.'),
((select id from subtopics where slug='neige-verglas'), 'Une route semble sèche mais il a gelé cette nuit. Faut-il rester prudent malgré l''apparence sèche ?', 'vrai_faux', 2, 'verglas invisible', 'se fier uniquement à l''apparence visuelle de la route', 'Oui, le verglas noir (invisible) peut exister même sur une chaussée qui semble sèche, notamment tôt le matin.'),
((select id from subtopics where slug='priorite-absolue-canne-blanche'), 'Une personne malvoyante traverse loin de tout passage piéton, en pleine ligne droite. La priorité absolue s''applique-t-elle quand même ?', 'vrai_faux', 2, 'priorité absolue en tout lieu', 'penser que la priorité absolue est limitée à une zone raisonnable', 'Oui, cette priorité s''applique quel que soit l''endroit où elle traverse.'),
((select id from subtopics where slug='abords-ecoles'), 'Une école est visible mais aucun enfant n''est en vue, un dimanche. Faut-il quand même respecter la limitation de vitesse réduite ?', 'vrai_faux', 1, 'limitation permanente aux abords des écoles', 'penser que la limite ne s''applique qu''en semaine scolaire', 'Oui, la limitation de vitesse liée à la zone reste en vigueur en permanence, pas seulement pendant les heures de classe.'),
((select id from subtopics where slug='sas-velo'), 'Peux-tu entrer dans le sas vélo si aucun cycliste n''y est présent au moment où tu arrives ?', 'vrai_faux', 2, 'sas vélo même vide', 'penser que la règle ne s''applique que si un cycliste attend déjà', 'Non, le sas reste interdit aux voitures même s''il est vide au moment où tu arrives.'),
((select id from subtopics where slug='ouverture-portiere'), 'Un passager arrière ouvre sa portière sans vérifier. Est-il concerné par la même règle de prudence qu''un conducteur ?', 'vrai_faux', 1, 'prudence pour tout occupant du véhicule', 'penser que seul le conducteur doit vérifier avant d''ouvrir', 'Oui, tout occupant doit vérifier avant d''ouvrir sa portière, pas seulement le conducteur.'),
((select id from subtopics where slug='casque-obligatoire'), 'Un casque de vélo classique (non homologué deux-roues motorisé) est-il suffisant pour circuler en scooter ?', 'vrai_faux', 2, 'homologation du casque', 'penser que tout casque de protection convient', 'Non, seul un casque homologué pour les deux-roues motorisés respecte l''obligation légale.'),
((select id from subtopics where slug='controle-technique-2rm'), 'Un scooter neuf doit-il passer un contrôle technique dès la première année ?', 'vrai_faux', 2, 'premier contrôle technique 2RM', 'penser que le premier contrôle est immédiat comme pour une formalité d''achat', 'Non, comme pour les voitures, il existe un délai avant le premier contrôle technique obligatoire.'),
((select id from subtopics where slug='etat-pneus'), 'Deux pneus avant très usés et deux pneus arrière neufs : est-ce une bonne pratique ?', 'vrai_faux', 2, 'répartition de l''usure des pneus', 'penser que seul l''état individuel de chaque pneu compte', 'Non, un déséquilibre important d''usure entre essieux nuit à la stabilité du véhicule, notamment au freinage.'),
((select id from subtopics where slug='controle-technique-voiture'), 'Une voiture de 3 ans doit-elle déjà passer son premier contrôle technique ?', 'vrai_faux', 1, 'délai avant premier contrôle', 'penser que le contrôle est nécessaire dès les premières années', 'Non, le premier contrôle technique n''est obligatoire qu''avant le 4e anniversaire du véhicule.'),
((select id from subtopics where slug='telephone-tenu-en-main'), 'Utiliser une oreillette Bluetooth au volant est-il équivalent à tenir son téléphone en main ?', 'vrai_faux', 2, 'oreillette vs téléphone en main', 'assimiler un kit mains-libres au téléphone tenu en main', 'Non, un dispositif mains-libres est autorisé, contrairement au téléphone tenu directement en main.'),
((select id from subtopics where slug='controle-routier-attitude'), 'Peux-tu demander à voir la carte professionnelle de l''agent qui te contrôle ?', 'vrai_faux', 1, 'droit du conducteur lors d''un contrôle', 'penser qu''un conducteur n''a aucun droit face à un contrôle', 'Oui, c''est un droit reconnu du conducteur, qui n''empêche pas de coopérer normalement au contrôle.'),
((select id from subtopics where slug='documents-obligatoires'), 'Une attestation d''assurance périmée depuis 2 jours est-elle valable lors d''un contrôle ?', 'vrai_faux', 2, 'validité de l''attestation d''assurance', 'penser qu''un léger retard ne pose pas de problème', 'Non, une attestation expirée n''est pas valable, même de quelques jours seulement.'),
((select id from subtopics where slug='assurance-obligatoire'), 'Un véhicule en panne, remorqué chez un garagiste, doit-il être assuré pendant le trajet ?', 'vrai_faux', 2, 'assurance pendant un remorquage', 'penser qu''un véhicule en panne échappe à l''obligation', 'Oui, l''obligation d''assurance s''applique tant que le véhicule est sur la voie publique, y compris remorqué.'),
((select id from subtopics where slug='passage-a-niveau'), 'Les barrières d''un passage à niveau sont en train de se relever. Peux-tu déjà t''engager ?', 'vrai_faux', 2, 'moment pour s''engager sur un passage à niveau', 'anticiper le passage avant la fin complète de la manœuvre', 'Il vaut mieux attendre qu''elles soient complètement relevées et les feux éteints avant de s''engager, par prudence.'),
((select id from subtopics where slug='vehicules-prioritaires'), 'Un véhicule prioritaire, gyrophare allumé mais sirène coupée, approche derrière toi. Dois-tu quand même céder le passage ?', 'vrai_faux', 2, 'gyrophare seul sans sirène', 'penser que seule la sirène signale une urgence réelle', 'Oui, le gyrophare seul suffit à signaler une intervention prioritaire, la sirène n''est pas toujours activée en continu.');

-- Réponses (vrai/faux directes ou QCM à options)
insert into answers (question_id, text, is_correct) values
((select id from questions where text like 'Tu circules sur une petite route sans aucun panneau%'), 'Vrai', true),
((select id from questions where text like 'Tu circules sur une petite route sans aucun panneau%'), 'Faux', false),

((select id from questions where text like 'Un panneau cédez-le-passage se trouve à la sortie d''un parking%'), 'Céder le passage à toute la circulation sur la route', true),
((select id from questions where text like 'Un panneau cédez-le-passage se trouve à la sortie d''un parking%'), 'Rien, la sortie de parking n''est pas concernée', false),
((select id from questions where text like 'Un panneau cédez-le-passage se trouve à la sortie d''un parking%'), 'S''arrêter seulement si un piéton est visible', false),

((select id from questions where text like 'Un panneau de danger annonçant un virage est présent%'), 'Vrai', true),
((select id from questions where text like 'Un panneau de danger annonçant un virage est présent%'), 'Faux', false),

((select id from questions where text like 'Peux-tu réduire la distance de dépassement d''un cycliste%'), 'Vrai', false),
((select id from questions where text like 'Peux-tu réduire la distance de dépassement d''un cycliste%'), 'Faux', true),

((select id from questions where text like 'Le panneau de sortie d''agglomération vient d''apparaître%'), 'Vrai', false),
((select id from questions where text like 'Le panneau de sortie d''agglomération vient d''apparaître%'), 'Faux', true),

((select id from questions where text like 'Sur autoroute à 130 km/h, un brouillard réduit%'), '130 km/h', false),
((select id from questions where text like 'Sur autoroute à 130 km/h, un brouillard réduit%'), '110 km/h', false),
((select id from questions where text like 'Sur autoroute à 130 km/h, un brouillard réduit%'), '50 km/h', true),

((select id from questions where text like 'La règle des 2 secondes s''applique-t-elle aussi en ville%'), 'Vrai', true),
((select id from questions where text like 'La règle des 2 secondes s''applique-t-elle aussi en ville%'), 'Faux', false),

((select id from questions where text like 'Sur autoroute mouillée, tu roules à 110 km/h%'), '2 secondes', false),
((select id from questions where text like 'Sur autoroute mouillée, tu roules à 110 km/h%'), '4 secondes', true),
((select id from questions where text like 'Sur autoroute mouillée, tu roules à 110 km/h%'), '6 secondes', false),

((select id from questions where text like 'Un conducteur en permis classique est contrôlé à 0,6 g/L%'), 'Vrai', true),
((select id from questions where text like 'Un conducteur en permis classique est contrôlé à 0,6 g/L%'), 'Faux', false),

((select id from questions where text like 'Tu ressens une légère lourdeur des paupières%'), 'Vrai', true),
((select id from questions where text like 'Tu ressens une légère lourdeur des paupières%'), 'Faux', false),

((select id from questions where text like 'Un feu piéton est au orange clignotant%'), 'Le conducteur, car le feu voiture est vert', false),
((select id from questions where text like 'Un feu piéton est au orange clignotant%'), 'Le piéton déjà engagé', true),
((select id from questions where text like 'Un feu piéton est au orange clignotant%'), 'Aucun des deux, chacun s''arrête', false),

((select id from questions where text like 'Un vélo est visible dans ton rétroviseur central%'), 'Loin derrière toi', false),
((select id from questions where text like 'Un vélo est visible dans ton rétroviseur central%'), 'Dans ton angle mort côté droit', true),
((select id from questions where text like 'Un vélo est visible dans ton rétroviseur central%'), 'Devant toi', false),

((select id from questions where text like 'Un permis probatoire circule à 108 km/h%'), 'Vrai', false),
((select id from questions where text like 'Un permis probatoire circule à 108 km/h%'), 'Faux', true),

((select id from questions where text like 'Un accident vient de se produire devant toi sur autoroute%'), 'Vrai', false),
((select id from questions where text like 'Un accident vient de se produire devant toi sur autoroute%'), 'Faux', true),

((select id from questions where text like 'Ta panne se produit de nuit sur une route mal éclairée%'), 'Vrai', true),
((select id from questions where text like 'Ta panne se produit de nuit sur une route mal éclairée%'), 'Faux', false),

((select id from questions where text like 'Une victime consciente d''un accident te demande%'), 'L''aider à se relever immédiatement', false),
((select id from questions where text like 'Une victime consciente d''un accident te demande%'), 'La rassurer sans la déplacer, sauf danger immédiat', true),
((select id from questions where text like 'Une victime consciente d''un accident te demande%'), 'Partir chercher de l''aide sans lui parler', false),

((select id from questions where text like 'Ton triangle est présent mais rangé dans une valise%'), 'Vrai', true),
((select id from questions where text like 'Ton triangle est présent mais rangé dans une valise%'), 'Faux', false),

((select id from questions where text like 'Un enfant est assis sur les genoux d''un adulte%'), 'Vrai', false),
((select id from questions where text like 'Un enfant est assis sur les genoux d''un adulte%'), 'Faux', true),

((select id from questions where text like 'Changer de vitesse à bas régime%'), 'Vrai', true),
((select id from questions where text like 'Changer de vitesse à bas régime%'), 'Faux', false),

((select id from questions where text like 'Une ligne jaune discontinue est peinte devant une boulangerie%'), 'Vrai', false),
((select id from questions where text like 'Une ligne jaune discontinue est peinte devant une boulangerie%'), 'Faux', true),

((select id from questions where text like 'Te garer juste avant un passage piéton%'), 'Vrai', false),
((select id from questions where text like 'Te garer juste avant un passage piéton%'), 'Faux', true),

((select id from questions where text like 'Un panneau "Vous n''avez pas la priorité"%'), 'Il t''autorise à entrer sans regarder', false),
((select id from questions where text like 'Un panneau "Vous n''avez pas la priorité"%'), 'Il confirme que les véhicules déjà engagés sont prioritaires', true),
((select id from questions where text like 'Un panneau "Vous n''avez pas la priorité"%'), 'Il indique un sens interdit', false),

((select id from questions where text like 'Un piéton traverse la sortie du rond-point%'), 'Vrai', true),
((select id from questions where text like 'Un piéton traverse la sortie du rond-point%'), 'Faux', false),

((select id from questions where text like 'Tu roules de nuit sur une route bien éclairée%'), 'Vrai', true),
((select id from questions where text like 'Tu roules de nuit sur une route bien éclairée%'), 'Faux', false),

((select id from questions where text like 'Peux-tu compenser une vitesse trop élevée de nuit%'), 'Vrai', false),
((select id from questions where text like 'Peux-tu compenser une vitesse trop élevée de nuit%'), 'Faux', true),

((select id from questions where text like 'Peux-tu utiliser tes feux de route pour mieux voir dans le brouillard%'), 'Vrai', false),
((select id from questions where text like 'Peux-tu utiliser tes feux de route pour mieux voir dans le brouillard%'), 'Faux', true),

((select id from questions where text like 'Une route semble sèche mais il a gelé cette nuit%'), 'Vrai', true),
((select id from questions where text like 'Une route semble sèche mais il a gelé cette nuit%'), 'Faux', false),

((select id from questions where text like 'Une personne malvoyante traverse loin de tout passage piéton%'), 'Vrai', true),
((select id from questions where text like 'Une personne malvoyante traverse loin de tout passage piéton%'), 'Faux', false),

((select id from questions where text like 'Une école est visible mais aucun enfant n''est en vue%'), 'Vrai', true),
((select id from questions where text like 'Une école est visible mais aucun enfant n''est en vue%'), 'Faux', false),

((select id from questions where text like 'Peux-tu entrer dans le sas vélo si aucun cycliste%'), 'Vrai', false),
((select id from questions where text like 'Peux-tu entrer dans le sas vélo si aucun cycliste%'), 'Faux', true),

((select id from questions where text like 'Un passager arrière ouvre sa portière sans vérifier%'), 'Vrai', true),
((select id from questions where text like 'Un passager arrière ouvre sa portière sans vérifier%'), 'Faux', false),

((select id from questions where text like 'Un casque de vélo classique%'), 'Vrai', false),
((select id from questions where text like 'Un casque de vélo classique%'), 'Faux', true),

((select id from questions where text like 'Un scooter neuf doit-il passer un contrôle technique dès la première année%'), 'Vrai', false),
((select id from questions where text like 'Un scooter neuf doit-il passer un contrôle technique dès la première année%'), 'Faux', true),

((select id from questions where text like 'Deux pneus avant très usés et deux pneus arrière neufs%'), 'Vrai', false),
((select id from questions where text like 'Deux pneus avant très usés et deux pneus arrière neufs%'), 'Faux', true),

((select id from questions where text like 'Une voiture de 3 ans doit-elle déjà passer%'), 'Vrai', false),
((select id from questions where text like 'Une voiture de 3 ans doit-elle déjà passer%'), 'Faux', true),

((select id from questions where text like 'Utiliser une oreillette Bluetooth au volant%'), 'Vrai', false),
((select id from questions where text like 'Utiliser une oreillette Bluetooth au volant%'), 'Faux', true),

((select id from questions where text like 'Peux-tu demander à voir la carte professionnelle%'), 'Vrai', true),
((select id from questions where text like 'Peux-tu demander à voir la carte professionnelle%'), 'Faux', false),

((select id from questions where text like 'Une attestation d''assurance périmée depuis 2 jours%'), 'Vrai', false),
((select id from questions where text like 'Une attestation d''assurance périmée depuis 2 jours%'), 'Faux', true),

((select id from questions where text like 'Un véhicule en panne, remorqué chez un garagiste%'), 'Vrai', true),
((select id from questions where text like 'Un véhicule en panne, remorqué chez un garagiste%'), 'Faux', false),

((select id from questions where text like 'Les barrières d''un passage à niveau sont en train de se relever%'), 'Vrai', false),
((select id from questions where text like 'Les barrières d''un passage à niveau sont en train de se relever%'), 'Faux', true),

((select id from questions where text like 'Un véhicule prioritaire, gyrophare allumé mais sirène coupée%'), 'Vrai', true),
((select id from questions where text like 'Un véhicule prioritaire, gyrophare allumé mais sirène coupée%'), 'Faux', false);
