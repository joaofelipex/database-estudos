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




create table profissao (
	idprofissao integer not null,
	nome varchar(30) not null,
	
	constraint pk_prf_idprofissao primary key (idprofissao),
	constraint un_prf_nome unique (nome)
);

insert into profissao (idprofissao, nome) values ('1', 'Estudante');
insert into profissao (idprofissao, nome) values ('2', 'Engenheiro');
insert into profissao (idprofissao, nome) values ('3', 'Pedreiro');
insert into profissao (idprofissao, nome) values ('4', 'Jornalista');
insert into profissao (idprofissao, nome) values ('5', 'Professor');

select * from profissao;

select profissao from cliente;


create table nacionalidade (
	idnacionalidade integer not null,
	nome varchar(30) not null,
	
	constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
	constraint un_ncn_nome unique (nome)
);

select nacionalidade from cliente;

insert into nacionalidade (idnacionalidade, nome) values ('1', 'Brasileira');
insert into nacionalidade (idnacionalidade, nome) values ('2', 'Italiana');
insert into nacionalidade (idnacionalidade, nome) values ('3', 'Norte-americana');
insert into nacionalidade (idnacionalidade, nome) values ('4', 'Alemã');

select * from nacionalidade;


create table complemento (
	idcomplemento integer not null,
	nome varchar(30) not null,
	
	constraint pk_cpl_idcomplemento primary key (idcomplemento),
	constraint un_cpl_nome unique (nome)
);

insert into complemento (idcomplemento, nome) values ('1', 'Casa');
insert into complemento (idcomplemento, nome) values ('2', 'Apartamento');

select * from complemento;


create table bairro (
	idbairro integer not null,
	nome varchar(30) not null,
	
	constraint pk_brr_idbairro primary key (idbairro),
	constraint un_brr_nome unique (nome)
);

insert into bairro (idbairro, nome) values ('1', 'Cidade Nova');
insert into bairro (idbairro, nome) values ('2', 'Centro');
insert into bairro (idbairro, nome) values ('3', 'São Pedro');
insert into bairro (idbairro, nome) values ('4', 'Santa Rosa');

select * from bairro;

select * from cliente;

alter table cliente rename column profissao to idprofissao;
alter table cliente alter column idprofissao type integer;
-- Estudante-> 1,9,10,12,15,17
-- Engenheiro-> 2
-- Pedreiro-> 3
-- Jornalista-> 4,5
-- Professor-> 6,7,8,13
-- Null-> 11,14
alter table cliente drop idprofissao;
alter table cliente add idprofissao integer; --foreign key
alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao);

update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17);
update cliente set idprofissao = 2 where idcliente = 2;
update cliente set idprofissao = 3 where idcliente = 3;
update cliente set idprofissao = 4 where idcliente in (4, 5);
update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13);

select * from profissao;
delete from profissao where idprofissao = 10;
insert into profissao (idprofissao, nome) values (10, 'Teste');

select * from cliente;
alter table cliente drop nacionalidade;
alter table cliente add idnacionalidade integer;
alter table cliente add constraint fk_cln_idnacionalidade foreign key (idnacionalidade)
select * from nacionalidade;
update cliente set idnacionalidade = 1 where idcliente in (1, 2, 3, 4, 6, 10, 11, 14);
update cliente set idnacionalidade = 2 where idcliente in (5, 7);
update cliente set idnacionalidade = 3 where idcliente = 8;
update cliente set idnacionalidade = 4 where idcliente in (9, 13);

select * from cliente;
alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
alter table cliente add constraint fk_cln_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);
select * from complemento;
update cliente set idcomplemento = 1 where idcliente in (1, 4, 9, 13);
update cliente set idcomplemento = 2 where idcliente in (2, 3, 7);

select * from cliente;select * from municipio;

select * from cliente;
alter table cliente drop municipio;
alter table cliente drop uf;
alter table cliente add idmunicipio integer;
alter table cliente add constraint fl_cliente_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

