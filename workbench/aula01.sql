# comentário de linha única

/*
 comentário em bloco
*/

# criando um banco de dados
create database livraria_teste;

# selecionando o banco de dados para trabalho
use livraria_teste;

# criando uma tabela
create table clientes(
	id_cliente int auto_increment primary key,
    nome varchar(50) not null,
    idade int(3)
);

# inserindo dados em uma tabela
insert into clientes(nome, idade) values ("Van Gogh","33");

# consultando dados em uma tabela
select * from clientes;

# exercitando
create table autores(
	id_autor int auto_increment primary key,
    nome varchar(50) not null,
    dt_nasc date
);

insert into autores (nome, dt_nasc) values ("J.K. Rowling", "2000-05-20");
insert into autores (nome, dt_nasc) values ("George R. R. Martin", "1990-10-03");

# relacionando tabelas com chave estrangeira 
create table livros(
	id_livro int auto_increment primary key,
	id_autor int,
	foreign key (id_autor) references autores(id_autor), # sem um nome (constraint) a chave estrangeira não pode ser reutilizada em outros relacionamentos; usualmente "fk_tabela1_tabela2" pois é usado localmente
	titulo varchar(200) not null
);

# expandindo o banco de dados
create table pedidos( 	# a tabela pedidos é uma entidade fraca e associativa entre CLIENTES e LIVROS
	id_pedido int auto_increment primary key,
    data_pedido date,
    id_livro int,
    id_cliente int,
    constraint fk_pedidos_livros foreign key (id_livro) references livros(id_livro),
    constraint fk_pedidos_clientes foreign key (id_cliente) references clientes(id_cliente)
);

use livraria_teste;

# alterando tabela clientes
alter table clientes add column rua varchar(100); 
alter table clientes add column cidade varchar(100);
alter table clientes add column cep int(8);

# inserindo novos clientes
insert into clientes (nome, idade, cep, cidade, rua) values 
("Arnaldo Fritz", 56, 11111111, "São Paulo", "Rua dos Jogos"),
("Alguém", 00, 00000000, "Desconhecida", "Qualquer"),
("Mineirinho", 13, 56000000, "Ouro Preto", "Rua do Laço"),
("Satoru Gojo", 22, 81000000, "Shibuya", "Estação");

# inserindo novos autores
insert into autores(nome, dt_nasc) values 
("J. R. R. Tolkien", "1935-06-11"),
("George Orwell", "1940-08-10"),
("Machado de Assis", "1960-03-21");

# alterando tabela livros
alter table livros add column preco float;
alter table livros add column categoria varchar(100);

# inserindo novos livros
insert into livros (id_autor, titulo, categoria, preco) values
(6, "O Senhor dos Anéis", "Fantasia", 120.50),
(7, "1984", "Ficção Científica", 80),
(8, "Dom Casmurro", "Literatura Brasileira", 99.99);

select * from livros;