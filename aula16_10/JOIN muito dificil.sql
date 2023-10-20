
create database Empresas;
use Empresas;
create table Cliente(
	cod_cli int primary key,
    nome_cli varchar(40),
    rua varchar(40),
    cidade varchar(40),
    cep char(8),
    uf varchar(40)
);
create table Pedido(
num_ped int primary key,
prazo_entr int,
cod_cli int,
cod_vend int,
foreign key (cod_cli) references Cliente(cod_cli),
foreign key (cod_vend) references Vendedor(cod_vend)
);

create table Produto(
cod_prod int primary key,
unid_prod char(3),
desc_prod varchar(20),
val_unit decimal(9,2)
);

create table Item_Pedido(
num_ped int,
cod_prod int,
qtd_ped int,
primary key(num_ped, cod_prod),
foreign key(num_ped) references Pedido(num_ped),
foreign key(cod_prod) references Produto(cod_prod)
);

create table Vendedor(
cod_vend int primary key,
nome_vend varchar(40),
saldo_fixo decimal(9,2)
);

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (1, 'Cliente 1', 'Rua 1', 'Cidade 1', '12345678', 'UF1');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (2, 'Cliente 2', 'Rua 2', 'Cidade 2', '23456789', 'UF2');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (3, 'Cliente 3', 'Rua 3', 'Cidade 3', '34567890', 'UF3');

INSERT INTO Cliente (cod_cli, nome_cli, rua, cidade, cep, uf)
VALUES (4, 'João', 'Rua João', 'Cidade João', '12345000', 'JN');

-- Inserir dados na tabela Pedido
INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (1, 7, 1, 1);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (2, 5, 2, 2);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (3, 10, 3, 3);

INSERT INTO Pedido (num_ped, prazo_entr, cod_cli, cod_vend)
VALUES (4, 22, 4, 1);

-- Inserir dados na tabela Produto
INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (1, 'UNI', 'Produto 1', 10.99);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (2, 'CX', 'Produto 2', 25.50);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (3, 'KG', 'Produto 3', 5.75);

INSERT INTO Produto (cod_prod, unid_prod, desc_prod, val_unit)
VALUES (4, 'KG', 'Produto 4', 9.75);

-- Inserir dados na tabela Item_Pedido
INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (1, 1, 3);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (2, 2, 2);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (3, 3, 5);

INSERT INTO Item_Pedido (num_ped, cod_prod, qtd_ped)
VALUES (4, 4, 33);

-- Inserir dados na tabela Vendedor
INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (1, 'Vendedor 1', 5000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (2, 'Vendedor 2', 7000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (3, 'Vendedor 3', 6000.00);

INSERT INTO Vendedor (cod_vend, nome_vend, saldo_fixo)
VALUES (4, 'Vendedor 4', 9000.00);

#2)
select Pedido.num_ped, Produto.desc_prod, Vendedor.nome_vend 
from Pedido inner join Vendedor on Pedido.cod_vend = Vendedor.cod_vend
inner join Item_Pedido on Pedido.num_ped = Item_Pedido.num_ped
inner join Produto on Item_Pedido.cod_prod = Produto.cod_prod;

#3)
select Vendedor.nome_vend
from Pedido inner join Vendedor on Pedido.cod_vend = Vendedor.cod_vend
where Pedido.prazo_entr = 5;

#4)
select Cliente.* 
from Cliente inner join Pedido on Cliente.cod_cli = Pedido.cod_cli
inner join Item_Pedido on Pedido.num_ped = Item_Pedido.num_ped
inner join Produto on Produto.cod_prod = Item_Pedido.cod_prod
where Produto.desc_prod = "Produto 3" and Cliente.cidade = "Cidade 3";

#5)
select Item_Pedido.num_ped, sum(Produto.val_unit * Item_Pedido.qtd_ped)
from Item_Pedido inner join Produto on Item_Pedido.cod_prod = Produto.cod_prod group by num_ped;

#6)
select Cliente.cidade, count(Pedido.num_ped)
from Pedido inner join Cliente on Pedido.cod_cli = Cliente.cod_cli group by cidade;

#7)
select Vendedor.nome_vend 
from Vendedor inner join Pedido on Vendedor.cod_vend = Pedido.cod_vend
inner join Item_Pedido on Item_Pedido.num_ped = Pedido.num_ped
inner join Produto on Produto.cod_prod = Item_Pedido.cod_prod
and Produto.desc_prod = "Produto 1"; 

#8)
select Cliente.nome_cli, count(Pedido.num_ped)
from Cliente inner join Pedido on Cliente.cod_cli = Pedido.cod_cli
group by Cliente.cod_cli having count(Pedido.num_ped)>=1;