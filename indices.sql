DROP INDEX IF EXISTS idx_usuario_nome_hash;

CREATE INDEX idx_usuario_nome_hash ON usuario USING HASH (id);

DROP INDEX IF EXISTS idx_usuario_nome_btree;

CREATE INDEX idx_usuario_nome_btree ON usuario USING BTREE (id);

DROP INDEX IF EXISTS idx_usuario_nome_brin;

CREATE INDEX idx_usuario_nome_brin ON usuario USING BRIN (id);

DROP INDEX IF EXISTS idx_emprestimo_usuario_hash;

CREATE INDEX idx_emprestimo_usuario_hash ON emprestimo USING HASH (id_usuario);

DROP INDEX IF EXISTS idx_emprestimo_usuario_btree;

CREATE INDEX idx_emprestimo_usuario_btree ON emprestimo USING BTREE (id_usuario);

DROP INDEX IF EXISTS idx_emprestimo_usuario_brin;

CREATE INDEX idx_emprestimo_usuario_brin ON emprestimo USING BRIN (id_usuario);

DROP INDEX IF EXISTS idx_emprestimo_livro_hash;

CREATE INDEX idx_emprestimo_livro_hash ON emprestimo USING HASH (id_livro);

DROP INDEX IF EXISTS idx_emprestimo_livro_btree;

CREATE INDEX idx_emprestimo_livro_btree ON emprestimo USING BTREE (id_livro);

DROP INDEX IF EXISTS idx_emprestimo_livro_brin;

CREATE INDEX idx_emprestimo_livro_brin ON emprestimo USING BRIN (id_livro);

DROP INDEX IF EXISTS idx_livro_ano_hash;

CREATE INDEX idx_livro_ano_hash ON livro USING HASH (ano_publicacao);

DROP INDEX IF EXISTS idx_livro_ano_btree;

CREATE INDEX idx_livro_ano_btree ON livro USING BTREE (ano_publicacao);

DROP INDEX IF EXISTS idx_livro_ano_brin;

CREATE INDEX idx_livro_ano_brin ON livro USING BRIN (ano_publicacao);

DROP INDEX IF EXISTS idx_livro_titulo_hash;

CREATE INDEX idx_livro_titulo_hash ON livro USING HASH (id);

DROP INDEX IF EXISTS idx_livro_titulo_btree;

CREATE INDEX idx_livro_titulo_btree ON livro USING BTREE (id);

DROP INDEX IF EXISTS idx_livro_titulo_brin;

CREATE INDEX idx_livro_titulo_brin ON livro USING BRIN (id);

DROP INDEX IF EXISTS idx_emprestimo_livro_hash;

CREATE INDEX idx_livro_ano_count_hash ON livro USING HASH (ano_publicacao);

DROP INDEX IF EXISTS idx_livro_ano_count_btree;

CREATE INDEX idx_livro_ano_count_btree ON livro USING BTREE (ano_publicacao);

DROP INDEX IF EXISTS idx_livro_ano_count_brin;

CREATE INDEX idx_livro_ano_count_brin ON livro USING BRIN (ano_publicacao);

DROP INDEX IF EXISTS idx_emprestimo_livro_dias_hash;

CREATE INDEX idx_emprestimo_livro_dias_hash ON emprestimo USING HASH (id_livro);

DROP INDEX IF EXISTS idx_emprestimo_livro_dias_btree;

CREATE INDEX idx_emprestimo_livro_dias_btree ON emprestimo USING BTREE (id_livro);

DROP INDEX IF EXISTS idx_emprestimo_livro_dias_brin;

CREATE INDEX idx_emprestimo_livro_dias_brin ON emprestimo USING BRIN (id_livro);

DROP INDEX IF EXISTS idx_livro_area_hash;

CREATE INDEX idx_livro_area_hash ON livro USING HASH (area);

DROP INDEX IF EXISTS idx_livro_area_btree;

CREATE INDEX idx_livro_area_btree ON livro USING BTREE (area);

DROP INDEX IF EXISTS idx_livro_area_brin;

CREATE INDEX idx_livro_area_brin ON livro USING BRIN (area);

DROP INDEX IF EXISTS idx_emprestimo_hremprestimo_hash;

CREATE INDEX idx_emprestimo_hremprestimo_hash ON emprestimo USING HASH (hremprestimo);

DROP INDEX IF EXISTS idx_emprestimo_hremprestimo_btree;

CREATE INDEX idx_emprestimo_hremprestimo_btree ON emprestimo USING BTREE (hremprestimo);

DROP INDEX IF EXISTS idx_emprestimo_hremprestimo_brin;

CREATE INDEX idx_emprestimo_hremprestimo_brin ON emprestimo USING BRIN (hremprestimo);

DROP INDEX IF EXISTS idx_emprestimo_dias_maior_hash;

CREATE INDEX idx_emprestimo_dias_maior_hash ON emprestimo USING HASH (id_usuario);

DROP INDEX IF EXISTS idx_emprestimo_dias_maior_btree;

CREATE INDEX idx_emprestimo_dias_maior_btree ON emprestimo USING BTREE (id_usuario);

DROP INDEX IF EXISTS idx_emprestimo_dias_maior_brin;

CREATE INDEX idx_emprestimo_dias_maior_brin ON emprestimo USING BRIN (dtemprestimo, dtdevolucao);