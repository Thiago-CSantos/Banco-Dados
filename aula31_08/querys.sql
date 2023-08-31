create database aula31_08;

use aula31_08;

create table professor(
codigo int primary key,
nome varchar(100),
tibulacao varchar(50)
);

insert into professor values(2,'Adrina', 'Senior');
select * from professor;

show tables;

select * from alunos;
use aula21_08;
insert into alunos values('12345-6', 'Leonardo', '123456-99', 'Engenharia de Software');
insert into alunos values('65412-3', 'Thiago', '123456-99', 'Engenharia de Software');



create table disciplinas(
codigo int auto_increment primary key,
descricao varchar(40),
ch int
);
insert into disciplinas(descricao, ch) values('Banco de Dados', 80);
insert into disciplinas(descricao, ch) values('Algoritmos', 80);
select * from disciplinas;