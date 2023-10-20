/* Mostrar os bancos de dados existentes no servidor */

show databases;

/*Criar um novo banco */
create database dbHotel;

/*Selecionar o banco de dados */
use dbHotel;

/*Criar uma nova tabela */
create table funcionarios (
	/*int se refere ao tipo do campo na tabela
    primary key determina que o campo idFunc seja uma chave primária e será responsável por identificar cada funcionário
    auto_increment determina que o MySQL dê um id novo a cada cadastro */
	idFunc int primary key auto_increment,
    
    /* varchar é a quantidade variável de cada caracter no nome (nesse caso, até 100 caracteres)
    not null determina que o campo seja obrigatório */
	nomeFunc varchar(100) not null,

    /* unique determina qye o campo seja único e o valor não possa repetir */
    login varchar(20) not null unique,
    senha varchar(255) not null,
    cargo varchar(20)
);

/* descreve os campos da tabela funcionarios */
describe funcionarios;



/*Mostrar as tabelas */
show tables;

/* CREATE */
/* Inserir um novo funcionário na tabela, com nome, login, senha criptografada e cargo */ 
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrator", "admin", md5("admin"), "Administrador");
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", md5("123@senac"), "RH");
insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));
insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));
/*READ*/
/*Ler/Buscar as informações da tabela funcionários */
select * from funcionarios;


/*UPDATE*/
/* Atualizar o campo login na tabela funcionários especificando o id */
update funcionarios set login = 'fellipecoelho' where idFunc = 7;
update funcionarios set cargo = 'Gerência' where idFunc = 4;

/* Excluir a tabela do banco */
drop table funcionarios;

/* Adicionar o campo email à tabela funcionarios */
alter table funcionarios add column email varchar(50);

/*Modificar o campo email para que se torne obrigatório, ou seja, não nulo (not null) */
alter table funcionarios modify column email varchar (50) not null;

/* Excluir um campo da tabela */
alter table funcionarios drop column email;

/*Reposicionar o campo email para que ele fique após o campo login */
alter table funcionarios modify column email varchar(50) not null after login;

update funcionarios set email = 'fellipecoelho@senacsp.edu.br' where idFunc = 7;
update funcionarios set email = 'pamellapereto@senacsp.edu.br' where idFunc = 6;
update funcionarios set email = 'lauralopes@senacsp.edu.br' where idFunc = 5;
update funcionarios set email = 'victoriacardoso@senacsp.edu.br' where idFunc = 4;
update funcionarios set email = 'brenosilva@senacsp.edu.br' where idFunc = 3;

select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");
