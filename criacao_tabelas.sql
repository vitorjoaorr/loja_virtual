--Criando o banco
create database loja_virtual;

--Criando tabelas
create table categoria(
	id_categoria serial primary key,
	nome_categoria varchar(100) not null
);

create table produto(
	id_produto serial primary key,
	nome_produto varchar (100) not null,
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

