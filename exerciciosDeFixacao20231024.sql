-- 1.
CREATE TRIGGER novo_cliente AFTER INSERT ON Clientes
	FOR EACH ROW INSERT INTO Auditoria VALUES("Um novo cliente foi adicionado");

-- 2.
CREATE TRIGGER exclusao_cliente BEFORE DELETE ON Clientes
	FOR EACH ROW INSERT INTO Auditoria VALUES("Houve uma tentativa de exclusão de um cliente");

-- 3.
DELIMITER //
CREATE TRIGGER att_cliente AFTER UPDATE ON Clientes
	FOR EACH ROW
	BEGIN
		DECLARE nome_antigo VARCHAR(255);
		DECLARE nome_novo VARCHAR(255);

		SET nome_antigo = OLD.nome;
		SET nome_novo = NEW.nome;

		INSERT INTO Auditoria VALUES(nome_antigo, nome_novo);
	END //
DELIMITER ;
