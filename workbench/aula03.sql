create database joins;
use joins;

create table departamentos(
	id int primary key auto_increment,
    nome varchar(80)
);

create table pessoas(
	id int primary key auto_increment,
    nome varchar(100),
    id_gestor int null,
    dept_id int null,
    constraint fk_pessoas_dept foreign key(dept_id) references departamentos(id),
    constraint fk_pessoas_gestor foreign key(id_gestor) references pessoas(id)
);

create table tarefas(
	id int primary key auto_increment,
    descricao varchar(120),
    status enum("Pendente","Em andamento","Concluída") default "Pendente",
    pessoa_id int null,
    constraint fk_tarefas_pessoa foreign key (pessoa_id) references pessoas(id)
);

create table projetos(
	id int primary key auto_increment,
    nome varchar(120)
);

create table alocacoes(
	id int primary key auto_increment, 
    pessoa_id int,
    projeto_id int,
    horas_semana tinyint,
    constraint fk_aloc_pessoa foreign key (pessoa_id) references pessoas(id),
    constraint fk_aloc_projeto foreign key (projeto_id) references projetos(id)
);

# Inserção de dados
insert into departamentos(nome) values("Ti"),("Financeiro"),("RH");

insert into pessoas (nome, id_gestor, dept_id) values ("Ana", null, 1),("Bruno", 1, 1),("Carla", 1, 1),("Diego",2, null),("Eduardo", null, 3),("Fernanda",5,2);

insert into tarefas (descricao, status, pessoa_id) values("Levantar requisitos","Concluída",2),("Desenhar protótipo","Em andamento",3),("Configurar servidor","Pendente",null),("Reunião com cliente","Concluída",1),("Aprovar orçamento","Pendente",null);

insert into projetos (nome) values ("Projeto Alfa"),("Projeto Beta"),("Projeto Gama");

insert into alocacoes(pessoa_id, projeto_id, horas_semana) values(1,1,10), (2,1,20), (3,2,15);

# Aprendendo Joins

select * from tarefas;

-- Inner Join
select pessoas.id, pessoas.nome, tarefas.id, tarefas.descricao, tarefas.status 
from pessoas
inner join tarefas
on tarefas.id = pessoas.id;



