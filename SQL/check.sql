--ADD CHECK A TABELA
ALTER TABLE TB_PARCEIRO ADD CONSTRAINT CHK_TIPO_PARCEIRO CHECK(TIPO_PARCEIRO IN ('F', 'C'));
ALTER TABLE TB_FINANCEIRO ADD CONSTRAINT CHK_TIPO_LANÇAMENTO CHECK (TIPO_LANÇAMENTO IN (1, 2));