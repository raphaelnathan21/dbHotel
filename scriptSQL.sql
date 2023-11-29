/*Banco de dados para gerenciamento de um hotel */

create database dbHotel;

show databases;

use dbHotel;

create table funcionarios (
	idFunc int primary key auto_increment,
	nomeFunc varchar(100) not null,
    login varchar(20) not null unique,
    email varchar(50) not null,
    senha varchar(255) not null,
    cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Administrator", "admin", "admin@gmail.com", md5("admin"), "Administrador");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Pamella Pereto", "pamellapereto", "pamellapereto@gmail.com", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Breno Silva", "brenosilva", "brenosilva@senacsp.edu.br", md5("123@senac"), "Contabilidade");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Victoria Cardoso", "victoriacardoso", "victoriacardoso@senacsp.edu.br", md5("123@senac"), "RH");
insert into funcionarios(nomeFunc, login, email, senha) values ("Laura Lopes", "lauralopes", "lauralopes@senacsp.edu.br", md5("123@senac"));
insert into funcionarios(nomeFunc, login, email, senha) values ("Fellipe Coelho", "fellipe", "fellipecoelho@senacsp.edu.br", md5("123@senac"));
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("José", "parabensze", "joseroberto@gmail.com", "joseroberto@gmail.com", md5("123@senac"), "Gerência");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Pedro Rodrigues", "pedrorodrigues", "pedrorodrigues@gmail.com", md5("123@senac"), "Gerência");

select * from funcionarios;
select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios from funcionarios order by nomeFunc asc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios from funcionarios order by nomeFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> 'null' order by idFunc desc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios order by idFunc desc;
select * from funcionarios where cargo = 'Gerência' order by nomeFunc asc;

create table quartos (
	idQuarto int primary key auto_increment, 
    andar varchar(10) not null, 
    numeroQuarto varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    disponibilidade char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar(255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char(3) not null,
    precoCafe decimal(10,2),
    tipoCama varchar(20),
    varanda char(3)
    );
    
describe quartos;
     
select * from quartos;
     
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 26m² com piso frio, com varanda - vista bairro. Oferece ar condicionado individual, TV LCD 42’’, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg", 750.90, "sim", "60.00", "Queen", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("5º", "505", "Superior Premier Twin", 3, "não", "Familiar", " Podemos acomodar até 2 pessoas conforme disponibilidade em apartamento duplo twin.
A 1º criança na mesma cama que os pais é cortesia até 6 anos.", "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg", 950.90, "sim", "60.00", "King", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("4º", "409", "Quarto de Solteiro", 2, "sim", "Junior", "Quarto com uma cama de casal
Os quartos contam com TV de tela plana, Frigobar, Wi-fi, e Ar-Condicionado. Para sua comodidade, são fornecidos produtos de banho de cortesia e secador de cabelo.", "https://pousadaportomare.com.br/wp-content/uploads/2022/08/tipos-de-quarto.jpg", 550.90, "não", "Solteiro tradicional", "sim");

create table clientes (
	idClientes int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) not null,
    celular varchar(20) not null
);

create table pedido (
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idClientes int not null,
    foreign key (idClientes) references clientes(idClientes)
);

describe pedido;

insert into pedido (statusPedido, idClientes) values ("Pendente", 1);
insert into pedido (statusPedido, idClientes) values ("Finalizado", 2);

select * from pedido;

select * from pedido inner join clientes on pedido.idClientes = clientes.idClientes;

create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedido(idPedido),
    foreign key (idQuarto) references quartos(idQuarto),
    checkin datetime not null,
    checkout datetime not null
    );
    
describe reservas;
    
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 1, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 2, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (2, 3,  "2023-11-02 14:00:00", "2023-11-05 12:00:00");

select * from reservas;

select clientes.nomeCompleto, clientes.cpf, clientes.email, pedido.idPedido, pedido.dataPedido, 
quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout from 
clientes inner join pedido on clientes.idClientes = pedido.idClientes inner join
reservas on reservas.idPedido = pedido.idPedido inner join quartos
on reservas.idQuarto = quartos.idQuarto;

select clientes.nomeCompleto, clientes.cpf, clientes.email, pedido.idPedido, pedido.dataPedido,  quartos.tipoQuarto, 
quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout from
clientes inner join pedido on clientes.idClientes = pedido.idClientes inner join 
reservas on reservas.idPedido = pedido.idPedido inner join quartos
on reservas.idQuarto = quartos.idQuarto;

select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido = 2;

describe quartos;
describe clientes;
describe pedidos;

select * from clientes;
select * from pedido;
select *from quartos;
select * from reservas;

update reservas inner join quartos on reservas.idQuarto = quartos.idQuarto
set quartos.disponibilidade = "sim" 
where reservas.checkout < current_timestamp();

/* Cliente Pedroca Mussolini - idPedido 2
Quarto reservado: Quarto de Solteiro (4° andar, número 409, preço/diária: R$ 550,90
Check-in: 27/11/2023 às 10h
Check-out: 08/12/2023 às 10h
*/

select clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, reservas.checkout from
clientes inner join pedido on clientes.idClientes = pedido.idClientes inner join
reservas on reservas.idPedido = pedido.idPedido inner join quartos
on reservas.idQuarto = quartos.idQuarto where reservas.checkout <= current_timestamp();

select clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto,  
date_format(reservas.checkout, '%d%m%Y') as checkout, datediff(reservas.checkout, curdate()) as dias_restantes
from clientes inner join pedido on clientes.idClientes = pedido.idClientes inner join
reservas on reservas.idPedido = pedido.idPedido inner join quartos 
on reservas.idQuarto = quartos.idQuarto where reservas.checkout > current_timestamp();