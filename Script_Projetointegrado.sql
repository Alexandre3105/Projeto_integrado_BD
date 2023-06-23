--ALUNOS: Eduardo Godio Rodrigues, Alexandre Blank Lopes, Daniela Beatriz Labarca Hinojosa e Gustavo Teixeira Regis
--TURMA: cc1mc

/* CRIAR TABELA
   RECOMPENSAS */

--Criar tabela recompensas.

CREATE TABLE recompensas (
                id_recompensa NUMERIC(10) NOT NULL,
                nome          VARCHAR(80) NOT NULL,
);

--Criar PK da tabela recompensas.

ALTER TABLE    recompensas
ADD CONSTRAINT id_recompensa_pk
PRIMARY KEY   (id_recompensa);

--Criar comentários da tabela recompensas.

COMMENT ON TABLE  recompensas               IS 'Tabela de recompensas que podem ser adquiridas pelo colaborador. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN recompensas.id_recompensa IS 'Representa o número identificador da recompensa. É a PK da tabela "recompensas". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN recompensas.nome          IS 'Representa o nome da recompensa. Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   PRECOS_RECOMPENSAS */

--Criar tabela precos_recompensas.

CREATE TABLE precos_recompensas (
                id_recompensa NUMERIC(10) NOT NULL,
                valor         NUMERIC(10) NOT NULL,
);

--Criar PK da tabela precos_recompensas.

ALTER TABLE    precos_recompensas
ADD CONSTRAINT precos_recompensas_pfk
PRIMARY KEY   (id_recompensa);

--Criar restrição do valor.

ALTER TABLE    precos_recompensas
ADD CONSTRAINT cc_precos_recompensas_valor
CHECK         (valor >= 0);

--Criar comentários da tabela precos_recompensas.

COMMENT ON TABLE  precos_recompensas               IS 'Tabela que armazena os valores das recompensas. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN precos_recompensas.id_recompensa IS 'Representa o número identificador da recompensa. É a PFK da tabela "precos_recompensas". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN precos_recompensas.valor         IS 'Representa o valor da recompensa. Apenas valores maiores ou iguais a 0 podem ser inseridos. Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   PROFESSORES */

--Criar tabela professores.

CREATE TABLE professores (
                cpf_professores CHAR(11)    NOT NULL,
                nome            VARCHAR(80) NOT NULL,
                email           VARCHAR(80) NOT NULL,
                senha           VARCHAR(80) NOT NULL,
);

--Criar PK da tabela professores.

ALTER TABLE    professores
ADD CONSTRAINT cpf_professores_pk
PRIMARY KEY   (cpf_professores);

--Criar comentários da tabela professores.

COMMENT ON TABLE  professores                 IS 'Tabela responsável por armazenar dados dos professores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN professores.cpf_professores IS 'Representa o cpf dos professores. É a PK da tabela "professores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN professores.nome            IS 'Representa o nome dos professores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN professores.email           IS 'Representa o email dos professores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN professores.senha           IS 'Representa a senha dos professores. Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   TELEFONES_PROFESSORES */

--Criar tabela telefones_professores.

CREATE TABLE telefones_professores (
                ddd             NUMERIC(2) NOT NULL,
                numero          NUMERIC(9) NOT NULL,
                cpf_professores CHAR(11)   NOT NULL,
);

--Criar PK da tabela telefones_professores.

ALTER TABLE    telefones_professores
ADD CONSTRAINT telefones_professores_pk
PRIMARY KEY   (ddd, numero);

--Criar comentários da tabela telefones_professores.

COMMENT ON TABLE  telefones_professores                 IS 'Tabela que armazena os telefones dos professores. Essa coluna não pode ter valor null.'
COMMENT ON COLUMN telefones_professores.ddd             IS 'Representa o DDD do telefone dos professores. Faz parte da PK composta da tabela "telefones_professores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN telefones_professores.numero          IS 'Representa o número do telefone dos professores. Faz parte da PK composta da tabela "telefones_professores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN telefones_professores.cpf_professores IS 'Representa o cpf dos professores. É FK da tabela "professores" para a tabela "telefones_professores". Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   COLABORADORES */

--Criar tabela colaboradores.

