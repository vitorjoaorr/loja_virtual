-- atualiza o status do pedido 1 para "Pago"
update pedido
set status = 'Pago'
where id_pedido = 1;
--obs: sem o where o status de todos os itens iram ser modificados para "pago"


-- excluir o cliente pedro (o que tem null)
delete from cliente
where id_cliente = 5;
-- sem where ira apagar o registro de todos os clientes