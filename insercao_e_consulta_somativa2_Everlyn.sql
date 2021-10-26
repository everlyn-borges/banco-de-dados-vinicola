-- Inserindo as regiões
INSERT INTO `vinicola`.`regiao` (`nomeRegiao`, `descricaoRegiao`) VALUES ('Sul Itália', 'Descrição da região Sul Itália');
INSERT INTO `vinicola`.`regiao` (`nomeRegiao`, `descricaoRegiao`) VALUES ('Sul França', 'Descrição da região Sul França');
INSERT INTO `vinicola`.`regiao` (`nomeRegiao`, `descricaoRegiao`) VALUES ('Sul Chile', 'Descrição da região Sul Chile');
INSERT INTO `vinicola`.`regiao` (`nomeRegiao`, `descricaoRegiao`) VALUES ('Sul Argentina', 'Descrição da região Sul Argentina');
INSERT INTO `vinicola`.`regiao` (`nomeRegiao`, `descricaoRegiao`) VALUES ('Sudeste França', 'Descrição da região Sudeste França');

-- Inserindo vinícolas
INSERT INTO `vinicola`.`vinicola` (`nomeVinicola`, `descricaoVinicola`, `foneVinicola`, `emailVinicola`, `codRegiao`)
VALUES ('Le Vin France', 'Descrição da vinícola', '339999999999999', 'levin@legmail', '2');

INSERT INTO `vinicola`.`vinicola` (`nomeVinicola`, `descricaoVinicola`, `foneVinicola`, `emailVinicola`, `codRegiao`)
VALUES ('Le Vin Paris', 'Descrição da vinícola', '338888888888888', 'leparis@legmail', '5');

INSERT INTO `vinicola`.`vinicola` (`nomeVinicola`, `descricaoVinicola`, `foneVinicola`, `emailVinicola`, `codRegiao`)
VALUES ('Della Nonna', 'Descrição da vinícola', '399999999999999', 'nonna@itgmail', '1');

INSERT INTO `vinicola`.`vinicola` (`nomeVinicola`, `descricaoVinicola`, `foneVinicola`, `emailVinicola`, `codRegiao`)
VALUES ('Buen vino', 'Descrição da vinícola', '569999999999999', 'buenvino@gmail', '3');

INSERT INTO `vinicola`.`vinicola` (`nomeVinicola`, `descricaoVinicola`, `foneVinicola`, `emailVinicola`, `codRegiao`)
VALUES ('Hermanos', 'Descrição da vinícola', '549999999999999', 'losherm@gmail', '4');

-- Cadastrando vinhos
INSERT INTO `vinicola`.`vinho` (`nomeVinho`, `tipoVinho`, `anoVinho`, `descricaoVinho`, `codVinicola`) VALUES ('Raisin', 'sec', '2001', 'Descrição vinho sec', '1');
INSERT INTO `vinicola`.`vinho` (`nomeVinho`, `tipoVinho`, `anoVinho`, `descricaoVinho`, `codVinicola`) VALUES ('Vin', 'sec', '1997', 'Descrição vinho sec', '2');
INSERT INTO `vinicola`.`vinho` (`nomeVinho`, `tipoVinho`, `anoVinho`, `descricaoVinho`, `codVinicola`) VALUES ('Vino', 'secco', '2005', 'Descrição vinho secco', '3');
INSERT INTO `vinicola`.`vinho` (`nomeVinho`, `tipoVinho`, `anoVinho`, `descricaoVinho`, `codVinicola`) VALUES ('Vino', 'seco', '1996', 'Descrição vinho seco', '4');
INSERT INTO `vinicola`.`vinho` (`nomeVinho`, `tipoVinho`, `anoVinho`, `descricaoVinho`, `codVinicola`) VALUES ('Muy Bien', 'seco', '2008', 'Descrição vinho seco', '5');

-- Consultando
SELECT 
	v.nomeVinho, 
    v.anoVinho, 
    c.nomeVinicola, 
    r.nomeRegiao 
FROM vinicola.vinho v INNER JOIN vinicola.vinicola c ON v.codVinicola = c.codVinicola
INNER JOIN vinicola.regiao r  ON c.codRegiao = r.codRegiao;

-- Criando usuário
create user Somellier@'localhost' identified by 'soM123' with max_connections_per_hour 40;
grant select on vinicola.vinho to Somellier@'localhost';
grant select(codVinicola,nomeVinicola) on vinicola.vinicola to Somellier@'localhost';
