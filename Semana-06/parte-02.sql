--1 OVER+Funciones Agrupamiento

--Mostrar para cada ubigeo su resumen por departamento
--1.1 Muestra el resumen solo para departamentos
select departamento, max(poblacion),min(poblacion),avg(poblacion),sum(poblacion),count(1)
from tb_Ubigeo
group by departamento
order by departamento
--1.2 Subconsultas
select 
departamento, 
provincia,
distrito,
(select max(poblacion) from tb_Ubigeo _u where u.departamento=_u.departamento) as maxdpto,
(select min(poblacion) from tb_Ubigeo _u where u.departamento=_u.departamento) as mindpto,
(select avg(poblacion) from tb_Ubigeo _u where u.departamento=_u.departamento) as avgdpto,
(select sum(poblacion) from tb_Ubigeo _u where u.departamento=_u.departamento) as sumdpto,
(select count(1) from tb_Ubigeo _u where u.departamento=_u.departamento) as condpto
from tb_Ubigeo u
order by departamento,provincia,distrito

--1.3 Funciones Windows
select 
departamento, 
provincia,
distrito,
max(poblacion) OVER(PARTITION BY departamento) as maxdpto,--Corta por departamento y obten la máxima población
min(poblacion) OVER(PARTITION BY departamento) as mindpto,--Corta por departamento y obten la mínima población
avg(poblacion) OVER(PARTITION BY departamento) as avgdpto,--Corta por departamento y obten el promedio población
sum(poblacion) OVER(PARTITION BY departamento) as sumdpto,--Corta por departamento y suma las poblaciones
count(poblacion) OVER(PARTITION BY departamento) as condpto--Corta por departamento y cuenta las poblaciones
from tb_Ubigeo u
order by departamento,provincia,distrito
