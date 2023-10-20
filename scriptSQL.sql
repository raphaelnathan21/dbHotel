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
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("José", "parabensze", md5("123@senac"), "Gerência", "joseroberto@gmail.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "Gerência", "pamellapereto@gmail.com");
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pedro Rodrigues", "pedrorodrigues", md5("123@senac"), "Gerência", "pedrorodrigues@gmail.com");
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

/* Buscar o login e a senha da tabela funcionarios em que login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");

/* DELETE */
delete from funcionarios where idFunc = 6;

/* Buscar o ID e o nome do funcionário da tabela funcionarios ordenando o nome alfabeticamente (ascendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios from funcionarios order by nomeFunc asc;

/* Buscar o ID e o nome do funcionário da tabela funcionarios ordenando o nome alfabeticamente (descendente, de Z a A) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios from funcionarios order by nomeFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios order by idFunc desc;

/* Buscar os campos ID com apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario da tabela funcionarios onde cargo seja diferente de nulo e ordenado de forma ascendente o ID (de maior para o menor) 
<> ESTE SINAL SIGNIFICA DIFERENTE
*/
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios order by idFunc desc;

/* Buscar todos os campos dos funcionários que tenham o cargo de Gerência, ordenando alfabeticamente */
select * from funcionarios where cargo = 'Gerência' order by nomeFunc asc;

create table quartos (
	idQuarto int primary key auto_increment, 
    andar varchar(10) not null, 
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
    );
    
    describe quartos;
    
    drop table quartos;
    
    alter table quartos add column numeroQuarto varchar(10) not null after andar;

