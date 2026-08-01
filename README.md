# Loja Virtual - Banco de Dados

   Projeto de banco de dados desenvolvido para modelar e implementar uma loja virtual utilizando PostgreSQL.

   O objetivo do projeto é aplicar conceitos de modelagem de dados, criação de tabelas, relacionamentos,
   inserção de dados, atualização e consultas SQL.

## Detalhes e regras de negócio
- O projeto consiste em uma loja virtual composta por cinco entidades principais: Cliente, Pedido, Produto, Categoria e Pedido_Produto.

- A entidade Cliente possui uma relação 1:N com Pedido, onde um cliente pode realizar nenhum ou vários pedidos, enquanto cada pedido deve estar associado a um único cliente.

- Existe uma relação N:N entre Pedido e Produto, resolvida pela tabela associativa Pedido_Produto, onde um pedido pode possuir nenhum ou vários registros mas um registro de pedido_produto precisa de um pedido para existir.

- A relação entre pedido_produto e produto consiste em um produto poder estar em nenhum ou muitos registros de pedido_produto mas cada registro deve conter um único produto, calculando sua quantidade por registro.

- A entidade Produto possui uma relação 1:N com Categoria, onde cada produto pertence a uma categoria
   e uma categoria pode possuir diversos produtos ou nenhum.

## Como executar o projeto
1. git clone https://github.com/vitorjoaorr/loja_virtual.git
   - *ou copie os codigos dos scripts
3. Abra um cliente de banco de dados compatível com PostgreSQL, como:
   - DBeaver
   - pgAdmin
3. Faça uma conexção com PostgresSQL, selecione ou crie um novo banco de dados
4. Em arquivo, localize a pasta clonada, abra os scripts e execute em ordem:
   - criacao_tabelas
   - populando_tabelas
   - consulta
