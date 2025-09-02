/* ao abrir a query tools, você já seleciona qual banco de dados você está usando */

create table clientes(
	id_cliente serial primary key, /*serial substitui int+autoincrement*/
	nome varchar(50) not null,
	idade int
);

/* para executar o código, clique F5 para executar TODO o script e ALT+F5 para executar a query atual (clickada) -> por padrão pede confirmação */
/* as tabelas estão disponíveis em Schemas > Tables */

/* inserindo dados na tabela */
insert into clientes (nome, idade) values ('Guilherme', 19); /* valores textuais são inseridos com aspas simples no Postgre */

/* consultando dados na tabela */
select * from clientes;

/* exercitando */
create table autores(
	id_autor serial primary key,
	nome varchar(50) not null,
	dt_nasc date
);

insert into autores(nome, dt_nasc) values ('JK Rowling','1000-12-01'),('George R.R. Martin','2000-07-23');

select * from autores;