update cliente set idmunicipio = 1 where idcliente in (1, 2, 10, 11);
update cliente set idmunicipio = 2 where idcliente in (3, 12);
update cliente set idmunicipio = 3 where idcliente = 4;
update cliente set idmunicipio = 4 where idcliente in (5);
update cliente set idmunicipio = 4 where idcliente in (6, 13);
update cliente set idmunicipio = 4 where idcliente in (7);
update cliente set idmunicipio = 4 where idcliente in (8);
update cliente set idmunicipio = 4 where idcliente in (9);
update cliente set idmunicipio = 4 where idcliente in (14, 15);

select * from cliente;
alter table cliente drop bairro;
alter table cliente add idbairro integer;
alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);

select * from bairro;
update cliente set idbairro = 1 where idcliente in (1, 12, 13);
update cliente set idbairro = 2 where idcliente in (2, 3, 6, 8, 9);
update cliente set idbairro = 3 where idcliente in (4, 5);
update cliente set idbairro = 4 where idcliente = 7;

select * from cliente;
create table uf (
	iduf integer not null,
	nome varchar(30) not null,
	sigla char(2) not null,
	
	constraint pk_ufd_idunidade_federacao primary key (iduf),
	constraint un_ufd_nome unique (nome),
	constraint un_ufd_sigla unique (sigla)
);

insert into uf (iduf, nome, sigla) values (1, 'Santa Catarina', 'SC');
insert into uf (iduf, nome, sigla) values (2, 'Paraná', 'PR');
insert into uf (iduf, nome, sigla) values (3, 'São Paulo', 'SP');
insert into uf (iduf, nome, sigla) values (4, 'Minas Gerais', 'MG');
insert into uf (iduf, nome, sigla) values (5, 'Rio Grande do Sul', 'RS');
insert into uf (iduf, nome, sigla) values (6, 'Rio de Janeiro', 'RJ');
select * from uf;

create table municipio (
	idmunicipio integer not null,
	nome varchar(30) not null,
	iduf integer not null,
	
	constraint pk_mnc_idmunicipio primary key (idmunicipio),
	constraint un_mnc_nome unique (nome),
	constraint fk_mnc_iduf foreign key (iduf) references uf (iduf)
);

insert into municipio (idmunicipio, nome, iduf) values (1, 'Porto União', 1);
insert into municipio (idmunicipio, nome, iduf) values (2, 'Canoinhas', 1);
insert into municipio (idmunicipio, nome, iduf) values (3, 'Porto Vitória', 2);
insert into municipio (idmunicipio, nome, iduf) values (4, 'General Carneiro', 2);
insert into municipio (idmunicipio, nome, iduf) values (5, 'São Paulo', 3);
insert into municipio (idmunicipio, nome, iduf) values (6, 'Rio de Janeiro', 6);
insert into municipio (idmunicipio, nome, iduf) values (7, 'Uberlândia', 4);
insert into municipio (idmunicipio, nome, iduf) values (8, 'Porto Alegre', 5);
insert into municipio (idmunicipio, nome, iduf) values (9, 'União da Vitória', 2);
select * from municipio;

select * from cliente;
alter table cliente drop municipio;
alter table cliente drop uf;
alter table cliente add idmunicipio integer;
alter table cliente add constraint fl_cliente_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

update cliente set idmunicipio = 1 where idcliente in (1, 2, 10, 11);
update cliente set idmunicipio = 2 where idcliente in (3, 12);
update cliente set idmunicipio = 3 where idcliente = 4;
update cliente set idmunicipio = 4 where idcliente in (5);
update cliente set idmunicipio = 4 where idcliente in (6, 13);
update cliente set idmunicipio = 4 where idcliente in (7);
update cliente set idmunicipio = 4 where idcliente in (8);
update cliente set idmunicipio = 4 where idcliente in (9);
update cliente set idmunicipio = 4 where idcliente in (14, 15);

select * from cliente;


-- RESOLUÇÃO DE EXERCÍCIOS

-- Criação de outras tabelas 2 e inserção nas tabelas

