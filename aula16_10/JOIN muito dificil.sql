
drop table cliente;
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
VALUES (3, 10, 3, 1);

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

SELECT Cliente.nome_cli, COUNT(Pedido.num_ped)
FROM Cliente
LEFT JOIN Pedido ON Cliente.cod_cli = Pedido.cod_cli
WHERE Cliente.nome_cli = 'João'
GROUP BY Cliente.nome_cli;

select Pedido.num_ped, Produto.desc_prod, Vendedor.nome_vend
from Pedido left join Vendedor on Pedido.num_ped = Vendedor.cod_vend
where ;



