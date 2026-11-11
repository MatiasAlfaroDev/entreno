-- Pegar en Supabase > SQL Editor > Run
create table public.entreno(
  user_id uuid primary key default auth.uid() references auth.users on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.entreno enable row level security;
create policy "solo lo mio" on public.entreno for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
