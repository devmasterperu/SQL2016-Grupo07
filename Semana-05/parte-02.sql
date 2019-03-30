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
cat.nombreCategoria as [Categor�a],
isnull(CTE_Totales.total,0) as [Total Colaboradores],
ISNULL(convert(varchar(8),CTE_MAX.maximo,112),'') as [Fecha �ltimo Contacto],
(select count(1) from CTE_Totales) as Total
from tb_Cliente cte
inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
left join CTE_Totales on cte.idCliente=CTE_Totales.idCliente
left join CTE_MAX on cte.idCliente=CTE_MAX.idCliente;
/*
select 
concat(nombreCliente,'',apellidosCliente) as [Nombre Completo],
cat.nombreCategoria as [Categor�a],
isnull(CTE_Totales.total,0) as [Total Colaboradores],
ISNULL(convert(varchar(8),CTE_Totales.max,112),'') as [Fecha �ltimo Contacto],
(select count(1) from CTE_Totales) as Total
from tb_Cliente cte
inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
left join CTE_Totales on cte.idCliente=CTE_Totales.idCliente;
*/

--2

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