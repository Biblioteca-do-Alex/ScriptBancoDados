CREATE TABLE Exemplar (
    Id SERIAL PRIMARY KEY,
    IBSN VARCHAR(20) NOT NULL
);

CREATE TABLE Livro (
    Id SERIAL PRIMARY KEY,
    Titulo VARCHAR(255),
    Descricao TEXT,
    IBSN VARCHAR(20),
    Volume INT,
    Colecao VARCHAR(255),
    Autor VARCHAR(255),
    Editora VARCHAR(255),
    Genero VARCHAR(100),
    Imagem TEXT
);

CREATE TABLE Usuario (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco TEXT,
    Telefone VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Reserva (
    Id SERIAL PRIMARY KEY,
    UserId INT,
    ExemplarId INT,
    DataInicio DATE,
    DataFimPrevista DATE,
    DataFimReal DATE,
    Status VARCHAR(50)
);

CREATE TABLE Emprestimo (
    Id SERIAL PRIMARY KEY,
    UserId INT,
    ExemplarId INT,
    DataInicio DATE,
    DataFimPrevista DATE,
    DataFimReal DATE
);

CREATE TABLE CatalogoLivros (
    Id SERIAL PRIMARY KEY,
    Titulo VARCHAR(255),
    Autor VARCHAR(255),
    Editora VARCHAR(255),
    Genero VARCHAR(100),
    Imagem TEXT,
    IBSN VARCHAR(20)
);
