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
    Email VARCHAR(255),
    Senha VARCHAR(255),
    Role VARCHAR(5) DEFAULT 'USER' RESTRICT('USER', 'ADMIN')
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

CREATE TABLE Genero (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela Livro: IBSN deve ser único para evitar duplicatas
ALTER TABLE Livro ADD CONSTRAINT unique_ibsn UNIQUE (IBSN);

-- Exemplar pertence a um Livro pelo IBSN
ALTER TABLE Exemplar 
ADD CONSTRAINT fk_exemplar_livro 
FOREIGN KEY (IBSN) REFERENCES Livro(IBSN) ON DELETE CASCADE;

-- Reserva está relacionada a um Usuário e a um Exemplar
ALTER TABLE Reserva 
ADD CONSTRAINT fk_reserva_usuario 
FOREIGN KEY (UserId) REFERENCES Usuario(Id) ON DELETE CASCADE;

ALTER TABLE Reserva 
ADD CONSTRAINT fk_reserva_exemplar 
FOREIGN KEY (ExemplarId) REFERENCES Exemplar(Id) ON DELETE CASCADE;

-- Empréstimo está relacionado a um Usuário e a um Exemplar
ALTER TABLE Emprestimo 
ADD CONSTRAINT fk_emprestimo_usuario 
FOREIGN KEY (UserId) REFERENCES Usuario(Id) ON DELETE CASCADE;

ALTER TABLE Emprestimo 
ADD CONSTRAINT fk_emprestimo_exemplar 
FOREIGN KEY (ExemplarId) REFERENCES Exemplar(Id) ON DELETE CASCADE;

-- Catálogo de Livros deveria estar vinculado ao Livro pelo IBSN
ALTER TABLE CatalogoLivros 
ADD CONSTRAINT fk_catalogo_livro 
FOREIGN KEY (IBSN) REFERENCES Livro(IBSN) ON DELETE CASCADE;

-- Atualizando a tabela Livro para usar a chave estrangeira para Gênero
ALTER TABLE Livro DROP COLUMN Genero;

ALTER TABLE Livro ADD COLUMN GeneroId INT;

ALTER TABLE Livro 
ADD CONSTRAINT fk_livro_genero 
FOREIGN KEY (GeneroId) REFERENCES Genero(Id) ON DELETE SET NULL;