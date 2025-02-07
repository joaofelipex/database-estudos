select * from cliente;

update cliente set nome = 'Teste' where idcliente = 1

update cliente set nome = 'Adriano', genero = 'M', numero = '241' where idcliente = 4;

insert into cliente (idcliente, nome) values (16, 'João');

delete from cliente where idcliente = 16;

-- RESOLUÇÃO DE EXERCÍCIOS

-- Exercícios – comandos update e delete

--1. Insira os dados abaixo na tabela de clientes
--2. Altere os dados do cliente Maicon
   --a. O CPF para 45390569432
   --b. O gênero para M
   --c. A nacionalidade para Brasileira
   --d. O UF para SC
--3. Altere os dados do cliente Getúlio
   --a. A data de nascimento para 01/04/1978
   --b. O gênero para M
--4. Altere os dados da cliente Sandra
   --a. O gênero para F
   --b. A profissão para Professora
   --c. O número para 123
--5. Apague o cliente Maicon
--6. Apague a cliente Sandra

1.
insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values ('16', 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', null, null, null, null, null, 'Florianópolis', 'PR');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values ('17', 'Getúlio', null, '4631', null, 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values ('18', 'Sandra', null, null, null, 'M', 'Professor', 'Italiana', null, '12', 'Bloco A', null, null, null);
2.
update cliente set cpf = '45390569432', genero = 'M', nacionalidade = 'Brasileira', uf = 'SC' where idcliente = 16;
3.
update cliente set data_nascimento = '1978-04-01', genero = 'M' where idcliente = 17;
4.
update cliente set genero = 'F', profissao = 'Professora', numero = '123' where idcliente = 18;
5.
delete from cliente where idcliente = 16;
6.
delete from cliente where idcliente = 18;

--FIM DO EXERCÍCIO