--Semana 07
--JSON AUTO: Tabular->JSON (SQL SERVER propone la estructura del JSON)
--1.Obtener los ubigeos con problación entre 10,000 y 20,000 en formato JSON.
--NOTA: Usted no debe proponer la estructura
select departamento, provincia, distrito, poblacion
from tb_Ubigeo
where poblacion between 10000 and 20000
for json auto,root('ubigeos')--Origen a ubigeos

--2.Obtener el nombre, apellidos, email para aquellos clientes de genero masculino
--en formato JSON.
--NOTA:Debe mostrarse para cualquier resultado la columna emailCliente
select nombreCliente,apellidosCliente,emailCliente
from tb_Cliente
where generoCliente='M'
for json auto,
--root('clientes'),--Origen a clientes
include_null_values,--Mostrar inclusive sea nulo
WITHOUT_ARRAY_WRAPPER--Mostrar los resultados como un objeto y no como arreglo

--3.Obtener el nombre, apellidos, email para aquellos clientes de genero masculino
--así como el departamento, provincia y distrito de su ubigeo en formato JSON.
--NOTA:Debe mostrarse para cualquier resultado la columna emailCliente
select nombreCliente,apellidosCliente,emailCliente,departamento,provincia,distrito
from tb_Cliente cliente
inner join tb_Ubigeo ubigeo on cliente.idUbigeo=ubigeo.idUbigeo
where generoCliente='M'
for json auto

--JSON PATH: Mayor control a través de definición de padres e hijos
--[Padre.Hijo]
select 
nombreCliente as [cliente.persona.nombres],
apellidosCliente as [cliente.persona.apellidos],
emailCliente as [cliente.email],
departamento as [ubigeo.departamento],
provincia as [ubigeo.provincia],
distrito as [ubigeo.distrito],
t.idTipoDocumento as [tipo.id],
t.nombreTipoDocumento as [tipo.nombre]
from tb_Cliente cliente
inner join tb_Ubigeo ubigeo on cliente.idUbigeo=ubigeo.idUbigeo
inner join tb_TipoDocumento t on cliente.idTipoDocumento=t.idTipoDocumento
where generoCliente='M'
for json path