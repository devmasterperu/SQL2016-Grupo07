--FOR XML RAW
--
select nombreSemanaPlan,fechaInicio,fechaFin,estadoSemanaPlan
from dbo.tb_SemanaPlanificada
for xml raw