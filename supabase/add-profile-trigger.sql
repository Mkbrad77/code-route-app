-- ============================================
-- Création automatique du profil à l'inscription
-- Remplace la création côté client (fragile si confirmation email active)
-- par un déclencheur fiable côté base de données.
-- ============================================

create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id)
  values (new.id)
  on conflict (id) do nothing;
  return new;
end;
$$ language plpgsql security definer set search_path = public;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ============================================
-- Réparation des comptes déjà créés (dont celui de ta amie)
-- Comble les profils manquants pour tous les comptes existants d'un coup.
-- ============================================
insert into public.profiles (id)
select id from auth.users
where id not in (select id from public.profiles)
on conflict (id) do nothing;
