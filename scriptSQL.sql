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
    
    alter table quartos add column cadeDaManha char(3) not null after preco;
    
    alter table quartos add column foto varchar(255) not null after descricao;
    
    alter table quartos change cadeDaManha cafeDaManha varchar(3) not null;
    
 update quartos set numeroQuarto = "506" where idQuarto = 2;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 26m² com piso frio, com varanda - vista bairro. Oferece ar condicionado individual, TV LCD 42’’, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 750.90, "Queen", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("5º", "505", "Superior Premier Twin", 3, "não", "Familiar", " Podemos acomodar até 2 pessoas conforme disponibilidade em apartamento duplo twin.
A 1º criança na mesma cama que os pais é cortesia até 6 anos.", 950.90, "King", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("4º", "409", "Quarto de Solteiro", 2, "sim", "Junior", "Quarto com uma cama de casal
Os quartos contam com TV de tela plana, Frigobar, Wi-fi, e Ar-Condicionado. Para sua comodidade, são fornecidos produtos de banho de cortesia e secador de cabelo.", 550.90, "Solteiro tradicional", "sim");

select * from quartos;

update quartos set cafeDaManha = "sim" where idQuarto = 1;

update quartos set foto = "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg" where idQuarto = 1;

select * from quartos where situacao = 'nao';

select * from quartos where situacao = 'nao' and cafeDaManha = 'sim';

select * from quartos where varanda = 'sim' and cafeDaManha = 'sim' and situacao = 'nao';

select * from quartos where situacao = 'nao' and preco < 700;

select * from quartos order by preco desc;

create table clientes (
	idClientes int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) not null,
    celular varchar(20) not null,
    numeroCartao varchar(20) not null,
    nomeTitular varchar(100) not null,
    validade date not null, 
    cvv char(3) not null,
    checkin datetime not null,
    checkout datetime not null,
    idQuarto int not null,
    foreign key (idQuarto) references quartos (idQuarto)
);

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idQuarto) values ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803", "5526 4863 8286 2543", "José de Assis", "2025-03-24", "452", "2023-11-02 14:00:00", "2023-11-05 12:00:00", 1);

insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout, idQuarto) values ("Pedroca Mussolini", "111.222.333-04", "11.222.333-4", "pedromussolini@gmail.com", "(96) 99999-9999", "1111 2222 3333 4444", "Pedro Mussolini", "2045-03-24", "123", "2023-11-02 14:00:00", "2023-11-05 12:00:00", 2);

drop table clientes;


select * from clientes;

/* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada à tabela clientes pelo campo idQuarto */

select *
from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto;

/* Buscar o nome completo e o celular do cliente que alugou o quarto de número 505, pois a tabela está vinculada à tabela clientes pelo idQuarto */
select clientes.nomeCompleto,
clientes.celular
from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/*Buscar o nome completo e data/horário do checkout do cliente que alugou o quarto de número 505 */
select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* 


