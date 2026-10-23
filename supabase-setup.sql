create table if not exists public.quiz_scores (
  id uuid primary key default gen_random_uuid(),
  team_name text not null check (char_length(btrim(team_name)) between 1 and 32),
  score smallint not null check (score between 0 and 30),
  elapsed_seconds integer not null check (elapsed_seconds between 0 and 86400),
  created_at timestamptz not null default now()
);

alter table public.quiz_scores enable row level security;

grant select, insert on public.quiz_scores to anon, authenticated;

drop policy if exists "Anyone can read quiz scores" on public.quiz_scores;
create policy "Anyone can read quiz scores"
  on public.quiz_scores
  for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can submit quiz scores" on public.quiz_scores;
create policy "Anyone can submit quiz scores"
  on public.quiz_scores
  for insert
  to anon, authenticated
  with check (
    char_length(btrim(team_name)) between 1 and 32
    and score between 0 and 30
    and elapsed_seconds between 0 and 86400
  );