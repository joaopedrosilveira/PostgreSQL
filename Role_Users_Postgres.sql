---------------------------------------------
-- ROLE DE LEITURA
---------------------------------------------
CREATE ROLE RL_Read

--Aplicando as permissões de leitura
GRANT CONNECT ON DATABASE zabbix TO RL_Read;
GRANT USAGE ON SCHEMA public TO RL_Read;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO RL_Read;

--Aplicando a garantia da permissão em tabelas futuras
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO RL_Read;

--Aplicando a role em um usuário
GRANT rl_read to dba_karol

--------------------------------------------
--ROLE DE ESCRITA
--------------------------------------------
CREATE ROLE RL_Write

--Aplicando as permissões de escrita
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO RL_Write

--Aplicando a garantia de permissão em tabelas futuras
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO RL_Write

--------------------------------------------
--ROLE ADMIN (Não super user)
--------------------------------------------
--Criando a role ADMIN
CREATE ROLE rl_admin

-- Acesso ao banco
GRANT CONNECT ON DATABASE zabbix TO rl_admin;

-- Acesso ao schema
GRANT USAGE, CREATE ON SCHEMA public TO rl_admin;

-- Permissões adicionais de criar objetos e criar roles
ALTER ROLE rl_admin CREATEDB;

ALTER ROLE rl_admin CREATEROLE;