CREATE TABLE colaboradores (
                cpf_colaboradores CHAR(11)    NOT NULL,
                nome              VARCHAR(80) NOT NULL,
                email             VARCHAR(80) NOT NULL,
                senha             VARCHAR(80) NOT NULL,
                data_admissao     DATE        NOT NULL,
                data_nascimento   DATE        NOT NULL,
                cep               NUMERIC(8)  NOT NULL,
                rua               VARCHAR(80) NOT NULL,
                numero            NUMERIC(10) NOT NULL,
                bairro            VARCHAR(80) NOT NULL,
                cidade            VARCHAR(80) NOT NULL,
                estado            CHAR(2)     NOT NULL,
);

--Criar PK da tabela colaboradores.

ALTER TABLE    colaboradores
ADD CONSTRAINT cpf_colaboradores_pk
PRIMARY KEY   (cpf_colaboradores);

--Criar comentários da tabela colaboradores.

COMMENT ON TABLE  colaboradores                   IS 'Tabela responsável por armazenar dados dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.cpf_colaboradores IS 'Representa o cpf dos colaboradores. É a PK da tabela "colaboradores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.nome              IS 'Representa o nome dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.email             IS 'Representa o email dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.senha             IS 'Representa a senha dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.data_admissao     IS 'Representa a data de admissao dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.data_nascimento   IS 'Representa a data de nascimento dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.cep               IS 'Representa o cep dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.rua               IS 'Representa a rua dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.numero            IS 'Representa o numero da rua dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.bairro            IS 'Representa o bairro dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.cidade            IS 'Representa a cidade dos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN colaboradores.estado            IS 'Representa o estado dos colaboradores. Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   TELEFONES_COLABORADORES */

--Criar tabela telefones_colaboradores.

CREATE TABLE telefones_colaboradores (
                ddd               NUMERIC(2) NOT NULL,
                numero            NUMERIC(9) NOT NULL,
                cpf_colaboradores CHAR(11)   NOT NULL,
);

--Criar PK da tabela telefones_colaboradores.

ALTER TABLE    telefones_colaboradores
ADD CONSTRAINT telefones_colaboradores_pk
PRIMARY KEY   (ddd, numero);

--Criar comentários da tabela telefones_colaboradores.

COMMENT ON TABLE  telefones_colaboradores                   IS 'Tabela que armazena os telefones dos colaboradores. Essa coluna não pode ter valor null.'
COMMENT ON COLUMN telefones_colaboradores.ddd               IS 'Representa o DDD do telefone dos colaboradores. Faz parte da PK composta da tabela "telefones_colaboradores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN telefones_colaboradores.numero            IS 'Representa o número do telefone dos colaboradores. Faz parte da PK composta da tabela "telefones_colaboradores". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN telefones_colaboradores.cpf_colaboradores IS 'Representa o cpf dos colaboradores. É FK da tabela "colaboradores" para a tabela "telefones_colaboradores". Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   SETOR */

--Criar tabela setor.

CREATE TABLE setor (
                codigo            NUMERIC(10) NOT NULL,
                nome              VARCHAR(80) NOT NULL,
                cpf_colaboradores CHAR(11)    NOT NULL,
);

--Criar PK da tabela setor.

ALTER TABLE    setor
ADD CONSTRAINT codigo_pk
PRIMARY KEY   (codigo);

--Criar comentários da tabela setor.

COMMENT ON TABLE  setor                   IS 'Tabela que ordena o setor de cada colaborador. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN setor.codigo            IS 'Representa o código do setor. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN setor.nome              IS 'Representa o nome do setor. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN setor.cpf_colaboradores IS 'Representa o cpf dos colaboradores. É FK da tabela "colaboradores" para a tabela "setor". Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   HISTORICO_RECOMPENSAS */

--Criar tabela historico_recompensas.

CREATE TABLE historico_recompensas (
                cpf_colaboradores CHAR(11)    NOT NULL,
                id_recompensa     NUMERIC(10) NOT NULL,
                data              DATE        NOT NULL,
);

--Criar PFK da tabela historico_recompensas.

ALTER TABLE    historico_recompensas
ADD CONSTRAINT id_recompensa_cpf_colaboradores_pfk
PRIMARY KEY   (cpf_colaboradores, id_recompensa);

