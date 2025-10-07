create table cliente(
	codigo serial, -- ou "integer unique not null"
	nome varchar(50),
	rua varchar(25),
	numero integer,
	data_nascimento date,
	constraint pk_cliente primary key (codigo)
);

create table produto(
	codigo serial,
	descricao varchar(20),
	preco numeric(7,2), -- aceitar um produto de 99.999,99
	constraint pk_produto primary key (codigo)
);

create table pedido(
	codigo serial,
	descricao varchar(30),
	data_pedido date,
	codigo_cliente integer not null, -- chave estrangeira não pode ser serial
	constraint pk_pedido primary key (codigo),
	constraint fk_pedido foreign key (codigo_cliente) references cliente 
);

create table item_pedido(
	numero integer not null,
	codigo_pedido integer not null,
	codigo_produto integer,
	quantidade integer,
	valor numeric(7,2),
	constraint pk_itempedido primary key (numero, codigo_pedido),
	constraint fk_itempedido_pedido foreign key (codigo_pedido) references pedido,
	constraint fk_itempedido_produto foreign key (codigo_produto) references produto
);

-- EXERCÍCIOS Alter Table 
-- acrescentar uma coluna "bairo - varchar (30)" 
alter table cliente 
	add bairro varchar(30);

-- adicionar a coluna "teste" do tipo integer na tabela Pedido e em seguida apagá-la 
alter table pedido
	add teste integer;
alter table pedido
	drop teste;

--alterar o nome da coluna "nome" da tabela Cliente para "nome_cliente"
alter table cliente
	rename column nome to nome_cliente;

--Altera o tipo da coluna NomeCli, que é varchar(30) para 
varchar(50)
alter table cliente
	alter nome_cliente type varchar(100);

--Renomeie a Tabela Produto para Mercad
alter table produto
	rename to mercadoria;