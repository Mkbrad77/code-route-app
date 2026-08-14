-- Table pour l'historique des examens blancs
create table mock_exams (
  id bigserial primary key,
  user_id uuid references profiles(id) on delete cascade,
  score int not null,
  total_questions int not null,
  correct_count int not null,
  passed boolean not null,
  created_at timestamptz default now()
);

alter table mock_exams enable row level security;
create policy "own mock exams" on mock_exams for all using (auth.uid() = user_id);
