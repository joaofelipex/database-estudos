-- RESOLUÇÃO DE EXERCÍCIOS

-- Exercícios – consultas simples

--1. Somente o nome de todos os vendedores em ordem alfabética.
--2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
--3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
--4. Os municípios do Rio Grande do Sul.
--5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.
--6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
--7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
--8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.
--9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.
--10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
--11. Os pedidos que foram transportados pela transportadora União Transportes.
--12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline.
--13. Os clientes que moram em União da Vitória ou Porto União.
--14. Os clientes que não moram em União da Vitória e nem em Porto União.
--15. Os clientes que não informaram o logradouro.
--16. Os clientes que moram em avenidas.
--17. Os vendedores que o nome começa com a letra S.
--18. Os vendedores que o nome termina com a letra A.
--19. Os vendedores que o nome não começa com a letra A.
--20. Os municípios que começam com a letra P e são de Santa Catarina.
--21. As transportadoras que informaram o endereço.
--22. Os itens do pedido 01.
--23. Os itens do pedido 06 ou do pedido 10.

1.
select nome from vendedor order by nome asc;
2.
select * from produto;
select nome, valor from produto where valor > 200 order by valor asc;
3.
select nome, valor, valor + (valor * 10) / 100 as Reajuste from produto;
4.
select * from uf;
select * from municipio where iduf = 5;
5.
select * from pedido;
select * from pedido where data_pedido between '2008-04-10' and '2008-04-25' order by valor asc;
6.
select * from pedido where valor between 1000 and 1500;
7.
select * from pedido where valor not between 100 and 500;
8.
select * from vendedor;
select * from pedido where idvendedor = 1 order by valor desc;
9.
select * from cliente;
select * from pedido where idcliente = 1 order by valor;
10.
select * from pedido; 
select * from pedido where idcliente = 15 and idvendedor = 1;
11.
select * from transportadora;
select * from pedido;
select * from pedido where idtransportadora = 2;
12.
select * from vendedor;
select * from pedido where idvendedor = 5 or idvendedor = 7;
13.
select * from municipio;
select * from cliente where idmunicipio = 1 or idmunicipio = 9;
14.
select * from cliente where not idmunicipio <> 1 and idmunicipio <> 9;
15.
select * from cliente where logradouro is null;
16.
select * from cliente where logradouro like 'Av%';
17.
select * from vendedor where nome like 'S%';
18.
select * from vendedor where nome like '%a';
19.
select * from vendedor where nome not like 'A%';
20.
select * from uf;
select * from municipio;
select * from municipio where nome like 'P%' and iduf = 1;
21.
select * from transportadora where logradouro is not null;
22.
select * from pedido_produto where idpedido = 1; 
23.
select * from pedido_produto where idpedido = 6 or idpedido = 10;