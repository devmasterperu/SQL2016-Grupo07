
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