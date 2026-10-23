# Ranking compartilhado com Supabase

O quiz usa a API REST do Supabase para que todas as pessoas consultem o mesmo ranking. O projeto precisa estar publicado em uma hospedagem com acesso à internet.

## Configuração

1. Crie um projeto no [Supabase](https://supabase.com/).
2. No painel do projeto, abra o SQL Editor e execute o conteúdo de `supabase-setup.sql`.
3. Em Project Settings > API, copie a Project URL e a chave pública `anon` (ou `publishable`). Nunca use a chave `service_role` no navegador.
4. Em `index.html`, substitua `https://SEU-PROJETO.supabase.co` e `SUA_CHAVE_ANON_PUBLICA` pelos valores do seu projeto.
5. Publique o `index.html` atualizado. Todos os acessos ao mesmo projeto Supabase compartilharão os resultados.

## Limites

A chave `anon` é pública e as políticas RLS limitam os campos e valores aceitos, mas a pontuação é enviada pelo navegador. Portanto, este ranking serve para atividades de turma e não impede fraude deliberada. Para um placar competitivo, a correção precisa ser validada por uma função de servidor.