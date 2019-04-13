--8

create procedure dbo.usp_selPersonas
as
begin
	select nombreCliente,apellidosCliente,t.nombreTipoDocumento,c.numeroDocumentoCliente
	from tb_Cliente c 
	inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
	inner join tb_ContactoCliente cc on c.idCliente=cc.idCliente
	union
	select nombreColaborador,apellidoColaborador,t.nombreTipoDocumento,c.numeroDocumentoColaborador
	from tb_Colaborador c 
	inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
	inner join tb_ContactoCliente cc on c.idColaborador=cc.idColaborador
end

execute dbo.usp_selPersonas
sp_helptext 'usp_selPersonas'--Definici�n de un procedimiento
sp_rename 'usp_selPersonas','usp_selRepPersonas'--Renombrar procedimiento almacenado

--9

alter function dbo.fnTopProducto(@idProducto int) --Cambi� p.idProducto por @idProducto
returns table
return
select top 3 concat(c.nombreCliente,' ',c.apellidosCliente) as cliente,c.idUbigeo,u.poblacion
from tb_ContactoCliente cc
inner join tb_Cliente c on cc.idCliente=c.idCliente
left join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where idProducto=@idProducto--enlace x+y
order by u.poblacion desc

create procedure dbo.usp_selTopProducto
as
select p.nombreProducto,tp.cliente,tp.idUbigeo,tp.poblacion from tb_Producto p
cross apply dbo.fnTopProducto(p.idProducto) tp

execute dbo.usp_selTopProducto

--10
alter procedure usp_selResPorDpto(@departamento varchar(100))
as
select distinct
departamento,
max(poblacion) OVER(PARTITION BY departamento) as maxdpto,--Corta por departamento y obten la m�xima poblaci�n
min(poblacion) OVER(PARTITION BY departamento) as mindpto,--Corta por departamento y obten la m�nima poblaci�n
avg(poblacion) OVER(PARTITION BY departamento) as avgdpto--Corta por departamento y obten el promedio poblaci�n
from tb_Ubigeo u
where departamento=@departamento

execute usp_selResPorDpto @departamento='Lima'