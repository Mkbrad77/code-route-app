-- Correction : la distance latérale de dépassement d'un cycliste/deux-roues
-- est de 1m en agglomération et 1,5m hors agglomération (pas 1m50 partout).

update subtopics set
  a_connaitre = 'Distance latérale minimale d''1 mètre en agglomération et 1,5 mètre hors agglomération pour dépasser un cycliste ou un deux-roues.',
  confusions = 'On confond souvent les deux seuils : c''est 1m EN VILLE (pas 1m50), et 1,5m HORS agglomération.',
  a_memoriser = '1m en agglomération, 1,5m hors agglomération, pour dépasser un cycliste ou un deux-roues motorisé.',
  situation_reponse = 'Vous devez respecter au moins 1 mètre de distance latérale (règle spécifique à l''agglomération).'
where slug = 'depassement-deux-roues';

update questions set
  explanation = 'Il faut respecter au moins 1 mètre en agglomération (1,5m hors agglomération).'
where id = 4;

update answers set text = '1 mètre' where question_id = 4 and text = '1m50';
