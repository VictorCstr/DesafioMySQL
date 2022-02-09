-- Quantos clientes estão cadastrados na sua base?
	SELECT count(id) as "Total de clientes" FROM cliente;
	
-- Qual o produto mais caro?
    SELECT nome, MAX(preco) as "Valor do produto mais caro" FROM produto;
    
-- Qual o produto mais barato?
   SELECT * from produto 
   order by preco limit 1;
    
-- Mostre todos os produtos com seus respectivos departamentos.
	SELECT produto.nome, departamento.nome as "Departamento" FROM produto INNER JOIN departamento
    on produto.departamento_codigo = departamento.codigo ;

-- Quantos produtos há em cada departamento? Exiba o nome do departamento e a quantidade de produtos que há em cada um. (pense em SUM e GROUP BY)
	SELECT departamento.nome , sum(estoque) FROM PRODUTO inner join DEPARTAMENTO
    on produto.departamento_codigo = departamento.codigo
    group by departamento.nome;

-- Mostre os dados dos pedidos, incluindo nomes dos clientes e nomes dos produtos que foram vendidos.
	SELECT item_pedido.num_sequencial as "Numero do Pedido", item_pedido.quantidade, item_pedido.valor_unitario, item_pedido.valor_total, cliente.nome as "Nome do Cliente" , produto.nome as "Nome do produto",
    pedido.status, pedido.data_pedido
    FROM cliente INNER JOIN pedido
    on pedido.cliente_id = cliente.id
    INNER JOIN item_pedido on item_pedido.pedido_numero = pedido.numero
    INNER JOIN produto on produto.codigo = item_pedido.produto_codigo 
     WHERE pedido.status LIKE "F";

-- Mostre quantos pedidos foram feitos por mês no ano de 2022 (caso você tenha registros neste ano, senão escolha um ano que você tenha cadastrado - Novamente pense em COUNT e GROUP BY).
	SELECT MONTHNAME(data_pedido) as "Mês" , count(numero) as "Pedidos no Mês" FROM pedido
    WHERE pedido.status LIKE "F"
    group by MONTH(data_pedido)  ;

-- Mostre quanto foi faturado por mês (leve em conta o valor total de cada pedido - novamente pense em GROUP BY e SUM).
	SELECT MONTHNAME(data_pedido) as "Mês" , sum(valor_total) as "Total faturado" FROM item_pedido
    INNER JOIN pedido on item_pedido.pedido_numero = pedido.numero
    WHERE pedido.status LIKE "F"
    group by MONTH(data_pedido) 
    ORDER BY MONTH(data_pedido) ;

-- Mostre o valor total do estoque por departamento.
	SELECT departamento.nome , sum(estoque * preco) FROM PRODUTO inner join DEPARTAMENTO
    on produto.departamento_codigo = departamento.codigo
    group by departamento.nome;
    
   
    
	



