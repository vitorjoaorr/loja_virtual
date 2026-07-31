--criando o banco
--create database loja_virtual;
--#------------------#------------------#------------------#------------------#

--criando tabelas
create table categoria(
	id_categoria serial primary key,
	nome_categoria varchar(100) not null
);

create table produto(
	id_produto serial primary key,
	nome varchar (100) not null,
	descricao text,
	preco numeric(10,2) not null check (preco >=0),
	estoque int not null check (preco >=0),
	id_categoria int not null,
	foreign key (id_categoria) references categoria(id_categoria)
);

create table cliente(
	id_cliente serial primary key,
	nome_cliente varchar(100) not null,
	email varchar(100) not null,
	telefone varchar(20)
);

create table pedido (
	id_pedido serial primary key,
	data_pedido date not null,
	status varchar(50) not null,
	id_cliente int not null,
	foreign key (id_cliente) references cliente(id_cliente)
);

create table pedido_produto(
	id_pedido int not null,
	id_produto int not null,
	quantidade int not null,
	preco_unitario numeric (10,2) not null check(preco_unitario >= 0),
	primary key (id_pedido, id_produto),
	foreign key (id_pedido) references pedido(id_pedido),
	foreign key (id_produto) references produto(id_produto)
);

--#------------------#------------------#------------------#------------------#
--populando tabelas

insert into categoria (nome_categoria)
values
('Jardinagem'),
('Informática'),
('Celulares'),
('Livros'),
('Roupas'),
('Games');


inser into produto (nome, descricao, preco, estoque, id_categoria)
values
('Regador', 'Regador tamanho unico para jardinagem', 50.00, 10, 1),
('Mouse', 'Mouse sem fio', 120.00, 50, 2),
('iPhone', 'Smartphone Apple', 10000.00, 15, 3),
('It a coisa', 'Livro de terror', 55.00, 30, 4),
('Vestido', 'Vestido verde', 200.00, 20, 5);



insert into cliente (nome_cliente, email, telefone)
values
('João', 'joao@gmail.com', '11111-1111'),
('Maria', 'maria@gmail.com', '22222-2222'),
('Carlos', 'carlos@gmail.com', '33333-3333'),
('Ana', 'ana@hotmail.com', '44444-4444'),
('Pedro', 'pedro@yahoomail.com', '55555-5555');


insert into pedido (data_pedido, status, id_cliente)
values
('2026-07-01', 'Pendente', 1),
('2026-07-02', 'Pago', 2),
('2026-07-03', 'Enviado', 3),
('2026-07-04', 'Entregue', 4),
('2026-07-05', 'Cancelado', 5);


insert into pedido_produto (id_pedido, id_produto, quantidade, preco_unitario)
values
(1, 1, 2, 50.00),
(1, 2, 1, 120.00),
(2, 3, 1, 10000.00),
(3, 4, 1, 55.00),
(4, 5, 1, 200.00);

