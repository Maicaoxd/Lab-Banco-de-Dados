USE deadlock;

SET AUTOCOMMIT = 0; -- Usado para o commit automatico ser desativado

commit; -- efetua a atualizações da sessao 1 (workbench)



-- (atualizar a TBA na sessão 1)

UPDATE TBB SET descricao = 'NOVO VALOR 2' where codigo = 2; -- atualizar a TBB

-- (atualizar a TBB na sessão 1)

UPDATE TBA SET descricao = 'NOVO VALOR 1' where codigo = 1; -- (momento em que ocorre o deadlock)