--Criar comentários da tabela historico_recompensas.

COMMENT ON TABLE  historico_recompensas                   IS 'Tabela que registra o histórico de recompensas adquiridas pelos colaboradores. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN historico_recompensas.cpf_colaboradores IS 'Representa o cpf dos colaboradores. É PFK da tabela "historico_recompensas". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN historico_recompensas.id_recompensa     IS 'Representa o número de id da recompensa. É PFK da tabela "historico_recompensas". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN historico_recompensas.data              IS 'Representa a data de compra da recompensa. Essa coluna não pode ter valor null.';

/* CRIAR TABELA
   CURSOS */

--Criar tabela cursos.

CREATE TABLE cursos (
                id_curso          NUMERIC(10) NOT NULL,
                nome              VARCHAR(80) NOT NULL,
                cpf_professores   CHAR(11)    NOT NULL,
                cpf_colaboradores CHAR(11)    NOT NULL,
);

--Criar PK da tabela cursos.

ALTER TABLE    cursos
ADD CONSTRAINT id_curso_pk
PRIMARY KEY   (id_curso);

--Criar comentários da tabela cursos.

COMMENT ON TABLE  cursos                   IS 'Tabela que armazena os cursos disponíveis. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN cursos.id_curso          IS 'Representa o número de id do curso. É PK da tabela "cursos". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN cursos.nome              IS 'Representa o nome do curso. Essa coluna não pode ter valor null.';
COMMENT ON COLUMN cursos.cpf_professores   IS 'Representa o cpf dos professores. É FK da tabela "professores" para a tabela "cursos". Essa coluna não pode ter valor null.';
COMMENT ON COLUMN cursos.cpf_colaboradores IS 'Representa o cpf dos colaboradores. É FK da tabela "colaboradores" para a tabela "cursos". Essa coluna não pode ter valor null.';

/* CRIAÇÃO 
   DAS
   CHAVES
   ESTRANGEIRAS
  (FK)*/

--Criar FK da tabela historico_recompensas para a tabela recompensas, para formar uma PFK.

ALTER TABLE    historico_recompensas 
ADD CONSTRAINT recompensas_historico_de_recompensas_fk
FOREIGN KEY   (id_recompensa)
REFERENCES     recompensas (id_recompensa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela precos_recompensas para a tabela recompensas, para formar uma PFK.

ALTER TABLE    precos_recompensas 
ADD CONSTRAINT recompensas_precos_recompensas_fk
FOREIGN KEY   (id_recompensa)
REFERENCES     recompensas (id_recompensa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela cursos para a tabela professores.

ALTER TABLE    cursos 
ADD CONSTRAINT professores_cursos_fk
FOREIGN KEY   (cpf_professores)
REFERENCES     professores (cpf_professores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela telefones_professores para a tabela professores.

ALTER TABLE    telefones_professores 
ADD CONSTRAINT professores_telefones_fk
FOREIGN KEY   (cpf_professores)
REFERENCES     professores (cpf_professores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela cursos para a tabela colaboradores.

ALTER TABLE    cursos 
ADD CONSTRAINT colaboradores_cursos_fk
FOREIGN KEY   (cpf_colaboradores)
REFERENCES     colaboradores (cpf_colaboradores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela historico_recompensas para a tabela colaboradores, para formar uma PFK.

ALTER TABLE    historico_recompensas 
ADD CONSTRAINT colaboradores_historico_de_recompensas_fk
FOREIGN KEY   (cpf_colaboradores)
REFERENCES     colaboradores (cpf_colaboradores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela setor para a tabela colaboradores.

ALTER TABLE    setor 
ADD CONSTRAINT colaboradores_setor_fk
FOREIGN KEY   (cpf_colaboradores)
REFERENCES     colaboradores (cpf_colaboradores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criar FK da tabela telefones_colaboradores para a tabela colaboradores.

ALTER TABLE    telefones_colaboradores 
ADD CONSTRAINT colaboradores_telefones_fk
FOREIGN KEY   (cpf_colaboradores)
REFERENCES     colaboradores (cpf_colaboradores)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
