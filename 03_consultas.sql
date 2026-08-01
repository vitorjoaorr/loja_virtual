--1 consulta de preço do produto
select nome_produto, preco
from produto
where preco > 100;


--2 busca utilizando ilike
select nome_cliente
from cliente
where nome_cliente ilike 'joão';


--3 produtos cadastrados
select count(id_produto) as quantidade_produtos
from produto;


--4 quantidade de produtos por categoria
select id_categoria, count(id_produto) AS quantidade_produtos
from produto
group by id_categoria
order by id_categoria asc;


--5 registro do pedido com informações sobre cliente, data e status do pedido
select
    p.id_pedido,
    c.nome_cliente,
    p.data_pedido,
    p.status
from pedido p
join cliente c on c.id_cliente = p.id_cliente;


--6 detalhes do pedido (produtos, quantidade e valor unitario)
select
    ped.id_pedido,
    prod.nome_produto,
    pp.quantidade,
    pp.preco_unitario
from pedido ped
join pedido_produto pp on pp.id_pedido = ped.id_pedido
join produto prod on prod.id_produto = pp.id_produto;


--7 consulta do status do pedido de cada cliente (incluindo null)
select
    c.nome_cliente,
    p.id_pedido,
    p.status
from cliente c
left join pedido p on p.id_cliente = c.id_cliente;


--8 tabela de pedidos com valor total da compra sendo calculada
select
    pp.id_pedido,
    sum(pp.quantidade * pp.preco_unitario) AS valor_total
from pedido_produto pp
group by pp.id_pedido
order by pp.id_pedido asc;


--9 calcula a media dos preços e exibe apenas os que estao acima desta media
with media_produtos as (
    select avg(preco) as media
    from produto
)
select nome_produto, preco
from produto
where preco > (select media from media_produtos);


--10 cria um ranking de preços do maior para o menor utilizando window function
select nome_produto, preco,
rank() over (order by preco desc) as ranking_preco
from produto;
