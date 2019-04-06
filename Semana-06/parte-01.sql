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

--1.2 Mostrar las personas indicando a que tabla pertenecen