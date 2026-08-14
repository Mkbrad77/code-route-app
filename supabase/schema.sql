-- ============================================
-- CODE ROUTE APP - SCHEMA + DONNEES DE DEPART
-- ============================================

-- Themes (les 22 grands thèmes)
create table topics (
  id serial primary key,
  slug text unique not null,
  name text not null,
  "order" int not null
);

-- Sous-thèmes / notions à l'intérieur d'un thème
create table subtopics (
  id serial primary key,
  topic_id int references topics(id) on delete cascade,
  slug text unique not null,
  title text not null,
  a_connaitre text,      -- section A
  pieges text,            -- section B
  confusions text,        -- section C
  a_memoriser text,       -- section D
  situation_reelle text,  -- section E (question + explication)
  situation_reponse text
);

-- Questions liées à un sous-thème
create table questions (
  id serial primary key,
  subtopic_id int references subtopics(id) on delete cascade,
  text text not null,
  type text not null default 'qcm', -- qcm, vrai_faux, multi, comparaison
  difficulty int not null default 2, -- 1 facile, 2 moyen, 3 difficile
  notion text,
  piege text,
  explanation text not null
);

create table answers (
  id serial primary key,
  question_id int references questions(id) on delete cascade,
  text text not null,
  is_correct boolean not null default false
);

-- Profil utilisateur (étend auth.users de Supabase)
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  exam_date date,
  daily_goal_minutes int default 45,
  created_at timestamptz default now()
);

-- Tentatives de réponse (historique complet)
create table attempts (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  question_id int references questions(id) on delete cascade,
  is_correct boolean not null,
  answered_at timestamptz default now()
);

-- Maîtrise par notion (table pivot centrale)
create table mastery (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  subtopic_id int references subtopics(id) on delete cascade,
  score int not null default 0,          -- 0 à 100
  correct_streak int not null default 0,
  times_tested int not null default 0,
  last_error_at timestamptz,
  next_review_date date default current_date,
  updated_at timestamptz default now(),
  unique(user_id, subtopic_id)
);

-- Planning des 14 jours
create table daily_plans (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  day_number int not null,
  plan_date date,
  topics_focus int[],  -- ids des topics du jour
  status text default 'pending', -- pending, validated, partial, failed
  unique(user_id, day_number)
);

-- Bilan de l'évaluation quotidienne
create table daily_evaluations (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  day_number int not null,
  score int,
  weak_subtopics int[],
  strong_subtopics int[],
  created_at timestamptz default now()
);

-- Badges débloqués
create table achievements (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  badge_code text not null,
  unlocked_at timestamptz default now(),
  unique(user_id, badge_code)
);

-- Historique XP
create table xp_log (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  amount int not null,
  reason text not null,
  created_at timestamptz default now()
);

-- ============================================
-- SECURITE : Row Level Security (chacun ne voit que ses données)
-- ============================================
alter table profiles enable row level security;
alter table attempts enable row level security;
alter table mastery enable row level security;
alter table daily_plans enable row level security;
alter table daily_evaluations enable row level security;
alter table achievements enable row level security;
alter table xp_log enable row level security;

create policy "own profile" on profiles for all using (auth.uid() = id);
create policy "own attempts" on attempts for all using (auth.uid() = user_id);
create policy "own mastery" on mastery for all using (auth.uid() = user_id);
create policy "own plans" on daily_plans for all using (auth.uid() = user_id);
create policy "own evals" on daily_evaluations for all using (auth.uid() = user_id);
create policy "own achievements" on achievements for all using (auth.uid() = user_id);
create policy "own xp" on xp_log for all using (auth.uid() = user_id);

-- Le contenu pédagogique (topics/subtopics/questions/answers) est public en lecture
alter table topics enable row level security;
alter table subtopics enable row level security;
alter table questions enable row level security;
alter table answers enable row level security;
create policy "public read topics" on topics for select using (true);
create policy "public read subtopics" on subtopics for select using (true);
create policy "public read questions" on questions for select using (true);
create policy "public read answers" on answers for select using (true);

-- ============================================
-- DONNEES DE DEPART (MVP - 3 thèmes pour tester)
-- ============================================

insert into topics (slug, name, "order") values
('priorites', 'Priorités', 1),
('signalisation', 'Signalisation', 2),
('depassements', 'Dépassements', 3);

insert into subtopics (topic_id, slug, title, a_connaitre, pieges, confusions, a_memoriser, situation_reelle, situation_reponse) values
(1, 'priorite-a-droite', 'La priorité à droite',
 'En l''absence de panneau, tout véhicule venant de la droite est prioritaire.',
 'Beaucoup de candidats oublient que la priorité à droite s''applique aussi entre deux petites routes sans aucun panneau, y compris en zone résidentielle.',
 'Priorité à droite ≠ "je passe en premier parce que j''arrive avant" : c''est uniquement une question de position, pas de timing.',
 'Règle par défaut = priorité à droite, sauf indication contraire (panneau, feu, marquage).',
 'Vous arrivez à une intersection sans aucun panneau, une voiture arrive sur votre droite au même moment.',
 'La voiture à votre droite est prioritaire, vous devez la laisser passer.'),
