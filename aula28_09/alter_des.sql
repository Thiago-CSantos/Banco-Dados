create database Faculdade;
use Faculdade;
create table Area(
	idArea int auto_increment primary key,
    nomeArea char(50)
);

create table Curso(
	idCurso int primary key,
    nomeCurso char(50),
    idTbArea int,
    foreign key(idTbArea) references Area(idArea)
);

create table Aluno(
	ra char(50) primary key,
    nome char(50),
    idCursoTb int,
    foreign key(idCursoTb) references Curso(idCurso)
);

insert into Area(nomeArea) values("Exatas");
insert into Area(nomeArea) values("Saúde");
insert into Area(nomeArea) values("Humanas");

select * from Area;

insert into Curso(idCurso, nomeCurso, idTbArea) values(10,"Eng.Software", 1);
insert into Curso(idCurso, nomeCurso, idTbArea) values(11, "Medicia", 2);
insert into Curso(idCurso, nomeCurso, idTbArea) values(12, "Fisioterapia", 2);
insert into Curso(idCurso, nomeCurso, idTbArea) values(13, "Eng.Civil", 1);

select * from Curso;

insert into Aluno values(123-4, "Antonio Jose", 11);
insert into Aluno values(432-8, "Solange", 10);
insert into Aluno values(553-4, "Jose", 10);
insert into Aluno values(356-1, "Ana", 12);

select * from Aluno;
 /*
	1)
 */
select Aluno.nome, Curso.nomeCurso from Aluno, Curso where idCursoTb = idCurso;

/*
	2)
*/

select Aluno.* from Aluno, Area, Curso where Curso.idTbArea = Aluno.idCursoTb and Curso.idTbArea = Area.idArea and nomeArea = "Exatas";

alter table Aluno add telefone varchar(12);
alter table Aluno add email varchar(100);

desc Aluno;

alter table Aluno change telefone telefone varchar(15);
alter table Area change nomeArea nomeArea varchar(100);

alter table Aluno change telefone tel varchar(15);

delete from Aluno where ra = "355";
delete from Curso where idCurso = 10 and idArea = 1;

delete from Aluno;

update Curso set nomeCurso = "Engenharia de Software" where idCurso = 10;

alter table Aluno drop email;
select * from Curso;