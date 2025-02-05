create table contato(
	id serial primary key,
	nome varchar(100),
	telefone varchar(11),
	email varchar(100)
);

insert into contato(nome, telefone, email) values ('Felipe', '92985854486', 'felipemiranda981@gmail.com');