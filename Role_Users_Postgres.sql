-- Criando a role
CREATE ROLE RL_READ_ONLY;

-- Atribuindo as permissões as roles 

-- Schema public e soamb
GRANT USAGE ON SCHEMA public TO RL_READ_ONLY;

GRANT USAGE ON SCHEMA soamb TO RL_READ_ONLY;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO RL_READ_ONLY;

GRANT SELECT ON ALL TABLES IN SCHEMA soamb TO RL_READ_ONLY;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO RL_READ_ONLY;

ALTER DEFAULT PRIVILEGES IN SCHEMA soamb
GRANT SELECT ON TABLES TO RL_READ_ONLY;

--Criando o usuário
CREATE ROLE "nome_usuario" LOGIN PASSWORD 'senha';

-- Atribuindo a role ao usuário
GRANT RL_READ_ONLY TO "nome_usuario";

--Criando o usuário
CREATE ROLE "nome_usuario" LOGIN PASSWORD 'senha';

-- Atribuindo a role ao usuário
GRANT rds_superuser TO DBA_ANIAT
