create table Cliente (
id_cliente int auto_increment primary key,
nome varchar(200),
telefone bigint(13),
email varchar(200),
endereco varchar(200) 
);

create table Bicicleta (
id_bicicleta int auto_increment primary key,
id_cliente int,
marca varchar(100),
modelo varchar(100),
ano int,
tipo varchar(50),
numero_serie varchar(50),
constraint fk_bicicleta_cliente foreign key (id_cliente) references Cliente(id_cliente)
);

create table Servico (
id_servico int auto_increment primary key,
nome varchar(200),
descricao varchar(300),
preco_base double,
tempo_estimado time
);

create table Produto (
id_produto int auto_increment primary key,
nome varchar(200),
descricao varchar(300),
preco_unitario double,
estoque int
);

create table OrdemServico(
id_ordem int auto_increment primary key,
id_bicicleta int,
data_entrada date,
data_saida date,
status varchar(50),
observacoes varchar(300),
constraint fk_ordemServico_bicicleta foreign key (id_bicicleta) references Bicicleta(id_bicicleta)
);

create table ItemOrdemServico(
id_item_ordem int auto_increment primary key,
id_ordem int,
tipo_item enum('Produto', 'Serviço'),
id_referencia int,
quantidade int,
preco_total double,
constraint fk_itemOrdemServico_ordemServico foreign key (id_ordem) references OrdemServico(id_ordem)
);

create table Personalizacao(
id_personalizacao int auto_increment primary key,
id_bicicleta int,
data date,
descricao varchar(300),
preco double,
constraint fk_personalizacao_bicicleta foreign key (id_bicicleta) references Bicicleta(id_bicicleta)
);

create table ItemPersonalizacao(
id_item int auto_increment primary key,
id_personalizacao int,
tipo_item enum('Produto', 'Serviço'),
id_referencia int,
quantidade int,
preco_total double,
constraint fk_itemPersonalizacao_personalizacao foreign key (id_personalizacao) references Personalizacao(id_personalizacao)
);

create table Venda(
id_venda int auto_increment primary key,
id_cliente int,
data_venda date,
total double,
constraint fk_venda_cliente foreign key (id_cliente) references Cliente(id_cliente)
);

create table ItemVenda(
id_item_venda int auto_increment primary key,
id_venda int,
id_produto int,
quantidade int,
preco_unitario double,
constraint fk_itemVenda_venda foreign key (id_venda) references Venda(id_venda),
constraint fk_itemVenda_produto foreign key (id_produto) references Produto(id_produto)
);

insert into Cliente (nome, telefone, email, endereco) values 
('João da Silva', '5513997956255' , 'joao.silva@gmail.com', 'Rua das Flores,123 – São Paulo'),
('Maria Oliveira', '5513997956265', 'maria.oliveira@email.com', 'Av. Atlântica, 456 – Rio de Janeiro '),
('Pedro Santos', '5513997956259', 'pedro.santos@email.com', 'R. Minas Gerais,89 – Belo Horizonte');

insert into Bicicleta (id_cliente, marca, modelo, ano, tipo, numero_serie) values 
( 1, 'Caloi', 'Elite 30', 2022 , 'MTB', 'C123456789'),
( 2, 'Trek', 'Domane AL 2', 2023 , 'Speed', 'T987654321'),
( 3, 'Caloi', 'i Hacker Sport', 2021 , 'Urbana', 'O654321987');

insert into Servico (nome, descricao, preco_base, tempo_estimado) values 
('Revisão Completa', 'Revisão geral com ajuste de peças', 150.00 , '02:30:00'),
('Troca de Freio ', 'Substituição dos freios dianteiros', 80.00,'01:00:00'),
('Alinhamento de Roda', 'Alinhamento das rodas dianteira/traseira', 60.00, '00:45:00');

insert into Produto (nome, descricao, preco_unitario, estoque) values 
('Pneu 29"', 'Pneu MTB 29x2.10 ', 120.00, 10),
('Câmbio Shimano Altus', 'Câmbio traseiro 8v ', 180.00, 5),
('Pastilha de Freio', 'Pastilha de freio hidráulico', 40.00, 20),
('Guidão Flat', 'Guidão de alumínio 720mm', 90.00 , 7);

insert into Personalizacao (id_bicicleta, data, descricao, preco) values 
( 3, '2025-08-18', 'Pintura personalizada + guidão novo', 250.00);

insert into ItemPersonalizacao (id_personalizacao, tipo_item, id_referencia, quantidade, preco_total) values 
(1, 'Serviço', 4, 1, 160.00), 
(1, 'Produto', 4, 1, 90.00); 

insert into Venda (id_cliente, data_venda, total) values 
(1, '2025-08-19',  210.00),
(2, '2025-08-25',  120.00);

insert into ItemVenda (id_venda, id_produto, quantidade, preco_unitario) values 
( 1, 1, 1, 120.00),
( 1, 3, 1, 40.00),
( 1, 2, 1, 50.00),
( 2, 1, 1, 120.00);

insert into ordemservico (id_bicicleta, data_entrada, data_saida, status, observacoes) values
(1,'2025-08-19', '2025-09-10','concluido','obs1'),
(1,'2025-08-19', '2025-09-10','concluido','obs2'),
(2,'2025-08-19', '2025-09-10','aberto','obs3'),
(2,'2025-08-19', '2025-09-10','pendente','obs4');

# ----------- APRENDENDO SELECTS ------------
select * from cliente; # seleção total
select * from cliente limit 2; # limit define a quantidade máxima de registros que serão retornados
select * from cliente limit 2 offset 2; # offset define a quantidade de registros que serão pulados
select * from produto order by nome asc; # order by serve para ordenas os registros, asc/desc ordenam por crescente/decrescente
select * from produto order by nome desc; 
select * from produto order by nome; # sem asc ou desc, o padrão de ordenação do order by é crescente
select * from produto order by preco_unitario;
select * from servico where preco_base > 100; # select condicional com where
select * from bicicleta where ano = 2023; 
select * from bicicleta where ano between 2022 and 2023; # between lista os registros que estão num determinado intervalo
select * from ordemservico where status = 'concluido';
select * from cliente where nome like '%Maria%'; # like é um operador que busca registros que contenham um determinado valor, a depender do uso de % no valor pesquisado
select * from produto where estoque < 10; 
select * from personalizacao where data > 2025-08-15;