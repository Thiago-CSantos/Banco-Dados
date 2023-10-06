create database aula05_10;
use aula05_10;
create table Produtos(
	id int primary key auto_increment,
    nome varchar(100),
    fabricante varchar(100),
    quantidade int,
    valor float8,
    tipo varchar(100)
);

insert into Produtos(nome, fabricante, quantidade, valor, tipo) 
values("Playstation 5", "Sony", 100, 4000, "Console"),
("I7 16Ram 500GB", "Dell", 200, 6000, "Notebook"),
("Xbox one X", "Microsoft", 350, 3900, "Console"),
("Iphone 15", "Apple", 50, 11000, "Celular"),
("Galaxy S22", "Samsung", 100, 4000, "Celular"),
("I5 16Ram 500GB", "Dell", 48, 3800, "Notebook"),
("Galaxy S20", "Samsung", 120, 3100, "Celular"),
("Galaxy Watch", "Samsung", 80, 2000, "Smart Watch");

/*Funções Agregadas:
	AVG ->Calcula média
    COUNT ->retorna o numero de negativos
    MAX ->recupera o valor maximo de uma coluna
    MIN ->recupera o valor minimo de uma coluna
    SUM ->obtem a soma de valores de uma coluna
*/
select avg(valor)from Produtos;
select avg(quantidade) from Produtos;
select count(*) from Produtos;
select count(fabricante) from Produtos;
select max(quantidade) from Produtos;
select min(valor) from Produtos;
select sum(valor) from Produtos;

select tipo, sum(quantidade) from Produtos group by  tipo having sum(quantidade)>200;
select fabricante, sum(quantidade) from Produtos group by fabricante;
select tipo, fabricante, sum(quantidade) as Total from Produtos group by tipo, fabricante; 
select tipo, sum(quantidade*valor)from Produtos group by tipo;

update Produtos set fabricante = null where id=6;