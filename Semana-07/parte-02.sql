--Parte 02

--1
create function dbo.fnDatosSemana(@idSemanaPlan int) returns table
return
select nombreSemanaPlan,fechaInicio,fechaFin,estadoSemanaPlan
from dbo.tb_SemanaPlanificada
where idSemanaPlan=@idSemanaPlan

select nombreSemanaPlan,fechaInicio,fechaFin,estadoSemanaPlan 
from dbo.fnDatosSemana(1)
for json auto,root('MisSemanas')

--2
create function dbo.fnConsultarMeta(@idRol int, @idSemanaPlan int) returns table
return
select r.nombreRol,s.nombreSemanaPlan,p.nombreProducto,m.totalMeta 
from tb_Meta m
inner join tb_Rol r on m.idRol=r.idRol
inner join tb_SemanaPlanificada s on m.idSemanaPlan=s.idSemanaPlan
inner join tb_Producto p on m.idProducto=p.idProducto
where m.idRol=@idRol and m.idSemanaPlan=@idSemanaPlan

select * from dbo.fnConsultarMeta(3,1)
for json auto, root('MisMetas')

--3
--3.1

if object_id('tempdb..##tt_cliente') is not null
begin
	drop table tempdb..##tt_cliente
end

select idCliente,nombreCliente,apellidosCliente,c.idUbigeo 
into ##tt_cliente
from tb_Cliente c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where u.departamento='lima'
--for json auto (No permitido)

select * from ##tt_cliente
for json auto, root('Clientes'),include_null_values

--3.2

WITH CTE_clientes AS
(
select idCliente,nombreCliente,apellidosCliente,c.idUbigeo 
from tb_Cliente c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where u.departamento='lima'
)
select * from CTE_clientes
for json auto,include_null_values,without_array_wrapper

--4

--4.1
if object_id('tempdb..##tt_colaboradores') is not null
begin
	drop table tempdb..##tt_colaboradores
end

select idColaborador,nombreColaborador,apellidoColaborador,c.idUbigeo 
into ##tt_colaboradores
from tb_Colaborador c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where u.departamento='lima'
--for json auto (No permitido)

select * from ##tt_colaboradores
for json auto, root('Colaboradores')

--4.2

WITH CTE_colaboradores AS
(
select idColaborador,nombreColaborador,apellidoColaborador,c.idUbigeo 
from tb_Colaborador c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where u.departamento='lima'
)
select * from CTE_colaboradores
for json auto,include_null_values,without_array_wrapper

--5

select 
nombreColaborador as [Persona.Nombres],
apellidoColaborador as [Persona.Apellidos],
c.numeroDocumentoColaborador as [Documento.Numero],
t.nombreTipoDocumento as [Documento.Tipo],
u.departamento as [Ubigeo.departamento],
u.provincia as [Ubigeo.provincia],
u.distrito as [Ubigeo.distrito]
from tb_Colaborador c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
where u.departamento='lima'
for json path