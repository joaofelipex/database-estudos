SELECT idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf, observacoes
FROM public.cliente;

select * from cliente;

select nome, data_nascimento from cliente;

select nome, data_nascimento as "Data de nascimento" from cliente;

select cpf, rg from cliente;

select ' CPF: ' || cpf || ' RG: ' || rg as "CPF e RG" from cliente;

select * from cliente limit 3;

select nome, data_nascimento from cliente where data_nascimento > '2000-01-01';

-- select nome from cliente where nome like 'C'; irá reotrnar nome igual ao C. Mas "C" não é nome de ngm. Logo, a forma correta é a próxima linha.

select nome from cliente where nome like 'C%';

select nome from cliente where nome like '%c%';

select nome, data_nascimento from cliente where data_nascimento between '1990-01-01' and '1998-01-01';

select nome,  rg from cliente where rg is null;

select nome from cliente order by nome asc;

select nome from cliente order by nome desc;


-- RESOLUÇÃO DE EXERCÍCIOS

-- Exercícios – consultas simples

--1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
--2. Os clientes que tenham a letra “R” no nome
--3. Os clientes que o nome inicia com a letra “C”
--4. Os clientes que o nome termina com a letra “A”
--5. Os clientes que moram no bairro “Centro”
--6. Os clientes que moram em complementos que iniciam com a letra “A”
--7. Somente os clientes do sexo feminino
--8. Os clientes que não informaram o CPF
--9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
--10. Os clientes de nacionalidade “Brasileira”
--11. Os clientes que informaram o número da residência
--12. Os clientes que moram em Santa Catarina
--13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002
--14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes


select * from cliente;
1.
select nome, genero, profissao from cliente order by nome desc;
2.
select nome from cliente where nome like '%r%';
3.
select nome from cliente where nome like 'C%';
4.
select nome from cliente where nome like '%a';
5.
select * from cliente where bairro = 'Centro' or bairro = 'Ctr.' or bairro = 'Cto.';
6.
select * from cliente where complemento like 'A%';  
7.
select * from cliente where genero like 'F';
8.
select * from cliente where cpf is null;
9.
select nome, profissao from cliente order by profissao asc;
10.
select * from cliente where nacionalidade like 'Brasileira';
11.
select * from cliente where numero is not null;
12.
select * from cliente where uf like 'SC';
13.
select nome, data_nascimento from cliente where data_nascimento between '2000-01-01' and '2002-01-01';
14.
select 'Nome: ' || NOME || ' Logradouro:  ' || LOGRADOURO || ' Numero:  ' || NUMERO || ' Complemento:  ' || COMPLEMENTO || ' Bairro:  ' || BAIRRO || ' Municipio:  ' || MUNICIPIO || ' UF:  ' || UF as "NOME, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, MUNICIPIO E UF" from cliente; 
ou
select nome || ' - ' || logradouro || ' - ' || numero || ' - ' || complemento || ' - ' || bairro || ' - ' || municipio || ' - ' || uf from cliente;
--FIM DO EXERCÍCIO




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





