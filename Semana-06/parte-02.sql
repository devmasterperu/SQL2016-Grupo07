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

--2. Mostrar para cada ubigeo con población>10000 su resumen de superfice por departamento

select 
departamento, 
provincia,
distrito,
max(superficie) OVER(PARTITION BY departamento) as maxdpto,--Corta por departamento y obten la máxima superfie
min(superficie) OVER(PARTITION BY departamento) as mindpto,--Corta por departamento y obten la mínima superfie
avg(superficie) OVER(PARTITION BY departamento) as avgdpto,--Corta por departamento y obten el promedio superfie
sum(superficie) OVER(PARTITION BY departamento) as sumdpto,--Corta por departamento y suma las superfie
count(superficie) OVER(PARTITION BY departamento) as condpto--Corta por departamento y cuenta las superfie
from tb_Ubigeo u
where u.poblacion>10000
order by departamento,provincia,distrito

--3 Mostrar para cada ubigeo su ranking de superfice por departamento (De mayor a menor):
---Mostrar el ranking con puestos irrepetibles.
---Mostrar el ranking sin salto de puestos.
---Mostrar el ranking con salto de puestos.
---Agrupar los ranking por departamento en 4 grupos.
select 
idUbigeo,
departamento, 
provincia,
distrito,
superficie,
ROW_NUMBER() OVER(PARTITION BY departamento ORDER BY superficie desc) as row_number,
DENSE_RANK() OVER(PARTITION BY departamento ORDER BY superficie desc) as dense_rank,
RANK() OVER(PARTITION BY departamento ORDER BY superficie desc) as rank,
NTILE(4) OVER(PARTITION BY departamento ORDER BY superficie desc) as ntile4,
NTILE(2) OVER(PARTITION BY departamento ORDER BY superficie desc) as ntile2
--ROW_NUMBER() OVER(ORDER BY superficie desc) as num
from tb_Ubigeo u
where u.poblacion>10000
order by departamento,superficie desc

update tb_Ubigeo
set superficie=1746.23
where idUbigeo='010202'

update tb_Ubigeo
set superficie=746.64
where idUbigeo='010706'

--3 Mostrar para cada ubigeo su ranking de poblacion por letra de inicio del departamento 
--(De menor a mayor):
--Consideraciones
---Mostrar el ranking con puestos irrepetibles.
---Mostrar el ranking sin salto de puestos.
---Mostrar el ranking con salto de puestos.
---Agrupar los ranking por letra de inicio del departamento en 3 grupos.

--3.1
select
idUbigeo,
departamento, 
pletra,
poblacion,
ROW_NUMBER() OVER(PARTITION BY pletra ORDER BY poblacion asc) as row_number,
DENSE_RANK() OVER(PARTITION BY pletra ORDER BY poblacion asc) as dense_rank,
RANK() OVER(PARTITION BY pletra ORDER BY poblacion asc) as rank,
NTILE(3) OVER(PARTITION BY pletra ORDER BY poblacion asc) as ntile3
from
(
select idUbigeo,departamento,provincia,distrito,poblacion,substring(departamento,1,1) as pletra from
dbo.tb_Ubigeo
) u
order by pletra

--4 Funciones Windows OFFSET

select 
idUbigeo,
departamento, 
provincia,
distrito,
superficie,
LAG(superficie) OVER(PARTITION BY departamento ORDER BY superficie desc) as LAG,
LEAD(superficie) OVER(PARTITION BY departamento ORDER BY superficie desc) as LEAD,
FIRST_VALUE(superficie) OVER(PARTITION BY departamento ORDER BY superficie desc) as FIRST_VALUE,
LAST_VALUE(superficie) OVER(PARTITION BY departamento ORDER BY superficie desc) as LAST_VALUE
--ROW_NUMBER() OVER(ORDER BY superficie desc) as num
from tb_Ubigeo u
where u.poblacion>10000
order by departamento,superficie desc