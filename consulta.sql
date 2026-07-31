--1
select nome_produto, preco
from produto
where preco > 100;


--2
select nome_produto, estoque
from produto
where estoque < 20;


--3
select count(id_produto) as quantidade_produtos
from produto;


--4
select id_categoria, count(id_produto) AS quantidade_produtos
from produto
group by id_categoria
order by id_categoria asc;


--5
select
    p.id_pedido,
    c.nome_cliente,
    p.data_pedido,
    p.status
from pedido p
join cliente c on c.id_cliente = p.id_cliente;


--6
select
    ped.id_pedido,
    prod.nome_produto,
    pp.quantidade,
    pp.preco_unitario
from pedido ped
join pedido_produto pp on pp.id_pedido = ped.id_pedido
join produto prod on prod.id_produto = pp.id_produto;


--7
select
    c.nome_cliente,
    p.id_pedido,
    p.status
from cliente c
left join pedido p on p.id_cliente = c.id_cliente;


--8
select
    pp.id_pedido,
    sum(pp.quantidade * pp.preco_unitario) AS valor_total
from pedido_produto pp
group by pp.id_pedido
order by pp.id_pedido asc;


--9
with media_produtos as (
    select avg(preco) as media
    from produto
)
select nome_produto, preco
from produto
where preco > (select media from media_produtos);


--10
select nome_produto, preco,
rank() over (order by preco desc) as ranking_preco
from produto;