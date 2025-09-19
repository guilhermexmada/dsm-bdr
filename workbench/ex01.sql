# Exercício 01 - Sistema de Gestão de Projetos ------------------------------
create database empresa_tecnologia;
use empresa_tecnologia;

# Criando tabelas ------------------------------
create table Pessoas(
	id_pessoa int primary key auto_increment,
    nome varchar(100),
    email varchar(100) unique
);

create table Projetos(
	id_projeto int primary key auto_increment,
    nome varchar(50),
    descricao varchar(200),
    dt_inicio date,
    dt_termino date
);

create table Papeis(
	id_papel int primary key auto_increment,
    nome varchar(50),
    funcao varchar(100)
);

create table Alocacoes(
	id_alocacao int primary key auto_increment,
    fk_id_pessoa int,
    fk_id_projeto int,
    fk_id_papel int,
    constraint fk_alocacao_pessoa foreign key (fk_id_pessoa) references Pessoas(id_pessoa),
    constraint fk_alocacao_projeto foreign key (fk_id_projeto) references Projetos(id_projeto),
    constraint fk_alocacao_papel foreign key (fk_id_papel) references Papeis(id_papel)
);

create table Tarefas(
	id_tarefa int primary key auto_increment,
    fk_id_responsavel int,
    constraint fk_tarefa_pessoa foreign key (fk_id_responsavel) references Pessoas(id_pessoa),
    fk_id_projeto int,
    constraint fk_tarefa_projeto foreign key (fk_id_projeto) references Projetos(id_projeto),
    titulo varchar(50),
    descricao varchar(200),
    status varchar(50)
);

# Populando banco com dados --------------------------
insert into projetos (nome, descricao, dt_inicio, dt_termino) values
('sistema de vendas online', 'plataforma de vendas online', '2025-02-01', '2025-07-30'),
('aplicativo de agenda médica', 'aplicativo para agendamento de consultas', '2025-03-10', '2025-09-15'),
('plataforma de cursos ead', 'sistema para ensino a distância', '2025-01-20', '2025-08-05'),
('sistema de gestão escolar', 'sistema para controle de escolas', '2025-04-01', '2025-11-20');

insert into pessoas (nome, email) values
('ana souza', 'ana.souza@email.com'),
('bruno lima', 'bruno.lima@email.com'),
('carla mendes', 'carla.mendes@email.com'),
('daniel oliveira', 'daniel.oliveira@email.com'),
('fernanda costa', 'fernanda.costa@email.com'),
('gustavo pereira', 'gustavo.pereira@email.com'),
('helena rocha', 'helena.rocha@email.com'),
('igor santos', 'igor.santos@email.com');

insert into papeis (nome, funcao) values
('desenvolvedor', 'responsável por implementar funcionalidades'),
('analista', 'responsável pela análise de requisitos e processos'),
('testador', 'responsável por realizar testes no sistema'),
('designer', 'responsável pela interface e experiência do usuário'),
('gerente de projetos', 'responsável pela gestão do projeto'),
('devops', 'responsável por integração e deploy contínuo');

insert into alocacoes (fk_id_pessoa, fk_id_projeto, fk_id_papel) values
(1, 1, 1), -- ana souza - desenvolvedor
(2, 1, 2), -- bruno lima - analista
(3, 1, 3), -- carla mendes - testador
(4, 1, 5), -- daniel oliveira - gerente de projetos
(5, 2, 1), -- fernanda costa - desenvolvedor
(6, 2, 6), -- gustavo pereira - devops
(7, 2, 4), -- helena rocha - designer
(4, 2, 5), -- daniel oliveira - gerente de projetos
(8, 3, 1), -- igor santos - desenvolvedor
(1, 3, 2), -- ana souza - analista
(3, 3, 3), -- carla mendes - testador
(7, 3, 4), -- helena rocha - designer
(2, 4, 1), -- bruno lima - desenvolvedor
(5, 4, 2), -- fernanda costa - analista
(6, 4, 3), -- gustavo pereira - testador
(8, 4, 6); -- igor santos - devops

insert into tarefas (fk_id_responsavel, fk_id_projeto, titulo, descricao, status) values
-- projeto 1 - sistema de vendas online
(1, 1, 'criar tela de login', '', 'planejada'),
(2, 1, 'modelar banco de dados', '', 'concluída'),
(1, 1, 'implementar carrinho de compras', '', 'em andamento'),
(3, 1, 'testar fluxo de pagamento', '', 'planejada'),
(4, 1, 'configurar ambiente de produção', '', 'em andamento'),
-- projeto 2 - aplicativo de agenda médica
(5, 2, 'criar cadastro de pacientes', '', 'em andamento'),
(6, 2, 'implementar agendamento online', '', 'planejada'),
(7, 2, 'criar protótipo de interface', '', 'concluída'),
(5, 2, 'validar integração com calendário', '', 'em andamento'),
-- projeto 3 - plataforma de cursos ead
(8, 3, 'criar módulo de cadastro de cursos', '', 'planejada'),
(1, 3, 'implementar área do aluno', '', 'em andamento'),
(3, 3, 'criar testes automáticos', '', 'planejada'),
(7, 3, 'desenvolver design responsivo', '', 'em andamento'),
(8, 3, 'ajustar autenticação com e-mail', '', 'concluída'),
-- projeto 4 - sistema de gestão escolar
(2, 4, 'criar cadastro de alunos', '', 'em andamento'),
(5, 4, 'desenvolver boletim online', '', 'planejada'),
(6, 4, 'testar módulo de presença', '', 'planejada'),
(2, 4, 'implementar relatórios de notas', '', 'em andamento');

# executando consultas ----------------------------
# -- 01 --
select * from projetos order by nome asc; 
# -- 02 --
select * from projetos where dt_inicio between "2025-02-01" and "2025-04-01" order by dt_inicio desc;
# -- 03 --
select * from projetos order by id_projeto asc limit 2 offset 2;
# -- 04 --
select * from pessoas where nome != "ana souza" and (nome like "%an%" or "%AN%");
# -- 05 -- 
select * from pessoas where nome like "% pe%" or nome like "% co%";
# -- 06 -- 
select id_tarefa, titulo, status from tarefas where fk_id_projeto = 1 order by status;
select id_tarefa, titulo, status from tarefas where fk_id_projeto = 1 order by titulo;
# -- 07 --
select id_tarefa, titulo, status from tarefas where status = "concluída" and fk_id_projeto = 3 order by id_tarefa desc;
# -- 08 --
select id_tarefa, titulo, status from tarefas where status != "concluída" and fk_id_projeto = 4 order by titulo;
# -- 09 --
select id_tarefa, fk_id_projeto, titulo, status from tarefas where titulo like "%cadastro%" order by fk_id_projeto; 
select id_tarefa, fk_id_projeto, titulo, status from tarefas where titulo like "%cadastro%" order by titulo; 
# -- 10 --
select id_tarefa, titulo, status from tarefas where fk_id_projeto = 2 limit 2 offset 2;



