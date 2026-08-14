-- ============================================
-- ASTUCES DE CALCUL RAPIDE / ÉLIMINATION
-- Une astuce par notion, pour répondre plus vite le jour J
-- ============================================

update subtopics set astuce = 'Élimine d''abord toute réponse qui parle de "vitesse" ou de "qui est arrivé en premier" — ces critères n''existent jamais dans les règles de priorité. Il ne reste alors que la bonne position (gauche/droite).' where slug = 'priorite-a-droite';

update subtopics set astuce = 'Retiens juste la différence de mot : "cédez" = ralentir seulement si besoin. "Stop" = toujours s''arrêter. Si l''énoncé dit "cédez-le-passage" et propose un arrêt obligatoire dans toutes les situations, élimine cette réponse.' where slug = 'cedez-le-passage';

update subtopics set astuce = 'Forme triangle = toujours danger, quel que soit le symbole dessiné dedans. Élimine directement toute réponse qui associe le triangle à une obligation (ça, c''est le rond bleu).' where slug = 'panneaux-danger';

update subtopics set astuce = 'Retiens "1 en ville, 1,5 hors ville" : le chiffre le plus petit va avec le mot le plus court (ville). Si une réponse inverse les deux, élimine-la.' where slug = 'depassement-deux-roues';

update subtopics set astuce = 'Élimine d''abord les réponses avec une vitesse supérieure à 50 km/h : en agglomération, c''est presque toujours la limite par défaut, sauf zone signalée plus basse.' where slug = 'vitesse-agglomeration';

update subtopics set astuce = 'Un seul chiffre à retenir : -10 km/h sous la pluie, quelle que soit la route de départ. Fais juste la soustraction sur la limite normale.' where slug = 'vitesse-conditions-degradees';

update subtopics set astuce = 'Calcul rapide : prends les dizaines de ta vitesse, multiplie par 3 (ça donne les mètres par seconde), puis multiplie encore par 2 (2 secondes). Exemple à 90 km/h : 9×3=27, puis 27×2=54 mètres — exactement la valeur attendue aux questions.' where slug = 'regle-2-secondes';

update subtopics set astuce = 'Pas besoin de recalculer : double simplement le résultat obtenu avec la règle des 2 secondes en conditions sèches pour obtenir la distance sous la pluie (2 sec → 4 sec).' where slug = 'distance-par-mauvais-temps';

update subtopics set astuce = 'Retiens le contraste : permis classique = 0,5 (comme "un demi-verre"), permis probatoire = 0,2 (quasiment zéro). Si une réponse donne le même chiffre pour les deux permis, élimine-la.' where slug = 'alcool-taux-legal';

update subtopics set astuce = 'Retiens le rythme "2h / 20min" : une pause toutes les 2 heures, d''environ 20 minutes. Élimine toute réponse qui propose d''attendre un signe grave (somnolence) avant de s''arrêter.' where slug = 'fatigue-signes';

update subtopics set astuce = 'Dès qu''un piéton s''approche du bord du trottoir en regardant la route, considère-le "engagé" dans l''énoncé. Mieux vaut choisir la réponse la plus prudente entre deux options proches.' where slug = 'pietons-passage';

update subtopics set astuce = 'Règle simple à appliquer sur les questions d''angle mort : si tu ne vois pas les rétroviseurs du véhicule en question, il ne te voit pas non plus.' where slug = 'angles-morts';

update subtopics set astuce = 'Retiens juste l''écart fixe : 20 km/h de moins en permis probatoire par rapport à la limite classique sur autoroute (130 → 110). Le reste se déduit de ce seul écart.' where slug = 'vitesse-autoroute';

update subtopics set astuce = 'Élimination rapide : toute réponse qui justifie un arrêt sur la bande d''urgence par confort (GPS, téléphone, courte pause) est fausse par principe — seule une urgence réelle compte.' where slug = 'bande-urgence';

update subtopics set astuce = 'Retiens l''ordre logique : le gilet te protège TOI, donc il vient toujours avant toute action vers l''extérieur du véhicule (triangle).' where slug = 'triangle-gilet-panne';

update subtopics set astuce = 'Mnémotechnique classique : "PAS" — Protéger, Alerter, Secourir, toujours dans cet ordre. Si une réponse inverse l''ordre, elle est fausse.' where slug = 'conduite-a-tenir-accident';

update subtopics set astuce = 'Retiens le mot clé "accessible" : le gilet doit être atteignable depuis l''habitacle (boîte à gants), pas juste "présent quelque part dans le coffre".' where slug = 'gilet-triangle-obligation';

update subtopics set astuce = 'Astuce ultra simple : dès qu''une réponse propose une exception à la ceinture (trajet court, place arrière, faible vitesse...), élimine-la — il n''existe aucune exception.' where slug = 'ceinture-securite';

update subtopics set astuce = 'Élimination rapide : toute réponse qui recommande d''accélérer fort puis de freiner fort est automatiquement fausse pour une question d''éco-conduite.' where slug = 'eco-conduite-principes';

update subtopics set astuce = 'Retiens juste "continue = tout interdit" (arrêt et stationnement), "discontinue = stationnement interdit mais arrêt bref toléré". Un seul mot à mémoriser par ligne.' where slug = 'lignes-jaunes-stationnement';

