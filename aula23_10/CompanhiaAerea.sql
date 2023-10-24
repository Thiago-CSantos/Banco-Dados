create database CompanhiaAerea;
create table CompanhiaAerea(
	idCompanhia int primary key,
    descricao varchar(100),
    pais varchar(100)
);

create table Piloto(
	idPiloto int,
    nomePiloto varchar(100),
    salario float8,
    gratificacao float8,
    companhia int,
    primary key(idPiloto, companhia),
    foreign key (companhia) references CompanhiaAerea(idCompanhia)
);

create table Aeroporto(
	idAeroporto int primary key,
    
);