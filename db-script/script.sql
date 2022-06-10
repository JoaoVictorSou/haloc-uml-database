/*Database*/
create database if not exists haloc;
use haloc;

/* model: */
CREATE TABLE IF NOT EXISTS Administrador (
    nome VARCHAR(45),
    cpf VARCHAR(14),
    numeroTelefone VARCHAR(14),
    salario DOUBLE(7, 2),
    rfid INTEGER(5),
    numeroCelular VARCHAR(14),
    senha VARCHAR(65),
    nivel INTEGER(1),
    email VARCHAR(45),
    PRIMARY KEY (cpf, rfid),
    UNIQUE (cpf, rfid)
);

CREATE TABLE IF NOT EXISTS DiaServicoTreinador (
    horaInicio TIME,
    diaSemana INTEGER(1),
    horaFim TIME,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14),
    id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Treinador (
    numeroTelefone VARCHAR(8),
    rfid INTEGER(5),
    numeroCelular VARCHAR(14),
    salario DOUBLE(6, 2),
    senha VARCHAR(65),
    nome VARCHAR(45),
    cpf VARCHAR(14),
    status BOOLEAN,
    email VARCHAR(45),
    PRIMARY KEY (rfid, cpf),
    UNIQUE (rfid, cpf)
);

CREATE TABLE IF NOT EXISTS IrregularidadeAdministrador (
    descricao VARCHAR(100),
    justificada BOOLEAN,
    momentoInicial DATETIME,
    id INTEGER PRIMARY KEY,
    momentoFinal DATETIME,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS IrregularidadeTreinador (
    descricao VARCHAR(100),
    id INTEGER PRIMARY KEY,
    momentoInicial DATETIME,
    justificada BOOLEAN,
    momentoFinal DATETIME,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS FrequenciaAdministrador (
    momentoEntrada DATETIME,
    id INTEGER PRIMARY KEY,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS TreinadorHoraExtra (
    horaInicio TIME,
    id INTEGER PRIMARY KEY,
    dia DATE,
    horaFim TIME,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS AdministradorHoraExtra (
    id INTEGER PRIMARY KEY,
    horaFim TIME,
    dia DATE,
    horaInicio TIME,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS FrequenciaTreinador (
    momentoEntrada DATETIME,
    id INTEGER PRIMARY KEY,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS NotificacaoAdministrador (
    lida BOOLEAN,
    descricao VARCHAR(200),
    dataEmissao DATETIME,
    dataLeitura DATETIME,
    titulo VARCHAR(25),
    id INTEGER PRIMARY KEY,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS NotificacaoTreinador (
    dataLeitura DATETIME,
    id INTEGER PRIMARY KEY,
    descricao VARCHAR(200),
    lida BOOLEAN,
    titulo VARCHAR(25),
    dataEmissao DATETIME,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Aluno (
    nome VARCHAR(45),
    status BOOLEAN,
    senha VARCHAR(45),
    rfid INTEGER(5),
    numeroCelular VARCHAR(14),
    numeroTelefone VARCHAR(14),
    email VARCHAR(45),
    cpf VARCHAR(14),
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14),
    PRIMARY KEY (rfid, cpf),
    UNIQUE (rfid, cpf)
);

CREATE TABLE IF NOT EXISTS Maquina (
    nome VARCHAR(10),
    funcao VARCHAR(15),
    situacao BOOLEAN,
    vezesInoperante INTEGER,
    id INTEGER PRIMARY KEY,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Relatorio (
    descricao TEXT,
    titulo VARCHAR(25),
    dataEmissao DATETIME,
    id INTEGER PRIMARY KEY,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14),
    fk_Aluno_id INTEGER(5),
    fk_Aluno_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Mensalidade (
    valor DOUBLE(6, 2),
    dataEmissao DATETIME,
    dataFinal DATETIME,
    paga BOOLEAN,
    regular BOOLEAN,
    codigo INTEGER PRIMARY KEY,
    fk_Aluno_rfid INTEGER(5),
    fk_Aluno_cpf VARCHAR(14),
    fk_Caixa_id INTEGER
);

CREATE TABLE IF NOT EXISTS Treino (
    dataCriacao DATETIME,
    corrente BOOLEAN,
    id INTEGER PRIMARY KEY,
    fk_Aluno_id INTEGER(5),
    fk_Aluno_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Modalidade (
    nome VARCHAR(25),
    id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Exercicio (
    nome VARCHAR(10),
    decricao VARCHAR(45),
    id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Caixa (
    titulo VARCHAR(25),
    descricao TEXT,
    valor DOUBLE(8, 2),
    id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Despesa (
    descricao VARCHAR(200),
    valor DOUBLE(7, 2),
    periodicidade BOOLEAN,
    situaco BOOLEAN,
    valorRepete BOOLEAN,
    titulo VARCHAR(25),
    id INTEGER PRIMARY KEY,
    fk_Caixa_id INTEGER
);

CREATE TABLE IF NOT EXISTS DiaServicoAdministrador (
    horaFim TIME,
    horaInicio TIME,
    diaSemana INTEGER(1),
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5),
    id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS MarcacaoTurnoAdministrador (
    momentoEntrada DATETIME,
    momentoSaida DATETIME,
    id INTEGER PRIMARY KEY,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS MarcacaoTurnoTreinador (
    momentoEntrada DATETIME,
    id INTEGER PRIMARY KEY,
    momentoSaida DATETIME,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Exame (
    tipo INTEGER,
    deferido BOOLEAN,
    validacaoPendente BOOLEAN,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14),
    fk_Aluno_id INTEGER(5),
    fk_Aluno_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Aluno_Modalidade (
    fk_Aluno_rfid INTEGER(5),
    fk_Aluno_cpf VARCHAR(14),
    fk_Modalidade_id INTEGER
);

CREATE TABLE IF NOT EXISTS Exercicio_Modalidade (
    fk_Exercico_id INTEGER,
    fk_Modalidade_id INTEGER
);

CREATE TABLE IF NOT EXISTS Treino_Exercicio (
    fk_Exercico_id INTEGER,
    fk_Treino_id INTEGER
);

CREATE TABLE IF NOT EXISTS Treinador_Caixa (
    fk_Caixa_id INTEGER,
    fk_Treinador_rfid INTEGER(5),
    fk_Treinador_cpf VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Administrador_Caixa (
    fk_Caixa_id INTEGER,
    fk_Administrador_cpf VARCHAR(14),
    fk_Administrador_rfid INTEGER(5)
);

CREATE TABLE IF NOT EXISTS NotificacaoAluno (
    lida BOOLEAN,
    descricao VARCHAR(200),
    dataEmissao DATETIME,
    dataLeitura DATETIME,
    titulo VARCHAR(25),
    id INTEGER PRIMARY KEY,
    fk_Aluno_cpf VARCHAR(14),
    fk_Aluno_rfid INTEGER(5)
);

/*ADICIONANDO FOREIGN KEY NAS TABELAS CRIADAS*/
ALTER TABLE DiaServicoTreinador ADD CONSTRAINT FK_DiaServicoTreinador_1
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE IrregularidadeAdministrador ADD CONSTRAINT FK_IrregularidadeAdministrador_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE CASCADE;
 
ALTER TABLE IrregularidadeTreinador ADD CONSTRAINT FK_IrregularidadeTreinador_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE FrequenciaAdministrador ADD CONSTRAINT FK_FrequenciaAdministrador_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE CASCADE;
 
ALTER TABLE TreinadorHoraExtra ADD CONSTRAINT FK_TreinadorHoraExtra_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE AdministradorHoraExtra ADD CONSTRAINT FK_AdministradorHoraExtra_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE CASCADE;
 
ALTER TABLE FrequenciaTreinador ADD CONSTRAINT FK_FrequenciaTreinador_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE NotificacaoAdministrador ADD CONSTRAINT FK_NotificacaoAdministrador_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE CASCADE;
 
ALTER TABLE NotificacaoTreinador ADD CONSTRAINT FK_NotificacaoTreinador_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;

ALTER TABLE NotificacaoAluno ADD CONSTRAINT FK_NotificacaoAluno_3
    FOREIGN KEY (fk_Aluno_rfid, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE CASCADE;
    
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Maquina ADD CONSTRAINT FK_Maquina_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Relatorio ADD CONSTRAINT FK_Relatorio_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Relatorio ADD CONSTRAINT FK_Relatorio_3
    FOREIGN KEY (fk_Aluno_id, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Mensalidade ADD CONSTRAINT FK_Mensalidade_2
    FOREIGN KEY (fk_Aluno_rfid, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE Mensalidade ADD CONSTRAINT FK_Mensalidade_3
    FOREIGN KEY (fk_Caixa_id)
    REFERENCES Caixa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Treino ADD CONSTRAINT FK_Treino_2
    FOREIGN KEY (fk_Aluno_id, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE Despesa ADD CONSTRAINT FK_Despesa_2
    FOREIGN KEY (fk_Caixa_id)
    REFERENCES Caixa (id)
    ON DELETE CASCADE;
 
ALTER TABLE DiaServicoAdministrador ADD CONSTRAINT FK_DiaServicoAdministrador_1
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE RESTRICT;
 
ALTER TABLE MarcacaoTurnoAdministrador ADD CONSTRAINT FK_MarcacaoTurnoAdministrador_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE CASCADE;
 
ALTER TABLE MarcacaoTurnoTreinador ADD CONSTRAINT FK_MarcacaoTurnoTreinador_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Exame ADD CONSTRAINT FK_Exame_1
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Exame ADD CONSTRAINT FK_Exame_2
    FOREIGN KEY (fk_Aluno_id, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno_Modalidade ADD CONSTRAINT FK_Aluno_Modalidade_1
    FOREIGN KEY (fk_Aluno_rfid, fk_Aluno_cpf)
    REFERENCES Aluno (rfid, cpf)
    ON DELETE SET NULL;
 
ALTER TABLE Aluno_Modalidade ADD CONSTRAINT FK_Aluno_Modalidade_2
    FOREIGN KEY (fk_Modalidade_id)
    REFERENCES Modalidade (id)
    ON DELETE SET NULL;
 
ALTER TABLE Exercicio_Modalidade ADD CONSTRAINT FK_Exercicio_Modalidade_1
    FOREIGN KEY (fk_Exercico_id)
    REFERENCES Exercicio (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Exercicio_Modalidade ADD CONSTRAINT FK_Exercicio_Modalidade_2
    FOREIGN KEY (fk_Modalidade_id)
    REFERENCES Modalidade (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Treino_Exercicio ADD CONSTRAINT FK_Treino_Exercicio_1
    FOREIGN KEY (fk_Exercico_id)
    REFERENCES Exercicio (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Treino_Exercicio ADD CONSTRAINT FK_Treino_Exercicio_2
    FOREIGN KEY (fk_Treino_id)
    REFERENCES Treino (id)
    ON DELETE SET NULL;
 
ALTER TABLE Treinador_Caixa ADD CONSTRAINT FK_Treinador_Caixa_1
    FOREIGN KEY (fk_Caixa_id)
    REFERENCES Caixa (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Treinador_Caixa ADD CONSTRAINT FK_Treinador_Caixa_2
    FOREIGN KEY (fk_Treinador_rfid, fk_Treinador_cpf)
    REFERENCES Treinador (rfid, cpf)
    ON DELETE SET NULL;
 
ALTER TABLE Administrador_Caixa ADD CONSTRAINT FK_Administrador_Caixa_1
    FOREIGN KEY (fk_Caixa_id)
    REFERENCES Caixa (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Administrador_Caixa ADD CONSTRAINT FK_Administrador_Caixa_2
    FOREIGN KEY (fk_Administrador_cpf, fk_Administrador_rfid)
    REFERENCES Administrador (cpf, rfid)
    ON DELETE SET NULL;