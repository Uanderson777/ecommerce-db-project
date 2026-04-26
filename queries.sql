-- Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, COUNT(p.id_pedido) as total_pedidos
FROM CLIENTE c
LEFT JOIN PEDIDO p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;

-- Relação de pedidos e status de entrega
SELECT p.id_pedido, e.status_entrega, e.codigo_rastreio
FROM PEDIDO p
JOIN ENTREGA e ON p.id_pedido = e.id_pedido;