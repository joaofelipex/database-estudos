
/** AJUDA PARA TRABALHAR NOS DADOS!!!!
GET	Buscar dados	SELECT * FROM contato
POST	Criar um novo registro	INSERT INTO contato (...) VALUES (...)
PUT	Atualizar um registro existente	UPDATE contato SET ... WHERE id = ...
DELETE	Remover um registro	DELETE FROM contato WHERE id = ... **/


select * from contato;

select * from contato where nome = 'Felipe';

select * from contato where id = 2;

update contato
set salario = '1.500,00', 
where id = 3;

select*from contato where id = 3;

delete from contato where id = 9;

INSERT INTO contato (nome, sobrenome, telefone, email, salario, situacao) 
VALUES ('João', 'Pereira', '11999997777', 'joao@gmail.com', '3500.00');

alter table contato 
add column situacao varchar(100);
