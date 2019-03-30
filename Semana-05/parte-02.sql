--1
WITH 
CTE_Totales
AS
(
 select idCliente,count(distinct idColaborador) as total
 from tb_ContactoCliente
 group by idCliente	
),
CTE_MAX
AS
(
 select idCliente,max(distinct fechaContactoCliente) as maximo
 from tb_ContactoCliente
 group by idCliente	
)
select 
concat(nombreCliente,'',apellidosCliente) as [Nombre Completo],
cat.nombreCategoria as [Categoría],
isnull(CTE_Totales.total,0) as [Total Colaboradores],
ISNULL(convert(varchar(8),CTE_MAX.maximo,112),'') as [Fecha Último Contacto],
(select count(1) from CTE_Totales) as Total
from tb_Cliente cte
inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
left join CTE_Totales on cte.idCliente=CTE_Totales.idCliente
left join CTE_MAX on cte.idCliente=CTE_MAX.idCliente;
/*
select 
concat(nombreCliente,'',apellidosCliente) as [Nombre Completo],
cat.nombreCategoria as [Categoría],
isnull(CTE_Totales.total,0) as [Total Colaboradores],
ISNULL(convert(varchar(8),CTE_Totales.max,112),'') as [Fecha Último Contacto],
(select count(1) from CTE_Totales) as Total
from tb_Cliente cte
inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
left join CTE_Totales on cte.idCliente=CTE_Totales.idCliente;
*/

--2 Más de un CTE

WITH CTE_COL
AS
(
select idColaborador,count(1) as total from tb_ContactoCliente
group by idColaborador--CI
) 
select 
CONCAT(nombreColaborador,'',apellidoColaborador) as [Nombre Completo],
r.nombreRol as [Rol],
t.nombreTipoDocumento as [Tipo Documento],
ISNULL(tc.total,0) as [Total Contactabilidad]
from tb_Colaborador c
left join tb_Rol r on c.idRol=r.idRol
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
left join CTE_COL tc on c.idColaborador=tc.idColaborador

--3 Uso de Vistas
alter view dbo.vCliente
as
select nombreCliente,apellidosCliente,emailCliente,direccionCliente from tb_Cliente

select * from dbo.vCliente

--4 Uso de Vistas con CTE
create view dbo.vColaborador
AS
WITH CTE_COL
AS
(
select idColaborador,count(1) as total from tb_ContactoCliente
group by idColaborador--CI
) 
select 
CONCAT(nombreColaborador,'',apellidoColaborador) as [Nombre Completo],
r.nombreRol as [Rol],
t.nombreTipoDocumento as [Tipo Documento],
ISNULL(tc.total,0) as [Total Contactabilidad]
from tb_Colaborador c
left join tb_Rol r on c.idRol=r.idRol
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
left join CTE_COL tc on c.idColaborador=tc.idColaborador

select * from dbo.tb_Colaborador
select * from dbo.vColaborador

--5

--create function dbo.fnResxCli(@idCliente int,@fecultcontacto varchar(8))
alter function dbo.fnResxCli(@idCliente int,@fecultcontacto varchar(8))
returns table
as
return
	select 
	concat(nombreCliente,'',apellidosCliente) as [Nombre Completo],
	cat.nombreCategoria as [Categoría],
	isnull(totales.total,0) as [Total Colaboradores],
	ISNULL(convert(varchar(8),totales.max,112),'') as [Fecha Último Contacto]
	from tb_Cliente cte
	inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
	left join 
	(
	select idCliente,count(distinct idColaborador) as total,max(distinct fechaContactoCliente) as max
	from tb_ContactoCliente
	group by idCliente
	) totales on cte.idCliente=totales.idCliente
	where cte.idCliente=@idCliente and ISNULL(convert(varchar(8),totales.max,112),'')>=@fecultcontacto

select * from dbo.fnResxCli(10,'20190330')

--6 Transformar la pregunta 05 de la parte 01 a función de tabla que acepte como
--parámetro el id de colaborador (Lineas 56-70)
create function dbo.fnCol(@idcolaborador int) returns table
return
	select 
	CONCAT(nombreColaborador,'',apellidoColaborador) as [Nombre Completo],
	r.nombreRol as [Rol],
	t.nombreTipoDocumento as [Tipo Documento],
	ISNULL(tc.total,0) as [Total Contactabilidad]
	from tb_Colaborador c
	left join tb_Rol r on c.idRol=r.idRol
	inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
	left join
	(
	select idColaborador,count(1) as total from tb_ContactoCliente
	group by idColaborador--CI
	) tc on c.idColaborador=tc.idColaborador
	where c.idColaborador=@idcolaborador

select * from dbo.fnCol(1)
select * from dbo.fnCol(5)
select * from dbo.fnCol(6)

--7 
--# Tabla temporal local
--## Tabla temporal global
select object_id('tempdb..##tt_colaborador')

if object_id('tempdb..##tt_colaborador') is not null
begin
	drop table tempdb..##tt_colaborador
end

select 
	CONCAT(nombreColaborador,'',apellidoColaborador) as [Nombre Completo],
	r.nombreRol as [Rol],
	t.nombreTipoDocumento as [Tipo Documento],
	ISNULL(tc.total,0) as [Total Contactabilidad]
into tempdb..##tt_colaborador
	from tb_Colaborador c
	left join tb_Rol r on c.idRol=r.idRol
	inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
	left join
	(
	select idColaborador,count(1) as total from tb_ContactoCliente
	group by idColaborador--CI
	) tc on c.idColaborador=tc.idColaborador