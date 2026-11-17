-- 1. Criação do Banco de Dados do projeto
CREATE DATABASE JogoRPG;
GO

-- 2. Seleção do Banco de Dados para uso
USE JogoRPG;
GO

-- 3. Criação das tabelas independentes (sem Chaves Estrangeiras)
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);
GO

CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Descricao VARCHAR(500) NULL
);
GO

CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE
);
GO

-- 4. Criação da tabela PERSONAGENS (Relacionamentos 1:N com USUARIOS e CLASSES)
CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    CONSTRAINT FK_Personagens_Usuarios FOREIGN KEY (UsuarioId) 
        REFERENCES USUARIOS(UsuarioId),
    CONSTRAINT FK_Personagens_Classes FOREIGN KEY (ClasseId) 
        REFERENCES CLASSES(ClasseId)
);
GO

-- 5. Criação da tabela associativa CLASSES_HABILIDADES (Relacionamento N:N)
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    CONSTRAINT PK_Classes_Habilidades PRIMARY KEY (ClasseId, HabilidadeId),
    CONSTRAINT FK_ClassesHabilidades_Classes FOREIGN KEY (ClasseId) 
        REFERENCES CLASSES(ClasseId),
    CONSTRAINT FK_ClassesHabilidades_Habilidades FOREIGN KEY (HabilidadeId) 
        REFERENCES HABILIDADES(HabilidadeId)
);
GO