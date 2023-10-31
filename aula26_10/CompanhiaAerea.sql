create database CompanhiaAerea;
use CompanhiaAerea;
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
	nomeAeroporto varchar(100),
    cidade varchar(60),
    pais varchar(60)
);

create table Voo(
	idVoo varchar(100),
	Companhi int,
    aeroportoOrigem int,
    aeroportoDestino int,
    Datas date,
    hora time,
    piloto int,
    primary key(idVoo),
    foreign key(aeroportoOrigem) references Aeroporto(idAeroporto),
    foreign key(aeroportoDestino) references Aeroporto(idAeroporto),
    foreign key(piloto) references Piloto(idPiloto)
);
INSERT INTO CompanhiaAerea (idCompanhia, Descricao, Pais)
VALUES
(1, 'Gol', 'Brasil'),
(2, 'Azul', 'Brasil'),
(3, 'Latam Airlines Brasil', 'Brasil'),
(4, 'Latam Airlines Equador', 'Equador'),
(5, 'American Airlines', 'EUA');

INSERT INTO Piloto (idPiloto, nomePiloto, Salario, Gratificacao, Companhia)
VALUES
(10, 'João Pedro Lopes', 12000, 1400, 3),
(11, 'Anderson Frisanco', 8300, 1800, 1),
(12, 'Cristiano Pereira', 9800, 1400, 3),
(13, 'José Antonio Silva', 10000, 2200, 2),
(14, 'Maycon Roberto Noronha', 7500, 1800, 1),
(15, 'Eugenio dos Santos', 12000, 1400, 3);

INSERT INTO Aeroporto (idAeroporto, nomeAeroporto, Cidade, Pais)
VALUES
(100, 'Aeroporto Internacional de Florianópolis – Hercílio Luz', 'Florianópolis', 'Brasil'),
(101, 'Aeroporto Internacional de São Paulo – Guarulhos', 'Guarulhos', 'Brasil'),
(102, 'Aeroporto Internacional de Campinas – Viracopos', 'Campinas', 'Brasil'),
(103, 'Aeroporto Internacional de Natal – Governador Aluízio Alves', 'Natal', 'Brasil'),
(104, 'Aeroporto Internacional de Miami', 'Miami', 'EUA'),
(105, 'Aeroporto Internacional John F. Kennedy', 'Nova Iorque', 'EUA'),
(106, 'Aeroporto Internacional de São Francisco', 'São Francisco', 'EUA');

INSERT INTO Voo (idVoo, Companhi, aeroportoOrigem, aeroportoDestino, Datas, Hora, Piloto)
VALUES
('JJ2345', 3, 101, 105, '2023-08-22', '12:10:00', 12),
('TY2225', 2, 102, 104, '2023-08-23', '22:45:00', 13),
('HQ5432', 2, 101, 100, '2023-08-22', '20:15:00', 13),
('JJ3344', 3, 102, 103, '2023-08-21', '18:05:00', 12),
('JJ2355', 3, 101, 106, '2023-08-22', '06:10:00', 15),
('DQ1325', 5, 101, 105, '2023-08-22', '06:12:00', 10),
('NR6787', 1, 105, 100, '2023-08-22', '10:09:00', 14);

#EX01
select Voo.* from Voo
inner join Aeroporto on Voo.aeroportoDestino = Aeroporto.idAeroporto
where Aeroporto.cidade = "Miami";

# EX02
select Voo.* from Voo
inner join Piloto on Voo.piloto = Piloto.idPiloto
inner join CompanhiaAerea on Piloto.companhia = CompanhiaAerea.idCompanhia
where CompanhiaAerea.descricao = "Azul";

select Voo.* from Voo
inner join CompanhiaAerea on Voo.companhi = CompanhiaAerea.idCompanhia
where CompanhiaAerea.descricao = "Azul";

#EX03
select Voo.* from Voo
inner join Aeroporto on Voo.aeroportoOrigem = Aeroporto.idAeroporto
where Aeroporto.nomeAeroporto like "%Viracopos%";

select Voo.idVoo from Voo
where Voo.idVoo like "_Q%";

select Piloto.nomePiloto, Piloto.salario, CompanhiaAerea.descricao, Voo.idVoo from Voo
inner join Piloto on Voo.piloto = Piloto.idPiloto
inner join CompanhiaAerea on Piloto.companhia = CompanhiaAerea.idCompanhia;

#ex07 alterar o horario do Voo JJ3344 para 21:15
update Voo set hora = "21:15:00"
where Voo.idVoo = "JJ3344"; 
select * from Voo;

#EX08 alterar o valor da graficação do piloto
# Cristiano Pereira para R$ 2000,00
update Piloto set Piloto.salario = 2000.00
where Piloto.nomePiloto = "Cristiano Pereira";
select * from Piloto;

#EX09 Apagar a coluna pais da tabela companhiaAerea
alter table CompanhiaAerea drop column pais;
select * from CompanhiaAerea;

#EX10 Apagar os voos com data 22/08/2023
delete from Voo where datas = "2023-08-22";
select * from Voo;

#EX11 Exibir a quantidade de voos do piloto Anderson Anderson Frisanco
select count(Voo.piloto) from Voo
inner join Piloto on Voo.piloto = Piloto.idPiloto
where Piloto.nomePiloto = 'Anderson Frisanco';

#EX12 Exibir a quantidade de voos do piloto Maycon que partiu de campinas
select count(Voo.piloto) from Voo
inner join Piloto on Voo.piloto = Piloto.idPiloto
inner join Aeroporto on Voo.aeroportoOrigem = Aeroporto.idAeroporto
where Piloto.nomePiloto = 'Cristiano Pereira' and  Aeroporto.cidade = "Campinas";

#Exibir os dados dos voos das companhias brasileiras que partiram de Miami
select Voo.* from Voo
inner join Piloto on Voo.piloto = Piloto.idPiloto
inner join CompanhiaAerea on Piloto.companhia = CompanhiaAerea.idCompanhia
where CompanhiaAerea.pais = "Brasil"
inner join 