update subtopics set astuce = 'Élimination rapide : si le lieu cité dans l''énoncé présente un risque de visibilité (virage, sommet de côte, passage piéton, piste cyclable), la réponse "dangereux" prime toujours sur "gênant".' where slug = 'stationnement-genant-dangereux';

update subtopics set astuce = 'Repère le panneau cédez-le-passage à l''entrée dans l''énoncé ou l''image : s''il y est, les véhicules déjà dans l''anneau sont prioritaires, point final — pas besoin de réfléchir plus loin.' where slug = 'priorite-rond-point';

update subtopics set astuce = 'Le clignotant n''est jamais un argument valable dans une bonne réponse de priorité. Élimine directement toute option qui s''appuie dessus pour justifier un passage.' where slug = 'sortie-rond-point';

update subtopics set astuce = 'Retiens le déclencheur simple : dès que tu vois les feux d''un autre véhicule en face, c''est le signal pour repasser en feux de croisement — pas besoin d''attendre d''être ébloui toi-même.' where slug = 'eclairage-nuit';

update subtopics set astuce = 'Règle simple à appliquer : ta vitesse doit toujours te permettre de t''arrêter dans la zone éclairée par tes phares, jamais au-delà — même sur une route que tu connais par cœur.' where slug = 'adaptation-vitesse-nuit';

update subtopics set astuce = 'Mémorise un seul chiffre répété des deux côtés : visibilité inférieure à 50m → vitesse limitée à 50 km/h. Le même nombre, facile à retenir.' where slug = 'brouillard-visibilite';

update subtopics set astuce = 'Pas besoin d''un chiffre précis : retiens l''ordre de grandeur "2 à 10 fois plus long" pour freiner sur neige/verglas. Une réponse avec une fourchette large est souvent la bonne ici.' where slug = 'neige-verglas';

update subtopics set astuce = 'Dès qu''une canne blanche ou un chien guide apparaît dans l''énoncé, élimine directement toute réponse qui conditionne la priorité à la présence d''un passage piéton — la priorité est absolue.' where slug = 'priorite-absolue-canne-blanche';

update subtopics set astuce = 'Retiens "30 = école", comme un radar mental permanent aux abords d''un établissement scolaire — pas seulement à l''heure de la sortie des classes.' where slug = 'abords-ecoles';

update subtopics set astuce = 'Repère visuel simple : si le vélo peint au sol est AVANT le feu, ta ligne d''arrêt à toi est encore plus en amont, jamais dans cette zone.' where slug = 'sas-velo';

update subtopics set astuce = 'Astuce pratique (utilisée par les pros) : ouvre ta portière avec la main du côté opposé — ce geste t''oblige naturellement à te retourner et à repérer un cycliste.' where slug = 'ouverture-portiere';

update subtopics set astuce = 'Élimination automatique : toute réponse qui dissocie le conducteur du passager sur l''obligation de casque est fausse — la règle est toujours symétrique entre les deux.' where slug = 'casque-obligatoire';

update subtopics set astuce = 'Mnémotechnique : "2 roues, 3 ans" — le contrôle technique moto revient tous les 3 ans une fois le premier passage effectué, sans exception liée à la cylindrée.' where slug = 'controle-technique-2rm';

update subtopics set astuce = 'Repère visuel facile : 1,6 mm, c''est à peu près l''épaisseur d''une pièce de 1 centime — un bon repère mental pour juger l''usure d''un pneu.' where slug = 'etat-pneus';

update subtopics set astuce = 'Mnémotechnique : "4 puis 2" pour la voiture (1er contrôle à 4 ans, puis tous les 2 ans) — à ne pas confondre avec la règle "3 ans" des deux-roues motorisés.' where slug = 'controle-technique-voiture';

update subtopics set astuce = 'Piège classique de l''examen : la question insiste souvent sur "à l''arrêt". Retiens que seul un stationnement réel (moteur coupé, hors circulation) change la donne, jamais un simple feu rouge.' where slug = 'telephone-tenu-en-main';

update subtopics set astuce = 'Élimination rapide : toute réponse qui implique d''accélérer, de ralentir sans s''arrêter, ou de discuter sur place est toujours fausse face à un contrôle routier.' where slug = 'controle-routier-attitude';

update subtopics set astuce = 'Mnémotechnique "PCA" : Permis, Carte grise, Assurance — les 3 documents à toujours pouvoir présenter, dans cet ordre pour t''en souvenir.' where slug = 'documents-obligatoires';

update subtopics set astuce = 'Élimination rapide : toute réponse qui lie l''obligation d''assurance à la fréquence d''usage du véhicule ("il roule peu/jamais") est fausse — seule la possibilité de circuler compte.' where slug = 'assurance-obligatoire';

update subtopics set astuce = 'Élimination systématique : toute réponse qui autorise à s''engager "si on pense avoir le temps" est fausse par principe sur les questions de passage à niveau.' where slug = 'passage-a-niveau';

update subtopics set astuce = 'Astuce simple : dès que l''énoncé mentionne des gyrophares ET une sirène en approche, élimine directement toute réponse qui n''implique pas de céder le passage.' where slug = 'vehicules-prioritaires';
