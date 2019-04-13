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