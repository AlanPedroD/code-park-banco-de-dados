-- Cria o banco de dados
CREATE DATABASE quiz_app;

-- Usa o banco de dados criado
USE quiz_app;

-- Cria a tabela de autores
CREATE TABLE autores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Cria a tabela de quizzes
CREATE TABLE quizzes (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  id_autor INT NOT NULL,
  FOREIGN KEY (id_autor) REFERENCES autores (id)
);

-- Insere dados na tabela autores
INSERT INTO autores (nome) VALUES
  ('Leonardo De Souza'),
  ('Yuri Oliveira');

-- Insere dados na tabela quizzes
INSERT INTO quizzes (titulo, id_autor) VALUES
  ('Quiz de Tecnologia', 1),
  ('Quiz de Astronomia', 2),
  ('Quiz de Programação', 1);

-- Consulta 01
SELECT * FROM autores;

-- Consulta 02
SELECT 
    quizzes.titulo AS titulo_quiz,
    autores.nome AS nome_autor
FROM 
    quizzes
JOIN 
    autores ON quizzes.id_autor = autores.id;
-- Consulta 3
SELECT 
    autores.nome AS nome_autor,
    COUNT(quizzes.id) AS total_quizzes
FROM 
    autores
LEFT JOIN 
    quizzes ON autores.id = quizzes.id_autor
GROUP BY 
    autores.nome;
