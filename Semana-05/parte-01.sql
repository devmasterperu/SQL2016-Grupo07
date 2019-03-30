--Semana 05
--1 Totales utilizando un solo SELECT

--CE
SELECT
(select count(1)  from tb_Producto)as totPdto, --CI1
(select count(1)  from tb_Cliente) as totCte,  --CI2
(select count(1)  from tb_ContactoCliente)as totCon --CI3

--2 Totales utilizando un solo SELECT+CASE
SELECT
(select count(1)  from tb_Colaborador)as totCol, --CI1
(select count(1)  from tb_Colaborador where idRol=1)as totColGte, --CI2
(select count(1)  from tb_Colaborador where idRol=2)as totColSub, --CI3
(select count(1)  from tb_Colaborador where idRol not in (1,2)) as totOtros, --CI4
CASE WHEN 
(select count(1)  from tb_Colaborador where idRol not in (1,2))>=0 AND 
(select count(1)  from tb_Colaborador where idRol not in (1,2))<5 THEN '[0-5>'
ELSE '[5-+>' 
END as Mensaje

--3 
select count(1) from tb_ContactoCliente where idProducto=1
select count(1) from tb_ContactoCliente where idProducto=2
select count(1) from tb_ContactoCliente where idProducto=3

--CE
select nombreProducto as Producto, 
(select count(1) from tb_ContactoCliente c where c.idProducto=p.idProducto) as [Total Contactabilidad],--CI
case 
when (select count(1) from tb_ContactoCliente c where c.idProducto=p.idProducto)=0 then 'Sin Contactabilidad'
else ''
end as mensaje
from tb_Producto p
where estadoProducto=1

--4
--CI
select count(1) from tb_Colaborador where idTipoDocumento=1
select count(1) from tb_Colaborador where idTipoDocumento=2
select count(1) from tb_Colaborador where idTipoDocumento=3

select 
nombreTipoDocumento as [Tipo Documento],
(select count(1) from tb_Colaborador c where c.idTipoDocumento=t.idTipoDocumento) as [Total x Tipo],--CI1
(select count(1) from tb_Colaborador c) as [Total]--CI2
from tb_TipoDocumento t

--5  
--Subconsulta dentro del FROM
--Subconsulta dentro del SELECT
--CI
select idColaborador,count(1) as total from tb_ContactoCliente
group by idColaborador

--CE
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

--6

--Modo 1
--CI 1 (Total colaboradores diferentes por cliente)
select idCliente,count(distinct idColaborador) as totcol
from tb_ContactoCliente
group by idCliente
--CI 2 (Último contacto por cliente)
select idCliente,max(distinct fechaContactoCliente) as totcol
from tb_ContactoCliente
group by idCliente

select 
concat(nombreCliente,'',apellidosCliente) as [Nombre Completo],
cat.nombreCategoria as [Categoría],
isnull(totcte.totcol,0) as [Total Colaboradores],
ISNULL(convert(varchar(8),maxcte.fecultcto,112),'') as [Fecha Último Contacto]
from tb_Cliente cte
inner join tb_Categoria cat on cte.idCategoria=cat.idCategoria
left join 
(
select idCliente,count(distinct idColaborador) as totcol
from tb_ContactoCliente
group by idCliente
) totcte on cte.idCliente=totcte.idCliente
left join 
(
select idCliente,max(distinct fechaContactoCliente) as fecultcto
from tb_ContactoCliente
group by idCliente
) maxcte on cte.idCliente=maxcte.idCliente

--Modo 2

select idCliente,count(distinct idColaborador) as total,max(distinct fechaContactoCliente) as max
from tb_ContactoCliente
group by idCliente

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