create table fornecedor (
	idfornecedor integer not null,
	nome varchar(50) not null,
	
	constraint pk_frn_idfornecedor primary key (idfornecedor),
	constraint un_frn_nome unique (nome)
);

insert into fornecedor (idfornecedor, nome) values (1, 'Cap. Computadores');
insert into fornecedor (idfornecedor, nome) values (2, 'AA. Computadores');
insert into fornecedor (idfornecedor, nome) values (3, 'BB. Máquinas');
select * from fornecedor;

create table vendedor (
	idvendedor integer not null,
	nome varchar(50) not null,
	
	constraint pk_vnd_idvendedor primary key (idvendedor),
	constraint un_vnd_nome unique (nome)
);

insert into vendedor (idvendedor, nome) values (1, 'André');
insert into vendedor (idvendedor, nome) values (2, 'Alisson');
insert into vendedor (idvendedor, nome) values (3, 'José');
insert into vendedor (idvendedor, nome) values (4, 'Ailton');
insert into vendedor (idvendedor, nome) values (5, 'Maria');
insert into vendedor (idvendedor, nome) values (6, 'Suelem');
insert into vendedor (idvendedor, nome) values (7, 'Aline');
insert into vendedor (idvendedor, nome) values (8, 'Silvana');
select * from vendedor;

create table transportadora (
	idtransportadora integer not null,
	idmunicipio integer,
	nome varchar(50) not null,
	logradouro varchar(50),
	numero varchar(10),
	
	constraint pk_trn_idtransportadora primary key (idtransportadora),
	constraint fk_trn_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio),
	constraint un_trn_nome unique (nome)
);

select * from municipio;

insert into transportadora (idtransportadora, idmunicipio, nome, logradouro, numero)
values (1, 9, 'BS. Transportes', 'Rua das Limas', '01');
insert into transportadora (idtransportadora, idmunicipio, nome)
values (2, 5, 'União Transportes');
select * from transportadora;

create table produto (
	idproduto integer not null,
	idfornecedor integer not null,
	nome varchar(50) not null,
	valor numeric(10,2) not null,
	
	constraint pk_prd_idproduto primary key (idproduto),
	constraint fk_prd_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);
select * from fornecedor;

insert into produto (idproduto, idfornecedor, nome, valor)
values (1, 1, 'Microcomputador', 800);
insert into produto (idproduto, idfornecedor, nome, valor)
values (2, 1, 'Monitor', 500);
insert into produto (idproduto, idfornecedor, nome, valor)
values (3, 2, 'Placa Mãe', 200);
insert into produto (idproduto, idfornecedor, nome, valor)
values (4, 2, 'HD', 150);
insert into produto (idproduto, idfornecedor, nome, valor)
values (5, 2, 'Placa de vídeo', 200);
insert into produto (idproduto, idfornecedor, nome, valor)
values (6, 3, 'Memória RAM', 100);
insert into produto (idproduto, idfornecedor, nome, valor)
values (7, 1, 'Gabinete', 35);

select * from produto;

create table pedido (
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor numeric(10,2) not null,
	
	constraint pk_pdd_idpedido primary key (idpedido),
	constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente),
	constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora (idtransportadora),
	constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor (idvendedor)
);

select * from pedido;

insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (1, '2008-04-01', 1300, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (2, '2008-04-01', 500, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (3, '2008-04-02', 300, 11, 2, 5);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (4, '2008-04-05', 1000, 8, 1, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (5, '2008-04-06', 200, 9, 2, 6);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (6, '2008-04-06', 1985, 10, 1, 6);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (7, '2008-04-06', 800, 3, 1, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (8, '2008-04-06', 175, 3, null, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (9, '2008-04-07', 1300, 12, null, 8);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (10, '2008-04-10', 200, 6, 1, 8);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (11, '2008-04-15', 300, 15, 2, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (12, '2008-04-20', 500, 15, 2, 5);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (13, '2008-04-20', 350, 9, 1, 7);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (14, '2008-04-23', 300, 2, 1, 5);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (15, '2008-04-25', 200, 11, null, 5);

select * from cliente;


















