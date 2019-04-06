--1

select nombreCliente,apellidosCliente,t.nombreTipoDocumento,c.numeroDocumentoCliente
from tb_Cliente c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
union
select nombreColaborador,apellidoColaborador,t.nombreTipoDocumento,c.numeroDocumentoColaborador
from tb_Colaborador c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento

--1.1

select persona.nombres,persona.apellidos
from
(
select nombreCliente as nombres,apellidosCliente as apellidos,t.nombreTipoDocumento,c.numeroDocumentoCliente
from tb_Cliente c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
union
select nombreColaborador as nombres,apellidoColaborador as apellidos,t.nombreTipoDocumento,c.numeroDocumentoColaborador
from tb_Colaborador c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
) persona

--1.2 Mostrar los nombres y apellidos de personas indicando a que tabla pertenecen y además, 
--mostrar un registro con los datos 'NN' como nombres, 'NN' como apellidos y que no pertenece a 
--ninguna tabla.
select nombreCliente as nombres,apellidosCliente as apellidos,'tb_Cliente' as tabla
from tb_Cliente
union
select nombreColaborador as nombres,apellidoColaborador as apellidos,'tb_Colaborador' as tabla
from tb_Colaborador
union
select 'NN' as nombres,'NN' as apellidos,'Ninguno' as tabla

--1.3 Con CTE
WITH CTE_personas
AS
(
select nombreCliente as nombres,apellidosCliente as apellidos,'tb_Cliente' as tabla
from tb_Cliente
union
select nombreColaborador as nombres,apellidoColaborador as apellidos,'tb_Colaborador' as tabla
from tb_Colaborador
union
select 'NN' as nombres,'NN' as apellidos,'Ninguno' as tabla
)
Select nombres, apellidos, tabla from CTE_personas

--1.4 Con función de valor tabla
create function dbo.fnPersonas() returns table
as
return
WITH CTE_personas
AS
(
select nombreCliente as nombres,apellidosCliente as apellidos,'tb_Cliente' as tabla
from tb_Cliente
union
select nombreColaborador as nombres,apellidoColaborador as apellidos,'tb_Colaborador' as tabla
from tb_Colaborador
union
select 'NN' as nombres,'NN' as apellidos,'Ninguno' as tabla
)
Select nombres, apellidos, tabla from CTE_personas

select * from dbo.fnPersonas()