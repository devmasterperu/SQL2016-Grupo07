--FOR XML RAW
select nombreSemanaPlan,fechaInicio,fechaFin,estadoSemanaPlan
from dbo.tb_SemanaPlanificada
for xml raw('semana'),root('semanas')--resultados como atributos

select nombreSemanaPlan,fechaInicio,fechaFin,estadoSemanaPlan
from dbo.tb_SemanaPlanificada
for xml raw('semana'),root('semanas'),elements--resultados como elementos padre e hijo

--6

select idColaborador,nombreColaborador,apellidoColaborador,c.idUbigeo 
from tb_Colaborador c
inner join tb_Ubigeo u on c.idUbigeo=u.idUbigeo
where u.departamento='lima'
--6.1
--for xml raw, elements
--6.2
--for xml raw
--6.3
--for xml raw, root('colaboradores')

--FOR XML AUTO
select cliente.idCliente,
contacto.fechaContactoCliente,
contacto.idColaborador,
contacto.idProducto
from tb_Cliente cliente
inner join tb_ContactoCliente contacto on cliente.idCliente=contacto.idCliente
for xml auto,root('clientes')

select cliente.idCliente,
contacto.fechaContactoCliente,
contacto.idColaborador,
contacto.idProducto
from tb_ContactoCliente  contacto
inner join tb_Cliente  cliente on cliente.idCliente=contacto.idCliente
for xml auto,root('clientes')

select 
contacto.fechaContactoCliente,
contacto.idColaborador,
contacto.idProducto,
cliente.idCliente
from tb_ContactoCliente  contacto
inner join tb_Cliente  cliente on cliente.idCliente=contacto.idCliente
for xml auto,root('clientes')

select 
contacto.fechaContactoCliente,
contacto.idColaborador,
cliente.idCliente,
contacto.idProducto
from tb_ContactoCliente  contacto
inner join tb_Cliente  cliente on cliente.idCliente=contacto.idCliente
for xml auto,root('clientes')

--7
--alter view vMetas
--as
select r.nombreRol,s.nombreSemanaPlan,p.nombreProducto,m.totalMeta 
from tb_Meta m
inner join tb_Rol r on m.idRol=r.idRol
inner join tb_SemanaPlanificada s on m.idSemanaPlan=s.idSemanaPlan
inner join tb_Producto p on m.idProducto=p.idProducto
for xml auto, root('metas')

--XML PATH
select 
r.nombreRol as '@rol',--regla 1
m.totalMeta as 'semana/@totalMeta',--regla 1+regla 3
s.nombreSemanaPlan as 'semana/@nombre',
p.nombreProducto as 'semana/producto',--regla 3,
p.estadoProducto --regla 2
from tb_Meta m
inner join tb_Rol r on m.idRol=r.idRol
inner join tb_SemanaPlanificada s on m.idSemanaPlan=s.idSemanaPlan
inner join tb_Producto p on m.idProducto=p.idProducto
for XML path('meta')




