-- Inserindo Gêneros
INSERT INTO Genero (Nome) VALUES
('Ficção Científica'),
('Fantasia'),
('Mistério'),
('Romance'),
('Terror');

-- Inserindo Livros
INSERT INTO Livro (Titulo, Descricao, IBSN, Volume, Colecao, Autor, Editora, GeneroId, Imagem) VALUES
('Duna', 'Clássico da ficção científica.', '9780441013593', 1, 'Duna', 'Frank Herbert', 'Editora Aleph', 1, 'https://m.media-amazon.com/images/I/81SPvywH9sL._AC_UF1000,1000_QL80_.jpg'),
('O Hobbit', 'Aventuras na Terra-Média.', '9780007525492', 1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB5_q8vn9bakK4__NsNFfzi0pgx4r1mG7S4g&s'),
('Sherlock Holmes', 'Casos intrigantes do famoso detetive.', '9788580415161', 1, 'Sherlock Holmes', 'Arthur Conan Doyle', 'Principis', 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtp3OtPJ2VgULQlZUB_AvBhzchU0dH5Uk0Yw&s');

-- Inserindo Exemplares
INSERT INTO Exemplar (IBSN, Status) VALUES
('9780441013593', 'Disponível'),
('9780441013593', 'Emprestado'),
('9780007525492', 'Disponível'),
('9788580415161', 'Reservado');

-- Inserindo Usuários
INSERT INTO Usuario (Nome, Endereco, Telefone, Email, Senha, Role) VALUES
('Alice Souza', 'Rua das Rosas, 123', '11999999999', 'alice@email.com', 'senha123', 'USER'),
('Carlos Lima', 'Av. Central, 456', '11888888888', 'carlos@email.com', 'senha123', 'ADMIN');

-- Inserindo Reservas
INSERT INTO Reserva (UserId, ExemplarId, DataInicio, DataFimPrevista) VALUES
(1, 4, '2024-03-10', '2024-03-20');

-- Inserindo Empréstimos
INSERT INTO Emprestimo (UserId, ExemplarId, DataInicio, DataFimPrevista, Status) VALUES
(2, 2, '2024-03-05', '2024-03-15', 'Em andamento');