(1, 'cedez-le-passage', 'Le cédez-le-passage',
 'Le panneau triangle pointe en bas = vous devez céder le passage sans obligation de vous arrêter si la voie est libre.',
 'Certains candidats confondent avec le Stop et pensent qu''un arrêt total est obligatoire — ce n''est vrai que si la visibilité ou le trafic l''exige.',
 'Cédez-le-passage = ralentir et regarder ; Stop = arrêt total obligatoire, même si la voie semble libre.',
 'Stop = arrêt total obligatoire. Cédez le passage = ralentir + céder si nécessaire.',
 'Vous approchez d''un panneau cédez-le-passage, aucune voiture en vue.',
 'Vous pouvez continuer sans arrêt complet, mais en restant prêt à céder le passage.'),
(2, 'panneaux-danger', 'Les panneaux de danger',
 'Triangulaires à fond blanc et bordure rouge, ils annoncent un danger à venir (virage, chaussée glissante, etc.).',
 'Un panneau de danger temporaire (fond jaune) prime toujours sur un panneau permanent équivalent.',
 'Ne pas confondre un panneau de danger (triangle) avec un panneau d''obligation (rond bleu) qui impose une action.',
 'Panneau jaune temporaire > panneau permanent en cas de contradiction.',
 'Vous voyez un panneau de virage dangereux permanent, et juste après un panneau jaune de travaux annonçant un rétrécissement.',
 'C''est le panneau temporaire (jaune) qui prime pour la situation actuelle.'),
(3, 'depassement-deux-roues', 'Dépasser un deux-roues',
 'Distance latérale minimale d''1m50 en agglomération et hors agglomération pour dépasser un cycliste ou un deux-roues.',
 'Beaucoup de candidats sous-estiment cette distance, pensant qu''elle ne s''applique qu''hors agglomération.',
 'La distance de 1m50 s''applique quelle que soit la vitesse autorisée sur la voie, contrairement à ce qu''on pense souvent.',
 '1m50 minimum, en ville comme sur route, pour dépasser un cycliste ou un deux-roues motorisé.',
 'Vous vous apprêtez à dépasser un cycliste en ville sur une route à 50 km/h.',
 'Vous devez respecter au moins 1m50 de distance latérale, même en agglomération.');

insert into questions (subtopic_id, text, type, difficulty, notion, piege, explanation) values
(1, 'Vous arrivez à une intersection sans panneau. Une voiture arrive sur votre droite. Qui est prioritaire ?', 'qcm', 2, 'priorité à droite', 'oubli de la règle par défaut', 'En l''absence de signalisation, la priorité à droite s''applique toujours : la voiture à droite passe en premier.'),
(1, 'La priorité à droite ne s''applique qu''en dehors des agglomérations.', 'vrai_faux', 2, 'priorité à droite', 'confusion agglomération/hors agglomération', 'Faux : la priorité à droite s''applique partout, y compris en ville, sauf signalisation contraire.'),
(2, 'À un panneau cédez-le-passage, l''arrêt total est-il toujours obligatoire ?', 'vrai_faux', 2, 'cédez le passage', 'confusion avec le Stop', 'Faux, l''arrêt n''est obligatoire que si la sécurité l''exige. Le Stop, lui, impose un arrêt total systématique.'),
(3, 'Un panneau de danger temporaire jaune contredit un panneau permanent. Lequel doit-on suivre ?', 'qcm', 3, 'hiérarchie des panneaux', 'ignorer la priorité du temporaire', 'Le panneau temporaire (jaune) prime toujours sur le panneau permanent équivalent.'),
(4, 'Quelle distance minimale respecter pour dépasser un cycliste en ville ?', 'qcm', 2, 'distance de dépassement', 'sous-estimation en agglomération', 'Il faut respecter au moins 1m50, y compris en agglomération.');

insert into answers (question_id, text, is_correct) values
(1, 'C''est moi qui passe en premier', false),
(1, 'La voiture à droite passe en premier', true),
(1, 'Celui qui arrive le premier passe', false),
(2, 'Vrai', false),
(2, 'Faux', true),
(3, 'Vrai, l''arrêt est toujours obligatoire', false),
(3, 'Faux, seulement si nécessaire', true),
(4, 'Le panneau permanent', false),
(4, 'Le panneau temporaire jaune', true),
(5, '1 mètre', false),
(5, '1m50', true),
(5, '2 mètres', false);
