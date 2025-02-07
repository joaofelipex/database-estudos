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

create table pedido_produto (
	idpedido integer not null,
	idproduto integer not null,
	quantidade integer not null,
	valor_unitario numeric(10,2) not null,
	
	constraint pk_pdp_idpedidoproduto primary key (idpedido, idproduto),
	constraint fk_pdp_idpedido foreign key (idpedido) references pedido (idpedido),
	constraint fk_pdp_idproduto foreign key (idproduto) references produto (idproduto)
);

insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (1, 1, 1, 800);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (1, 2, 1, 500);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (2, 2, 1, 500);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (3, 4, 2, 150);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (4, 1, 1, 800);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (4, 3, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (5, 3, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (6, 1, 2, 800);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (6, 7, 1, 35);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (6, 5, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (6, 4, 1, 150);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (7, 1, 1, 800);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (8, 7, 5, 35);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (9, 1, 1, 800);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (9, 2, 1, 500);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (10, 5, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (11, 5, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (11, 6, 1, 100);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (12, 2, 1, 500);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (13, 3, 1, 200);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (13, 4, 1, 150);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (14, 6, 3, 100);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
values (15, 3, 1, 200);

select * from pedido_produto;