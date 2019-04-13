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