-- Arquivo btree.sql - Testes de consultas com índice BTREE

\c biblioteca;

DROP INDEX IF EXISTS idx_usuario_nome_btree;

DROP INDEX IF EXISTS idx_emprestimo_usuario_btree;

DROP INDEX IF EXISTS idx_emprestimo_livro_btree;

DROP INDEX IF EXISTS idx_livro_ano_btree;

DROP INDEX IF EXISTS idx_emprestimo_livro_count_btree;

DROP INDEX IF EXISTS idx_livro_ano_count_btree;

DROP INDEX IF EXISTS idx_emprestimo_livro_dias_btree;

DROP INDEX IF EXISTS idx_livro_area_btree;

DROP INDEX IF EXISTS idx_emprestimo_hremprestimo_btree;

DROP INDEX IF EXISTS idx_emprestimo_dias_maior_btree;

-- 1. Criar índice BTREE na coluna nome da tabela usuario
CREATE INDEX idx_usuario_nome_btree ON usuario USING BTREE (nome);

-- a. Selecionar o nome de um usuário específico
EXPLAIN
ANALYZE
SELECT nome
FROM usuario
WHERE
    nome = 'Sra. Bianca Barbosa';

-- Limpar o cache
DISCARD ALL;

-- 2. Criar índice BTREE na coluna id_usuario da tabela emprestimo
CREATE INDEX idx_emprestimo_usuario_btree ON emprestimo USING BTREE (id_usuario);

-- b. Selecionar quantos livros um usuário pegou emprestado
EXPLAIN
ANALYZE
SELECT COUNT(*) AS total_livros_emprestados
FROM emprestimo
WHERE
    id_usuario = (
        SELECT id
        FROM usuario
        WHERE
            nome = 'Sra. Bianca Barbosa'
    );

-- Limpar o cache
DISCARD ALL;

-- 3. Criar índice BTREE na coluna id_livro da tabela emprestimo
CREATE INDEX idx_emprestimo_livro_btree ON emprestimo USING BTREE (id_livro);

-- c. Selecionar quantos empréstimos um livro teve
EXPLAIN
ANALYZE
SELECT COUNT(*) AS total_emprestimos
FROM emprestimo
WHERE
    id_livro = (
        SELECT id
        FROM livro
        WHERE
            titulo = 'Nome do Livro'
    );

-- Limpar o cache
DISCARD ALL;

-- 4. Criar índice BTREE na coluna ano_publicacao da tabela livro
CREATE INDEX idx_livro_ano_btree ON livro USING BTREE (ano_publicacao);

-- d. Selecionar o ano de publicação dos livros em ordem crescente
EXPLAIN
ANALYZE
SELECT ano_publicacao
FROM livro
ORDER BY ano_publicacao ASC;

-- Limpar o cache
DISCARD ALL;

-- 5. Criar índice BTREE na coluna id_livro da tabela emprestimo
CREATE INDEX idx_emprestimo_livro_count_btree ON emprestimo USING BTREE (id_livro);

-- e. Selecionar todos os títulos de livros que tiveram mais de 30 empréstimos
EXPLAIN
ANALYZE
SELECT l.titulo
FROM livro l
    JOIN emprestimo e ON l.id = e.id_livro
GROUP BY
    l.titulo
HAVING
    COUNT(e.id_livro) > 30;

-- Limpar o cache
DISCARD ALL;

-- 6. Criar índice BTREE na coluna ano_publicacao da tabela livro
CREATE INDEX idx_livro_ano_count_btree ON livro USING BTREE (ano_publicacao);

-- f. Calcular o total de livros para cada ano de publicação
EXPLAIN
ANALYZE
SELECT ano_publicacao, COUNT(*) AS total_livros
FROM livro
GROUP BY
    ano_publicacao;

-- Limpar o cache
DISCARD ALL;

-- 7. Criar índice BTREE na coluna id_livro da tabela emprestimo
CREATE INDEX idx_emprestimo_livro_dias_btree ON emprestimo USING BTREE (id_livro);

-- g. Calcular a quantidade de dias que cada livro ficou emprestado
EXPLAIN
ANALYZE
SELECT l.titulo, e.dtemprestimo, e.dtdevolucao, (
        e.dtdevolucao - e.dtemprestimo
    ) AS dias_emprestado
FROM livro l
    JOIN emprestimo e ON l.id = e.id_livro;

-- Limpar o cache
DISCARD ALL;

-- 8. Criar índice BTREE na coluna area da tabela livro
CREATE INDEX idx_livro_area_btree ON livro USING BTREE (area);

-- h. Calcular quantos livros há emprestados para cada área
EXPLAIN
ANALYZE
SELECT l.area, COUNT(e.id_livro) AS total_emprestados
FROM livro l
    JOIN emprestimo e ON l.id = e.id_livro
GROUP BY
    l.area;

-- Limpar o cache
DISCARD ALL;

-- 9. Criar índice BTREE na coluna hremprestimo da tabela emprestimo
CREATE INDEX idx_emprestimo_hremprestimo_btree ON emprestimo USING BTREE (hremprestimo);

-- i. Contar quantos livros foram emprestados depois das 22h
EXPLAIN
ANALYZE
SELECT COUNT(*)
FROM emprestimo
WHERE
    hremprestimo > '22:00:00';

-- Limpar o cache
DISCARD ALL;

-- 10. Criar índice BTREE nas colunas dtemprestimo e dtdevolucao da tabela emprestimo
CREATE INDEX idx_emprestimo_dias_maior_btree ON emprestimo USING BTREE (id_usuario);

-- j. Lista de empréstimos em que a diferença entre a data de empréstimo e a data de devolução for maior que 14 dias
EXPLAIN
ANALYZE
SELECT u.nome, u.curso, l.titulo, l.isbn, (
        e.dtdevolucao - e.dtemprestimo
    ) AS dias_emprestado
FROM
    usuario u
    JOIN emprestimo e ON u.id = e.id_usuario
    JOIN livro l ON e.id_livro = l.id
WHERE (
        e.dtdevolucao - e.dtemprestimo
    ) > 14;

-- Fim do arquivo