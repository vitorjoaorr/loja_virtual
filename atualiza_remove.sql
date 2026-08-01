-- atualiza o status do pedido 1 para "Pago"
update pedido
set status = 'Pago'
where id_pedido = 1;
-- sem o where, todos os pedidos teriam o status alterado para "Pago"


-- exclui o cliente Pedro (cliente sem pedido associado)
delete from cliente
where id_cliente = 5;
-- sem o where, todos os clientes seriam excluídos
