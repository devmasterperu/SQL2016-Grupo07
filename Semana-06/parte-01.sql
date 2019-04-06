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

--2

select nombreCliente,apellidosCliente,t.nombreTipoDocumento,c.numeroDocumentoCliente
from tb_Cliente c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
inner join tb_ContactoCliente cc on c.idCliente=cc.idCliente
union
select nombreColaborador,apellidoColaborador,t.nombreTipoDocumento,c.numeroDocumentoColaborador
from tb_Colaborador c 
inner join tb_TipoDocumento t on c.idTipoDocumento=t.idTipoDocumento
inner join tb_ContactoCliente cc on c.idColaborador=cc.idColaborador


--3
INSERT INTO dbo.tb_Ubigeo(idubigeo,distrito,provincia,departamento,poblacion,superficie)
SELECT '010101','Chachapoyas','Chachapoyas','Amazonas',29171,153.78 UNION 
SELECT '010102','Asuncion','Chachapoyas','Amazonas',288,25.71 UNION 
SELECT '010103','Balsas','Chachapoyas','Amazonas',1644,357.09 UNION 
SELECT '010104','Cheto','Chachapoyas','Amazonas',591,56.97 UNION 
SELECT '010105','Chiliquin','Chachapoyas','Amazonas',687,143.43 UNION 
SELECT '010106','Chuquibamba','Chachapoyas','Amazonas',2064,278.63 UNION 
SELECT '010107','Granada','Chachapoyas','Amazonas',379,181.41 UNION 
SELECT '010108','Huancas','Chachapoyas','Amazonas',1329,48.79 UNION 
SELECT '010109','La Jalca','Chachapoyas','Amazonas',5513,380.39 UNION 
SELECT '010110','Leimebamba','Chachapoyas','Amazonas',4206,373.14 UNION 
SELECT '010111','Levanto','Chachapoyas','Amazonas',862,77.54 UNION 
SELECT '010112','Magdalena','Chachapoyas','Amazonas',782,135.47 UNION 
SELECT '010113','Mariscal Castilla','Chachapoyas','Amazonas',986,83.58 UNION 
SELECT '010114','Molinopampa','Chachapoyas','Amazonas',2750,333.86 UNION 
SELECT '010115','Montevideo','Chachapoyas','Amazonas',572,119.01 UNION 
SELECT '010116','Olleros','Chachapoyas','Amazonas',363,125.16 UNION 
SELECT '010117','Quinjalca','Chachapoyas','Amazonas',830,91.59 UNION 
SELECT '010118','San Francisco de Daguas','Chachapoyas','Amazonas',351,47.41 UNION 
SELECT '010119','San Isidro de Maino','Chachapoyas','Amazonas',703,101.67 UNION 
SELECT '010120','Soloco','Chachapoyas','Amazonas',1302,84.48 UNION 
SELECT '010121','Sonche','Chachapoyas','Amazonas',218,113.26 UNION 
SELECT '010201','La Peca','Bagua','Amazonas',8048,144.29 UNION 
SELECT '010202','Aramango','Bagua','Amazonas',10940,809.07 UNION 
SELECT '010203','Copallin','Bagua','Amazonas',6319,99.05 UNION 
SELECT '010204','El Parco','Bagua','Amazonas',1492,18.48 UNION 
SELECT '010205','Bagua','Bagua','Amazonas',26091,150.99 UNION 
SELECT '010206','Imaza','Bagua','Amazonas',24323,4430.84 UNION 
SELECT '010301','Jumbilla','Bongara','Amazonas',1764,154.18 UNION 
SELECT '010302','Corosha','Bongara','Amazonas',1046,45.67 UNION 
SELECT '010303','Cuispes','Bongara','Amazonas',899,110.72 UNION 
SELECT '010304','Chisquilla','Bongara','Amazonas',335,174.96 UNION 
SELECT '010305','Churuja','Bongara','Amazonas',269,33.34 UNION 
SELECT '010306','Florida','Bongara','Amazonas',8663,203.22 UNION 
SELECT '010307','Recta','Bongara','Amazonas',201,24.58 UNION 
SELECT '010308','San Carlos','Bongara','Amazonas',310,100.76 UNION 
SELECT '010309','Shipasbamba','Bongara','Amazonas',1819,127.29 UNION 
SELECT '010310','Valera','Bongara','Amazonas',1281,90.14 UNION 
SELECT '010311','Yambrasbamba','Bongara','Amazonas',8470,1715.96 UNION 
SELECT '010312','Jazan','Bongara','Amazonas',9349,88.83 UNION 
SELECT '010401','Lamud','Luya','Amazonas',2292,69.49 UNION 
SELECT '010402','Camporredondo','Luya','Amazonas',7131,376.01 UNION 
SELECT '010403','Cocabamba','Luya','Amazonas',2517,355.85 UNION 
SELECT '010404','Colcamar','Luya','Amazonas',2263,106.6 UNION 
SELECT '010405','Conila','Luya','Amazonas',2083,256.17 UNION 
SELECT '010406','Inguilpata','Luya','Amazonas',587,118.04 UNION 
SELECT '010407','Longuita','Luya','Amazonas',1161,57.91 UNION 
SELECT '010408','Lonya Chico','Luya','Amazonas',961,83.82 UNION 
SELECT '010409','Luya','Luya','Amazonas',4420,91.21 UNION 
SELECT '010410','Luya Viejo','Luya','Amazonas',489,73.87 UNION 
SELECT '010411','Maria','Luya','Amazonas',945,80.27 UNION 
SELECT '010412','Ocalli','Luya','Amazonas',4259,177.39 UNION 
SELECT '010413','Ocumal','Luya','Amazonas',4194,235.86 UNION 
SELECT '010414','Pisuquia','Luya','Amazonas',6132,306.5 UNION 
SELECT '010415','San Cristobal','Luya','Amazonas',685,33.36 UNION 
SELECT '010416','San Francisco del Yeso','Luya','Amazonas',821,113.94 UNION 
SELECT '010417','San Jeronimo','Luya','Amazonas',880,214.66 UNION 
SELECT '010418','San Juan de Lopecancha','Luya','Amazonas',506,88.02 UNION 
SELECT '010419','Santa Catalina','Luya','Amazonas',1908,126.21 UNION 
SELECT '010420','Santo Tomas','Luya','Amazonas',3537,84.93 UNION 
SELECT '010421','Tingo','Luya','Amazonas',1363,102.67 UNION 
SELECT '010422','Trita','Luya','Amazonas',1378,12.68 UNION 
SELECT '010423','Providencia','Luya','Amazonas',1536,71.22 UNION 
SELECT '010501','San Nicolas','Rodriguez de Mendoza','Amazonas',5290,206.01 UNION 
SELECT '010502','Cochamal','Rodriguez de Mendoza','Amazonas',504,199.44 UNION 
SELECT '010503','Chirimoto','Rodriguez de Mendoza','Amazonas',2079,153 UNION 
SELECT '010504','Huambo','Rodriguez de Mendoza','Amazonas',2542,99.56 UNION 
SELECT '010505','Limabamba','Rodriguez de Mendoza','Amazonas',3049,317.88 UNION 
SELECT '010506','Longar','Rodriguez de Mendoza','Amazonas',1619,66.24 UNION 
SELECT '010507','Milpuc','Rodriguez de Mendoza','Amazonas',599,26.8 UNION 
SELECT '010508','Mariscal Benavides','Rodriguez de Mendoza','Amazonas',1376,176.18 UNION 
SELECT '010509','Omia','Rodriguez de Mendoza','Amazonas',9787,175.13 UNION 
SELECT '010510','Santa Rosa','Rodriguez de Mendoza','Amazonas',457,34.11 UNION 
SELECT '010511','Totora','Rodriguez de Mendoza','Amazonas',448,6.02 UNION 
SELECT '010512','Vista Alegre','Rodriguez de Mendoza','Amazonas',3803,899.02 UNION 
SELECT '010601','Nieva','Condorcanqui','Amazonas',29213,4481.63 UNION 
SELECT '010602','Rio Santiago','Condorcanqui','Amazonas',16986,8035.28 UNION 
SELECT '010603','El Cenepa','Condorcanqui','Amazonas',9620,5458.48 UNION 
SELECT '010701','Bagua Grande','Utcubamba','Amazonas',54033,746.64 UNION 
SELECT '010702','Cajaruro','Utcubamba','Amazonas',28491,1746.23 UNION 
SELECT '010703','Cumba','Utcubamba','Amazonas',8752,292.66 UNION 
SELECT '010704','El Milagro','Utcubamba','Amazonas',6399,313.89 UNION 
SELECT '010705','Jamalca','Utcubamba','Amazonas',8243,357.98 UNION 
SELECT '010706','Lonya Grande','Utcubamba','Amazonas',10443,327.92 UNION 
SELECT '010707','Yamon','Utcubamba','Amazonas',2841,57.61 UNION 
SELECT '020101','Huaraz','Huaraz','Ancash',65663,432.99 UNION 
SELECT '020102','Independencia','Huaraz','Ancash',75559,342.95 UNION 
SELECT '020103','Cochabamba','Huaraz','Ancash',1983,135.65 UNION 
SELECT '020104','Colcabamba','Huaraz','Ancash',826,50.65 UNION 
SELECT '020105','Huanchay','Huaraz','Ancash',2235,209.34 UNION 
SELECT '020106','Jangas','Huaraz','Ancash',5106,59.84 UNION 
SELECT '020107','La Libertad','Huaraz','Ancash',1138,164.26 UNION 
SELECT '020108','Olleros','Huaraz','Ancash',2148,222.91 UNION 
SELECT '020109','Pampas','Huaraz','Ancash',1165,357.81 UNION 
SELECT '020110','Pariacoto','Huaraz','Ancash',4794,162.5 UNION 
SELECT '020111','Pira','Huaraz','Ancash',3755,243.73 UNION 
SELECT '020112','Tarica','Huaraz','Ancash',5936,110.28 UNION 
SELECT '020201','Aija','Aija','Ancash',1841,159.74 UNION 
SELECT '020203','Coris','Aija','Ancash',2270,267.15 UNION 
SELECT '020205','Huacllan','Aija','Ancash',628,37.91 UNION 
SELECT '020206','La Merced','Aija','Ancash',2190,153.08 UNION 
SELECT '020208','Succha','Aija','Ancash',828,78.84 UNION 
SELECT '020301','Chiquian','Bolognesi','Ancash',3587,184.16 UNION 
SELECT '020302','Abelardo Pardo Lezameta','Bolognesi','Ancash',1263,11.31 UNION 
SELECT '020304','Aquia','Bolognesi','Ancash',2465,434.6 UNION 
SELECT '020305','Cajacay','Bolognesi','Ancash',1603,193.06 UNION 
SELECT '020310','Huayllacayan','Bolognesi','Ancash',1076,127.99 UNION 
SELECT '020311','Huasta','Bolognesi','Ancash',2610,387.91 UNION 
SELECT '020313','Mangas','Bolognesi','Ancash',566,115.84 UNION 
SELECT '020315','Pacllon','Bolognesi','Ancash',1771,211.98 UNION 
SELECT '020317','San Miguel de Corpanqui','Bolognesi','Ancash',1298,43.78 UNION 
SELECT '020320','Ticllos','Bolognesi','Ancash',1291,89.41 UNION 
SELECT '020321','Antonio Raymondi','Bolognesi','Ancash',1065,118.7 UNION 
SELECT '020322','Canis','Bolognesi','Ancash',1308,19.45 UNION 
SELECT '020323','Colquioc','Bolognesi','Ancash',4165,274.61 UNION 
SELECT '020324','La Primavera','Bolognesi','Ancash',951,68.61 UNION 
SELECT '020325','Huallanca','Bolognesi','Ancash',8325,873.39 UNION 
SELECT '020401','Carhuaz','Carhuaz','Ancash',15712,194.62 UNION 
SELECT '020402','Acopampa','Carhuaz','Ancash',2685,14.17 UNION 
SELECT '020403','Amashca','Carhuaz','Ancash',1571,11.99 UNION 
SELECT '020404','Anta','Carhuaz','Ancash',2510,40.77 UNION 
SELECT '020405','Ataquero','Carhuaz','Ancash',1353,47.22 UNION 
SELECT '020406','Marcara','Carhuaz','Ancash',9452,157.49 UNION 
SELECT '020407','Pariahuanca','Carhuaz','Ancash',1630,11.74 UNION 
SELECT '020408','San Miguel de Aco','Carhuaz','Ancash',2794,133.89 UNION 
SELECT '020409','Shilla','Carhuaz','Ancash',3318,130.19 UNION 
SELECT '020410','Tinco','Carhuaz','Ancash',3301,15.44 UNION 
SELECT '020411','Yungar','Carhuaz','Ancash',3462,46.43 UNION 
SELECT '020501','Casma','Casma','Ancash',33648,1204.85 UNION 
SELECT '020502','Buena Vista Alta','Casma','Ancash',4250,476.62 UNION 
SELECT '020503','Comandante Noel','Casma','Ancash',2044,222.36 UNION 
SELECT '020505','Yautan','Casma','Ancash',8531,357.2 UNION 
SELECT '020601','Corongo','Corongo','Ancash',1420,143.13 UNION 
SELECT '020602','Aco','Corongo','Ancash',442,56.54 UNION 
SELECT '020603','Bambas','Corongo','Ancash',546,151.13 UNION 
SELECT '020604','Cusca','Corongo','Ancash',2985,411.55 UNION 
SELECT '020605','La Pampa','Corongo','Ancash',1004,93.94 UNION 
SELECT '020606','Yanac','Corongo','Ancash',704,45.85 UNION 
SELECT '020607','Yupan','Corongo','Ancash',1041,85.87 UNION 
SELECT '020701','Caraz','Huaylas','Ancash',26740,246.52 UNION 
SELECT '020702','Huallanca','Huaylas','Ancash',686,178.8 UNION 
SELECT '020703','Huata','Huaylas','Ancash',1638,70.69 UNION 
SELECT '020704','Huaylas','Huaylas','Ancash',1421,56.89 UNION 
SELECT '020705','Mato','Huaylas','Ancash',2003,107.12 UNION 
SELECT '020706','Pamparomas','Huaylas','Ancash',9268,496.35 UNION 
SELECT '020707','Pueblo Libre','Huaylas','Ancash',7246,130.99 UNION 
SELECT '020708','Santa Cruz','Huaylas','Ancash',5236,357.7 UNION 
SELECT '020709','Yuracmarca','Huaylas','Ancash',1760,565.7 UNION 
SELECT '020710','Santo Toribio','Huaylas','Ancash',1056,82.02 UNION 
SELECT '020801','Huari','Huari','Ancash',10423,398.91 UNION 
SELECT '020802','Cajay','Huari','Ancash',2552,159.35 UNION 
SELECT '020803','Chavin de Huantar','Huari','Ancash',9251,434.13 UNION 
SELECT '020804','Huacachi','Huari','Ancash',1826,86.7 UNION 
SELECT '020805','Huachis','Huari','Ancash',3466,153.89 UNION 
SELECT '020806','Huacchis','Huari','Ancash',2079,72.16 UNION 
SELECT '020807','Huantar','Huari','Ancash',3058,156.15 UNION 
SELECT '020808','Masin','Huari','Ancash',1652,75.33 UNION 
SELECT '020809','Paucas','Huari','Ancash',1827,135.31 UNION 
SELECT '020810','Ponto','Huari','Ancash',3333,118.29 UNION 
SELECT '020811','Rahuapampa','Huari','Ancash',814,9.02 UNION 
SELECT '020812','Rapayan','Huari','Ancash',1800,143.34 UNION 
SELECT '020813','San Marcos','Huari','Ancash',15094,556.75 UNION 
SELECT '020814','San Pedro de Chana','Huari','Ancash',2850,138.65 UNION 
SELECT '020815','Uco','Huari','Ancash',1668,53.61 UNION 
SELECT '020816','Anra','Huari','Ancash',1581,80.31 UNION 
SELECT '020901','Piscobamba','Mariscal Luzuriaga','Ancash',3799,45.93 UNION 
SELECT '020902','Casca','Mariscal Luzuriaga','Ancash',4534,77.38 UNION 
SELECT '020903','Lucma','Mariscal Luzuriaga','Ancash',3262,77.37 UNION 
SELECT '020904','Fidel Olivas Escudero','Mariscal Luzuriaga','Ancash',2242,204.82 UNION 
SELECT '020905','Llama','Mariscal Luzuriaga','Ancash',1223,48.13 UNION 
SELECT '020906','Llumpa','Mariscal Luzuriaga','Ancash',6435,143.27 UNION 
SELECT '020907','Musga','Mariscal Luzuriaga','Ancash',1014,39.72 UNION 
SELECT '020908','Eleazar Guzman Barron','Mariscal Luzuriaga','Ancash',1381,93.96 UNION 
SELECT '021001','Cabana','Pallasca','Ancash',2715,150.29 UNION 
SELECT '021002','Bolognesi','Pallasca','Ancash',1293,86.88 UNION 
SELECT '021003','Conchucos','Pallasca','Ancash',8458,585.24 UNION 
SELECT '021004','Huacaschuque','Pallasca','Ancash',563,63.59 UNION 
SELECT '021005','Huandoval','Pallasca','Ancash',1123,116 UNION 
SELECT '021006','Lacabamba','Pallasca','Ancash',559,64.68 UNION 
SELECT '021007','Llapo','Pallasca','Ancash',732,28.69 UNION 
SELECT '021008','Pallasca','Pallasca','Ancash',2417,59.77 UNION 
SELECT '021009','Pampas','Pallasca','Ancash',8780,438.18 UNION 
SELECT '021010','Santa Rosa','Pallasca','Ancash',1038,298.77 UNION 
SELECT '021011','Tauca','Pallasca','Ancash',3170,209.12 UNION 
SELECT '021101','Pomabamba','Pomabamba','Ancash',16631,347.92 UNION 
SELECT '021102','Huayllan','Pomabamba','Ancash',3668,88.97 UNION 
SELECT '021103','Parobamba','Pomabamba','Ancash',7016,331.1 UNION 
SELECT '021104','Quinuabamba','Pomabamba','Ancash',2390,146.06 UNION 
SELECT '021201','Recuay','Recuay','Ancash',4372,142.96 UNION 
SELECT '021202','Cotaparaco','Recuay','Ancash',648,172.85 UNION 
SELECT '021203','Huayllapampa','Recuay','Ancash',1339,105.29 UNION 
SELECT '021204','Marca','Recuay','Ancash',969,184.84 UNION 
SELECT '021205','Pampas Chico','Recuay','Ancash',2109,100.51 UNION 
SELECT '021206','Pararin','Recuay','Ancash',1403,254.85 UNION 
SELECT '021207','Tapacocha','Recuay','Ancash',452,81.23 UNION 
SELECT '021208','Ticapampa','Recuay','Ancash',2232,142.29 UNION 
SELECT '021209','Llacllin','Recuay','Ancash',1872,101.1 UNION 
SELECT '021210','Catac','Recuay','Ancash',4038,1018.27 UNION 
SELECT '021301','Chimbote','Santa','Ancash',216037,1461.44 UNION 
SELECT '021302','Caceres del Peru','Santa','Ancash',4865,549.78 UNION 
SELECT '021303','Macate','Santa','Ancash',3325,584.65 UNION 
SELECT '021304','Moro','Santa','Ancash',7545,359.35 UNION 
SELECT '021305','Nepeña','Santa','Ancash',15949,458.24 UNION 
SELECT '021306','Samanco','Santa','Ancash',4676,153.98 UNION 
SELECT '021307','Santa','Santa','Ancash',21041,42.23 UNION 
SELECT '021308','Coishco','Santa','Ancash',16057,9.21 UNION 
SELECT '021309','Nuevo Chimbote','Santa','Ancash',157211,389.73 UNION 
SELECT '021401','Sihuas','Sihuas','Ancash',5750,43.81 UNION 
SELECT '021402','Alfonso Ugarte','Sihuas','Ancash',762,80.71 UNION 
SELECT '021403','Chingalpo','Sihuas','Ancash',1034,173.2 UNION 
SELECT '021404','Huayllabamba','Sihuas','Ancash',3982,287.58 UNION 
SELECT '021405','Quiches','Sihuas','Ancash',2958,146.98 UNION 
SELECT '021406','Sicsibamba','Sihuas','Ancash',1808,86 UNION 
SELECT '021407','Acobamba','Sihuas','Ancash',2234,153.04 UNION 
SELECT '021408','Cashapampa','Sihuas','Ancash',2833,66.96 UNION 
SELECT '021409','Ragash','Sihuas','Ancash',2613,208.45 UNION 
SELECT '021410','San Juan','Sihuas','Ancash',6568,209.24 UNION 
SELECT '021501','Yungay','Yungay','Ancash',22323,276.68 UNION 
SELECT '021502','Cascapara','Yungay','Ancash',2332,138.32 UNION 
SELECT '021503','Mancos','Yungay','Ancash',6954,64.05 UNION 
SELECT '021504','Matacoto','Yungay','Ancash',1666,43.65 UNION 
SELECT '021505','Quillo','Yungay','Ancash',14134,373.83 UNION 
SELECT '021506','Ranrahirca','Yungay','Ancash',2690,22.89 UNION 
SELECT '021507','Shupluy','Yungay','Ancash',2412,162.21 UNION 
SELECT '021508','Yanama','Yungay','Ancash',6986,279.85 UNION 
SELECT '021601','Llamellin','Antonio Raymondi','Ancash',3552,90.82 UNION 
SELECT '021602','Aczo','Antonio Raymondi','Ancash',2130,69.03 UNION 
SELECT '021603','Chaccho','Antonio Raymondi','Ancash',1670,73.99 UNION 
SELECT '021604','Chingas','Antonio Raymondi','Ancash',1909,48.95 UNION 
SELECT '021605','Mirgas','Antonio Raymondi','Ancash',5370,175.69 UNION 
SELECT '021606','San Juan de Rontoy','Antonio Raymondi','Ancash',1648,103.13 UNION 
SELECT '021701','San Luis','Carlos Fermin Fitzca','Ancash',12689,256.45 UNION 
SELECT '021702','Yauya','Carlos Fermin Fitzca','Ancash',5591,170.41 UNION 
SELECT '021703','San Nicolas','Carlos Fermin Fitzca','Ancash',3690,197.39 UNION 
SELECT '021801','Chacas','Asuncion','Ancash',5619,447.69 UNION 
SELECT '021802','Acochaca','Asuncion','Ancash',3130,80.97 UNION 
SELECT '021901','Huarmey','Huarmey','Ancash',24856,2894.38 UNION 
SELECT '021902','Cochapeti','Huarmey','Ancash',747,100.02 UNION 
SELECT '021903','Huayan','Huarmey','Ancash',1064,58.99 UNION 
SELECT '021904','Malvas','Huarmey','Ancash',905,219.52 UNION 
SELECT '021905','Culebras','Huarmey','Ancash',3758,630.25 UNION 
SELECT '022001','Acas','Ocros','Ancash',1057,252.48 UNION 
SELECT '022002','Cajamarquilla','Ocros','Ancash',600,75.52 UNION 
SELECT '022003','Carhuapampa','Ocros','Ancash',841,109.78 UNION 
SELECT '022004','Cochas','Ocros','Ancash',1486,408.66 UNION 
SELECT '022005','Congas','Ocros','Ancash',1223,130.03 UNION 
SELECT '022006','Llipa','Ocros','Ancash',1814,33.69 UNION 
SELECT '022007','Ocros','Ocros','Ancash',1003,230.55 UNION 
SELECT '022008','San Cristobal de Rajan','Ocros','Ancash',639,67.75 UNION 
SELECT '022009','San Pedro','Ocros','Ancash',2044,531.21 UNION 
SELECT '022010','Santiago de Chilcas','Ocros','Ancash',383,85.76 UNION 
SELECT '030101','Abancay','Abancay','Apurimac',56871,313.07 UNION 
SELECT '030102','Circa','Abancay','Apurimac',2515,641.68 UNION 
SELECT '030103','Curahuasi','Abancay','Apurimac',18422,817.98 UNION 
SELECT '030104','Chacoche','Abancay','Apurimac',1226,186.1 UNION 
SELECT '030105','Huanipaca','Abancay','Apurimac',4770,432.62 UNION 
SELECT '030106','Lambrama','Abancay','Apurimac',5577,521.62 UNION 
SELECT '030107','Pichirhua','Abancay','Apurimac',4028,370.69 UNION 
SELECT '030108','San Pedro de Cachora','Abancay','Apurimac',3864,108.77 UNION 
SELECT '030109','Tamburco','Abancay','Apurimac',9894,54.6 UNION 
SELECT '030201','Chalhuanca','Aymaraes','Apurimac',5098,322.34 UNION 
SELECT '030202','Capaya','Aymaraes','Apurimac',1013,77.75 UNION 
SELECT '030203','Caraybamba','Aymaraes','Apurimac',1497,234.91 UNION 
SELECT '030204','Colcabamba','Aymaraes','Apurimac',959,95.75 UNION 
SELECT '030205','Cotaruse','Aymaraes','Apurimac',5444,1749.83 UNION 
SELECT '030206','Chapimarca','Aymaraes','Apurimac',2139,213.09 UNION 
SELECT '030207','Huayllo','Aymaraes','Apurimac',739,72.89 UNION 
SELECT '030208','Lucre','Aymaraes','Apurimac',2141,110.48 UNION 
SELECT '030209','Pocohuanca','Aymaraes','Apurimac',1154,82.55 UNION 
SELECT '030210','Sañayca','Aymaraes','Apurimac',1455,448.91 UNION 
SELECT '030211','Soraya','Aymaraes','Apurimac',824,43.56 UNION 
SELECT '030212','Tapairihua','Aymaraes','Apurimac',2252,163.73 UNION 
SELECT '030213','Tintay','Aymaraes','Apurimac',3213,136.58 UNION 
SELECT '030214','Toraya','Aymaraes','Apurimac',2005,173.05 UNION 
SELECT '030215','Yanaca','Aymaraes','Apurimac',1169,103.88 UNION 
SELECT '030216','San Juan de Chacña','Aymaraes','Apurimac',833,86.13 UNION 
SELECT '030217','Justo Apu Sahuaraura','Aymaraes','Apurimac',1340,97.64 UNION 
SELECT '030301','Andahuaylas','Andahuaylas','Apurimac',46760,174.11 UNION 
SELECT '030302','Andarapa','Andahuaylas','Apurimac',6335,172.05 UNION 
SELECT '030303','Chiara','Andahuaylas','Apurimac',1323,148.92 UNION 
SELECT '030304','Huancarama','Andahuaylas','Apurimac',7408,153.04 UNION 
SELECT '030305','Huancaray','Andahuaylas','Apurimac',4617,112.2 UNION 
SELECT '030306','Kishuara','Andahuaylas','Apurimac',9356,309.91 UNION 
SELECT '030307','Pacobamba','Andahuaylas','Apurimac',4676,245.9 UNION 
SELECT '030308','Pampachiri','Andahuaylas','Apurimac',2820,602.5 UNION 
SELECT '030309','San Antonio de Cachi','Andahuaylas','Apurimac',3183,178.78 UNION 
SELECT '030310','San Jeronimo','Andahuaylas','Apurimac',29017,237.42 UNION 
SELECT '030311','Talavera','Andahuaylas','Apurimac',18478,148.12 UNION 
SELECT '030312','Turpo','Andahuaylas','Apurimac',4152,121.67 UNION 
SELECT '030313','Pacucha','Andahuaylas','Apurimac',9833,170.39 UNION 
SELECT '030314','Pomacocha','Andahuaylas','Apurimac',1048,129.19 UNION 
SELECT '030315','Santa Maria de Chicmo','Andahuaylas','Apurimac',9864,162.14 UNION 
SELECT '030316','Tumay Huaraca','Andahuaylas','Apurimac',2448,446.71 UNION 
SELECT '030317','Huayana','Andahuaylas','Apurimac',1060,96.87 UNION 
SELECT '030318','San Miguel de Chaccrampa','Andahuaylas','Apurimac',2080,83.37 UNION 
SELECT '030319','Kaquiabamba','Andahuaylas','Apurimac',3006,97.79 UNION 
SELECT '030401','Antabamba','Antabamba','Apurimac',3185,603.76 UNION 
SELECT '030402','El Oro','Antabamba','Apurimac',548,68.81 UNION 
SELECT '030403','Huaquirca','Antabamba','Apurimac',1568,337.6 UNION 
SELECT '030404','Juan Espinoza Medrano','Antabamba','Apurimac',2044,623.22 UNION 
SELECT '030405','Oropesa','Antabamba','Apurimac',3127,1180.12 UNION 
SELECT '030406','Pachaconas','Antabamba','Apurimac',1291,226.73 UNION 
SELECT '030407','Sabaino','Antabamba','Apurimac',1657,178.77 UNION 
SELECT '030501','Tambobamba','Cotabambas','Apurimac',11793,722.23 UNION 
SELECT '030502','Coyllurqui','Cotabambas','Apurimac',8629,418.95 UNION 
SELECT '030503','Cotabambas','Cotabambas','Apurimac',4274,331.96 UNION 
SELECT '030504','Haquira','Cotabambas','Apurimac',11908,475.46 UNION 
SELECT '030505','Mara','Cotabambas','Apurimac',6718,224.17 UNION 
SELECT '030506','Challhuahuacho','Cotabambas','Apurimac',9998,439.96 UNION 
SELECT '030601','Chuquibambilla','Grau','Apurimac',5410,432.5 UNION 
SELECT '030602','Curpahuasi','Grau','Apurimac',2320,293.42 UNION 
SELECT '030603','Huayllati','Grau','Apurimac',1654,110.75 UNION 
SELECT '030604','Mamara','Grau','Apurimac',973,66.21 UNION 
SELECT '030605','Gamarra','Grau','Apurimac',3890,370.45 UNION 
SELECT '030606','Micaela Bastidas','Grau','Apurimac',1689,110.14 UNION 
SELECT '030607','Progreso','Grau','Apurimac',3342,254.59 UNION 
SELECT '030608','Pataypampa','Grau','Apurimac',1127,158.91 UNION 
SELECT '030609','San Antonio','Grau','Apurimac',358,24.12 UNION 
SELECT '030610','Turpay','Grau','Apurimac',746,52.34 UNION 
SELECT '030611','Vilcabamba','Grau','Apurimac',1402,7.97 UNION 
SELECT '030612','Virundo','Grau','Apurimac',1305,117.19 UNION 
SELECT '030613','Santa Rosa','Grau','Apurimac',700,36.16 UNION 
SELECT '030614','Curasco','Grau','Apurimac',1624,139.77 UNION 
SELECT '030701','Chincheros','Chincheros','Apurimac',6998,132.4 UNION 
SELECT '030702','Ongoy','Chincheros','Apurimac',3812,118.69 UNION 
SELECT '030703','Ocobamba','Chincheros','Apurimac',8331,58.2 UNION 
SELECT '030704','Cocharcas','Chincheros','Apurimac',2742,109.9 UNION 
SELECT '030705','Anco_Huallo','Chincheros','Apurimac',12627,38.9 UNION 
SELECT '030706','Huaccana','Chincheros','Apurimac',9142,472.12 UNION 
SELECT '030707','Uranmarca','Chincheros','Apurimac',3748,148.73 UNION 
SELECT '030708','Ranracancha','Chincheros','Apurimac',5377,44.52 UNION 
SELECT '040101','Arequipa','Arequipa','Arequipa',52425,2.8 UNION 
SELECT '040102','Cayma','Arequipa','Arequipa',96878,246.31 UNION 
SELECT '040103','Cerro Colorado','Arequipa','Arequipa',158836,174.9 UNION 
SELECT '040104','Characato','Arequipa','Arequipa',10101,86 UNION 
SELECT '040105','Chiguata','Arequipa','Arequipa',3012,460.81 UNION 
SELECT '040106','La Joya','Arequipa','Arequipa',32048,670.22 UNION 
SELECT '040107','Miraflores','Arequipa','Arequipa',48242,28.68 UNION 
SELECT '040108','Mollebaya','Arequipa','Arequipa',1979,26.7 UNION 
SELECT '040109','Paucarpata','Arequipa','Arequipa',126053,31.07 UNION 
SELECT '040110','Pocsi','Arequipa','Arequipa',537,172.48 UNION 
SELECT '040111','Polobaya','Arequipa','Arequipa',1497,441.61 UNION 
SELECT '040112','Quequeña','Arequipa','Arequipa',1410,34.93 UNION 
SELECT '040113','Sabandia','Arequipa','Arequipa',4234,36.63 UNION 
SELECT '040114','Sachaca','Arequipa','Arequipa',20059,26.63 UNION 
SELECT '040115','San Juan de Siguas','Arequipa','Arequipa',1591,93.31 UNION 
SELECT '040116','San Juan de Tarucani','Arequipa','Arequipa',2193,2264.59 UNION 
SELECT '040117','Santa Isabel de Siguas','Arequipa','Arequipa',1273,187.98 UNION 
SELECT '040118','Santa Rita de Siguas','Arequipa','Arequipa',5854,370.16 UNION 
SELECT '040119','Socabaya','Arequipa','Arequipa',83799,18.64 UNION 
SELECT '040120','Tiabaya','Arequipa','Arequipa',14812,31.62 UNION 
SELECT '040121','Uchumayo','Arequipa','Arequipa',12950,227.14 UNION 
SELECT '040122','Vitor','Arequipa','Arequipa',2267,1543.5 UNION 
SELECT '040123','Yanahuara','Arequipa','Arequipa',26233,2.2 UNION 
SELECT '040124','Yarabamba','Arequipa','Arequipa',1140,492.2 UNION 
SELECT '040125','Yura','Arequipa','Arequipa',28556,1942.9 UNION 
SELECT '040126','Mariano Melgar','Arequipa','Arequipa',52881,29.83 UNION 
SELECT '040127','Jacobo Hunter','Arequipa','Arequipa',48985,20.37 UNION 
SELECT '040128','Alto Selva Alegre','Arequipa','Arequipa',85223,6.98 UNION 
SELECT '040129','Jose Luis Bustamante y Rivero','Arequipa','Arequipa',76905,10.83 UNION 
SELECT '040201','Chivay','Caylloma','Arequipa',8073,240.64 UNION 
SELECT '040202','Achoma','Caylloma','Arequipa',869,393.54 UNION 
SELECT '040203','Cabanaconde','Caylloma','Arequipa',2332,460.55 UNION 
SELECT '040204','Caylloma','Caylloma','Arequipa',3021,1499 UNION 
SELECT '040205','Callalli','Caylloma','Arequipa',1915,1485.1 UNION 
SELECT '040206','Coporaque','Caylloma','Arequipa',1542,111.98 UNION 
SELECT '040207','Huambo','Caylloma','Arequipa',566,705.79 UNION 
SELECT '040208','Huanca','Caylloma','Arequipa',1383,391.16 UNION 
SELECT '040209','Ichupampa','Caylloma','Arequipa',648,74.89 UNION 
SELECT '040210','Lari','Caylloma','Arequipa',1548,384.02 UNION 
SELECT '040211','Lluta','Caylloma','Arequipa',1253,1226.46 UNION 
SELECT '040212','Maca','Caylloma','Arequipa',692,227.48 UNION 
SELECT '040213','Madrigal','Caylloma','Arequipa',463,160.09 UNION 
SELECT '040214','San Antonio de Chuca','Caylloma','Arequipa',1593,1531.27 UNION 
SELECT '040215','Sibayo','Caylloma','Arequipa',655,286.03 UNION 
SELECT '040216','Tapay','Caylloma','Arequipa',523,420.17 UNION 
SELECT '040217','Tisco','Caylloma','Arequipa',1388,1445.02 UNION 
SELECT '040218','Tuti','Caylloma','Arequipa',738,241.89 UNION 
SELECT '040219','Yanque','Caylloma','Arequipa',2113,1108.58 UNION 
SELECT '040220','Majes','Caylloma','Arequipa',69348,1625.8 UNION 
SELECT '040301','Camana','Camana','Arequipa',14409,11.67 UNION 
SELECT '040302','Jose Maria Quimper','Camana','Arequipa',4195,16.72 UNION 
SELECT '040303','Mariano Nicolas Valcarcel','Camana','Arequipa',7728,557.74 UNION 
SELECT '040304','Mariscal Caceres','Camana','Arequipa',6637,579.31 UNION 
SELECT '040305','Nicolas de Pierola','Camana','Arequipa',6387,391.84 UNION 
SELECT '040306','Ocoña','Camana','Arequipa',4862,1414.8 UNION 
SELECT '040307','Quilca','Camana','Arequipa',630,912.25 UNION 
SELECT '040308','Samuel Pastor','Camana','Arequipa',15933,113.4 UNION 
SELECT '040401','Caraveli','Caraveli','Arequipa',3705,727.68 UNION 
SELECT '040402','Acari','Caraveli','Arequipa',3010,799.21 UNION 
SELECT '040403','Atico','Caraveli','Arequipa',4128,3146.24 UNION 
SELECT '040404','Atiquipa','Caraveli','Arequipa',945,423.55 UNION 
SELECT '040405','Bella Union','Caraveli','Arequipa',7296,1588.41 UNION 
SELECT '040406','Cahuacho','Caraveli','Arequipa',909,1412.1 UNION 
SELECT '040407','Chala','Caraveli','Arequipa',7186,378.38 UNION 
SELECT '040408','Chaparra','Caraveli','Arequipa',5814,1473.19 UNION 
SELECT '040409','Huanuhuanu','Caraveli','Arequipa',3469,708.52 UNION 
SELECT '040410','Jaqui','Caraveli','Arequipa',1163,424.73 UNION 
SELECT '040411','Lomas','Caraveli','Arequipa',1356,452.7 UNION 
SELECT '040412','Quicacha','Caraveli','Arequipa',1890,1048.42 UNION 
SELECT '040413','Yauca','Caraveli','Arequipa',1555,556.3 UNION 
SELECT '040501','Aplao','Castilla','Arequipa',8856,640.04 UNION 
SELECT '040502','Andagua','Castilla','Arequipa',1116,480.74 UNION 
SELECT '040503','Ayo','Castilla','Arequipa',401,327.97 UNION 
SELECT '040504','Chachas','Castilla','Arequipa',1671,1190.49 UNION 
SELECT '040505','Chilcaymarca','Castilla','Arequipa',1376,181.37 UNION 
SELECT '040506','Choco','Castilla','Arequipa',985,904.33 UNION 
SELECT '040507','Huancarqui','Castilla','Arequipa',1288,803.65 UNION 
SELECT '040508','Machaguay','Castilla','Arequipa',681,246.89 UNION 
SELECT '040509','Orcopampa','Castilla','Arequipa',10039,724.37 UNION 
SELECT '040510','Pampacolca','Castilla','Arequipa',2612,205.19 UNION 
SELECT '040511','Tipan','Castilla','Arequipa',506,57.68 UNION 
SELECT '040512','Uraca','Castilla','Arequipa',7235,713.83 UNION 
SELECT '040513','Uñon','Castilla','Arequipa',464,296.93 UNION 
SELECT '040514','Viraco','Castilla','Arequipa',1647,141 UNION 
SELECT '040601','Chuquibamba','Condesuyos','Arequipa',3279,1255.04 UNION 
SELECT '040602','Andaray','Condesuyos','Arequipa',657,847.56 UNION 
SELECT '040603','Cayarani','Condesuyos','Arequipa',3046,1395.67 UNION 
SELECT '040604','Chichas','Condesuyos','Arequipa',638,392.16 UNION 
SELECT '040605','Iray','Condesuyos','Arequipa',633,247.62 UNION 
SELECT '040606','Salamanca','Condesuyos','Arequipa',841,1235.8 UNION 
SELECT '040607','Yanaquihua','Condesuyos','Arequipa',6061,1057.07 UNION 
SELECT '040608','Rio Grande','Condesuyos','Arequipa',2606,527.48 UNION 
SELECT '040701','Mollendo','Islay','Arequipa',22008,960.83 UNION 
SELECT '040702','Cocachacra','Islay','Arequipa',8901,1536.96 UNION 
SELECT '040703','Dean Valdivia','Islay','Arequipa',6703,134.08 UNION 
SELECT '040704','Islay','Islay','Arequipa',7851,383.78 UNION 
SELECT '040705','Mejia','Islay','Arequipa',1014,100.78 UNION 
SELECT '040706','Punta de Bombon','Islay','Arequipa',6444,769.6 UNION 
SELECT '040801','Cotahuasi','La Union','Arequipa',2923,166.5 UNION 
SELECT '040802','Alca','La Union','Arequipa',1988,193.42 UNION 
SELECT '040803','Charcana','La Union','Arequipa',536,165.27 UNION 
SELECT '040804','Huaynacotas','La Union','Arequipa',2207,932.64 UNION 
SELECT '040805','Pampamarca','La Union','Arequipa',1231,782.17 UNION 
SELECT '040806','Puyca','La Union','Arequipa',2797,1501.2 UNION 
SELECT '040807','Quechualla','La Union','Arequipa',228,138.37 UNION 
SELECT '040808','Sayla','La Union','Arequipa',592,66.55 UNION 
SELECT '040809','Tauria','La Union','Arequipa',317,314.68 UNION 
SELECT '040810','Tomepampa','La Union','Arequipa',813,94.16 UNION 
SELECT '040811','Toro','La Union','Arequipa',767,391.44 UNION 
SELECT '050101','Ayacucho','Huamanga','Ayacucho',96671,83.11 UNION 
SELECT '050102','Acos Vinchos','Huamanga','Ayacucho',6197,156.82 UNION 
SELECT '050103','Carmen Alto','Huamanga','Ayacucho',22397,17.52 UNION 
SELECT '050104','Chiara','Huamanga','Ayacucho',7216,461.61 UNION 
SELECT '050105','Quinua','Huamanga','Ayacucho',6375,116.61 UNION 
SELECT '050106','San Jose de Ticllas','Huamanga','Ayacucho',2591,82.31 UNION 
SELECT '050107','San Juan Bautista','Huamanga','Ayacucho',52935,15.19 UNION 
SELECT '050108','Santiago de Pischa','Huamanga','Ayacucho',1700,91.09 UNION 
SELECT '050109','Vinchos','Huamanga','Ayacucho',17136,928.68 UNION 
SELECT '050110','Tambillo','Huamanga','Ayacucho',5462,153.23 UNION 
SELECT '050111','Acocro','Huamanga','Ayacucho',11081,436.65 UNION 
SELECT '050112','Socos','Huamanga','Ayacucho',7637,172.34 UNION 
SELECT '050113','Ocros','Huamanga','Ayacucho',6466,305.41 UNION 
SELECT '050114','Pacaycasa','Huamanga','Ayacucho',3314,53.55 UNION 
SELECT '050115','Jesus Nazareno','Huamanga','Ayacucho',18815,16.12 UNION 
SELECT '050201','Cangallo','Cangallo','Ayacucho',6866,187.05 UNION 
SELECT '050204','Chuschi','Cangallo','Ayacucho',8127,418.03 UNION 
SELECT '050206','Los Morochucos','Cangallo','Ayacucho',8316,253.22 UNION 
SELECT '050207','Paras','Cangallo','Ayacucho',4636,789.09 UNION 
SELECT '050208','Totos','Cangallo','Ayacucho',3742,112.9 UNION 
SELECT '050211','Maria Parado de Bellido','Cangallo','Ayacucho',2576,129.13 UNION 
SELECT '050301','Huanta','Huanta','Ayacucho',42538,193.48 UNION 
SELECT '050302','Ayahuanco','Huanta','Ayacucho',6452,297.89 UNION 
SELECT '050303','Huamanguilla','Huanta','Ayacucho',5345,95.27 UNION 
SELECT '050304','Iguain','Huanta','Ayacucho',3327,61.44 UNION 
SELECT '050305','Luricocha','Huanta','Ayacucho',5359,130.04 UNION 
SELECT '050307','Santillana','Huanta','Ayacucho',4906,336.17 UNION 
SELECT '050308','Sivia','Huanta','Ayacucho',13511,1053.52 UNION 
SELECT '050309','Llochegua','Huanta','Ayacucho',11372,469.02 UNION 
SELECT '050401','San Miguel','La Mar','Ayacucho',9248,457.88 UNION 
SELECT '050402','Anco','La Mar','Ayacucho',11144,802.86 UNION 
SELECT '050403','Ayna','La Mar','Ayacucho',10559,290.51 UNION 
SELECT '050404','Chilcas','La Mar','Ayacucho',3081,156.58 UNION 
SELECT '050405','Chungui','La Mar','Ayacucho',5478,1093.05 UNION 
SELECT '050406','Tambo','La Mar','Ayacucho',20429,313.82 UNION 
SELECT '050407','Luis Carranza','La Mar','Ayacucho',1041,135.84 UNION 
SELECT '050408','Santa Rosa','La Mar','Ayacucho',11233,396.58 UNION 
SELECT '050409','Samugari','La Mar','Ayacucho',10772,387.45 UNION 
SELECT '050501','Puquio','Lucanas','Ayacucho',14166,866.43 UNION 
SELECT '050502','Aucara','Lucanas','Ayacucho',5640,903.51 UNION 
SELECT '050503','Cabana','Lucanas','Ayacucho',4727,402.62 UNION 
SELECT '050504','Carmen Salcedo','Lucanas','Ayacucho',4159,473.66 UNION 
SELECT '050506','Chaviña','Lucanas','Ayacucho',2025,399.09 UNION 
SELECT '050508','Chipao','Lucanas','Ayacucho',3825,1166.91 UNION 
SELECT '050510','Huac-Huas','Lucanas','Ayacucho',2865,309.48 UNION 
SELECT '050511','Laramate','Lucanas','Ayacucho',1367,785.89 UNION 
SELECT '050512','Leoncio Prado','Lucanas','Ayacucho',1364,1053.6 UNION 
SELECT '050513','Lucanas','Lucanas','Ayacucho',4240,1205.78 UNION 
SELECT '050514','Llauta','Lucanas','Ayacucho',1126,482.07 UNION 
SELECT '050516','Ocaña','Lucanas','Ayacucho',2932,848.36 UNION 
SELECT '050517','Otoca','Lucanas','Ayacucho',3149,720.2 UNION 
SELECT '050520','Sancos','Lucanas','Ayacucho',7510,1520.87 UNION 
SELECT '050521','San Juan','Lucanas','Ayacucho',1636,44.59 UNION 
SELECT '050522','San Pedro','Lucanas','Ayacucho',3019,733.03 UNION 
SELECT '050524','Santa Ana de Huaycahuacho','Lucanas','Ayacucho',669,50.63 UNION 
SELECT '050525','Santa Lucia','Lucanas','Ayacucho',889,1019.14 UNION 
SELECT '050529','Saisa','Lucanas','Ayacucho',933,585.4 UNION 
SELECT '050531','San Pedro de Palco','Lucanas','Ayacucho',1371,531.55 UNION 
SELECT '050532','San Cristobal','Lucanas','Ayacucho',2182,391.83 UNION 
SELECT '050601','Coracora','Parinacochas','Ayacucho',15679,1399.41 UNION 
SELECT '050604','Coronel Castañeda','Parinacochas','Ayacucho',1926,1108.04 UNION 
SELECT '050605','Chumpi','Parinacochas','Ayacucho',2680,366.3 UNION 
SELECT '050608','Pacapausa','Parinacochas','Ayacucho',2955,144.3 UNION 
SELECT '050611','Pullo','Parinacochas','Ayacucho',5003,1562.34 UNION 
SELECT '050612','Puyusca','Parinacochas','Ayacucho',2091,700.75 UNION 
SELECT '050615','San Francisco de Ravacayco','Parinacochas','Ayacucho',770,99.83 UNION 
SELECT '050616','Upahuacho','Parinacochas','Ayacucho',2817,587.35 UNION 
SELECT '050701','Huancapi','Victor Fajardo','Ayacucho',2049,223.35 UNION 
SELECT '050702','Alcamenca','Victor Fajardo','Ayacucho',2428,125.11 UNION 
SELECT '050703','Apongo','Victor Fajardo','Ayacucho',1420,171.58 UNION 
SELECT '050704','Canaria','Victor Fajardo','Ayacucho',4057,263.88 UNION 
SELECT '050706','Cayara','Victor Fajardo','Ayacucho',1204,69.25 UNION 
SELECT '050707','Colca','Victor Fajardo','Ayacucho',1078,69.57 UNION 
SELECT '050708','Huaya','Victor Fajardo','Ayacucho',3284,162.23 UNION 
SELECT '050709','Huamanquiquia','Victor Fajardo','Ayacucho',1248,67.33 UNION 
SELECT '050710','Huancaraylla','Victor Fajardo','Ayacucho',1207,165.49 UNION 
SELECT '050713','Sarhua','Victor Fajardo','Ayacucho',2778,373.14 UNION 
SELECT '050714','Vilcanchos','Victor Fajardo','Ayacucho',2733,498.54 UNION 
SELECT '050715','Asquipata','Victor Fajardo','Ayacucho',444,70.72 UNION 
SELECT '050801','Sancos','Huanca Sancos','Ayacucho',3632,1289.7 UNION 
SELECT '050802','Sacsamarca','Huanca Sancos','Ayacucho',1637,673.03 UNION 
SELECT '050803','Santiago de Lucanamarca','Huanca Sancos','Ayacucho',2683,658.26 UNION 
SELECT '050804','Carapo','Huanca Sancos','Ayacucho',2543,241.34 UNION 
SELECT '050901','Vilcas Huaman','Vilcas Huaman','Ayacucho',8545,216.89 UNION 
SELECT '050902','Vischongo','Vilcas Huaman','Ayacucho',4828,268.87 UNION 
SELECT '050903','Accomarca','Vilcas Huaman','Ayacucho',939,82.43 UNION 
SELECT '050904','Carhuanca','Vilcas Huaman','Ayacucho',1018,56.91 UNION 
SELECT '050905','Concepcion','Vilcas Huaman','Ayacucho',3193,215.03 UNION 
SELECT '050906','Huambalpa','Vilcas Huaman','Ayacucho',2206,150.76 UNION 
SELECT '050907','Saurama','Vilcas Huaman','Ayacucho',1297,95.15 UNION 
SELECT '050908','Independencia','Vilcas Huaman','Ayacucho',1583,85.28 UNION 
SELECT '051001','Pausa','Paucar del Sara Sara','Ayacucho',2845,242.78 UNION 
SELECT '051002','Colta','Paucar del Sara Sara','Ayacucho',1179,277.29 UNION 
SELECT '051003','Corculla','Paucar del Sara Sara','Ayacucho',445,97.05 UNION 
SELECT '051004','Lampa','Paucar del Sara Sara','Ayacucho',2590,289.45 UNION 
SELECT '051005','Marcabamba','Paucar del Sara Sara','Ayacucho',786,122.53 UNION 
SELECT '051006','Oyolo','Paucar del Sara Sara','Ayacucho',1226,820.13 UNION 
SELECT '051007','Pararca','Paucar del Sara Sara','Ayacucho',669,57.91 UNION 
SELECT '051008','San Javier de Alpabamba','Paucar del Sara Sara','Ayacucho',551,92.87 UNION 
SELECT '051009','San Jose de Ushua','Paucar del Sara Sara','Ayacucho',179,17.33 UNION 
SELECT '051010','Sara Sara','Paucar del Sara Sara','Ayacucho',735,79.58 UNION 
SELECT '051101','Querobamba','Sucre','Ayacucho',2792,275.65 UNION 
SELECT '051102','Belen','Sucre','Ayacucho',772,41.46 UNION 
SELECT '051103','Chalcos','Sucre','Ayacucho',635,58.43 UNION 
SELECT '051104','San Salvador de Quije','Sucre','Ayacucho',1679,144.63 UNION 
SELECT '051105','Paico','Sucre','Ayacucho',837,79.65 UNION 
SELECT '051106','Santiago de Paucaray','Sucre','Ayacucho',724,62.65 UNION 
SELECT '051107','San Pedro de Larcay','Sucre','Ayacucho',1053,310.07 UNION 
SELECT '051108','Soras','Sucre','Ayacucho',1331,357.97 UNION 
SELECT '051109','Huacaña','Sucre','Ayacucho',694,132.73 UNION 
SELECT '051110','Chilcayoc','Sucre','Ayacucho',568,33.06 UNION 
SELECT '051111','Morcolla','Sucre','Ayacucho',1035,289.34 UNION 
SELECT '060101','Cajamarca','Cajamarca','Cajamarca',251097,382.74 UNION 
SELECT '060102','Asuncion','Cajamarca','Cajamarca',13508,210.18 UNION 
SELECT '060103','Cospan','Cajamarca','Cajamarca',7882,558.79 UNION 
SELECT '060104','Chetilla','Cajamarca','Cajamarca',4319,73.94 UNION 
SELECT '060105','Encañada','Cajamarca','Cajamarca',24290,635.06 UNION 
SELECT '060106','Jesus','Cajamarca','Cajamarca',14742,267.78 UNION 
SELECT '060107','Los Baños del Inca','Cajamarca','Cajamarca',43401,276.4 UNION 
SELECT '060108','Llacanora','Cajamarca','Cajamarca',5404,49.42 UNION 
SELECT '060109','Magdalena','Cajamarca','Cajamarca',9689,215.38 UNION 
SELECT '060110','Matara','Cajamarca','Cajamarca',3542,59.74 UNION 
SELECT '060111','Namora','Cajamarca','Cajamarca',10740,180.69 UNION 
SELECT '060112','San Juan','Cajamarca','Cajamarca',5232,69.66 UNION 
SELECT '060201','Cajabamba','Cajabamba','Cajamarca',30798,192.29 UNION 
SELECT '060202','Cachachi','Cajabamba','Cajamarca',26990,820.81 UNION 
SELECT '060203','Condebamba','Cajabamba','Cajamarca',14006,204.6 UNION 
SELECT '060205','Sitacocha','Cajabamba','Cajamarca',8910,589.94 UNION 
SELECT '060301','Celendin','Celendin','Cajamarca',28319,409 UNION 
SELECT '060302','Cortegana','Celendin','Cajamarca',8878,233.31 UNION 
SELECT '060303','Chumuch','Celendin','Cajamarca',3198,196.3 UNION 
SELECT '060304','Huasmin','Celendin','Cajamarca',13621,437.5 UNION 
SELECT '060305','Jorge Chavez','Celendin','Cajamarca',593,53.34 UNION 
SELECT '060306','Jose Galvez','Celendin','Cajamarca',2497,58.01 UNION 
SELECT '060307','Miguel Iglesias','Celendin','Cajamarca',5613,235.73 UNION 
SELECT '060308','Oxamarca','Celendin','Cajamarca',6977,292.52 UNION 
SELECT '060309','Sorochuco','Celendin','Cajamarca',9881,170.02 UNION 
SELECT '060310','Sucre','Celendin','Cajamarca',6085,270.98 UNION 
SELECT '060311','Utco','Celendin','Cajamarca',1417,100.79 UNION 
SELECT '060312','La Libertad de Pallan','Celendin','Cajamarca',9101,184.09 UNION 
SELECT '060401','Contumaza','Contumaza','Cajamarca',8461,358.28 UNION 
SELECT '060403','Chilete','Contumaza','Cajamarca',2733,133.94 UNION 
SELECT '060404','Guzmango','Contumaza','Cajamarca',3146,49.88 UNION 
SELECT '060405','San Benito','Contumaza','Cajamarca',3845,486.55 UNION 
SELECT '060406','Cupisnique','Contumaza','Cajamarca',1457,280.2 UNION 
SELECT '060407','Tantarica','Contumaza','Cajamarca',3303,149.7 UNION 
SELECT '060408','Yonan','Contumaza','Cajamarca',7907,547.25 UNION 
SELECT '060409','Santa Cruz de Toled','Contumaza','Cajamarca',1044,64.53 UNION 
SELECT '060501','Cutervo','Cutervo','Cajamarca',56382,422.27 UNION 
SELECT '060502','Callayuc','Cutervo','Cajamarca',10280,316.05 UNION 
SELECT '060503','Cujillo','Cutervo','Cajamarca',3040,108.93 UNION 
SELECT '060504','Choros','Cutervo','Cajamarca',3595,276.96 UNION 
SELECT '060505','La Ramada','Cutervo','Cajamarca',4862,30.27 UNION 
SELECT '060506','Pimpingos','Cutervo','Cajamarca',5697,186.04 UNION 
SELECT '060507','Querocotillo','Cutervo','Cajamarca',17001,697.1 UNION 
SELECT '060508','San Andres de Cutervo','Cutervo','Cajamarca',5240,133.4 UNION 
SELECT '060509','San Juan de Cutervo','Cutervo','Cajamarca',1981,60.87 UNION 
SELECT '060510','San Luis de Lucma','Cutervo','Cajamarca',4042,109.74 UNION 
SELECT '060511','Santa Cruz','Cutervo','Cajamarca',2889,128 UNION 
SELECT '060512','Santo Domingo de La Capilla','Cutervo','Cajamarca',5649,103.74 UNION 
SELECT '060513','Santo Tomas','Cutervo','Cajamarca',7931,279.61 UNION 
SELECT '060514','Socota','Cutervo','Cajamarca',10720,134.83 UNION 
SELECT '060515','Toribio Casanova','Cutervo','Cajamarca',1262,40.65 UNION 
SELECT '060601','Chota','Chota','Cajamarca',48903,261.75 UNION 
SELECT '060602','Anguia','Chota','Cajamarca',4296,123.01 UNION 
SELECT '060603','Cochabamba','Chota','Cajamarca',6401,130.01 UNION 
SELECT '060604','Conchan','Chota','Cajamarca',7060,180.23 UNION 
SELECT '060605','Chadin','Chota','Cajamarca',4104,66.53 UNION 
SELECT '060606','Chiguirip','Chota','Cajamarca',4663,51.44 UNION 
SELECT '060607','Chimban','Chota','Cajamarca',3684,198.99 UNION 
SELECT '060608','Huambos','Chota','Cajamarca',9490,240.72 UNION 
SELECT '060609','Lajas','Chota','Cajamarca',12505,120.73 UNION 
SELECT '060610','Llama','Chota','Cajamarca',8037,494.94 UNION 
SELECT '060611','Miracosta','Chota','Cajamarca',3924,415.69 UNION 
SELECT '060612','Paccha','Chota','Cajamarca',5335,93.97 UNION 
SELECT '060613','Pion','Chota','Cajamarca',1566,141.05 UNION 
SELECT '060614','Querocoto','Chota','Cajamarca',8918,301.07 UNION 
SELECT '060615','Tacabamba','Chota','Cajamarca',20132,196.25 UNION 
SELECT '060616','Tocmoche','Chota','Cajamarca',993,222.38 UNION 
SELECT '060617','San Juan de Licupis','Chota','Cajamarca',969,205.01 UNION 
SELECT '060618','Choropampa','Chota','Cajamarca',2553,171.59 UNION 
SELECT '060619','Chalamarca','Chota','Cajamarca',11274,179.74 UNION 
SELECT '060701','Bambamarca','Hualgayoc','Cajamarca',82744,451.38 UNION 
SELECT '060702','Chugur','Hualgayoc','Cajamarca',3601,99.6 UNION 
SELECT '060703','Hualgayoc','Hualgayoc','Cajamarca',16979,226.17 UNION 
SELECT '060801','Jaen','Jaen','Cajamarca',101726,537.25 UNION 
SELECT '060802','Bellavista','Jaen','Cajamarca',15310,870.55 UNION 
SELECT '060803','Colasay','Jaen','Cajamarca',10447,735.73 UNION 
SELECT '060804','Chontali','Jaen','Cajamarca',10232,428.55 UNION 
SELECT '060805','Pomahuaca','Jaen','Cajamarca',10190,732.8 UNION 
SELECT '060806','Pucara','Jaen','Cajamarca',7703,240.3 UNION 
SELECT '060807','Sallique','Jaen','Cajamarca',8730,373.89 UNION 
SELECT '060808','San Felipe','Jaen','Cajamarca',6266,255.49 UNION 
SELECT '060809','San Jose del Alto','Jaen','Cajamarca',7209,634.11 UNION 
SELECT '060810','Santa Rosa','Jaen','Cajamarca',11363,282.8 UNION 
SELECT '060811','Las Pirias','Jaen','Cajamarca',4009,60.41 UNION 
SELECT '060812','Huabal','Jaen','Cajamarca',6956,80.69 UNION 
SELECT '060901','Santa Cruz','Santa Cruz','Cajamarca',12431,102.51 UNION 
SELECT '060902','Catache','Santa Cruz','Cajamarca',10048,609.16 UNION 
SELECT '060903','Chancaybaños','Santa Cruz','Cajamarca',3899,120.04 UNION 
SELECT '060904','La Esperanza','Santa Cruz','Cajamarca',2560,59.7 UNION 
SELECT '060905','Ninabamba','Santa Cruz','Cajamarca',2759,60.04 UNION 
SELECT '060906','Pulan','Santa Cruz','Cajamarca',4438,155.67 UNION 
SELECT '060907','Sexi','Santa Cruz','Cajamarca',571,192.87 UNION 
SELECT '060908','Uticyacu','Santa Cruz','Cajamarca',1606,43.38 UNION 
SELECT '060909','Yauyucan','Santa Cruz','Cajamarca',3610,35.37 UNION 
SELECT '060910','Andabamba','Santa Cruz','Cajamarca',1494,7.61 UNION 
SELECT '060911','Saucepampa','Santa Cruz','Cajamarca',1848,31.58 UNION 
SELECT '061001','San Miguel','San Miguel','Cajamarca',15894,368.26 UNION 
SELECT '061002','Calquis','San Miguel','Cajamarca',4425,339 UNION 
SELECT '061003','La Florida','San Miguel','Cajamarca',2157,61.33 UNION 
SELECT '061004','Llapa','San Miguel','Cajamarca',6086,132.68 UNION 
SELECT '061005','Nanchoc','San Miguel','Cajamarca',1550,358.94 UNION 
SELECT '061006','Niepos','San Miguel','Cajamarca',4001,158.88 UNION 
SELECT '061007','San Gregorio','San Miguel','Cajamarca',2263,308.05 UNION 
SELECT '061008','San Silvestre de Cochan','San Miguel','Cajamarca',4449,131.62 UNION 
SELECT '061009','El Prado','San Miguel','Cajamarca',1300,71.44 UNION 
SELECT '061010','Union Agua Blanca','San Miguel','Cajamarca',3577,171.71 UNION 
SELECT '061011','Tongod','San Miguel','Cajamarca',4900,163.89 UNION 
SELECT '061012','Catilluc','San Miguel','Cajamarca',3495,197.31 UNION 
SELECT '061013','Bolivar','San Miguel','Cajamarca',1462,78.97 UNION 
SELECT '061101','San Ignacio','San Ignacio','Cajamarca',37862,381.88 UNION 
SELECT '061102','Chirinos','San Ignacio','Cajamarca',14355,351.91 UNION 
SELECT '061103','Huarango','San Ignacio','Cajamarca',20589,922.35 UNION 
SELECT '061104','Namballe','San Ignacio','Cajamarca',11717,663.51 UNION 
SELECT '061105','La Coipa','San Ignacio','Cajamarca',21056,376.09 UNION 
SELECT '061106','San Jose de Lourdes','San Ignacio','Cajamarca',22147,1482.75 UNION 
SELECT '061107','Tabaconas','San Ignacio','Cajamarca',22002,798.59 UNION 
SELECT '061201','Pedro Galvez','San Marcos','Cajamarca',21549,238.74 UNION 
SELECT '061202','Ichocan','San Marcos','Cajamarca',1624,76.11 UNION 
SELECT '061203','Gregorio Pita','San Marcos','Cajamarca',6666,212.81 UNION 
SELECT '061204','Jose Manuel Quiroz','San Marcos','Cajamarca',3961,115.42 UNION 
SELECT '061205','Eduardo Villanueva','San Marcos','Cajamarca',2288,63.13 UNION 
SELECT '061206','Jose Sabogal','San Marcos','Cajamarca',15303,594.31 UNION 
SELECT '061207','Chancay','San Marcos','Cajamarca',3337,61.8 UNION 
SELECT '061301','San Pablo','San Pablo','Cajamarca',13586,197.92 UNION 
SELECT '061302','San Bernardino','San Pablo','Cajamarca',4830,167.12 UNION 
SELECT '061303','San Luis','San Pablo','Cajamarca',1255,42.88 UNION 
SELECT '061304','Tumbaden','San Pablo','Cajamarca',3590,264.37 UNION 
SELECT '070101','Cusco','Cusco','Cusco',121667,116.22 UNION 
SELECT '070102','Ccorca','Cusco','Cusco',2483,188.56 UNION 
SELECT '070103','Poroy','Cusco','Cusco',8020,14.96 UNION 
SELECT '070104','San Jeronimo','Cusco','Cusco',48224,103.34 UNION 
SELECT '070105','San Sebastian','Cusco','Cusco',118312,89.44 UNION 
SELECT '070106','Santiago','Cusco','Cusco',91838,69.72 UNION 
SELECT '070107','Saylla','Cusco','Cusco',5599,28.38 UNION 
SELECT '070108','Wanchaq','Cusco','Cusco',65188,6.38 UNION 
SELECT '070201','Acomayo','Acomayo','Cusco',5627,141.27 UNION 
SELECT '070202','Acopia','Acomayo','Cusco',2336,91.72 UNION 
SELECT '070203','Acos','Acomayo','Cusco',2286,137.55 UNION 
SELECT '070204','Pomacanchi','Acomayo','Cusco',9092,275.56 UNION 
SELECT '070205','Rondocan','Acomayo','Cusco',2281,180.22 UNION 
SELECT '070206','Sangarara','Acomayo','Cusco',3733,78.29 UNION 
SELECT '070207','Mosoc Llacta','Acomayo','Cusco',2321,43.61 UNION 
SELECT '070301','Anta','Anta','Cusco',16833,202.58 UNION 
SELECT '070302','Chinchaypujio','Anta','Cusco',4434,390.58 UNION 
SELECT '070303','Huarocondo','Anta','Cusco',5875,228.62 UNION 
SELECT '070304','Limatambo','Anta','Cusco',9813,512.92 UNION 
SELECT '070305','Mollepata','Anta','Cusco',2674,284.48 UNION 
SELECT '070306','Pucyura','Anta','Cusco',4242,37.75 UNION 
SELECT '070307','Zurite','Anta','Cusco',3714,52.33 UNION 
SELECT '070308','Cachimayo','Anta','Cusco',2274,43.28 UNION 
SELECT '070309','Ancahuasi','Anta','Cusco',7015,123.58 UNION 
SELECT '070401','Calca','Calca','Cusco',23824,311.01 UNION 
SELECT '070402','Coya','Calca','Cusco',4034,71.43 UNION 
SELECT '070403','Lamay','Calca','Cusco',5821,94.22 UNION 
SELECT '070404','Lares','Calca','Cusco',7227,527.26 UNION 
SELECT '070405','Pisac','Calca','Cusco',10285,148.25 UNION 
SELECT '070406','San Salvador','Calca','Cusco',5674,128.07 UNION 
SELECT '070407','Taray','Calca','Cusco',4745,53.78 UNION 
SELECT '070408','Yanatile','Calca','Cusco',13588,3080.47 UNION 
SELECT '070501','Yanaoca','Canas','Cusco',10178,292.97 UNION 
SELECT '070502','Checca','Canas','Cusco',6315,503.76 UNION 
SELECT '070503','Kunturkanki','Canas','Cusco',5781,376.19 UNION 
SELECT '070504','Langui','Canas','Cusco',2567,187.1 UNION 
SELECT '070505','Layo','Canas','Cusco',6447,452.56 UNION 
SELECT '070506','Pampamarca','Canas','Cusco',2075,29.91 UNION 
SELECT '070507','Quehue','Canas','Cusco',3578,143.46 UNION 
SELECT '070508','Tupac Amaru','Canas','Cusco',2961,117.81 UNION 
SELECT '070601','Sicuani','Canchis','Cusco',60903,645.88 UNION 
SELECT '070602','Combapata','Canchis','Cusco',5432,182.5 UNION 
SELECT '070603','Checacupe','Canchis','Cusco',4984,962.34 UNION 
SELECT '070604','Marangani','Canchis','Cusco',11287,432.65 UNION 
SELECT '070605','Pitumarca','Canchis','Cusco',7616,1117.54 UNION 
SELECT '070606','San Pablo','Canchis','Cusco',4557,524.06 UNION 
SELECT '070607','San Pedro','Canchis','Cusco',2773,54.91 UNION 
SELECT '070608','Tinta','Canchis','Cusco',5642,79.39 UNION 
SELECT '070701','Santo Tomas','Chumbivilcas','Cusco',26992,1924.08 UNION 
SELECT '070702','Capacmarca','Chumbivilcas','Cusco',4620,271.81 UNION 
SELECT '070703','Colquemarca','Chumbivilcas','Cusco',8630,449.49 UNION 
SELECT '070704','Chamaca','Chumbivilcas','Cusco',8971,674.19 UNION 
SELECT '070705','Livitaca','Chumbivilcas','Cusco',13526,758.2 UNION 
SELECT '070706','Llusco','Chumbivilcas','Cusco',7173,315.42 UNION 
SELECT '070707','Quiñota','Chumbivilcas','Cusco',4990,221.05 UNION 
SELECT '070708','Velille','Chumbivilcas','Cusco',8580,756.84 UNION 
SELECT '070801','Espinar','Espinar','Cusco',33970,747.78 UNION 
SELECT '070802','Condoroma','Espinar','Cusco',1431,513.36 UNION 
SELECT '070803','Coporaque','Espinar','Cusco',18004,1564.46 UNION 
SELECT '070804','Ocoruro','Espinar','Cusco',1588,353.15 UNION 
SELECT '070805','Pallpata','Espinar','Cusco',5593,815.56 UNION 
SELECT '070806','Pichigua','Espinar','Cusco',3629,288.76 UNION 
SELECT '070807','Suyckutambo','Espinar','Cusco',2781,652.13 UNION 
SELECT '070808','Alto Pichigua','Espinar','Cusco',3171,375.89 UNION 
SELECT '070901','Santa Ana','La Convencion','Cusco',35206,359.4 UNION 
SELECT '070902','Echarate','La Convencion','Cusco',37130,19135.5 UNION 
SELECT '070903','Huayopata','La Convencion','Cusco',4539,524.02 UNION 
SELECT '070904','Maranura','La Convencion','Cusco',5949,150.3 UNION 
SELECT '070905','Ocobamba','La Convencion','Cusco',6852,840.93 UNION 
SELECT '070906','Santa Teresa','La Convencion','Cusco',6418,1340.38 UNION 
SELECT '070907','Vilcabamba','La Convencion','Cusco',13869,3318.86 UNION 
SELECT '070908','Quellouno','La Convencion','Cusco',18320,799.68 UNION 
SELECT '070909','Kimbiri','La Convencion','Cusco',14893,905.69 UNION 
SELECT '070910','Pichari','La Convencion','Cusco',20538,730.45 UNION 
SELECT '071001','Paruro','Paruro','Cusco',3400,153.42 UNION 
SELECT '071002','Accha','Paruro','Cusco',3839,244.75 UNION 
SELECT '071003','Ccapi','Paruro','Cusco',3749,334.85 UNION 
SELECT '071004','Colcha','Paruro','Cusco',1189,139.98 UNION 
SELECT '071005','Huanoquite','Paruro','Cusco',5700,362.67 UNION 
SELECT '071006','Omacha','Paruro','Cusco',7205,436.21 UNION 
SELECT '071007','Yaurisque','Paruro','Cusco',2522,90.8 UNION 
SELECT '071008','Paccaritambo','Paruro','Cusco',2076,142.61 UNION 
SELECT '071009','Pillpinto','Paruro','Cusco',1254,79.13 UNION 
SELECT '071101','Paucartambo','Paucartambo','Cusco',13491,1079.23 UNION 
SELECT '071102','Caicay','Paucartambo','Cusco',2768,110.72 UNION 
SELECT '071103','Colquepata','Paucartambo','Cusco',10767,467.68 UNION 
SELECT '071104','Challabamba','Paucartambo','Cusco',11389,746.56 UNION 
SELECT '071105','Kosñipata','Paucartambo','Cusco',5692,3745.68 UNION 
SELECT '071106','Huancarani','Paucartambo','Cusco',7774,145.14 UNION 
SELECT '071201','Urcos','Quispicanchi','Cusco',9412,134.65 UNION 
SELECT '071202','Andahuaylillas','Quispicanchi','Cusco',5558,84.6 UNION 
SELECT '071203','Camanti','Quispicanchi','Cusco',2094,3174.93 UNION 
SELECT '071204','Ccarhuayo','Quispicanchi','Cusco',3173,313.89 UNION 
SELECT '071205','Ccatca','Quispicanchi','Cusco',18128,307.72 UNION 
SELECT '071206','Cusipata','Quispicanchi','Cusco',4795,248.03 UNION 
SELECT '071207','Huaro','Quispicanchi','Cusco',4508,106.28 UNION 
SELECT '071208','Lucre','Quispicanchi','Cusco',4051,118.78 UNION 
SELECT '071209','Marcapata','Quispicanchi','Cusco',4533,1687.91 UNION 
SELECT '071210','Ocongate','Quispicanchi','Cusco',15889,952.66 UNION 
SELECT '071211','Oropesa','Quispicanchi','Cusco',7428,74.44 UNION 
SELECT '071212','Quiquijana','Quispicanchi','Cusco',11100,360.9 UNION 
SELECT '071301','Urubamba','Urubamba','Cusco',21424,128.28 UNION 
SELECT '071302','Chinchero','Urubamba','Cusco',9896,94.57 UNION 
SELECT '071303','Huayllabamba','Urubamba','Cusco',5332,102.47 UNION 
SELECT '071304','Machupicchu','Urubamba','Cusco',8471,271.44 UNION 
SELECT '071305','Maras','Urubamba','Cusco',5900,131.85 UNION 
SELECT '071306','Ollantaytambo','Urubamba','Cusco',11347,640.25 UNION 
SELECT '071307','Yucay','Urubamba','Cusco',3390,70.57 UNION 
SELECT '080101','Huancavelica','Huancavelica','Huancavelica',41284,514.1 UNION 
SELECT '080102','Acobambilla','Huancavelica','Huancavelica',4730,758.32 UNION 
SELECT '080103','Acoria','Huancavelica','Huancavelica',37509,535.1 UNION 
SELECT '080104','Conayca','Huancavelica','Huancavelica',1212,37.79 UNION 
SELECT '080105','Cuenca','Huancavelica','Huancavelica',1942,50.25 UNION 
SELECT '080106','Huachocolpa','Huancavelica','Huancavelica',2886,336.28 UNION 
SELECT '080108','Huayllahuara','Huancavelica','Huancavelica',724,38.8 UNION 
SELECT '080109','Izcuchaca','Huancavelica','Huancavelica',868,12.19 UNION 
SELECT '080110','Laria','Huancavelica','Huancavelica',1453,78.45 UNION 
SELECT '080111','Manta','Huancavelica','Huancavelica',1876,154.14 UNION 
SELECT '080112','Mariscal Caceres','Huancavelica','Huancavelica',1058,5.63 UNION 
SELECT '080113','Moya','Huancavelica','Huancavelica',2539,94.08 UNION 
SELECT '080114','Nuevo Occoro','Huancavelica','Huancavelica',2728,211.56 UNION 
SELECT '080115','Palca','Huancavelica','Huancavelica',3214,82.08 UNION 
SELECT '080116','Pilchaca','Huancavelica','Huancavelica',487,42.97 UNION 
SELECT '080117','Vilca','Huancavelica','Huancavelica',3060,317.76 UNION 
SELECT '080118','Yauli','Huancavelica','Huancavelica',34557,319.92 UNION 
SELECT '080119','Ascension','Huancavelica','Huancavelica',12711,432.24 UNION 
SELECT '080120','Huando','Huancavelica','Huancavelica',7695,193.9 UNION 
SELECT '080201','Acobamba','Acobamba','Huancavelica',10258,123.02 UNION 
SELECT '080202','Anta','Acobamba','Huancavelica',9711,91.36 UNION 
SELECT '080203','Andabamba','Acobamba','Huancavelica',5758,81.85 UNION 
SELECT '080204','Caja','Acobamba','Huancavelica',2837,82.39 UNION 
SELECT '080205','Marcas','Acobamba','Huancavelica',2402,155.87 UNION 
SELECT '080206','Paucara','Acobamba','Huancavelica',38507,225.6 UNION 
SELECT '080207','Pomacocha','Acobamba','Huancavelica',3941,53.66 UNION 
SELECT '080208','Rosario','Acobamba','Huancavelica',7985,97.07 UNION 
SELECT '080301','Lircay','Angaraes','Huancavelica',25333,818.84 UNION 
SELECT '080302','Anchonga','Angaraes','Huancavelica',8216,72.4 UNION 
SELECT '080303','Callanmarca','Angaraes','Huancavelica',757,26.02 UNION 
SELECT '080304','Congalla','Angaraes','Huancavelica',4165,215.64 UNION 
SELECT '080305','Chincho','Angaraes','Huancavelica',3578,182.7 UNION 
SELECT '080306','Huayllay Grande','Angaraes','Huancavelica',2240,33.28 UNION 
SELECT '080307','Huanca-Huanca','Angaraes','Huancavelica',1773,109.96 UNION 
SELECT '080308','Julcamarca','Angaraes','Huancavelica',1801,48.61 UNION 
SELECT '080309','San Antonio de Antaparco','Angaraes','Huancavelica',7834,33.42 UNION 
SELECT '080310','Santo Tomas de Pata','Angaraes','Huancavelica',2735,133.57 UNION 
SELECT '080311','Secclla','Angaraes','Huancavelica',3885,167.99 UNION 
SELECT '080312','Ccochaccasa','Angaraes','Huancavelica',2665,116.6 UNION 
SELECT '080401','Castrovirreyna','Castrovirreyna','Huancavelica',3265,937.94 UNION 
SELECT '080402','Arma','Castrovirreyna','Huancavelica',1439,304.85 UNION 
SELECT '080403','Aurahua','Castrovirreyna','Huancavelica',2275,360.97 UNION 
SELECT '080405','Capillas','Castrovirreyna','Huancavelica',1452,397.95 UNION 
SELECT '080406','Cocas','Castrovirreyna','Huancavelica',916,87.95 UNION 
SELECT '080408','Chupamarca','Castrovirreyna','Huancavelica',1233,373.78 UNION 
SELECT '080409','Huachos','Castrovirreyna','Huancavelica',1676,172.01 UNION 
SELECT '080410','Huamatambo','Castrovirreyna','Huancavelica',379,54.16 UNION 
SELECT '080414','Mollepampa','Castrovirreyna','Huancavelica',1695,165.65 UNION 
SELECT '080422','San Juan','Castrovirreyna','Huancavelica',440,207.25 UNION 
SELECT '080427','Tantara','Castrovirreyna','Huancavelica',717,113.01 UNION 
SELECT '080428','Ticrapo','Castrovirreyna','Huancavelica',1598,187 UNION 
SELECT '080429','Santa Ana','Castrovirreyna','Huancavelica',2195,622.1 UNION 
SELECT '080501','Pampas','Tayacaja','Huancavelica',9335,109.07 UNION 
SELECT '080502','Acostambo','Tayacaja','Huancavelica',4110,168.06 UNION 
SELECT '080503','Acraquia','Tayacaja','Huancavelica',5014,110.27 UNION 
SELECT '080504','Ahuaycha','Tayacaja','Huancavelica',5619,90.96 UNION 
SELECT '080506','Colcabamba','Tayacaja','Huancavelica',12376,312.18 UNION 
SELECT '080509','Daniel Hernandez','Tayacaja','Huancavelica',10381,106.92 UNION 
SELECT '080511','Huachocolpa','Tayacaja','Huancavelica',6534,292 UNION 
SELECT '080512','Huaribamba','Tayacaja','Huancavelica',4472,150.69 UNION 
SELECT '080515','Ñahuimpuquio','Tayacaja','Huancavelica',1876,67.39 UNION 
SELECT '080517','Pazos','Tayacaja','Huancavelica',7281,227.86 UNION 
SELECT '080518','Quishuar','Tayacaja','Huancavelica',904,31.54 UNION 
SELECT '080519','Salcabamba','Tayacaja','Huancavelica',4584,192.52 UNION 
SELECT '080520','San Marcos de Rocchac','Tayacaja','Huancavelica',2856,281.71 UNION 
SELECT '080523','Surcubamba','Tayacaja','Huancavelica',4926,271.75 UNION 
SELECT '080525','Tintay Puncu','Tayacaja','Huancavelica',9140,257.73 UNION 
SELECT '080526','Salcahuasi','Tayacaja','Huancavelica',3294,117.98 UNION 
SELECT '080601','Ayavi','Huaytara','Huancavelica',597,201.26 UNION 
SELECT '080602','Cordova','Huaytara','Huancavelica',2898,104.59 UNION 
SELECT '080603','Huayacundo Arma','Huaytara','Huancavelica',469,12.81 UNION 
SELECT '080604','Huaytara','Huaytara','Huancavelica',2108,401.25 UNION 
SELECT '080605','Laramarca','Huaytara','Huancavelica',823,205.05 UNION 
SELECT '080606','Ocoyo','Huaytara','Huancavelica',2488,154.71 UNION 
SELECT '080607','Pilpichaca','Huaytara','Huancavelica',3765,2162.92 UNION 
SELECT '080608','Querco','Huaytara','Huancavelica',1044,697.31 UNION 
SELECT '080609','Quito-Arma','Huaytara','Huancavelica',767,222.32 UNION 
SELECT '080610','San Antonio de Cusicancha','Huaytara','Huancavelica',1676,255.86 UNION 
SELECT '080611','San Francisco de Sangayaico','Huaytara','Huancavelica',557,70.7 UNION 
SELECT '080612','San Isidro','Huaytara','Huancavelica',1194,174.95 UNION 
SELECT '080613','Santiago de Chocorvos','Huaytara','Huancavelica',2842,1150.2 UNION 
SELECT '080614','Santiago de Quirahuara','Huaytara','Huancavelica',658,169.32 UNION 
SELECT '080615','Santo Domingo de Capillas','Huaytara','Huancavelica',982,248.56 UNION 
SELECT '080616','Tambo','Huaytara','Huancavelica',313,226.58 UNION 
SELECT '080701','Churcampa','Churcampa','Huancavelica',5961,135.48 UNION 
SELECT '080702','Anco','Churcampa','Huancavelica',6609,150.18 UNION 
SELECT '080703','Chinchihuasi','Churcampa','Huancavelica',3410,162.21 UNION 
SELECT '080704','El Carmen','Churcampa','Huancavelica',3050,77.07 UNION 
SELECT '080705','La Merced','Churcampa','Huancavelica',1639,73.32 UNION 
SELECT '080706','Locroja','Churcampa','Huancavelica',4179,92.48 UNION 
SELECT '080707','Paucarbamba','Churcampa','Huancavelica',7336,97.72 UNION 
SELECT '080708','San Miguel de Mayocc','Churcampa','Huancavelica',1239,38.43 UNION 
SELECT '080709','San Pedro de Coris','Churcampa','Huancavelica',4451,128.9 UNION 
SELECT '080710','Pachamarca','Churcampa','Huancavelica',2917,156.29 UNION 
SELECT '080711','Cosme','Churcampa','Huancavelica',4141,106.34 UNION 
SELECT '090101','Huanuco','Huanuco','Huanuco',88542,126.23 UNION 
SELECT '090102','Chinchao','Huanuco','Huanuco',14099,795.78 UNION 
SELECT '090103','Churubamba','Huanuco','Huanuco',28908,507.31 UNION 
SELECT '090104','Margos','Huanuco','Huanuco',10021,206.57 UNION 
SELECT '090105','Quisqui','Huanuco','Huanuco',8392,172.74 UNION 
SELECT '090106','San Francisco de Cayran','Huanuco','Huanuco',5575,146.24 UNION 
SELECT '090107','San Pedro de Chaulan','Huanuco','Huanuco',8121,266.36 UNION 
SELECT '090108','Santa Maria del Valle','Huanuco','Huanuco',20984,446.63 UNION 
SELECT '090109','Yarumayo','Huanuco','Huanuco',3139,60.94 UNION 
SELECT '090110','Amarilis','Huanuco','Huanuco',79545,131.68 UNION 
SELECT '090111','Pillco Marca','Huanuco','Huanuco',28110,76.61 UNION 
SELECT '090112','Yacus','Huanuco','Huanuco',7390,69.9 UNION 
SELECT '090201','Ambo','Ambo','Huanuco',17328,288.8 UNION 
SELECT '090202','Cayna','Ambo','Huanuco',3377,166.05 UNION 
SELECT '090203','Colpas','Ambo','Huanuco',2388,174.34 UNION 
SELECT '090204','Conchamarca','Ambo','Huanuco',6938,104.81 UNION 
SELECT '090205','Huacar','Ambo','Huanuco',7642,234.23 UNION 
SELECT '090206','San Francisco','Ambo','Huanuco',3233,121.21 UNION 
SELECT '090207','San Rafael','Ambo','Huanuco',12278,443.63 UNION 
SELECT '090208','Tomay Kichwa','Ambo','Huanuco',3857,42.11 UNION 
SELECT '090301','La Union','Dos de Mayo','Huanuco',6302,167.1 UNION 
SELECT '090307','Chuquis','Dos de Mayo','Huanuco',6030,151.25 UNION 
SELECT '090312','Marias','Dos de Mayo','Huanuco',9957,637.24 UNION 
SELECT '090314','Pachas','Dos de Mayo','Huanuco',13450,264.74 UNION 
SELECT '090316','Quivilla','Dos de Mayo','Huanuco',3296,33.6 UNION 
SELECT '090317','Ripan','Dos de Mayo','Huanuco',7150,75.04 UNION 
SELECT '090321','Shunqui','Dos de Mayo','Huanuco',2478,32.26 UNION 
SELECT '090322','Sillapata','Dos de Mayo','Huanuco',2430,70.53 UNION 
SELECT '090323','Yanas','Dos de Mayo','Huanuco',3339,36.31 UNION 
SELECT '090401','Llata','Huamalies','Huanuco',15299,411.35 UNION 
SELECT '090402','Arancay','Huamalies','Huanuco',1603,158.33 UNION 
SELECT '090403','Chavin de Pariarca','Huamalies','Huanuco',3721,89.25 UNION 
SELECT '090404','Jacas Grande','Huamalies','Huanuco',5998,236.99 UNION 
SELECT '090405','Jircan','Huamalies','Huanuco',3739,84.81 UNION 
SELECT '090406','Miraflores','Huamalies','Huanuco',3592,96.74 UNION 
SELECT '090407','Monzon','Huamalies','Huanuco',29863,1521.39 UNION 
SELECT '090408','Punchao','Huamalies','Huanuco',2599,42.24 UNION 
SELECT '090409','Puños','Huamalies','Huanuco',4316,101.75 UNION 
SELECT '090410','Singa','Huamalies','Huanuco',3342,151.7 UNION 
SELECT '090411','Tantamayo','Huamalies','Huanuco',3035,249.95 UNION 
SELECT '090501','Huacrachuco','Marañon','Huanuco',15942,704.63 UNION 
SELECT '090502','Cholon','Marañon','Huanuco',10428,2125.19 UNION 
SELECT '090505','San Buenaventura','Marañon','Huanuco',2744,86.54 UNION 
SELECT '090601','Rupa-Rupa','Leoncio Prado','Huanuco',51713,266.52 UNION 
SELECT '090602','Daniel Alomias Robles','Leoncio Prado','Huanuco',8011,702.46 UNION 
SELECT '090603','Hermilio Valdizan','Leoncio Prado','Huanuco',4065,112.2 UNION 
SELECT '090604','Luyando','Leoncio Prado','Huanuco',10078,100.32 UNION 
SELECT '090605','Mariano Damaso Beraun','Leoncio Prado','Huanuco',9433,766.27 UNION 
SELECT '090606','Jose Crespo y Castillo','Leoncio Prado','Huanuco',25403,2120.66 UNION 
SELECT '090701','Panao','Pachitea','Huanuco',25270,1580.86 UNION 
SELECT '090702','Chaglla','Pachitea','Huanuco',14914,1103.58 UNION 
SELECT '090704','Molino','Pachitea','Huanuco',15486,235.5 UNION 
SELECT '090706','Umari','Pachitea','Huanuco',22098,149.08 UNION 
SELECT '090801','Honoria','Puerto Inca','Huanuco',6330,798.05 UNION 
SELECT '090802','Puerto Inca','Puerto Inca','Huanuco',7538,2147.18 UNION 
SELECT '090803','Codo del Pozuzo','Puerto Inca','Huanuco',6630,3322.04 UNION 
SELECT '090804','Tournavista','Puerto Inca','Huanuco',4559,2228.46 UNION 
SELECT '090805','Yuyapichis','Puerto Inca','Huanuco',6616,1845.62 UNION 
SELECT '090901','Huacaybamba','Huacaybamba','Huanuco',7290,586.21 UNION 
SELECT '090902','Pinra','Huacaybamba','Huanuco',8974,283.71 UNION 
SELECT '090903','Canchabamba','Huacaybamba','Huanuco',3324,186.83 UNION 
SELECT '090904','Cochabamba','Huacaybamba','Huanuco',3650,684.87 UNION 
SELECT '091001','Jesus','Lauricocha','Huanuco',5712,449.9 UNION 
SELECT '091002','Baños','Lauricocha','Huanuco',7184,152.66 UNION 
SELECT '091003','San Francisco de Asis','Lauricocha','Huanuco',2126,84.3 UNION 
SELECT '091004','Queropalca','Lauricocha','Huanuco',3090,131.15 UNION 
SELECT '091005','San Miguel de Cauri','Lauricocha','Huanuco',10381,811.75 UNION 
SELECT '091006','Rondos','Lauricocha','Huanuco',7687,169.42 UNION 
SELECT '091007','Jivia','Lauricocha','Huanuco',2925,61.31 UNION 
SELECT '091101','Chavinillo','Yarowilca','Huanuco',5943,205.16 UNION 
SELECT '091102','Aparicio Pomares','Yarowilca','Huanuco',5488,183.14 UNION 
SELECT '091103','Cahuac','Yarowilca','Huanuco',4687,29.5 UNION 
SELECT '091104','Chacabamba','Yarowilca','Huanuco',3760,16.53 UNION 
SELECT '091105','Jacas Chico','Yarowilca','Huanuco',2038,36.16 UNION 
SELECT '091106','Obas','Yarowilca','Huanuco',5435,123.16 UNION 
SELECT '091107','Pampamarca','Yarowilca','Huanuco',2039,72.68 UNION 
SELECT '091108','Choras','Yarowilca','Huanuco',3665,61.14 UNION 
SELECT '100101','Ica','Ica','Ica',134249,887.51 UNION 
SELECT '100102','La Tinguiña','Ica','Ica',36909,98.34 UNION 
SELECT '100103','Los Aquijes','Ica','Ica',19987,90.92 UNION 
SELECT '100104','Parcona','Ica','Ica',56336,17.39 UNION 
SELECT '100105','Pueblo Nuevo','Ica','Ica',4843,33.12 UNION 
SELECT '100106','Salas','Ica','Ica',24557,651.72 UNION 
SELECT '100107','San Jose de los Molinos','Ica','Ica',6360,363.2 UNION 
SELECT '100108','San Juan Bautista','Ica','Ica',15214,26.39 UNION 
SELECT '100109','Santiago','Ica','Ica',30313,2783.73 UNION 
SELECT '100110','Subtanjalla','Ica','Ica',29063,193.97 UNION 
SELECT '100111','Yauca del Rosario','Ica','Ica',972,1289.1 UNION 
SELECT '100112','Tate','Ica','Ica',4719,7.07 UNION 
SELECT '100113','Pachacutec','Ica','Ica',6949,34.47 UNION 
SELECT '100114','Ocucaje','Ica','Ica',3816,1417.12 UNION 
SELECT '100201','Chincha Alta','Chincha','Ica',65322,238.34 UNION 
SELECT '100202','Chavin','Chincha','Ica',1470,426.17 UNION 
SELECT '100203','Chincha Baja','Chincha','Ica',12536,72.52 UNION 
SELECT '100204','El Carmen','Chincha','Ica',13734,789.9 UNION 
SELECT '100205','Grocio Prado','Chincha','Ica',24910,190.53 UNION 
SELECT '100206','San Pedro de Huacarpana','Chincha','Ica',1700,222.45 UNION 
SELECT '100207','Sunampe','Chincha','Ica',28435,16.76 UNION 
SELECT '100208','Tambo de Mora','Chincha','Ica',5110,22 UNION 
SELECT '100209','Alto Laran','Chincha','Ica',7663,298.83 UNION 
SELECT '100210','Pueblo Nuevo','Chincha','Ica',63297,209.45 UNION 
SELECT '100211','San Juan de Yanac','Chincha','Ica',269,500.4 UNION 
SELECT '100301','Nazca','Nazca','Ica',27249,1252.25 UNION 
SELECT '100302','Changuillo','Nazca','Ica',1457,946.94 UNION 
SELECT '100303','El Ingenio','Nazca','Ica',2697,552.39 UNION 
SELECT '100304','Marcona','Nazca','Ica',12510,1955.2 UNION 
SELECT '100305','Vista Alegre','Nazca','Ica',15935,527.3 UNION 
SELECT '100401','Pisco','Pisco','Ica',54716,24.56 UNION 
SELECT '100402','Huancano','Pisco','Ica',1577,905.14 UNION 
SELECT '100403','Humay','Pisco','Ica',6041,1112.96 UNION 
SELECT '100404','Independencia','Pisco','Ica',14928,272.34 UNION 
SELECT '100405','Paracas','Pisco','Ica',7390,1420 UNION 
SELECT '100406','San Andres','Pisco','Ica',13733,39.45 UNION 
SELECT '100407','San Clemente','Pisco','Ica',22548,127.22 UNION 
SELECT '100408','Tupac Amaru Inca','Pisco','Ica',18366,55.48 UNION 
SELECT '100501','Palpa','Palpa','Ica',7279,147.44 UNION 
SELECT '100502','Llipata','Palpa','Ica',1516,186.18 UNION 
SELECT '100503','Rio Grande','Palpa','Ica',2236,315.52 UNION 
SELECT '100504','Santa Cruz','Palpa','Ica',987,255.7 UNION 
SELECT '100505','Tibillo','Palpa','Ica',316,328.04 UNION 
SELECT '110101','Huancayo','Huancayo','Junin',119025,237.55 UNION 
SELECT '110103','Carhuacallanga','Huancayo','Junin',1398,13.78 UNION 
SELECT '110104','Colca','Huancayo','Junin',2068,113.25 UNION 
SELECT '110105','Cullhuas','Huancayo','Junin',2204,108.01 UNION 
SELECT '110106','Chacapampa','Huancayo','Junin',810,120.72 UNION 
SELECT '110107','Chicche','Huancayo','Junin',901,45.92 UNION 
SELECT '110108','Chilca','Huancayo','Junin',87993,8.3 UNION 
SELECT '110109','Chongos Alto','Huancayo','Junin',1339,701.75 UNION 
SELECT '110112','Chupuro','Huancayo','Junin',1752,13.56 UNION 
SELECT '110113','El Tambo','Huancayo','Junin',166163,73.56 UNION 
SELECT '110114','Huacrapuquio','Huancayo','Junin',1274,24.1 UNION 
SELECT '110116','Hualhuas','Huancayo','Junin',4630,24.82 UNION 
SELECT '110118','Huancan','Huancayo','Junin',21744,12 UNION 
SELECT '110119','Huasicancha','Huancayo','Junin',842,47.61 UNION 
SELECT '110120','Huayucachi','Huancayo','Junin',8665,13.13 UNION 
SELECT '110121','Ingenio','Huancayo','Junin',2507,53.29 UNION 
SELECT '110122','Pariahuanca','Huancayo','Junin',5767,617.5 UNION 
SELECT '110123','Pilcomayo','Huancayo','Junin',17062,20.18 UNION 
SELECT '110124','Pucara','Huancayo','Junin',5008,110.49 UNION 
SELECT '110125','Quichuay','Huancayo','Junin',1745,34.79 UNION 
SELECT '110126','Quilcas','Huancayo','Junin',4268,167.98 UNION 
SELECT '110127','San Agustin','Huancayo','Junin',11955,23.09 UNION 
SELECT '110128','San Jeronimo de Tunan','Huancayo','Junin',10420,20.99 UNION 
SELECT '110131','Santo Domingo de Acobamba','Huancayo','Junin',7776,778.02 UNION 
SELECT '110132','Saño','Huancayo','Junin',4082,11.59 UNION 
SELECT '110133','Sapallanga','Huancayo','Junin',12879,119.02 UNION 
SELECT '110134','Sicaya','Huancayo','Junin',8166,42.73 UNION 
SELECT '110136','Viques','Huancayo','Junin',2247,3.57 UNION 
SELECT '110201','Concepcion','Concepcion','Junin',15010,18.29 UNION 
SELECT '110202','Aco','Concepcion','Junin',1592,37.8 UNION 
SELECT '110203','Andamarca','Concepcion','Junin',4536,694.9 UNION 
SELECT '110204','Comas','Concepcion','Junin',6073,825.29 UNION 
SELECT '110205','Cochas','Concepcion','Junin',1757,165.05 UNION 
SELECT '110206','Chambara','Concepcion','Junin',2882,113.21 UNION 
SELECT '110207','Heroinas Toledo','Concepcion','Junin',1193,25.83 UNION 
SELECT '110208','Manzanares','Concepcion','Junin',1391,20.58 UNION 
SELECT '110209','Mariscal Castilla','Concepcion','Junin',1652,743.84 UNION 
SELECT '110210','Matahuasi','Concepcion','Junin',5171,24.74 UNION 
SELECT '110211','Mito','Concepcion','Junin',1369,25.21 UNION 
SELECT '110212','Nueve de Julio','Concepcion','Junin',1485,7.28 UNION 
SELECT '110213','Orcotuna','Concepcion','Junin',4168,44.61 UNION 
SELECT '110214','Santa Rosa de Ocopa','Concepcion','Junin',2030,13.91 UNION 
SELECT '110215','San Jose de Quero','Concepcion','Junin',6106,314.8 UNION 
SELECT '110301','Jauja','Jauja','Junin',14536,10.1 UNION 
SELECT '110302','Acolla','Jauja','Junin',7215,122.4 UNION 
SELECT '110303','Apata','Jauja','Junin',4084,421.62 UNION 
SELECT '110304','Ataura','Jauja','Junin',1155,5.9 UNION 
SELECT '110305','Canchayllo','Jauja','Junin',1658,974.69 UNION 
SELECT '110306','El Mantaro','Jauja','Junin',2562,17.76 UNION 
SELECT '110307','Huamali','Jauja','Junin',1809,20.19 UNION 
SELECT '110308','Huaripampa','Jauja','Junin',836,14.19 UNION 
SELECT '110309','Huertas','Jauja','Junin',1644,11.82 UNION 
SELECT '110310','Janjaillo','Jauja','Junin',681,31.57 UNION 
SELECT '110311','Julcan','Jauja','Junin',671,24.78 UNION 
SELECT '110312','Leonor Ordoñez','Jauja','Junin',1480,20.34 UNION 
SELECT '110313','Llocllapampa','Jauja','Junin',1001,110.6 UNION 
SELECT '110314','Marco','Jauja','Junin',1590,28.8 UNION 
SELECT '110315','Masma','Jauja','Junin',2065,14.26 UNION 
SELECT '110316','Molinos','Jauja','Junin',1522,312.17 UNION 
SELECT '110317','Monobamba','Jauja','Junin',1055,295.83 UNION 
SELECT '110318','Muqui','Jauja','Junin',960,11.74 UNION 
SELECT '110319','Muquiyauyo','Jauja','Junin',2210,19.86 UNION 
SELECT '110320','Paca','Jauja','Junin',988,34.22 UNION 
SELECT '110321','Paccha','Jauja','Junin',1805,90.86 UNION 
SELECT '110322','Pancan','Jauja','Junin',1280,10.89 UNION 
SELECT '110323','Parco','Jauja','Junin',1152,32.82 UNION 
SELECT '110324','Pomacancha','Jauja','Junin',1975,281.61 UNION 
SELECT '110325','Ricran','Jauja','Junin',1567,319.95 UNION 
SELECT '110326','San Lorenzo','Jauja','Junin',2509,22.15 UNION 
SELECT '110327','San Pedro de Chunan','Jauja','Junin',839,8.44 UNION 
SELECT '110328','Sincos','Jauja','Junin',4912,236.74 UNION 
SELECT '110329','Tunan Marca','Jauja','Junin',1165,30.07 UNION 
SELECT '110330','Yauli','Jauja','Junin',1304,93.15 UNION 
SELECT '110331','Curicaca','Jauja','Junin',1645,64.68 UNION 
SELECT '110332','Masma Chicche','Jauja','Junin',757,29.86 UNION 
SELECT '110333','Sausa','Jauja','Junin',3081,4.5 UNION 
SELECT '110334','Yauyos','Jauja','Junin',9360,20.54 UNION 
SELECT '110401','Junin','Junin','Junin',9492,883.8 UNION 
SELECT '110402','Carhuamayo','Junin','Junin',7768,219.68 UNION 
SELECT '110403','Ondores','Junin','Junin',1828,254.46 UNION 
SELECT '110404','Ulcumayo','Junin','Junin',5783,1129.37 UNION 
SELECT '110501','Tarma','Tarma','Junin',46130,459.95 UNION 
SELECT '110502','Acobamba','Tarma','Junin',13586,97.84 UNION 
SELECT '110503','Huaricolca','Tarma','Junin',3251,162.31 UNION 
SELECT '110504','Huasahuasi','Tarma','Junin',15398,652.15 UNION 
SELECT '110505','La Union','Tarma','Junin',3124,140.4 UNION 
SELECT '110506','Palca','Tarma','Junin',5585,378.08 UNION 
SELECT '110507','Palcamayo','Tarma','Junin',9573,169.24 UNION 
SELECT '110508','San Pedro de Cajas','Tarma','Junin',5669,537.31 UNION 
SELECT '110509','Tapo','Tarma','Junin',6073,151.88 UNION 
SELECT '110601','La Oroya','Yauli','Junin',12577,388.42 UNION 
SELECT '110602','Chacapalpa','Yauli','Junin',704,183.06 UNION 
SELECT '110603','Huay-Huay','Yauli','Junin',1474,179.94 UNION 
SELECT '110604','Marcapomacocha','Yauli','Junin',1297,888.56 UNION 
SELECT '110605','Morococha','Yauli','Junin',4262,265.67 UNION 
SELECT '110606','Paccha','Yauli','Junin',1649,323.69 UNION 
SELECT '110607','Santa Barbara de Carhuacayan','Yauli','Junin',2374,646.29 UNION 
SELECT '110608','Suitucancha','Yauli','Junin',1014,216.47 UNION 
SELECT '110609','Yauli','Yauli','Junin',5113,424.16 UNION 
SELECT '110610','Santa Rosa de Sacco','Yauli','Junin',10413,101.09 UNION 
SELECT '110701','Satipo','Satipo','Junin',43554,732.02 UNION 
SELECT '110702','Coviriali','Satipo','Junin',6332,145.13 UNION 
SELECT '110703','Llaylla','Satipo','Junin',6417,180.39 UNION 
SELECT '110704','Mazamari','Satipo','Junin',65014,2219.63 UNION 
SELECT '110705','Pampa Hermosa','Satipo','Junin',10899,566.82 UNION 
SELECT '110706','Pangoa','Satipo','Junin',60587,3679.4 UNION 
SELECT '110707','Rio Negro','Satipo','Junin',29250,714.98 UNION 
SELECT '110708','Rio Tambo','Satipo','Junin',61259,10349.9 UNION 
SELECT '110801','Chanchamayo','Chanchamayo','Junin',24866,919.72 UNION 
SELECT '110802','San Ramon','Chanchamayo','Junin',27630,591.67 UNION 
SELECT '110803','Vitoc','Chanchamayo','Junin',1734,313.85 UNION 
SELECT '110804','San Luis de Shuaro','Chanchamayo','Junin',7395,212.49 UNION 
SELECT '110805','Pichanaqui','Chanchamayo','Junin',71598,1496.59 UNION 
SELECT '110806','Perene','Chanchamayo','Junin',77635,1191.16 UNION 
SELECT '110901','Chupaca','Chupaca','Junin',22407,21.7 UNION 
SELECT '110902','Ahuac','Chupaca','Junin',5932,70.44 UNION 
SELECT '110903','Chongos Bajo','Chupaca','Junin',4006,100.95 UNION 
SELECT '110904','Huachac','Chupaca','Junin',4027,22.01 UNION 
SELECT '110905','Huamancaca Chico','Chupaca','Junin',6126,9.4 UNION 
SELECT '110906','San Juan de Yscos','Chupaca','Junin',2123,24.7 UNION 
SELECT '110907','San Juan de Jarpa','Chupaca','Junin',3597,137.02 UNION 
SELECT '110908','Tres de Diciembre','Chupaca','Junin',2111,14.66 UNION 
SELECT '110909','Yanacancha','Chupaca','Junin',3547,743.4 UNION 
SELECT '120101','Trujillo','Trujillo','La Libertad',329127,39.36 UNION 
SELECT '120102','Huanchaco','Trujillo','La Libertad',72237,332.14 UNION 
SELECT '120103','Laredo','Trujillo','La Libertad',36353,335.44 UNION 
SELECT '120104','Moche','Trujillo','La Libertad',35945,25.25 UNION 
SELECT '120105','Salaverry','Trujillo','La Libertad',19095,295.88 UNION 
SELECT '120106','Simbal','Trujillo','La Libertad',4433,390.55 UNION 
SELECT '120107','Victor Larco Herrera','Trujillo','La Libertad',66607,18.02 UNION 
SELECT '120109','Poroto','Trujillo','La Libertad',3127,276.01 UNION 
SELECT '120110','El Porvenir','Trujillo','La Libertad',196333,36.7 UNION 
SELECT '120111','La Esperanza','Trujillo','La Libertad',190881,15.55 UNION 
SELECT '120112','Florencia de Mora','Trujillo','La Libertad',42978,1.99 UNION 
SELECT '120201','Bolivar','Bolivar','La Libertad',4921,740.58 UNION 
SELECT '120202','Bambamarca','Bolivar','La Libertad',3992,165.2 UNION 
SELECT '120203','Condormarca','Bolivar','La Libertad',2047,331.26 UNION 
SELECT '120204','Longotea','Bolivar','La Libertad',2242,192.88 UNION 
SELECT '120205','Ucuncha','Bolivar','La Libertad',787,98.41 UNION 
SELECT '120206','Uchumarca','Bolivar','La Libertad',2762,190.53 UNION 
SELECT '120301','Huamachuco','Sanchez Carrion','La Libertad',65142,424.13 UNION 
SELECT '120302','Cochorco','Sanchez Carrion','La Libertad',9588,258.04 UNION 
SELECT '120303','Curgos','Sanchez Carrion','La Libertad',8712,99.5 UNION 
SELECT '120304','Chugay','Sanchez Carrion','La Libertad',19316,416.31 UNION 
SELECT '120305','Marcabal','Sanchez Carrion','La Libertad',17296,229.57 UNION 
SELECT '120306','Sanagoran','Sanchez Carrion','La Libertad',15424,324.38 UNION 
SELECT '120307','Sarin','Sanchez Carrion','La Libertad',10241,340.08 UNION 
SELECT '120308','Sartimbamba','Sanchez Carrion','La Libertad',14090,394.37 UNION 
SELECT '120401','Otuzco','Otuzco','La Libertad',28048,444.13 UNION 
SELECT '120402','Agallpampa','Otuzco','La Libertad',9997,258.56 UNION 
SELECT '120403','Charat','Otuzco','La Libertad',2814,68.89 UNION 
SELECT '120404','Huaranchal','Otuzco','La Libertad',5138,149.65 UNION 
SELECT '120405','La Cuesta','Otuzco','La Libertad',690,39.25 UNION 
SELECT '120408','Paranday','Otuzco','La Libertad',746,21.46 UNION 
SELECT '120409','Salpo','Otuzco','La Libertad',6142,192.74 UNION 
SELECT '120410','Sinsicap','Otuzco','La Libertad',8808,452.95 UNION 
SELECT '120411','Usquil','Otuzco','La Libertad',27986,445.82 UNION 
SELECT '120413','Mache','Otuzco','La Libertad',3129,37.32 UNION 
SELECT '120501','San Pedro de Lloc','Pacasmayo','La Libertad',17017,697.01 UNION 
SELECT '120503','Guadalupe','Pacasmayo','La Libertad',45031,165.37 UNION 
SELECT '120504','Jequetepeque','Pacasmayo','La Libertad',3997,50.98 UNION 
SELECT '120506','Pacasmayo','Pacasmayo','La Libertad',28458,30.84 UNION 
SELECT '120508','San Jose','Pacasmayo','La Libertad',12790,181.06 UNION 
SELECT '120601','Tayabamba','Pataz','La Libertad',15100,339.13 UNION 
SELECT '120602','Buldibuyo','Pataz','La Libertad',3823,227.39 UNION 
SELECT '120603','Chillia','Pataz','La Libertad',14060,300.04 UNION 
SELECT '120604','Huaylillas','Pataz','La Libertad',3691,89.73 UNION 
SELECT '120605','Huancaspata','Pataz','La Libertad',6532,247.48 UNION 
SELECT '120606','Huayo','Pataz','La Libertad',4527,124.63 UNION 
SELECT '120607','Ongon','Pataz','La Libertad',1817,1394.89 UNION 
SELECT '120608','Parcoy','Pataz','La Libertad',22442,304.99 UNION 
SELECT '120609','Pataz','Pataz','La Libertad',9408,467.44 UNION 
SELECT '120610','Pias','Pataz','La Libertad',1293,371.67 UNION 
SELECT '120611','Taurija','Pataz','La Libertad',3067,130.09 UNION 
SELECT '120612','Urpay','Pataz','La Libertad',2809,99.61 UNION 
SELECT '120613','Santiago de Challas','Pataz','La Libertad',2520,129.44 UNION 
SELECT '120701','Santiago de Chuco','Santiago de Chuco','La Libertad',20781,1073.63 UNION 
SELECT '120702','Cachicadan','Santiago de Chuco','La Libertad',8320,266.5 UNION 
SELECT '120703','Mollebamba','Santiago de Chuco','La Libertad',2411,69.69 UNION 
SELECT '120704','Mollepata','Santiago de Chuco','La Libertad',2682,71.2 UNION 
SELECT '120705','Quiruvilca','Santiago de Chuco','La Libertad',14549,549.14 UNION 
SELECT '120706','Santa Cruz de Chuca','Santiago de Chuco','La Libertad',3222,165.12 UNION 
SELECT '120707','Sitabamba','Santiago de Chuco','La Libertad',3367,310.23 UNION 
SELECT '120708','Angasmarca','Santiago de Chuco','La Libertad',7592,153.45 UNION 
SELECT '120801','Ascope','Ascope','La Libertad',6676,290.18 UNION 
SELECT '120802','Chicama','Ascope','La Libertad',15796,870.58 UNION 
SELECT '120803','Chocope','Ascope','La Libertad',9342,95.73 UNION 
SELECT '120804','Santiago de Cao','Ascope','La Libertad',19896,154.55 UNION 
SELECT '120805','Magdalena de Cao','Ascope','La Libertad',3347,163.01 UNION 
SELECT '120806','Paijan','Ascope','La Libertad',26433,79.69 UNION 
SELECT '120807','Razuri','Ascope','La Libertad',9358,317.3 UNION 
SELECT '120808','Casa Grande','Ascope','La Libertad',31875,687.6 UNION 
SELECT '120901','Chepen','Chepen','La Libertad',49927,287.34 UNION 
SELECT '120902','Pacanga','Chepen','La Libertad',24913,583.93 UNION 
SELECT '120903','Pueblo Nuevo','Chepen','La Libertad',15458,271.16 UNION 
SELECT '121001','Julcan','Julcan','La Libertad',11630,208.49 UNION 
SELECT '121002','Carabamba','Julcan','La Libertad',6418,254.28 UNION 
SELECT '121003','Calamarca','Julcan','La Libertad',5604,207.57 UNION 
SELECT '121004','Huaso','Julcan','La Libertad',7304,431.05 UNION 
SELECT '121101','Cascas','Gran Chimu','La Libertad',14386,465.67 UNION 
SELECT '121102','Lucma','Gran Chimu','La Libertad',7210,280.38 UNION 
SELECT '121103','Marmot','Gran Chimu','La Libertad',2054,300.25 UNION 
SELECT '121104','Sayapullo','Gran Chimu','La Libertad',7994,238.47 UNION 
SELECT '121201','Viru','Viru','La Libertad',71152,1072.95 UNION 
SELECT '121202','Chao','Viru','La Libertad',42779,1736.87 UNION 
SELECT '121203','Guadalupito','Viru','La Libertad',10166,404.72 UNION 
SELECT '130101','Chiclayo','Chiclayo','Lambayeque',298467,50.35 UNION 
SELECT '130102','Chongoyape','Chiclayo','Lambayeque',18101,712 UNION 
SELECT '130103','Eten','Chiclayo','Lambayeque',10599,84.78 UNION 
SELECT '130104','Eten Puerto','Chiclayo','Lambayeque',2160,14.48 UNION 
SELECT '130105','Lagunas','Chiclayo','Lambayeque',10436,429.27 UNION 
SELECT '130106','Monsefu','Chiclayo','Lambayeque',32314,44.94 UNION 
SELECT '130107','Nueva Arica','Chiclayo','Lambayeque',2331,208.63 UNION 
SELECT '130108','Oyotun','Chiclayo','Lambayeque',9879,455.4 UNION 
SELECT '130109','Picsi','Chiclayo','Lambayeque',9965,56.92 UNION 
SELECT '130110','Pimentel','Chiclayo','Lambayeque',46075,66.53 UNION 
SELECT '130111','Reque','Chiclayo','Lambayeque',15386,47.03 UNION 
SELECT '130112','Jose Leonardo Ortiz','Chiclayo','Lambayeque',199144,28.22 UNION 
SELECT '130113','Santa Rosa','Chiclayo','Lambayeque',13030,14.09 UNION 
SELECT '130114','Saña','Chiclayo','Lambayeque',12397,313.9 UNION 
SELECT '130115','La Victoria','Chiclayo','Lambayeque',93069,29.36 UNION 
SELECT '130116','Cayalti','Chiclayo','Lambayeque',15915,162.86 UNION 
SELECT '130117','Patapo','Chiclayo','Lambayeque',22843,182.81 UNION 
SELECT '130118','Pomalca','Chiclayo','Lambayeque',25831,80.35 UNION 
SELECT '130119','Pucala','Chiclayo','Lambayeque',8958,175.81 UNION 
SELECT '130120','Tuman','Chiclayo','Lambayeque',30713,130.34 UNION 
SELECT '130201','Ferreñafe','Ferreñafe','Lambayeque',35919,62.18 UNION 
SELECT '130202','Incahuasi','Ferreñafe','Lambayeque',15733,443.91 UNION 
SELECT '130203','Cañaris','Ferreñafe','Lambayeque',14787,284.88 UNION 
SELECT '130204','Pitipo','Ferreñafe','Lambayeque',24214,558.18 UNION 
SELECT '130205','Pueblo Nuevo','Ferreñafe','Lambayeque',13619,28.88 UNION 
SELECT '130206','Manuel Antonio Mesones Muro','Ferreñafe','Lambayeque',4254,200.57 UNION 
SELECT '130301','Lambayeque','Lambayeque','Lambayeque',79914,330.73 UNION 
SELECT '130302','Chochope','Lambayeque','Lambayeque',1122,79.27 UNION 
SELECT '130303','Illimo','Lambayeque','Lambayeque',9415,24.37 UNION 
SELECT '130304','Jayanca','Lambayeque','Lambayeque',18039,680.96 UNION 
SELECT '130305','Mochumi','Lambayeque','Lambayeque',19467,103.7 UNION 
SELECT '130306','Morrope','Lambayeque','Lambayeque',47455,1041.66 UNION 
SELECT '130307','Motupe','Lambayeque','Lambayeque',26985,557.37 UNION 
SELECT '130308','Olmos','Lambayeque','Lambayeque',41587,5583.47 UNION 
SELECT '130309','Pacora','Lambayeque','Lambayeque',7299,87.79 UNION 
SELECT '130310','Salas','Lambayeque','Lambayeque',13056,991.8 UNION 
SELECT '130311','San Jose','Lambayeque','Lambayeque',16851,46.73 UNION 
SELECT '130312','Tucume','Lambayeque','Lambayeque',23288,67 UNION 
SELECT '140101','Lima','Lima','Lima',269858,21.98 UNION 
SELECT '140102','Ancon','Lima','Lima',42124,285.45 UNION 
SELECT '140103','Ate','Lima','Lima',672160,77.72 UNION 
SELECT '140104','Breña','Lima','Lima',75882,3.22 UNION 
SELECT '140105','Carabayllo','Lima','Lima',322936,303.31 UNION 
SELECT '140106','Comas','Lima','Lima',545685,48.75 UNION 
SELECT '140107','Chaclacayo','Lima','Lima',44890,39.5 UNION 
SELECT '140108','Chorrillos','Lima','Lima',341322,38.94 UNION 
SELECT '140109','La Victoria','Lima','Lima',169270,8.74 UNION 
SELECT '140110','La Molina','Lima','Lima',182603,65.75 UNION 
SELECT '140111','Lince','Lima','Lima',49833,3.03 UNION 
SELECT '140112','Lurigancho','Lima','Lima',232902,236.47 UNION 
SELECT '140113','Lurin','Lima','Lima',90818,180.26 UNION 
SELECT '140114','Magdalena del Mar','Lima','Lima',55786,3.61 UNION 
SELECT '140115','Miraflores','Lima','Lima',82898,9.62 UNION 
SELECT '140116','Pachacamac','Lima','Lima',139067,160.23 UNION 
SELECT '140117','Pueblo Libre','Lima','Lima',77322,4.38 UNION 
SELECT '140118','Pucusana','Lima','Lima',18284,37.39 UNION 
SELECT '140119','Puente Piedra','Lima','Lima',378910,72.81 UNION 
SELECT '140120','Punta Hermosa','Lima','Lima',8104,119.5 UNION 
SELECT '140121','Punta Negra','Lima','Lima',8500,130.5 UNION 
SELECT '140122','Rimac','Lima','Lima',165451,11.87 UNION 
SELECT '140123','San Bartolo','Lima','Lima',8200,45.01 UNION 
SELECT '140124','San Isidro','Lima','Lima',54298,11.1 UNION 
SELECT '140125','Barranco','Lima','Lima',29424,3.33 UNION 
SELECT '140126','San Martin de Porres','Lima','Lima',741417,36.82 UNION 
SELECT '140127','San Miguel','Lima','Lima',139399,10.72 UNION 
SELECT '140128','Santa Maria del Mar','Lima','Lima',1721,9.81 UNION 
SELECT '140129','Santa Rosa','Lima','Lima',20112,21.35 UNION 
SELECT '140130','Santiago de Surco','Lima','Lima',363183,35.89 UNION 
SELECT '140131','Surquillo','Lima','Lima',92908,3.46 UNION 
SELECT '140132','Villa Maria del Triunfo','Lima','Lima',473036,70.57 UNION 
SELECT '140133','Jesus Maria','Lima','Lima',72804,4.57 UNION 
SELECT '140134','Independencia','Lima','Lima',223827,14.56 UNION 
SELECT '140135','El Agustino','Lima','Lima',198366,12.54 UNION 
SELECT '140136','San Juan de Miraflores','Lima','Lima',422389,22.97 UNION 
SELECT '140137','San Juan de Lurigancho','Lima','Lima',1156300,131.25 UNION 
SELECT '140138','San Luis','Lima','Lima',59377,3.49 UNION 
SELECT '140139','Cieneguilla','Lima','Lima',50486,240.33 UNION 
SELECT '140140','San Borja','Lima','Lima',114479,9.96 UNION 
SELECT '140141','Villa El Salvador','Lima','Lima',489583,35.46 UNION 
SELECT '140142','Los Olivos','Lima','Lima',390742,18.25 UNION 
SELECT '140143','Santa Anita','Lima','Lima',242026,10.69 UNION 
SELECT '140201','Cajatambo','Cajatambo','Lima',2260,567.96 UNION 
SELECT '140205','Copa','Cajatambo','Lima',803,212.16 UNION 
SELECT '140206','Gorgor','Cajatambo','Lima',2774,309.95 UNION 
SELECT '140207','Huancapon','Cajatambo','Lima',982,146.1 UNION 
SELECT '140208','Manas','Cajatambo','Lima',982,279.04 UNION 
SELECT '140301','Canta','Canta','Lima',2900,123.09 UNION 
SELECT '140302','Arahuay','Canta','Lima',796,134.29 UNION 
SELECT '140303','Huamantanga','Canta','Lima',1349,488.09 UNION 
SELECT '140304','Huaros','Canta','Lima',785,333.45 UNION 
SELECT '140305','Lachaqui','Canta','Lima',904,137.87 UNION 
SELECT '140306','San Buenaventura','Canta','Lima',567,106.26 UNION 
SELECT '140307','Santa Rosa de Quives','Canta','Lima',8388,408.11 UNION 
SELECT '140401','San Vicente de Cañete','Cañete','Lima',58091,513.15 UNION 
SELECT '140402','Calango','Cañete','Lima',2434,530.89 UNION 
SELECT '140403','Cerro Azul','Cañete','Lima',8489,105.08 UNION 
SELECT '140404','Coayllo','Cañete','Lima',1097,590.99 UNION 
SELECT '140405','Chilca','Cañete','Lima',16350,475.47 UNION 
SELECT '140406','Imperial','Cañete','Lima',41037,53.16 UNION 
SELECT '140407','Lunahuana','Cañete','Lima',4921,500.33 UNION 
SELECT '140408','Mala','Cañete','Lima',35929,129.31 UNION 
SELECT '140409','Nuevo Imperial','Cañete','Lima',24623,329.3 UNION 
SELECT '140410','Pacaran','Cañete','Lima',1842,258.72 UNION 
SELECT '140411','Quilmana','Cañete','Lima',15823,437.4 UNION 
SELECT '140412','San Antonio','Cañete','Lima',4371,37.15 UNION 
SELECT '140413','San Luis','Cañete','Lima',13420,38.53 UNION 
SELECT '140414','Santa Cruz de Flores','Cañete','Lima',2898,100.06 UNION 
SELECT '140415','Zuñiga','Cañete','Lima',1912,198.01 UNION 
SELECT '140416','Asia','Cañete','Lima',9902,277.36 UNION 
SELECT '140501','Huacho','Huaura','Lima',60196,717.02 UNION 
SELECT '140502','Ambar','Huaura','Lima',2761,929.68 UNION 
SELECT '140504','Caleta de Carquin','Huaura','Lima',7055,2.04 UNION 
SELECT '140505','Checras','Huaura','Lima',1864,166.37 UNION 
SELECT '140506','Hualmay','Huaura','Lima',29448,5.81 UNION 
SELECT '140507','Huaura','Huaura','Lima',36793,484.43 UNION 
SELECT '140508','Leoncio Prado','Huaura','Lima',2004,300.13 UNION 
SELECT '140509','Paccho','Huaura','Lima',2225,229.25 UNION 
SELECT '140511','Santa Leonor','Huaura','Lima',1462,375.49 UNION 
SELECT '140512','Santa Maria','Huaura','Lima',35132,127.51 UNION 
SELECT '140513','Sayan','Huaura','Lima',24941,1310.77 UNION 
SELECT '140516','Vegueta','Huaura','Lima',23091,253.7 UNION 
SELECT '140601','Matucana','Huarochiri','Lima',3584,179.44 UNION 
SELECT '140602','Antioquia','Huarochiri','Lima',1246,387.98 UNION 
SELECT '140603','Callahuanca','Huarochiri','Lima',4357,57.47 UNION 
SELECT '140604','Carampoma','Huarochiri','Lima',1907,234.21 UNION 
SELECT '140605','San Pedro de Casta','Huarochiri','Lima',1325,79.91 UNION 
SELECT '140606','Cuenca','Huarochiri','Lima',397,60.02 UNION 
SELECT '140607','Chicla','Huarochiri','Lima',7881,244.1 UNION 
SELECT '140608','Huanza','Huarochiri','Lima',2851,227.01 UNION 
SELECT '140609','Huarochiri','Huarochiri','Lima',1251,249.09 UNION 
SELECT '140610','Lahuaytambo','Huarochiri','Lima',651,81.88 UNION 
SELECT '140611','Langa','Huarochiri','Lima',822,80.99 UNION 
SELECT '140612','Mariatana','Huarochiri','Lima',1325,168.63 UNION 
SELECT '140613','Ricardo Palma','Huarochiri','Lima',6358,34.59 UNION 
SELECT '140614','San Andres de Tupicocha','Huarochiri','Lima',1272,83.35 UNION 
SELECT '140615','San Antonio','Huarochiri','Lima',5785,563.59 UNION 
SELECT '140616','San Bartolome','Huarochiri','Lima',2409,43.91 UNION 
SELECT '140617','San Damian','Huarochiri','Lima',1137,343.22 UNION 
SELECT '140618','Sangallaya','Huarochiri','Lima',569,81.92 UNION 
SELECT '140619','San Juan de Tantaranche','Huarochiri','Lima',477,137.16 UNION 
SELECT '140620','San Lorenzo de Quinti','Huarochiri','Lima',1547,467.58 UNION 
SELECT '140621','San Mateo','Huarochiri','Lima',5120,425.6 UNION 
SELECT '140622','San Mateo de Otao','Huarochiri','Lima',1599,123.91 UNION 
SELECT '140623','San Pedro de Huancayre','Huarochiri','Lima',248,41.75 UNION 
SELECT '140624','Santa Cruz de Cocachacra','Huarochiri','Lima',2541,41.5 UNION 
SELECT '140625','Santa Eulalia','Huarochiri','Lima',12476,111.12 UNION 
SELECT '140626','Santiago de Anchucaya','Huarochiri','Lima',526,94.01 UNION 
SELECT '140627','Santiago de Tuna','Huarochiri','Lima',762,54.25 UNION 
SELECT '140628','Santo Domingo de los Olleros','Huarochiri','Lima',5026,552.32 UNION 
SELECT '140629','Surco','Huarochiri','Lima',1973,102.58 UNION 
SELECT '140630','Huachupampa','Huarochiri','Lima',3003,76.02 UNION 
SELECT '140631','Laraos','Huarochiri','Lima',2452,104.51 UNION 
SELECT '140632','San Juan de Iris','Huarochiri','Lima',1891,124.31 UNION 
SELECT '140701','Yauyos','Yauyos','Lima',2905,327.17 UNION 
SELECT '140702','Alis','Yauyos','Lima',1233,142.06 UNION 
SELECT '140703','Ayauca','Yauyos','Lima',2293,438.79 UNION 
SELECT '140704','Ayaviri','Yauyos','Lima',675,238.83 UNION 
SELECT '140705','Azangaro','Yauyos','Lima',519,79.84 UNION 
SELECT '140706','Cacra','Yauyos','Lima',383,213.79 UNION 
SELECT '140707','Carania','Yauyos','Lima',378,122.13 UNION 
SELECT '140708','Cochas','Yauyos','Lima',449,27.73 UNION 
SELECT '140709','Colonia','Yauyos','Lima',1288,323.96 UNION 
SELECT '140710','Chocos','Yauyos','Lima',1236,213.37 UNION 
SELECT '140711','Huampara','Yauyos','Lima',175,54.03 UNION 
SELECT '140712','Huancaya','Yauyos','Lima',1424,283.6 UNION 
SELECT '140713','Huangascar','Yauyos','Lima',549,50.46 UNION 
SELECT '140714','Huantan','Yauyos','Lima',943,516.35 UNION 
SELECT '140715','Huañec','Yauyos','Lima',485,37.54 UNION 
SELECT '140716','Laraos','Yauyos','Lima',725,402.85 UNION 
SELECT '140717','Lincha','Yauyos','Lima',966,221.22 UNION 
SELECT '140718','Miraflores','Yauyos','Lima',447,226.24 UNION 
SELECT '140719','Omas','Yauyos','Lima',562,295.35 UNION 
SELECT '140720','Quinches','Yauyos','Lima',961,113.33 UNION 
SELECT '140721','Quinocay','Yauyos','Lima',530,153.13 UNION 
SELECT '140722','San Joaquin','Yauyos','Lima',452,41.24 UNION 
SELECT '140723','San Pedro de Pilas','Yauyos','Lima',364,97.39 UNION 
SELECT '140724','Tanta','Yauyos','Lima',504,347.15 UNION 
SELECT '140725','Tauripampa','Yauyos','Lima',405,530.86 UNION 
SELECT '140726','Tupe','Yauyos','Lima',648,321.15 UNION 
SELECT '140727','Tomas','Yauyos','Lima',1151,297.93 UNION 
SELECT '140728','Viñac','Yauyos','Lima',1906,165.23 UNION 
SELECT '140729','Vitis','Yauyos','Lima',665,101.79 UNION 
SELECT '140730','Hongos','Yauyos','Lima',388,103.8 UNION 
SELECT '140731','Madean','Yauyos','Lima',804,220.72 UNION 
SELECT '140732','Putinza','Yauyos','Lima',489,66.44 UNION 
SELECT '140733','Catahuasi','Yauyos','Lima',943,123.86 UNION 
SELECT '140801','Huaral','Huaral','Lima',104610,640.76 UNION 
SELECT '140802','Atavillos Alto','Huaral','Lima',626,347.69 UNION 
SELECT '140803','Atavillos Bajo','Huaral','Lima',1135,164.89 UNION 
SELECT '140804','Aucallama','Huaral','Lima',20446,729.41 UNION 
SELECT '140805','Chancay','Huaral','Lima',65014,150.11 UNION 
SELECT '140806','Ihuari','Huaral','Lima',2344,467.67 UNION 
SELECT '140807','Lampian','Huaral','Lima',389,144.97 UNION 
SELECT '140808','Pacaraos','Huaral','Lima',385,294.04 UNION 
SELECT '140809','San Miguel de Acos','Huaral','Lima',777,48.16 UNION 
SELECT '140810','Veintisiete de Noviembre','Huaral','Lima',414,204.27 UNION 
SELECT '140811','Santa Cruz de Andamarca','Huaral','Lima',1469,216.92 UNION 
SELECT '140812','Sumbilca','Huaral','Lima',948,259.38 UNION 
SELECT '140901','Barranca','Barranca','Lima',73485,158.82 UNION 
SELECT '140902','Paramonga','Barranca','Lima',22373,408.59 UNION 
SELECT '140903','Pativilca','Barranca','Lima',20032,278.64 UNION 
SELECT '140904','Supe','Barranca','Lima',23345,512.92 UNION 
SELECT '140905','Supe Puerto','Barranca','Lima',11898,11.51 UNION 
SELECT '141001','Oyon','Oyon','Lima',15066,890.43 UNION 
SELECT '141002','Navan','Oyon','Lima',1235,227.16 UNION 
SELECT '141003','Caujul','Oyon','Lima',1076,105.5 UNION 
SELECT '141004','Andajes','Oyon','Lima',1058,148.18 UNION 
SELECT '141005','Pachangara','Oyon','Lima',3485,252.05 UNION 
SELECT '141006','Cochamarca','Oyon','Lima',1653,265.55 UNION 
SELECT '150101','Iquitos','Maynas','Loreto',151072,358.15 UNION 
SELECT '150102','Alto Nanay','Maynas','Loreto',3064,14290.81 UNION 
SELECT '150103','Fernando Lores','Maynas','Loreto',20646,4476.19 UNION 
SELECT '150104','Las Amazonas','Maynas','Loreto',9926,6593.64 UNION 
SELECT '150105','Mazan','Maynas','Loreto',14057,9884.28 UNION 
SELECT '150106','Napo','Maynas','Loreto',16695,24049.95 UNION 
SELECT '150107','Putumayo','Maynas','Loreto',4341,10886.41 UNION 
SELECT '150108','Torres Causana','Maynas','Loreto',5238,6795.14 UNION 
SELECT '150110','Indiana','Maynas','Loreto',11273,3297.76 UNION 
SELECT '150111','Punchana','Maynas','Loreto',94201,1573.39 UNION 
SELECT '150112','Belen','Maynas','Loreto',77641,632.8 UNION 
SELECT '150113','San Juan Bautista','Maynas','Loreto',161819,3117.05 UNION 
SELECT '150114','Teniente Manuel Clavero','Maynas','Loreto',5926,9488.52 UNION 
SELECT '150201','Yurimaguas','Alto Amazonas','Loreto',74047,2187.67 UNION 
SELECT '150202','Balsapuerto','Alto Amazonas','Loreto',18042,2954.17 UNION 
SELECT '150205','Jeberos','Alto Amazonas','Loreto',5453,4253.68 UNION 
SELECT '150206','Lagunas','Alto Amazonas','Loreto',14584,5929.16 UNION 
SELECT '150210','Santa Cruz','Alto Amazonas','Loreto',4535,2222.31 UNION 
SELECT '150211','Teniente Cesar Lopez Rojas','Alto Amazonas','Loreto',6743,1292.03 UNION 
SELECT '150301','Nauta','Loreto','Loreto',30631,6672.35 UNION 
SELECT '150302','Parinari','Loreto','Loreto',7331,12934.74 UNION 
SELECT '150303','Tigre','Loreto','Loreto',8664,19785.7 UNION 
SELECT '150304','Urarinas','Loreto','Loreto',15270,15434.46 UNION 
SELECT '150305','Trompeteros','Loreto','Loreto',11196,12246.01 UNION 
SELECT '150401','Requena','Requena','Loreto',31004,3038.56 UNION 
SELECT '150402','Alto Tapiche','Requena','Loreto',2139,9013.8 UNION 
SELECT '150403','Capelo','Requena','Loreto',4564,842.37 UNION 
SELECT '150404','Emilio San Martin','Requena','Loreto',7637,4572.56 UNION 
SELECT '150405','Maquia','Requena','Loreto',8508,4792.06 UNION 
SELECT '150406','Puinahua','Requena','Loreto',6170,6149.49 UNION 
SELECT '150407','Saquena','Requena','Loreto',5025,2081.42 UNION 
SELECT '150408','Soplin','Requena','Loreto',707,4711.38 UNION 
SELECT '150409','Tapiche','Requena','Loreto',1245,2014.23 UNION 
SELECT '150410','Jenaro Herrera','Requena','Loreto',5754,1517.43 UNION 
SELECT '150411','Yaquerana','Requena','Loreto',3090,10947.16 UNION 
SELECT '150501','Contamana','Ucayali','Loreto',28098,10675.13 UNION 
SELECT '150502','Vargas Guerra','Ucayali','Loreto',9125,1846.49 UNION 
SELECT '150503','Padre Marquez','Ucayali','Loreto',7901,2475.66 UNION 
SELECT '150504','Pampa Hermosa','Ucayali','Loreto',11081,7346.98 UNION 
SELECT '150505','Sarayacu','Ucayali','Loreto',16913,6303.17 UNION 
SELECT '150506','Inahuaya','Ucayali','Loreto',2751,646.04 UNION 
SELECT '150601','Ramon Castilla','Mariscal Ramon Castilla','Loreto',25020,7163.07 UNION 
SELECT '150602','Pebas','Mariscal Ramon Castilla','Loreto',17653,11048.35 UNION 
SELECT '150603','Yavari','Mariscal Ramon Castilla','Loreto',16315,13807.54 UNION 
SELECT '150604','San Pablo','Mariscal Ramon Castilla','Loreto',16675,5045.58 UNION 
SELECT '150701','Barranca','Datem del Marañon','Loreto',14043,7235.53 UNION 
SELECT '150702','Andoas','Datem del Marañon','Loreto',12869,11540.66 UNION 
SELECT '150703','Cahuapanas','Datem del Marañon','Loreto',8639,4685.11 UNION 
SELECT '150704','Manseriche','Datem del Marañon','Loreto',10707,3493.77 UNION 
SELECT '150705','Morona','Datem del Marañon','Loreto',13609,10776.95 UNION 
SELECT '150706','Pastaza','Datem del Marañon','Loreto',6496,8908.91 UNION 
SELECT '160101','Tambopata','Tambopata','Madre de Dios',84207,22218.56 UNION 
SELECT '160102','Inambari','Tambopata','Madre de Dios',10818,4256.82 UNION 
SELECT '160103','Las Piedras','Tambopata','Madre de Dios',6101,7032.21 UNION 
SELECT '160104','Laberinto','Tambopata','Madre de Dios',5329,2760.9 UNION 
SELECT '160201','Manu','Manu','Madre de Dios',3321,8166.65 UNION 
SELECT '160202','Fitzcarrald','Manu','Madre de Dios',1641,10955.29 UNION 
SELECT '160203','Madre de Dios','Manu','Madre de Dios',13835,7234.81 UNION 
SELECT '160204','Huepetuhe','Manu','Madre de Dios',6802,1478.42 UNION 
SELECT '160301','Iñapari','Tahuamanu','Madre de Dios',1659,14853.66 UNION 
SELECT '160302','Iberia','Tahuamanu','Madre de Dios',9486,2549.32 UNION 
SELECT '160303','Tahuamanu','Tahuamanu','Madre de Dios',3658,3793.9 UNION 
SELECT '170101','Moquegua','Mariscal Nieto','Moquegua',59387,3949.04 UNION 
SELECT '170102','Carumas','Mariscal Nieto','Moquegua',5805,2256.31 UNION 
SELECT '170103','Cuchumbaya','Mariscal Nieto','Moquegua',2228,67.58 UNION 
SELECT '170104','San Cristobal','Mariscal Nieto','Moquegua',4190,542.73 UNION 
SELECT '170105','Torata','Mariscal Nieto','Moquegua',5784,1793.37 UNION 
SELECT '170106','Samegua','Mariscal Nieto','Moquegua',6581,62.55 UNION 
SELECT '170201','Omate','General Sanchez Cerro','Moquegua',4661,250.64 UNION 
SELECT '170202','Coalaque','General Sanchez Cerro','Moquegua',1104,247.58 UNION 
SELECT '170203','Chojata','General Sanchez Cerro','Moquegua',2685,847.94 UNION 
SELECT '170204','Ichuña','General Sanchez Cerro','Moquegua',5048,1017.74 UNION 
SELECT '170205','La Capilla','General Sanchez Cerro','Moquegua',2326,776.04 UNION 
SELECT '170206','Lloque','General Sanchez Cerro','Moquegua',2087,254.45 UNION 
SELECT '170207','Matalaque','General Sanchez Cerro','Moquegua',1236,557.23 UNION 
SELECT '170208','Puquina','General Sanchez Cerro','Moquegua',2469,550.99 UNION 
SELECT '170209','Quinistaquillas','General Sanchez Cerro','Moquegua',1487,193.79 UNION 
SELECT '170210','Ubinas','General Sanchez Cerro','Moquegua',3714,874.57 UNION 
SELECT '170211','Yunga','General Sanchez Cerro','Moquegua',2514,110.74 UNION 
SELECT '170301','Ilo','Ilo','Moquegua',69079,295.51 UNION 
SELECT '170302','El Algarrobal','Ilo','Moquegua',332,747 UNION 
SELECT '170303','Pacocha','Ilo','Moquegua',3319,338.08 UNION 
SELECT '180101','Chaupimarca','Pasco','Pasco',25724,6.66 UNION 
SELECT '180103','Huachon','Pasco','Pasco',4762,846.3 UNION 
SELECT '180104','Huariaca','Pasco','Pasco',8278,133.07 UNION 
SELECT '180105','Huayllay','Pasco','Pasco',11564,1026.87 UNION 
SELECT '180106','Ninacaca','Pasco','Pasco',3297,508.92 UNION 
SELECT '180107','Pallanchacra','Pasco','Pasco',5040,73.69 UNION 
SELECT '180108','Paucartambo','Pasco','Pasco',25070,782.19 UNION 
SELECT '180109','San Francisco de Asis de Yarusyacan','Pasco','Pasco',9518,117.7 UNION 
SELECT '180110','Simon Bolivar','Pasco','Pasco',11404,697.15 UNION 
SELECT '180111','Ticlacayan','Pasco','Pasco',14863,748.43 UNION 
SELECT '180112','Tinyahuarco','Pasco','Pasco',6346,94.49 UNION 
SELECT '180113','Vicco','Pasco','Pasco',2173,173.3 UNION 
SELECT '180114','Yanacancha','Pasco','Pasco',30792,165.11 UNION 
SELECT '180201','Yanahuanca','Daniel Alcides Carrion','Pasco',12963,921.06 UNION 
SELECT '180202','Chacayan','Daniel Alcides Carrion','Pasco',4439,198.58 UNION 
SELECT '180203','Goyllarisquizga','Daniel Alcides Carrion','Pasco',4234,23.17 UNION 
SELECT '180204','Paucar','Daniel Alcides Carrion','Pasco',1721,134.18 UNION 
SELECT '180205','San Pedro de Pillao','Daniel Alcides Carrion','Pasco',1883,92.17 UNION 
SELECT '180206','Santa Ana de Tusi','Daniel Alcides Carrion','Pasco',23892,353.11 UNION 
SELECT '180207','Tapuc','Daniel Alcides Carrion','Pasco',4533,60.19 UNION 
SELECT '180208','Vilcabamba','Daniel Alcides Carrion','Pasco',1563,102.35 UNION 
SELECT '180301','Oxapampa','Oxapampa','Pasco',14438,419.85 UNION 
SELECT '180302','Chontabamba','Oxapampa','Pasco',3598,457.09 UNION 
SELECT '180303','Huancabamba','Oxapampa','Pasco',6628,1182.15 UNION 
SELECT '180304','Puerto Bermudez','Oxapampa','Pasco',18016,8014.31 UNION 
SELECT '180305','Villa Rica','Oxapampa','Pasco',20633,859.23 UNION 
SELECT '180306','Pozuzo','Oxapampa','Pasco',9818,750.87 UNION 
SELECT '180307','Palcazu','Oxapampa','Pasco',11282,2912.16 UNION 
SELECT '180308','Constitución','Oxapampa','Pasco',12105,3171.49 UNION 
SELECT '190101','Piura','Piura','Piura',158034,196.15 UNION 
SELECT '190103','Castilla','Piura','Piura',147546,656.69 UNION 
SELECT '190104','Catacaos','Piura','Piura',74562,2286.97 UNION 
SELECT '190105','La Arena','Piura','Piura',38483,171.24 UNION 
SELECT '190106','La Union','Piura','Piura',41736,320.9 UNION 
SELECT '190107','Las Lomas','Piura','Piura',27290,557.69 UNION 
SELECT '190109','Tambo Grande','Piura','Piura',123352,1496.75 UNION 
SELECT '190113','Cura Mori','Piura','Piura',19168,217.41 UNION 
SELECT '190114','El Tallan','Piura','Piura',5215,100.98 UNION 
SELECT '190201','Ayabaca','Ayabaca','Piura',38963,1549.99 UNION 
SELECT '190202','Frias','Ayabaca','Piura',24461,565.31 UNION 
SELECT '190203','Lagunas','Ayabaca','Piura',7425,190.82 UNION 
SELECT '190204','Montero','Ayabaca','Piura',6619,130.57 UNION 
SELECT '190205','Pacaipampa','Ayabaca','Piura',25060,981.5 UNION 
SELECT '190206','Sapillica','Ayabaca','Piura',12442,267.09 UNION 
SELECT '190207','Sicchez','Ayabaca','Piura',1829,33.1 UNION 
SELECT '190208','Suyo','Ayabaca','Piura',12471,1078.61 UNION 
SELECT '190209','Jilili','Ayabaca','Piura',2768,104.73 UNION 
SELECT '190210','Paimas','Ayabaca','Piura',10504,319.67 UNION 
SELECT '190301','Huancabamba','Huancabamba','Piura',30956,446.75 UNION 
SELECT '190302','Canchaque','Huancabamba','Piura',8173,306.41 UNION 
SELECT '190303','Huarmaca','Huancabamba','Piura',41688,1908.22 UNION 
SELECT '190304','Sondor','Huancabamba','Piura',8679,336.53 UNION 
SELECT '190305','Sondorillo','Huancabamba','Piura',10910,226.09 UNION 
SELECT '190306','El Carmen de La Frontera','Huancabamba','Piura',14195,702.81 UNION 
SELECT '190307','San Miguel de El Faique','Huancabamba','Piura',9067,201.6 UNION 
SELECT '190308','Lalaquiz','Huancabamba','Piura',4666,138.95 UNION 
SELECT '190401','Chulucanas','Morropon','Piura',76815,842.26 UNION 
SELECT '190402','Buenos Aires','Morropon','Piura',8147,245.12 UNION 
SELECT '190403','Chalaco','Morropon','Piura',9190,151.96 UNION 
SELECT '190404','Morropon','Morropon','Piura',14240,169.96 UNION 
SELECT '190405','Salitral','Morropon','Piura',8470,614.03 UNION 
SELECT '190406','Santa Catalina de Mossa','Morropon','Piura',4187,76.76 UNION 
SELECT '190407','Santo Domingo','Morropon','Piura',7335,187.32 UNION 
SELECT '190408','La Matanza','Morropon','Piura',12912,1043.61 UNION 
SELECT '190409','Yamango','Morropon','Piura',9715,216.91 UNION 
SELECT '190410','San Juan de Bigote','Morropon','Piura',6747,245.21 UNION 
SELECT '190501','Paita','Paita','Piura',96707,706.31 UNION 
SELECT '190502','Amotape','Paita','Piura',2336,90.82 UNION 
SELECT '190503','Arenal','Paita','Piura',1049,8.19 UNION 
SELECT '190504','La Huaca','Paita','Piura',11921,599.51 UNION 
SELECT '190505','Colan','Paita','Piura',12625,124.93 UNION 
SELECT '190506','Tamarindo','Paita','Piura',4632,63.67 UNION 
SELECT '190507','Vichayal','Paita','Piura',4901,134.36 UNION 
SELECT '190601','Sullana','Sullana','Piura',180896,529.73 UNION 
SELECT '190602','Bellavista','Sullana','Piura',38621,3.09 UNION 
SELECT '190603','Lancones','Sullana','Piura',13525,2152.99 UNION 
SELECT '190604','Marcavelica','Sullana','Piura',29411,1687.98 UNION 
SELECT '190605','Miguel Checa','Sullana','Piura',8861,480.26 UNION 
SELECT '190606','Querecotillo','Sullana','Piura',25675,270.08 UNION 
SELECT '190607','Salitral','Sullana','Piura',6834,28.27 UNION 
SELECT '190608','Ignacio Escudero','Sullana','Piura',20502,306.53 UNION 
SELECT '190701','Pariñas','Talara','Piura',91278,1116.99 UNION 
SELECT '190702','El Alto','Talara','Piura',7114,491.33 UNION 
SELECT '190703','La Brea','Talara','Piura',11926,692.96 UNION 
SELECT '190704','Lobitos','Talara','Piura',1685,233.01 UNION 
SELECT '190705','Mancora','Talara','Piura',13045,100.19 UNION 
SELECT '190706','Los Organos','Talara','Piura',9510,165.01 UNION 
SELECT '190801','Sechura','Sechura','Piura',44407,5710.85 UNION 
SELECT '190802','Vice','Sechura','Piura',14475,261.01 UNION 
SELECT '190803','Bernal','Sechura','Piura',7477,71.74 UNION 
SELECT '190804','Bellavista de La Union','Sechura','Piura',4498,13.88 UNION 
SELECT '190805','Cristo Nos Valga','Sechura','Piura',4067,234.37 UNION 
SELECT '190806','Rinconada Llicuar','Sechura','Piura',3298,19.44 UNION 
SELECT '200101','Puno','Puno','Puno',146095,460.63 UNION 
SELECT '200102','Acora','Puno','Puno',28363,1941.09 UNION 
SELECT '200103','Atuncolla','Puno','Puno',5778,124.74 UNION 
SELECT '200104','Capachica','Puno','Puno',11436,117.06 UNION 
SELECT '200105','Coata','Puno','Puno',8265,104 UNION 
SELECT '200106','Chucuito','Puno','Puno',6807,121.18 UNION 
SELECT '200107','Huata','Puno','Puno',10988,130.37 UNION 
SELECT '200108','Mañazo','Puno','Puno',5400,410.67 UNION 
SELECT '200109','Paucarcolla','Puno','Puno',5254,170.04 UNION 
SELECT '200110','Pichacani','Puno','Puno',5298,1633.48 UNION 
SELECT '200111','San Antonio','Puno','Puno',4025,376.75 UNION 
SELECT '200112','Tiquillaca','Puno','Puno',1725,455.71 UNION 
SELECT '200113','Vilque','Puno','Puno',3163,193.29 UNION 
SELECT '200114','Plateria','Puno','Puno',7674,238.59 UNION 
SELECT '200115','Amantani','Puno','Puno',4538,15 UNION 
SELECT '200201','Azangaro','Azangaro','Puno',28809,706.13 UNION 
SELECT '200202','Achaya','Azangaro','Puno',4619,132.23 UNION 
SELECT '200203','Arapa','Azangaro','Puno',7707,329.85 UNION 
SELECT '200204','Asillo','Azangaro','Puno',17767,392.38 UNION 
SELECT '200205','Caminaca','Azangaro','Puno',3543,146.88 UNION 
SELECT '200206','Chupa','Azangaro','Puno',13200,143.21 UNION 
SELECT '200207','Jose Domingo Choquehuanca','Azangaro','Puno',5595,69.73 UNION 
SELECT '200208','Muñani','Azangaro','Puno',8367,764.49 UNION 
SELECT '200210','Potoni','Azangaro','Puno',6586,602.95 UNION 
SELECT '200212','Saman','Azangaro','Puno',14541,188.59 UNION 
SELECT '200213','San Anton','Azangaro','Puno',10186,514.84 UNION 
SELECT '200214','San Jose','Azangaro','Puno',5838,372.73 UNION 
SELECT '200215','San Juan de Salinas','Azangaro','Puno',4430,106 UNION 
SELECT '200216','Santiago de Pupuja','Azangaro','Puno',5400,301.27 UNION 
SELECT '200217','Tirapata','Azangaro','Puno',3141,198.73 UNION 
SELECT '200301','Macusani','Carabaya','Puno',13291,1029.56 UNION 
SELECT '200302','Ajoyani','Carabaya','Puno',2140,413.11 UNION 
SELECT '200303','Ayapata','Carabaya','Puno',12540,1091.61 UNION 
SELECT '200304','Coasa','Carabaya','Puno',16619,3572.92 UNION 
SELECT '200305','Corani','Carabaya','Puno',4035,852.99 UNION 
SELECT '200306','Crucero','Carabaya','Puno',9497,836.37 UNION 
SELECT '200307','Ituata','Carabaya','Puno',6501,1200.79 UNION 
SELECT '200308','Ollachea','Carabaya','Puno',5765,595.79 UNION 
SELECT '200309','San Gaban','Carabaya','Puno',4199,2029.22 UNION 
SELECT '200310','Usicayos','Carabaya','Puno',24668,644.04 UNION 
SELECT '200401','Juli','Chucuito','Puno',21619,720.38 UNION 
SELECT '200402','Desaguadero','Chucuito','Puno',32339,178.21 UNION 
SELECT '200403','Huacullani','Chucuito','Puno',23781,705.28 UNION 
SELECT '200406','Pisacoma','Chucuito','Puno',13871,959.34 UNION 
SELECT '200407','Pomata','Chucuito','Puno',16206,382.58 UNION 
SELECT '200410','Zepita','Chucuito','Puno',19161,546.57 UNION 
SELECT '200412','Kelluyo','Chucuito','Puno',26051,485.77 UNION 
SELECT '200501','Huancane','Huancane','Puno',18727,381.62 UNION 
SELECT '200502','Cojata','Huancane','Puno',4501,881.18 UNION 
SELECT '200504','Inchupalla','Huancane','Puno',3422,289.03 UNION 
SELECT '200506','Pusi','Huancane','Puno',6515,148.42 UNION 
SELECT '200507','Rosaspata','Huancane','Puno',5326,301.47 UNION 
SELECT '200508','Taraco','Huancane','Puno',14483,198.02 UNION 
SELECT '200509','Vilque Chico','Huancane','Puno',8480,499.38 UNION 
SELECT '200511','Huatasani','Huancane','Puno',5634,106.73 UNION 
SELECT '200601','Lampa','Lampa','Puno',10351,675.82 UNION 
SELECT '200602','Cabanilla','Lampa','Puno',5383,443.04 UNION 
SELECT '200603','Calapuja','Lampa','Puno',1506,141.3 UNION 
SELECT '200604','Nicasio','Lampa','Puno',2710,134.35 UNION 
SELECT '200605','Ocuviri','Lampa','Puno',3246,878.26 UNION 
SELECT '200606','Palca','Lampa','Puno',2871,483.96 UNION 
SELECT '200607','Paratia','Lampa','Puno',9675,745.08 UNION 
SELECT '200608','Pucara','Lampa','Puno',5201,537.6 UNION 
SELECT '200609','Santa Lucia','Lampa','Puno',7620,1595.67 UNION 
SELECT '200610','Vilavila','Lampa','Puno',4449,156.65 UNION 
SELECT '200701','Ayaviri','Melgar','Puno',22568,1013.14 UNION 
SELECT '200702','Antauta','Melgar','Puno',4447,636.17 UNION 
SELECT '200703','Cupi','Melgar','Puno',3519,214.25 UNION 
SELECT '200704','Llalli','Melgar','Puno',5003,216.36 UNION 
SELECT '200705','Macari','Melgar','Puno',8772,673.78 UNION 
SELECT '200706','Nuñoa','Melgar','Puno',11106,2200.16 UNION 
SELECT '200707','Orurillo','Melgar','Puno',11009,379.05 UNION 
SELECT '200708','Santa Rosa','Melgar','Puno',7526,790.38 UNION 
SELECT '200709','Umachiri','Melgar','Puno',4504,323.56 UNION 
SELECT '200801','Sandia','Sandia','Puno',12478,580.13 UNION 
SELECT '200803','Cuyocuyo','Sandia','Puno',4768,503.91 UNION 
SELECT '200804','Limbani','Sandia','Puno',4422,2112.34 UNION 
SELECT '200805','Phara','Sandia','Puno',4905,400.9 UNION 
SELECT '200806','Patambuco','Sandia','Puno',3967,462.72 UNION 
SELECT '200807','Quiaca','Sandia','Puno',2413,447.9 UNION 
SELECT '200808','San Juan del Oro','Sandia','Puno',14201,197.14 UNION 
SELECT '200810','Yanahuaya','Sandia','Puno',2244,670.61 UNION 
SELECT '200811','Alto Inambari','Sandia','Puno',9765,1124.88 UNION 
SELECT '200812','San Pedro de Putina Punco','Sandia','Puno',14560,5361.88 UNION 
SELECT '200901','Juliaca','San Roman','Puno',235221,533.5 UNION 
SELECT '200902','Cabana','San Roman','Puno',4224,191.23 UNION 
SELECT '200903','Cabanillas','San Roman','Puno',5459,1267.06 UNION 
SELECT '200904','Caracoto','San Roman','Puno',5608,285.87 UNION 
SELECT '201001','Yunguyo','Yunguyo','Puno',27385,170.59 UNION 
SELECT '201002','Unicachi','Yunguyo','Puno',3889,11.1 UNION 
SELECT '201003','Anapia','Yunguyo','Puno',3376,9.54 UNION 
SELECT '201004','Copani','Yunguyo','Puno',5040,47.37 UNION 
SELECT '201005','Cuturapi','Yunguyo','Puno',1245,21.74 UNION 
SELECT '201006','Ollaraya','Yunguyo','Puno',5376,23.67 UNION 
SELECT '201007','Tinicachi','Yunguyo','Puno',1629,6.2 UNION 
SELECT '201101','Putina','San Antonio de Putina','Puno',27607,1021.92 UNION 
SELECT '201102','Pedro Vilca Apaza','San Antonio de Putina','Puno',3054,565.81 UNION 
SELECT '201103','Quilcapuncu','San Antonio de Putina','Puno',5929,516.66 UNION 
SELECT '201104','Ananea','San Antonio de Putina','Puno',33728,939.56 UNION 
SELECT '201105','Sina','San Antonio de Putina','Puno',1761,163.43 UNION 
SELECT '201201','Ilave','El Collao','Puno',59120,874.57 UNION 
SELECT '201202','Pilcuyo','El Collao','Puno',13172,157 UNION 
SELECT '201203','Santa Rosa','El Collao','Puno',7989,2524.02 UNION 
SELECT '201204','Capazo','El Collao','Puno',2351,1039.25 UNION 
SELECT '201205','Conduriri','El Collao','Puno',4496,1005.67 UNION 
SELECT '201301','Moho','Moho','Puno',16058,494.36 UNION 
SELECT '201302','Conima','Moho','Puno',3064,72.95 UNION 
SELECT '201303','Tilali','Moho','Puno',2769,48.15 UNION 
SELECT '201304','Huayrapata','Moho','Puno',4282,388.35 UNION 
SELECT '210101','Moyobamba','Moyobamba','San Martin',87833,2737.57 UNION 
SELECT '210102','Calzada','Moyobamba','San Martin',4435,95.38 UNION 
SELECT '210103','Habana','Moyobamba','San Martin',2078,91.25 UNION 
SELECT '210104','Jepelacio','Moyobamba','San Martin',22049,360.03 UNION 
SELECT '210105','Soritor','Moyobamba','San Martin',35837,387.76 UNION 
SELECT '210106','Yantalo','Moyobamba','San Martin',3536,100.32 UNION 
SELECT '210201','Saposoa','Huallaga','San Martin',11436,545.43 UNION 
SELECT '210202','Piscoyacu','Huallaga','San Martin',3958,184.87 UNION 
SELECT '210203','Sacanche','Huallaga','San Martin',2602,143.15 UNION 
SELECT '210204','Tingo de Saposoa','Huallaga','San Martin',661,37.29 UNION 
SELECT '210205','Alto Saposoa','Huallaga','San Martin',3296,1347.34 UNION 
SELECT '210206','El Eslabon','Huallaga','San Martin',3965,122.77 UNION 
SELECT '210301','Lamas','Lamas','San Martin',12528,79.82 UNION 
SELECT '210303','Barranquita','Lamas','San Martin',5140,1065.12 UNION 
SELECT '210304','Caynarachi','Lamas','San Martin',8040,1678.69 UNION 
SELECT '210305','Cuñumbuqui','Lamas','San Martin',4815,191.46 UNION 
SELECT '210306','Pinto Recodo','Lamas','San Martin',11115,524.07 UNION 
SELECT '210307','Rumisapa','Lamas','San Martin',2514,39.19 UNION 
SELECT '210311','Shanao','Lamas','San Martin',3659,24.59 UNION 
SELECT '210313','Tabalosos','Lamas','San Martin',13492,485.25 UNION 
SELECT '210314','Zapatero','Lamas','San Martin',4823,175 UNION 
SELECT '210315','Alonso de Alvarado','Lamas','San Martin',19886,294.2 UNION 
SELECT '210316','San Roque de Cumbaza','Lamas','San Martin',1466,525.15 UNION 
SELECT '210401','Juanjui','Mariscal Caceres','San Martin',26662,335.19 UNION 
SELECT '210402','Campanilla','Mariscal Caceres','San Martin',7672,2249.83 UNION 
SELECT '210403','Huicungo','Mariscal Caceres','San Martin',6630,9830.17 UNION 
SELECT '210404','Pachiza','Mariscal Caceres','San Martin',4205,1839.51 UNION 
SELECT '210405','Pajarillo','Mariscal Caceres','San Martin',6192,244.03 UNION 
SELECT '210501','Rioja','Rioja','San Martin',24222,185.69 UNION 
SELECT '210502','Posic','Rioja','San Martin',1706,54.65 UNION 
SELECT '210503','Yorongos','Rioja','San Martin',3741,74.53 UNION 
SELECT '210504','Yuracyacu','Rioja','San Martin',3914,13.74 UNION 
SELECT '210505','Nueva Cajamarca','Rioja','San Martin',47637,330.31 UNION 
SELECT '210506','Elias Soplin Vargas','Rioja','San Martin',13897,199.64 UNION 
SELECT '210507','San Fernando','Rioja','San Martin',3360,63.53 UNION 
SELECT '210508','Pardo Miguel','Rioja','San Martin',23572,1131.87 UNION 
SELECT '210509','Awajun','Rioja','San Martin',12342,481.08 UNION 
SELECT '210601','Tarapoto','San Martin','San Martin',75656,67.81 UNION 
SELECT '210602','Alberto Leveau','San Martin','San Martin',645,268.4 UNION 
SELECT '210604','Cacatachi','San Martin','San Martin',3466,75.36 UNION 
SELECT '210606','Chazuta','San Martin','San Martin',8206,966.38 UNION 
SELECT '210607','Chipurana','San Martin','San Martin',1818,500.44 UNION 
SELECT '210608','El Porvenir','San Martin','San Martin',2841,483.21 UNION 
SELECT '210609','Huimbayoc','San Martin','San Martin',3262,1609.07 UNION 
SELECT '210610','Juan Guerra','San Martin','San Martin',3167,196.5 UNION 
SELECT '210611','Morales','San Martin','San Martin',30844,43.91 UNION 
SELECT '210612','Papaplaya','San Martin','San Martin',1975,686.19 UNION 
SELECT '210616','San Antonio','San Martin','San Martin',1345,93.03 UNION 
SELECT '210619','Sauce','San Martin','San Martin',16808,103 UNION 
SELECT '210620','Shapaja','San Martin','San Martin',1472,270.44 UNION 
SELECT '210621','La Banda de Shilcayo','San Martin','San Martin',43596,286.68 UNION 
SELECT '210701','Bellavista','Bellavista','San Martin',13643,287.12 UNION 
SELECT '210702','San Rafael','Bellavista','San Martin',7706,98.32 UNION 
SELECT '210703','San Pablo','Bellavista','San Martin',9128,362.49 UNION 
SELECT '210704','Alto Biavo','Bellavista','San Martin',7368,6117.12 UNION 
SELECT '210705','Huallaga','Bellavista','San Martin',3118,210.42 UNION 
SELECT '210706','Bajo Biavo','Bellavista','San Martin',20617,975.43 UNION 
SELECT '210801','Tocache','Tocache','San Martin',25393,1142.04 UNION 
SELECT '210802','Nuevo Progreso','Tocache','San Martin',12370,860.98 UNION 
SELECT '210803','Polvora','Tocache','San Martin',14439,2174.48 UNION 
SELECT '210804','Shunte','Tocache','San Martin',983,964.21 UNION 
SELECT '210805','Uchiza','Tocache','San Martin',20197,723.73 UNION 
SELECT '210901','Picota','Picota','San Martin',8314,218.72 UNION 
SELECT '210902','Buenos Aires','Picota','San Martin',3287,272.97 UNION 
SELECT '210903','Caspisapa','Picota','San Martin',2130,81.44 UNION 
SELECT '210904','Pilluana','Picota','San Martin',683,239.27 UNION 
SELECT '210905','Pucacaca','Picota','San Martin',2431,230.72 UNION 
SELECT '210906','San Cristobal','Picota','San Martin',1427,29.63 UNION 
SELECT '210907','San Hilarion','Picota','San Martin',5756,96.55 UNION 
SELECT '210908','Tingo de Ponasa','Picota','San Martin',4889,340.01 UNION 
SELECT '210909','Tres Unidos','Picota','San Martin',5349,246.52 UNION 
SELECT '210910','Shamboyacu','Picota','San Martin',12188,415.58 UNION 
SELECT '211001','San Jose de Sisa','El Dorado','San Martin',11954,299.9 UNION 
SELECT '211002','Agua Blanca','El Dorado','San Martin',2385,168.19 UNION 
SELECT '211003','Shatoja','El Dorado','San Martin',3281,24.07 UNION 
SELECT '211004','San Martin','El Dorado','San Martin',13834,562.57 UNION 
SELECT '211005','Santa Rosa','El Dorado','San Martin',10704,243.41 UNION 
SELECT '220101','Tacna','Tacna','Tacna',80845,1877.78 UNION 
SELECT '220102','Calana','Tacna','Tacna',3338,108.38 UNION 
SELECT '220104','Inclan','Tacna','Tacna',8125,1414.82 UNION 
SELECT '220107','Pachia','Tacna','Tacna',1971,603.68 UNION 
SELECT '220108','Palca','Tacna','Tacna',1728,1417.86 UNION 
SELECT '220109','Pocollay','Tacna','Tacna',22319,265.65 UNION 
SELECT '220110','Sama','Tacna','Tacna',2679,1115.98 UNION 
SELECT '220111','Alto de La Alianza','Tacna','Tacna',40652,371.4 UNION 
SELECT '220112','Ciudad Nueva','Tacna','Tacna',39060,173.42 UNION 
SELECT '220113','Coronel Gregorio Albarracin Lanchipa','Tacna','Tacna',123662,187.74 UNION 
SELECT '220201','Tarata','Tarata','Tacna',3233,864.31 UNION 
SELECT '220205','Heroes Albarracin','Tarata','Tacna',676,372.41 UNION 
SELECT '220206','Estique','Tarata','Tacna',741,312.85 UNION 
SELECT '220207','Estique-Pampa','Tarata','Tacna',703,185.61 UNION 
SELECT '220210','Sitajara','Tarata','Tacna',728,251.24 UNION 
SELECT '220211','Susapaya','Tarata','Tacna',746,373.21 UNION 
SELECT '220212','Tarucachi','Tarata','Tacna',412,113.27 UNION 
SELECT '220213','Ticaco','Tarata','Tacna',547,347.06 UNION 
SELECT '220301','Locumba','Jorge Basadre','Tacna',2641,968.99 UNION 
SELECT '220302','Ite','Jorge Basadre','Tacna',3415,848.18 UNION 
SELECT '220303','Ilabaya','Jorge Basadre','Tacna',2806,1111.39 UNION 
SELECT '220401','Candarave','Candarave','Tacna',3008,1111.03 UNION 
SELECT '220402','Cairani','Candarave','Tacna',1299,371.17 UNION 
SELECT '220403','Curibaya','Candarave','Tacna',174,126.98 UNION 
SELECT '220404','Huanuara','Candarave','Tacna',909,95.61 UNION 
SELECT '220405','Quilahuani','Candarave','Tacna',1229,37.66 UNION 
SELECT '220406','Camilaca','Candarave','Tacna',1468,518.65 UNION 
SELECT '230101','Tumbes','Tumbes','Tumbes',115562,158.14 UNION 
SELECT '230102','Corrales','Tumbes','Tumbes',24561,131.6 UNION 
SELECT '230103','La Cruz','Tumbes','Tumbes',9444,65.23 UNION 
SELECT '230104','Pampas de Hospital','Tumbes','Tumbes',7239,727.75 UNION 
SELECT '230105','San Jacinto','Tumbes','Tumbes',8704,598.72 UNION 
SELECT '230106','San Juan de La Virgen','Tumbes','Tumbes',4160,118.71 UNION 
SELECT '230201','Zorritos','Contralmirante Villar','Tumbes',12785,644.52 UNION 
SELECT '230202','Casitas','Contralmirante Villar','Tumbes',2088,855.36 UNION 
SELECT '230203','Canoas de Punta Sal','Contralmirante Villar','Tumbes',5700,623.34 UNION 
SELECT '230301','Zarumilla','Zarumilla','Tumbes',23148,113.25 UNION 
SELECT '230302','Matapalo','Zarumilla','Tumbes',2529,392.29 UNION 
SELECT '230303','Papayal','Zarumilla','Tumbes',5348,193.53 UNION 
SELECT '230304','Aguas Verdes','Zarumilla','Tumbes',24781,46.06 UNION 
SELECT '240101','Callao','Callao','Callao',410795,45.65 UNION 
SELECT '240102','Bellavista','Callao','Callao',72625,4.56 UNION 
SELECT '240103','La Punta','Callao','Callao',3184,18.38 UNION 
SELECT '240104','Carmen de La Legua','Callao','Callao',40833,2.12 UNION 
SELECT '240105','La Perla','Callao','Callao',60011,2.75 UNION 
SELECT '240106','Ventanilla','Callao','Callao',402038,69.93 UNION 
SELECT '250101','Calleria','Coronel Portillo','Ucayali',159364,10485.41 UNION 
SELECT '250102','Yarinacocha','Coronel Portillo','Ucayali',101126,596.2 UNION 
SELECT '250103','Masisea','Coronel Portillo','Ucayali',13150,14102.19 UNION 
SELECT '250104','Campoverde','Coronel Portillo','Ucayali',16324,1194.1 UNION 
SELECT '250105','Iparia','Coronel Portillo','Ucayali',12193,8029.12 UNION 
SELECT '250106','Nueva Requena','Coronel Portillo','Ucayali',5699,1857.82 UNION 
SELECT '250107','Manantay','Coronel Portillo','Ucayali',83040,579.91 UNION 
SELECT '250201','Padre Abad','Padre Abad','Ucayali',26614,4689.2 UNION 
SELECT '250202','Irazola','Padre Abad','Ucayali',10830,998.93 UNION 
SELECT '250203','Curimana','Padre Abad','Ucayali',8956,2134.04 UNION 
SELECT '250301','Raymondi','Atalaya','Ucayali',35109,14504.99 UNION 
SELECT '250302','Tahuania','Atalaya','Ucayali',8284,7010.09 UNION 
SELECT '250303','Yurua','Atalaya','Ucayali',2716,9175.58 UNION 
SELECT '250304','Sepahua','Atalaya','Ucayali',9193,8223.63 UNION 
SELECT '250401','Purus','Purus','Ucayali',4657,17847.76  

--4
--create schema desarrollo_2

create table desarrollo_2.tbUbigeo
(
 idUbigeo varchar(6)
)

truncate table desarrollo.tb_Ubigeo--Todo hasta reseteo de campos identity

insert into desarrollo.tb_Ubigeo(idUbigeo,distrito,provincia,departamento,poblacion,superficie)
SELECT '010101','Chachapoyas','Chachapoyas','Amazonas',29171,153.78 UNION 
SELECT '010102','Asuncion','Chachapoyas','Amazonas',288,25.71 UNION 
SELECT '010103','Balsas','Chachapoyas','Amazonas',1644,357.09 UNION 
SELECT '010104','Cheto','Chachapoyas','Amazonas',591,56.97 UNION 
SELECT '010105','Chiliquin','Chachapoyas','Amazonas',687,143.43 UNION 
SELECT '010106','Chuquibamba','Chachapoyas','Amazonas',2064,278.63 UNION 
SELECT '010107','Granada','Chachapoyas','Amazonas',379,181.41 UNION 
SELECT '010312','Jazan','Bongara','Amazonas',9349,88.83 UNION 
SELECT '010401','Lamud','Luya','Amazonas',2292,69.49 UNION 
SELECT '010402','Camporredondo','Luya','Amazonas',7131,376.01 UNION 
SELECT '010403','Cocabamba','Luya','Amazonas',2517,355.85 UNION 
SELECT '010404','Colcamar','Luya','Amazonas',2263,106.6 UNION 
SELECT '010405','Conila','Luya','Amazonas',2083,256.17 UNION 
SELECT '010406','Inguilpata','Luya','Amazonas',587,118.04 UNION 
SELECT '010407','Longuita','Luya','Amazonas',1161,57.91 UNION 
SELECT '010408','Lonya Chico','Luya','Amazonas',961,83.82 UNION 
SELECT '010409','Luya','Luya','Amazonas',4420,91.21 UNION 
SELECT '010410','Luya Viejo','Luya','Amazonas',489,73.87 UNION 
SELECT '010411','Maria','Luya','Amazonas',945,80.27 UNION 
SELECT '010412','Ocalli','Luya','Amazonas',4259,177.39 UNION 
SELECT '010413','Ocumal','Luya','Amazonas',4194,235.86 UNION 
SELECT '010414','Pisuquia','Luya','Amazonas',6132,306.5 UNION 
SELECT '010415','San Cristobal','Luya','Amazonas',685,33.36 UNION 
SELECT '010416','San Francisco del Yeso','Luya','Amazonas',821,113.94 UNION 
SELECT '010417','San Jeronimo','Luya','Amazonas',880,214.66 UNION 
SELECT '010418','San Juan de Lopecancha','Luya','Amazonas',506,88.02 UNION 
SELECT '010419','Santa Catalina','Luya','Amazonas',1908,126.21 UNION 
SELECT '010420','Santo Tomas','Luya','Amazonas',3537,84.93 UNION 
SELECT '010421','Tingo','Luya','Amazonas',1363,102.67 UNION 
SELECT '010422','Trita','Luya','Amazonas',1378,12.68 UNION 
SELECT '010423','Providencia','Luya','Amazonas',1536,71.22 UNION 
SELECT '010501','San Nicolas','Rodriguez de Mendoza','Amazonas',5290,206.01 UNION 
SELECT '010502','Cochamal','Rodriguez de Mendoza','Amazonas',504,199.44 UNION 
SELECT '010503','Chirimoto','Rodriguez de Mendoza','Amazonas',2079,153 UNION 
SELECT '010504','Huambo','Rodriguez de Mendoza','Amazonas',2542,99.56 UNION 
SELECT '010505','Limabamba','Rodriguez de Mendoza','Amazonas',3049,317.88 UNION 
SELECT '010506','Longar','Rodriguez de Mendoza','Amazonas',1619,66.24 UNION 
SELECT '010507','Milpuc','Rodriguez de Mendoza','Amazonas',599,26.8 UNION 
SELECT '010508','Mariscal Benavides','Rodriguez de Mendoza','Amazonas',1376,176.18 UNION 
SELECT '010509','Omia','Rodriguez de Mendoza','Amazonas',9787,175.13 UNION 
SELECT '010510','Santa Rosa','Rodriguez de Mendoza','Amazonas',457,34.11 UNION 
SELECT '010511','Totora','Rodriguez de Mendoza','Amazonas',448,6.02 UNION 
SELECT '010512','Vista Alegre','Rodriguez de Mendoza','Amazonas',3803,899.02 UNION 
SELECT '010601','Nieva','Condorcanqui','Amazonas',29213,4481.63 UNION 
SELECT '010602','Rio Santiago','Condorcanqui','Amazonas',16986,8035.28 UNION 
SELECT '010603','El Cenepa','Condorcanqui','Amazonas',9620,5458.48 UNION 
SELECT '010701','Bagua Grande','Utcubamba','Amazonas',54033,746.64 UNION 
SELECT '010702','Cajaruro','Utcubamba','Amazonas',28491,1746.23 UNION 
SELECT '010703','Cumba','Utcubamba','Amazonas',8752,292.66 UNION 
SELECT '010704','El Milagro','Utcubamba','Amazonas',6399,313.89 UNION 
SELECT '010705','Jamalca','Utcubamba','Amazonas',8243,357.98 UNION 
SELECT '010706','Lonya Grande','Utcubamba','Amazonas',10443,327.92 UNION 
SELECT '010707','Yamon','Utcubamba','Amazonas',2841,57.61 UNION 
SELECT '020101','Huaraz','Huaraz','Ancash',65663,432.99 UNION 
SELECT '020102','Independencia','Huaraz','Ancash',75559,342.95 UNION 
SELECT '020103','Cochabamba','Huaraz','Ancash',1983,135.65 UNION 
SELECT '020104','Colcabamba','Huaraz','Ancash',826,50.65 UNION 
SELECT '020105','Huanchay','Huaraz','Ancash',2235,209.34 UNION 
SELECT '020106','Jangas','Huaraz','Ancash',5106,59.84 UNION 
SELECT '020107','La Libertad','Huaraz','Ancash',1138,164.26 UNION 
SELECT '020108','Olleros','Huaraz','Ancash',2148,222.91 UNION 
SELECT '020109','Pampas','Huaraz','Ancash',1165,357.81 UNION 
SELECT '020110','Pariacoto','Huaraz','Ancash',4794,162.5 UNION 
SELECT '020111','Pira','Huaraz','Ancash',3755,243.73 UNION 
SELECT '020112','Tarica','Huaraz','Ancash',5936,110.28 UNION 
SELECT '020201','Aija','Aija','Ancash',1841,159.74 UNION 
SELECT '020203','Coris','Aija','Ancash',2270,267.15 UNION 
SELECT '020205','Huacllan','Aija','Ancash',628,37.91 UNION 
SELECT '020206','La Merced','Aija','Ancash',2190,153.08 UNION 
SELECT '020208','Succha','Aija','Ancash',828,78.84 UNION 
SELECT '020301','Chiquian','Bolognesi','Ancash',3587,184.16 UNION 
SELECT '020302','Abelardo Pardo Lezameta','Bolognesi','Ancash',1263,11.31 UNION 
SELECT '020304','Aquia','Bolognesi','Ancash',2465,434.6 UNION 
SELECT '020305','Cajacay','Bolognesi','Ancash',1603,193.06 UNION 
SELECT '020310','Huayllacayan','Bolognesi','Ancash',1076,127.99 UNION 
SELECT '020311','Huasta','Bolognesi','Ancash',2610,387.91 UNION 
SELECT '020313','Mangas','Bolognesi','Ancash',566,115.84 UNION 
SELECT '020315','Pacllon','Bolognesi','Ancash',1771,211.98 UNION 
SELECT '020317','San Miguel de Corpanqui','Bolognesi','Ancash',1298,43.78 UNION 
SELECT '020320','Ticllos','Bolognesi','Ancash',1291,89.41 UNION 
SELECT '020321','Antonio Raymondi','Bolognesi','Ancash',1065,118.7 UNION 
SELECT '020322','Canis','Bolognesi','Ancash',1308,19.45 UNION 
SELECT '020323','Colquioc','Bolognesi','Ancash',4165,274.61 UNION 
SELECT '020324','La Primavera','Bolognesi','Ancash',951,68.61 UNION 
SELECT '020325','Huallanca','Bolognesi','Ancash',8325,873.39 UNION 
SELECT '020401','Carhuaz','Carhuaz','Ancash',15712,194.62 UNION 
SELECT '020402','Acopampa','Carhuaz','Ancash',2685,14.17 UNION 
SELECT '020403','Amashca','Carhuaz','Ancash',1571,11.99 UNION 
SELECT '020404','Anta','Carhuaz','Ancash',2510,40.77 UNION 
SELECT '020405','Ataquero','Carhuaz','Ancash',1353,47.22 UNION 
SELECT '020406','Marcara','Carhuaz','Ancash',9452,157.49 UNION 
SELECT '020407','Pariahuanca','Carhuaz','Ancash',1630,11.74 UNION 
SELECT '020408','San Miguel de Aco','Carhuaz','Ancash',2794,133.89 UNION 
SELECT '020409','Shilla','Carhuaz','Ancash',3318,130.19 UNION 
SELECT '020410','Tinco','Carhuaz','Ancash',3301,15.44 UNION 
SELECT '020411','Yungar','Carhuaz','Ancash',3462,46.43 UNION 
SELECT '020501','Casma','Casma','Ancash',33648,1204.85 UNION 
SELECT '020502','Buena Vista Alta','Casma','Ancash',4250,476.62 UNION 
SELECT '020503','Comandante Noel','Casma','Ancash',2044,222.36 UNION 
SELECT '020505','Yautan','Casma','Ancash',8531,357.2 UNION 
SELECT '020601','Corongo','Corongo','Ancash',1420,143.13 UNION 
SELECT '020602','Aco','Corongo','Ancash',442,56.54 UNION 
SELECT '020603','Bambas','Corongo','Ancash',546,151.13 UNION 
SELECT '020604','Cusca','Corongo','Ancash',2985,411.55 UNION 
SELECT '020605','La Pampa','Corongo','Ancash',1004,93.94 UNION 
SELECT '020606','Yanac','Corongo','Ancash',704,45.85 UNION 
SELECT '020607','Yupan','Corongo','Ancash',1041,85.87 UNION 
SELECT '020701','Caraz','Huaylas','Ancash',26740,246.52 UNION 
SELECT '020702','Huallanca','Huaylas','Ancash',686,178.8 UNION 
SELECT '020703','Huata','Huaylas','Ancash',1638,70.69 UNION 
SELECT '020704','Huaylas','Huaylas','Ancash',1421,56.89 UNION 
SELECT '020705','Mato','Huaylas','Ancash',2003,107.12 UNION 
SELECT '020706','Pamparomas','Huaylas','Ancash',9268,496.35 UNION 
SELECT '020707','Pueblo Libre','Huaylas','Ancash',7246,130.99 UNION 
SELECT '020708','Santa Cruz','Huaylas','Ancash',5236,357.7 UNION 
SELECT '020709','Yuracmarca','Huaylas','Ancash',1760,565.7 UNION 
SELECT '020710','Santo Toribio','Huaylas','Ancash',1056,82.02 UNION 
SELECT '020801','Huari','Huari','Ancash',10423,398.91 UNION 
SELECT '020802','Cajay','Huari','Ancash',2552,159.35 UNION 
SELECT '020803','Chavin de Huantar','Huari','Ancash',9251,434.13 UNION 
SELECT '020804','Huacachi','Huari','Ancash',1826,86.7 UNION 
SELECT '020805','Huachis','Huari','Ancash',3466,153.89 UNION 
SELECT '020806','Huacchis','Huari','Ancash',2079,72.16 UNION 
SELECT '020807','Huantar','Huari','Ancash',3058,156.15 UNION 
SELECT '020808','Masin','Huari','Ancash',1652,75.33 UNION 
SELECT '020809','Paucas','Huari','Ancash',1827,135.31 UNION 
SELECT '020810','Ponto','Huari','Ancash',3333,118.29 UNION 
SELECT '020811','Rahuapampa','Huari','Ancash',814,9.02 UNION 
SELECT '020812','Rapayan','Huari','Ancash',1800,143.34 UNION 
SELECT '020813','San Marcos','Huari','Ancash',15094,556.75 UNION 
SELECT '020814','San Pedro de Chana','Huari','Ancash',2850,138.65 UNION 
SELECT '020815','Uco','Huari','Ancash',1668,53.61 UNION 
SELECT '020816','Anra','Huari','Ancash',1581,80.31 UNION 
SELECT '020901','Piscobamba','Mariscal Luzuriaga','Ancash',3799,45.93 UNION 
SELECT '020902','Casca','Mariscal Luzuriaga','Ancash',4534,77.38 UNION 
SELECT '020903','Lucma','Mariscal Luzuriaga','Ancash',3262,77.37 UNION 
SELECT '020904','Fidel Olivas Escudero','Mariscal Luzuriaga','Ancash',2242,204.82 UNION 
SELECT '020905','Llama','Mariscal Luzuriaga','Ancash',1223,48.13 UNION 
SELECT '020906','Llumpa','Mariscal Luzuriaga','Ancash',6435,143.27 UNION 
SELECT '020907','Musga','Mariscal Luzuriaga','Ancash',1014,39.72 UNION 
SELECT '020908','Eleazar Guzman Barron','Mariscal Luzuriaga','Ancash',1381,93.96 UNION 
SELECT '021001','Cabana','Pallasca','Ancash',2715,150.29 UNION 
SELECT '021002','Bolognesi','Pallasca','Ancash',1293,86.88 UNION 
SELECT '021003','Conchucos','Pallasca','Ancash',8458,585.24 UNION 
SELECT '021004','Huacaschuque','Pallasca','Ancash',563,63.59 UNION 
SELECT '021005','Huandoval','Pallasca','Ancash',1123,116 UNION 
SELECT '021006','Lacabamba','Pallasca','Ancash',559,64.68 UNION 
SELECT '021007','Llapo','Pallasca','Ancash',732,28.69 UNION 
SELECT '021008','Pallasca','Pallasca','Ancash',2417,59.77 UNION 
SELECT '021009','Pampas','Pallasca','Ancash',8780,438.18 UNION 
SELECT '021010','Santa Rosa','Pallasca','Ancash',1038,298.77 UNION 
SELECT '021011','Tauca','Pallasca','Ancash',3170,209.12 UNION 
SELECT '021101','Pomabamba','Pomabamba','Ancash',16631,347.92 UNION 
SELECT '021102','Huayllan','Pomabamba','Ancash',3668,88.97 UNION 
SELECT '021103','Parobamba','Pomabamba','Ancash',7016,331.1 UNION 
SELECT '021104','Quinuabamba','Pomabamba','Ancash',2390,146.06 UNION 
SELECT '021201','Recuay','Recuay','Ancash',4372,142.96 UNION 
SELECT '021202','Cotaparaco','Recuay','Ancash',648,172.85 UNION 
SELECT '021203','Huayllapampa','Recuay','Ancash',1339,105.29 UNION 
SELECT '021204','Marca','Recuay','Ancash',969,184.84 UNION 
SELECT '021205','Pampas Chico','Recuay','Ancash',2109,100.51 UNION 
SELECT '021206','Pararin','Recuay','Ancash',1403,254.85 UNION 
SELECT '021207','Tapacocha','Recuay','Ancash',452,81.23 UNION 
SELECT '021208','Ticapampa','Recuay','Ancash',2232,142.29 UNION 
SELECT '021209','Llacllin','Recuay','Ancash',1872,101.1 UNION 
SELECT '021210','Catac','Recuay','Ancash',4038,1018.27 UNION 
SELECT '021301','Chimbote','Santa','Ancash',216037,1461.44 UNION 
SELECT '021302','Caceres del Peru','Santa','Ancash',4865,549.78 UNION 
SELECT '021303','Macate','Santa','Ancash',3325,584.65 UNION 
SELECT '021304','Moro','Santa','Ancash',7545,359.35 UNION 
SELECT '021305','Nepeña','Santa','Ancash',15949,458.24 UNION 
SELECT '021306','Samanco','Santa','Ancash',4676,153.98 UNION 
SELECT '021307','Santa','Santa','Ancash',21041,42.23 UNION 
SELECT '021308','Coishco','Santa','Ancash',16057,9.21 UNION 
SELECT '021309','Nuevo Chimbote','Santa','Ancash',157211,389.73 UNION 
SELECT '021401','Sihuas','Sihuas','Ancash',5750,43.81 UNION 
SELECT '021402','Alfonso Ugarte','Sihuas','Ancash',762,80.71 UNION 
SELECT '021403','Chingalpo','Sihuas','Ancash',1034,173.2 UNION 
SELECT '021404','Huayllabamba','Sihuas','Ancash',3982,287.58 UNION 
SELECT '021405','Quiches','Sihuas','Ancash',2958,146.98 UNION 
SELECT '021406','Sicsibamba','Sihuas','Ancash',1808,86 UNION 
SELECT '021407','Acobamba','Sihuas','Ancash',2234,153.04 UNION 
SELECT '021408','Cashapampa','Sihuas','Ancash',2833,66.96 UNION 
SELECT '021409','Ragash','Sihuas','Ancash',2613,208.45 UNION 
SELECT '021410','San Juan','Sihuas','Ancash',6568,209.24 UNION 
SELECT '021501','Yungay','Yungay','Ancash',22323,276.68 UNION 
SELECT '021502','Cascapara','Yungay','Ancash',2332,138.32 UNION 
SELECT '021503','Mancos','Yungay','Ancash',6954,64.05 UNION 
SELECT '021504','Matacoto','Yungay','Ancash',1666,43.65 UNION 
SELECT '021505','Quillo','Yungay','Ancash',14134,373.83 UNION 
SELECT '021506','Ranrahirca','Yungay','Ancash',2690,22.89 UNION 
SELECT '021507','Shupluy','Yungay','Ancash',2412,162.21 UNION 
SELECT '021508','Yanama','Yungay','Ancash',6986,279.85 UNION 
SELECT '021601','Llamellin','Antonio Raymondi','Ancash',3552,90.82 UNION 
SELECT '021602','Aczo','Antonio Raymondi','Ancash',2130,69.03 UNION 
SELECT '021603','Chaccho','Antonio Raymondi','Ancash',1670,73.99 UNION 
SELECT '021604','Chingas','Antonio Raymondi','Ancash',1909,48.95 UNION 
SELECT '021605','Mirgas','Antonio Raymondi','Ancash',5370,175.69 UNION 
SELECT '021606','San Juan de Rontoy','Antonio Raymondi','Ancash',1648,103.13 UNION 
SELECT '021701','San Luis','Carlos Fermin Fitzca','Ancash',12689,256.45 UNION 
SELECT '021702','Yauya','Carlos Fermin Fitzca','Ancash',5591,170.41 UNION 
SELECT '021703','San Nicolas','Carlos Fermin Fitzca','Ancash',3690,197.39 UNION 
SELECT '021801','Chacas','Asuncion','Ancash',5619,447.69 UNION 
SELECT '021802','Acochaca','Asuncion','Ancash',3130,80.97 UNION 
SELECT '021901','Huarmey','Huarmey','Ancash',24856,2894.38 UNION 
SELECT '021902','Cochapeti','Huarmey','Ancash',747,100.02 UNION 
SELECT '021903','Huayan','Huarmey','Ancash',1064,58.99 UNION 
SELECT '021904','Malvas','Huarmey','Ancash',905,219.52 UNION 
SELECT '021905','Culebras','Huarmey','Ancash',3758,630.25 UNION 
SELECT '022001','Acas','Ocros','Ancash',1057,252.48 UNION 
SELECT '022002','Cajamarquilla','Ocros','Ancash',600,75.52 UNION 
SELECT '022003','Carhuapampa','Ocros','Ancash',841,109.78 UNION 
SELECT '022004','Cochas','Ocros','Ancash',1486,408.66 UNION 
SELECT '022005','Congas','Ocros','Ancash',1223,130.03 UNION 
SELECT '022006','Llipa','Ocros','Ancash',1814,33.69 UNION 
SELECT '022007','Ocros','Ocros','Ancash',1003,230.55 UNION 
SELECT '022008','San Cristobal de Rajan','Ocros','Ancash',639,67.75 UNION 
SELECT '022009','San Pedro','Ocros','Ancash',2044,531.21 UNION 
SELECT '022010','Santiago de Chilcas','Ocros','Ancash',383,85.76 UNION 
SELECT '030101','Abancay','Abancay','Apurimac',56871,313.07 UNION 
SELECT '030102','Circa','Abancay','Apurimac',2515,641.68 UNION 
SELECT '030103','Curahuasi','Abancay','Apurimac',18422,817.98 UNION 
SELECT '030104','Chacoche','Abancay','Apurimac',1226,186.1 UNION 
SELECT '030105','Huanipaca','Abancay','Apurimac',4770,432.62 UNION 
SELECT '030106','Lambrama','Abancay','Apurimac',5577,521.62 UNION 
SELECT '030107','Pichirhua','Abancay','Apurimac',4028,370.69 UNION 
SELECT '030108','San Pedro de Cachora','Abancay','Apurimac',3864,108.77 UNION 
SELECT '030109','Tamburco','Abancay','Apurimac',9894,54.6 UNION 
SELECT '030201','Chalhuanca','Aymaraes','Apurimac',5098,322.34 UNION 
SELECT '030202','Capaya','Aymaraes','Apurimac',1013,77.75 UNION 
SELECT '030203','Caraybamba','Aymaraes','Apurimac',1497,234.91 UNION 
SELECT '030204','Colcabamba','Aymaraes','Apurimac',959,95.75 UNION 
SELECT '030205','Cotaruse','Aymaraes','Apurimac',5444,1749.83 UNION 
SELECT '030206','Chapimarca','Aymaraes','Apurimac',2139,213.09 UNION 
SELECT '030207','Huayllo','Aymaraes','Apurimac',739,72.89 UNION 
SELECT '030208','Lucre','Aymaraes','Apurimac',2141,110.48 UNION 
SELECT '030209','Pocohuanca','Aymaraes','Apurimac',1154,82.55 UNION 
SELECT '030210','Sañayca','Aymaraes','Apurimac',1455,448.91 UNION 
SELECT '030211','Soraya','Aymaraes','Apurimac',824,43.56 UNION 
SELECT '030212','Tapairihua','Aymaraes','Apurimac',2252,163.73 UNION 
SELECT '030213','Tintay','Aymaraes','Apurimac',3213,136.58 UNION 
SELECT '030214','Toraya','Aymaraes','Apurimac',2005,173.05 UNION 
SELECT '030215','Yanaca','Aymaraes','Apurimac',1169,103.88 UNION 
SELECT '030216','San Juan de Chacña','Aymaraes','Apurimac',833,86.13 UNION 
SELECT '030217','Justo Apu Sahuaraura','Aymaraes','Apurimac',1340,97.64 UNION 
SELECT '030301','Andahuaylas','Andahuaylas','Apurimac',46760,174.11 UNION 
SELECT '030302','Andarapa','Andahuaylas','Apurimac',6335,172.05 UNION 
SELECT '030303','Chiara','Andahuaylas','Apurimac',1323,148.92 UNION 
SELECT '030304','Huancarama','Andahuaylas','Apurimac',7408,153.04 UNION 
SELECT '030305','Huancaray','Andahuaylas','Apurimac',4617,112.2 UNION 
SELECT '030306','Kishuara','Andahuaylas','Apurimac',9356,309.91 UNION 
SELECT '030307','Pacobamba','Andahuaylas','Apurimac',4676,245.9 UNION 
SELECT '030308','Pampachiri','Andahuaylas','Apurimac',2820,602.5 UNION 
SELECT '030309','San Antonio de Cachi','Andahuaylas','Apurimac',3183,178.78 UNION 
SELECT '030310','San Jeronimo','Andahuaylas','Apurimac',29017,237.42 UNION 
SELECT '030311','Talavera','Andahuaylas','Apurimac',18478,148.12 UNION 
SELECT '030312','Turpo','Andahuaylas','Apurimac',4152,121.67 UNION 
SELECT '030313','Pacucha','Andahuaylas','Apurimac',9833,170.39 UNION 
SELECT '030314','Pomacocha','Andahuaylas','Apurimac',1048,129.19 UNION 
SELECT '030315','Santa Maria de Chicmo','Andahuaylas','Apurimac',9864,162.14 UNION 
SELECT '030316','Tumay Huaraca','Andahuaylas','Apurimac',2448,446.71 UNION 
SELECT '030317','Huayana','Andahuaylas','Apurimac',1060,96.87 UNION 
SELECT '030318','San Miguel de Chaccrampa','Andahuaylas','Apurimac',2080,83.37 UNION 
SELECT '030319','Kaquiabamba','Andahuaylas','Apurimac',3006,97.79 UNION 
SELECT '030401','Antabamba','Antabamba','Apurimac',3185,603.76 UNION 
SELECT '030402','El Oro','Antabamba','Apurimac',548,68.81 UNION 
SELECT '030403','Huaquirca','Antabamba','Apurimac',1568,337.6 UNION 
SELECT '030404','Juan Espinoza Medrano','Antabamba','Apurimac',2044,623.22 UNION 
SELECT '030405','Oropesa','Antabamba','Apurimac',3127,1180.12 UNION 
SELECT '030406','Pachaconas','Antabamba','Apurimac',1291,226.73 UNION 
SELECT '030407','Sabaino','Antabamba','Apurimac',1657,178.77 UNION 
SELECT '030501','Tambobamba','Cotabambas','Apurimac',11793,722.23 UNION 
SELECT '030502','Coyllurqui','Cotabambas','Apurimac',8629,418.95 UNION 
SELECT '030503','Cotabambas','Cotabambas','Apurimac',4274,331.96 UNION 
SELECT '030504','Haquira','Cotabambas','Apurimac',11908,475.46 UNION 
SELECT '030505','Mara','Cotabambas','Apurimac',6718,224.17 UNION 
SELECT '030506','Challhuahuacho','Cotabambas','Apurimac',9998,439.96 UNION 
SELECT '030601','Chuquibambilla','Grau','Apurimac',5410,432.5 UNION 
SELECT '030602','Curpahuasi','Grau','Apurimac',2320,293.42 UNION 
SELECT '030603','Huayllati','Grau','Apurimac',1654,110.75 UNION 
SELECT '030604','Mamara','Grau','Apurimac',973,66.21 UNION 
SELECT '030605','Gamarra','Grau','Apurimac',3890,370.45 UNION 
SELECT '030606','Micaela Bastidas','Grau','Apurimac',1689,110.14 UNION 
SELECT '030607','Progreso','Grau','Apurimac',3342,254.59 UNION 
SELECT '030608','Pataypampa','Grau','Apurimac',1127,158.91 UNION 
SELECT '030609','San Antonio','Grau','Apurimac',358,24.12 UNION 
SELECT '030610','Turpay','Grau','Apurimac',746,52.34 UNION 
SELECT '030611','Vilcabamba','Grau','Apurimac',1402,7.97 UNION 
SELECT '030612','Virundo','Grau','Apurimac',1305,117.19 UNION 
SELECT '030613','Santa Rosa','Grau','Apurimac',700,36.16 UNION 
SELECT '030614','Curasco','Grau','Apurimac',1624,139.77 UNION 
SELECT '030701','Chincheros','Chincheros','Apurimac',6998,132.4 UNION 
SELECT '030702','Ongoy','Chincheros','Apurimac',3812,118.69 UNION 
SELECT '030703','Ocobamba','Chincheros','Apurimac',8331,58.2 UNION 
SELECT '030704','Cocharcas','Chincheros','Apurimac',2742,109.9 UNION 
SELECT '030705','Anco_Huallo','Chincheros','Apurimac',12627,38.9 UNION 
SELECT '030706','Huaccana','Chincheros','Apurimac',9142,472.12 UNION 
SELECT '030707','Uranmarca','Chincheros','Apurimac',3748,148.73 UNION 
SELECT '030708','Ranracancha','Chincheros','Apurimac',5377,44.52 UNION 
SELECT '040101','Arequipa','Arequipa','Arequipa',52425,2.8 UNION 
SELECT '040102','Cayma','Arequipa','Arequipa',96878,246.31 UNION 
SELECT '040103','Cerro Colorado','Arequipa','Arequipa',158836,174.9 UNION 
SELECT '040104','Characato','Arequipa','Arequipa',10101,86 UNION 
SELECT '040105','Chiguata','Arequipa','Arequipa',3012,460.81 UNION 
SELECT '040106','La Joya','Arequipa','Arequipa',32048,670.22 UNION 
SELECT '040107','Miraflores','Arequipa','Arequipa',48242,28.68 UNION 
SELECT '040108','Mollebaya','Arequipa','Arequipa',1979,26.7 UNION 
SELECT '040109','Paucarpata','Arequipa','Arequipa',126053,31.07 UNION 
SELECT '040110','Pocsi','Arequipa','Arequipa',537,172.48 UNION 
SELECT '040111','Polobaya','Arequipa','Arequipa',1497,441.61 UNION 
SELECT '040112','Quequeña','Arequipa','Arequipa',1410,34.93 UNION 
SELECT '040113','Sabandia','Arequipa','Arequipa',4234,36.63 UNION 
SELECT '040114','Sachaca','Arequipa','Arequipa',20059,26.63 UNION 
SELECT '040115','San Juan de Siguas','Arequipa','Arequipa',1591,93.31 UNION 
SELECT '040116','San Juan de Tarucani','Arequipa','Arequipa',2193,2264.59 UNION 
SELECT '040117','Santa Isabel de Siguas','Arequipa','Arequipa',1273,187.98 UNION 
SELECT '040118','Santa Rita de Siguas','Arequipa','Arequipa',5854,370.16 UNION 
SELECT '040119','Socabaya','Arequipa','Arequipa',83799,18.64 UNION 
SELECT '040120','Tiabaya','Arequipa','Arequipa',14812,31.62 UNION 
SELECT '040121','Uchumayo','Arequipa','Arequipa',12950,227.14 UNION 
SELECT '040122','Vitor','Arequipa','Arequipa',2267,1543.5 UNION 
SELECT '040123','Yanahuara','Arequipa','Arequipa',26233,2.2 UNION 
SELECT '040124','Yarabamba','Arequipa','Arequipa',1140,492.2 UNION 
SELECT '040125','Yura','Arequipa','Arequipa',28556,1942.9 UNION 
SELECT '040126','Mariano Melgar','Arequipa','Arequipa',52881,29.83 UNION 
SELECT '040127','Jacobo Hunter','Arequipa','Arequipa',48985,20.37 UNION 
SELECT '040128','Alto Selva Alegre','Arequipa','Arequipa',85223,6.98 UNION 
SELECT '040129','Jose Luis Bustamante y Rivero','Arequipa','Arequipa',76905,10.83 UNION 
SELECT '040201','Chivay','Caylloma','Arequipa',8073,240.64 UNION 
SELECT '040202','Achoma','Caylloma','Arequipa',869,393.54 UNION 
SELECT '040203','Cabanaconde','Caylloma','Arequipa',2332,460.55 UNION 
SELECT '040204','Caylloma','Caylloma','Arequipa',3021,1499 UNION 
SELECT '040205','Callalli','Caylloma','Arequipa',1915,1485.1 UNION 
SELECT '040206','Coporaque','Caylloma','Arequipa',1542,111.98 UNION 
SELECT '040207','Huambo','Caylloma','Arequipa',566,705.79 UNION 
SELECT '040208','Huanca','Caylloma','Arequipa',1383,391.16 UNION 
SELECT '040209','Ichupampa','Caylloma','Arequipa',648,74.89 UNION 
SELECT '040210','Lari','Caylloma','Arequipa',1548,384.02 UNION 
SELECT '040211','Lluta','Caylloma','Arequipa',1253,1226.46 UNION 
SELECT '040212','Maca','Caylloma','Arequipa',692,227.48 UNION 
SELECT '040213','Madrigal','Caylloma','Arequipa',463,160.09 UNION 
SELECT '040214','San Antonio de Chuca','Caylloma','Arequipa',1593,1531.27 UNION 
SELECT '040215','Sibayo','Caylloma','Arequipa',655,286.03 UNION 
SELECT '040216','Tapay','Caylloma','Arequipa',523,420.17 UNION 
SELECT '040217','Tisco','Caylloma','Arequipa',1388,1445.02 UNION 
SELECT '040218','Tuti','Caylloma','Arequipa',738,241.89 UNION 
SELECT '040219','Yanque','Caylloma','Arequipa',2113,1108.58 UNION 
SELECT '040220','Majes','Caylloma','Arequipa',69348,1625.8 UNION 
SELECT '040301','Camana','Camana','Arequipa',14409,11.67 UNION 
SELECT '040302','Jose Maria Quimper','Camana','Arequipa',4195,16.72 UNION 
SELECT '040303','Mariano Nicolas Valcarcel','Camana','Arequipa',7728,557.74 UNION 
SELECT '040304','Mariscal Caceres','Camana','Arequipa',6637,579.31 UNION 
SELECT '040305','Nicolas de Pierola','Camana','Arequipa',6387,391.84 UNION 
SELECT '040306','Ocoña','Camana','Arequipa',4862,1414.8 UNION 
SELECT '040307','Quilca','Camana','Arequipa',630,912.25 UNION 
SELECT '040308','Samuel Pastor','Camana','Arequipa',15933,113.4 UNION 
SELECT '040401','Caraveli','Caraveli','Arequipa',3705,727.68 UNION 
SELECT '040402','Acari','Caraveli','Arequipa',3010,799.21 UNION 
SELECT '040403','Atico','Caraveli','Arequipa',4128,3146.24 UNION 
SELECT '040404','Atiquipa','Caraveli','Arequipa',945,423.55 UNION 
SELECT '040405','Bella Union','Caraveli','Arequipa',7296,1588.41 UNION 
SELECT '040406','Cahuacho','Caraveli','Arequipa',909,1412.1 UNION 
SELECT '040407','Chala','Caraveli','Arequipa',7186,378.38 UNION 
SELECT '040408','Chaparra','Caraveli','Arequipa',5814,1473.19 UNION 
SELECT '040409','Huanuhuanu','Caraveli','Arequipa',3469,708.52 UNION 
SELECT '040410','Jaqui','Caraveli','Arequipa',1163,424.73 UNION 
SELECT '040411','Lomas','Caraveli','Arequipa',1356,452.7 UNION 
SELECT '040412','Quicacha','Caraveli','Arequipa',1890,1048.42 UNION 
SELECT '040413','Yauca','Caraveli','Arequipa',1555,556.3 UNION 
SELECT '040501','Aplao','Castilla','Arequipa',8856,640.04 UNION 
SELECT '040502','Andagua','Castilla','Arequipa',1116,480.74 UNION 
SELECT '040503','Ayo','Castilla','Arequipa',401,327.97 UNION 
SELECT '040504','Chachas','Castilla','Arequipa',1671,1190.49 UNION 
SELECT '040505','Chilcaymarca','Castilla','Arequipa',1376,181.37 UNION 
SELECT '040506','Choco','Castilla','Arequipa',985,904.33 UNION 
SELECT '040507','Huancarqui','Castilla','Arequipa',1288,803.65 UNION 
SELECT '040508','Machaguay','Castilla','Arequipa',681,246.89 UNION 
SELECT '040509','Orcopampa','Castilla','Arequipa',10039,724.37 UNION 
SELECT '040510','Pampacolca','Castilla','Arequipa',2612,205.19 UNION 
SELECT '040511','Tipan','Castilla','Arequipa',506,57.68 UNION 
SELECT '040512','Uraca','Castilla','Arequipa',7235,713.83 UNION 
SELECT '040513','Uñon','Castilla','Arequipa',464,296.93 UNION 
SELECT '040514','Viraco','Castilla','Arequipa',1647,141 UNION 
SELECT '040601','Chuquibamba','Condesuyos','Arequipa',3279,1255.04 UNION 
SELECT '040602','Andaray','Condesuyos','Arequipa',657,847.56 UNION 
SELECT '040603','Cayarani','Condesuyos','Arequipa',3046,1395.67 UNION 
SELECT '040604','Chichas','Condesuyos','Arequipa',638,392.16 UNION 
SELECT '040605','Iray','Condesuyos','Arequipa',633,247.62 UNION 
SELECT '040606','Salamanca','Condesuyos','Arequipa',841,1235.8 UNION 
SELECT '040607','Yanaquihua','Condesuyos','Arequipa',6061,1057.07 UNION 
SELECT '040608','Rio Grande','Condesuyos','Arequipa',2606,527.48 UNION 
SELECT '040701','Mollendo','Islay','Arequipa',22008,960.83 UNION 
SELECT '040702','Cocachacra','Islay','Arequipa',8901,1536.96 UNION 
SELECT '040703','Dean Valdivia','Islay','Arequipa',6703,134.08 UNION 
SELECT '040704','Islay','Islay','Arequipa',7851,383.78 UNION 
SELECT '040705','Mejia','Islay','Arequipa',1014,100.78 UNION 
SELECT '040706','Punta de Bombon','Islay','Arequipa',6444,769.6 UNION 
SELECT '040801','Cotahuasi','La Union','Arequipa',2923,166.5 UNION 
SELECT '040802','Alca','La Union','Arequipa',1988,193.42 UNION 
SELECT '040803','Charcana','La Union','Arequipa',536,165.27 UNION 
SELECT '040804','Huaynacotas','La Union','Arequipa',2207,932.64 UNION 
SELECT '040805','Pampamarca','La Union','Arequipa',1231,782.17 UNION 
SELECT '040806','Puyca','La Union','Arequipa',2797,1501.2 UNION 
SELECT '040807','Quechualla','La Union','Arequipa',228,138.37 UNION 
SELECT '040808','Sayla','La Union','Arequipa',592,66.55 UNION 
SELECT '040809','Tauria','La Union','Arequipa',317,314.68 UNION 
SELECT '040810','Tomepampa','La Union','Arequipa',813,94.16 UNION 
SELECT '040811','Toro','La Union','Arequipa',767,391.44 UNION 
SELECT '050101','Ayacucho','Huamanga','Ayacucho',96671,83.11 UNION 
SELECT '050102','Acos Vinchos','Huamanga','Ayacucho',6197,156.82 UNION 
SELECT '050103','Carmen Alto','Huamanga','Ayacucho',22397,17.52 UNION 
SELECT '050104','Chiara','Huamanga','Ayacucho',7216,461.61 UNION 
SELECT '050105','Quinua','Huamanga','Ayacucho',6375,116.61 UNION 
SELECT '050106','San Jose de Ticllas','Huamanga','Ayacucho',2591,82.31 UNION 
SELECT '050107','San Juan Bautista','Huamanga','Ayacucho',52935,15.19 UNION 
SELECT '050108','Santiago de Pischa','Huamanga','Ayacucho',1700,91.09 UNION 
SELECT '050109','Vinchos','Huamanga','Ayacucho',17136,928.68 UNION 
SELECT '050110','Tambillo','Huamanga','Ayacucho',5462,153.23 UNION 
SELECT '050111','Acocro','Huamanga','Ayacucho',11081,436.65 UNION 
SELECT '050112','Socos','Huamanga','Ayacucho',7637,172.34 UNION 
SELECT '050113','Ocros','Huamanga','Ayacucho',6466,305.41 UNION 
SELECT '050114','Pacaycasa','Huamanga','Ayacucho',3314,53.55 UNION 
SELECT '050115','Jesus Nazareno','Huamanga','Ayacucho',18815,16.12 UNION 
SELECT '050201','Cangallo','Cangallo','Ayacucho',6866,187.05 UNION 
SELECT '050204','Chuschi','Cangallo','Ayacucho',8127,418.03 UNION 
SELECT '050206','Los Morochucos','Cangallo','Ayacucho',8316,253.22 UNION 
SELECT '050207','Paras','Cangallo','Ayacucho',4636,789.09 UNION 
SELECT '050208','Totos','Cangallo','Ayacucho',3742,112.9 UNION 
SELECT '050211','Maria Parado de Bellido','Cangallo','Ayacucho',2576,129.13 UNION 
SELECT '050301','Huanta','Huanta','Ayacucho',42538,193.48 UNION 
SELECT '050302','Ayahuanco','Huanta','Ayacucho',6452,297.89 UNION 
SELECT '050303','Huamanguilla','Huanta','Ayacucho',5345,95.27 UNION 
SELECT '050304','Iguain','Huanta','Ayacucho',3327,61.44 UNION 
SELECT '050305','Luricocha','Huanta','Ayacucho',5359,130.04 UNION 
SELECT '050307','Santillana','Huanta','Ayacucho',4906,336.17 UNION 
SELECT '050308','Sivia','Huanta','Ayacucho',13511,1053.52 UNION 
SELECT '050309','Llochegua','Huanta','Ayacucho',11372,469.02 UNION 
SELECT '050401','San Miguel','La Mar','Ayacucho',9248,457.88 UNION 
SELECT '050402','Anco','La Mar','Ayacucho',11144,802.86 UNION 
SELECT '050403','Ayna','La Mar','Ayacucho',10559,290.51 UNION 
SELECT '050404','Chilcas','La Mar','Ayacucho',3081,156.58 UNION 
SELECT '050405','Chungui','La Mar','Ayacucho',5478,1093.05 UNION 
SELECT '050406','Tambo','La Mar','Ayacucho',20429,313.82 UNION 
SELECT '050407','Luis Carranza','La Mar','Ayacucho',1041,135.84 UNION 
SELECT '050408','Santa Rosa','La Mar','Ayacucho',11233,396.58 UNION 
SELECT '050409','Samugari','La Mar','Ayacucho',10772,387.45 UNION 
SELECT '050501','Puquio','Lucanas','Ayacucho',14166,866.43 UNION 
SELECT '050502','Aucara','Lucanas','Ayacucho',5640,903.51 UNION 
SELECT '050503','Cabana','Lucanas','Ayacucho',4727,402.62 UNION 
SELECT '050504','Carmen Salcedo','Lucanas','Ayacucho',4159,473.66 UNION 
SELECT '050506','Chaviña','Lucanas','Ayacucho',2025,399.09 UNION 
SELECT '050508','Chipao','Lucanas','Ayacucho',3825,1166.91 UNION 
SELECT '050510','Huac-Huas','Lucanas','Ayacucho',2865,309.48 UNION 
SELECT '050511','Laramate','Lucanas','Ayacucho',1367,785.89 UNION 
SELECT '050512','Leoncio Prado','Lucanas','Ayacucho',1364,1053.6 UNION 
SELECT '050513','Lucanas','Lucanas','Ayacucho',4240,1205.78 UNION 
SELECT '050514','Llauta','Lucanas','Ayacucho',1126,482.07 UNION 
SELECT '050516','Ocaña','Lucanas','Ayacucho',2932,848.36 UNION 
SELECT '050517','Otoca','Lucanas','Ayacucho',3149,720.2 UNION 
SELECT '050520','Sancos','Lucanas','Ayacucho',7510,1520.87 UNION 
SELECT '050521','San Juan','Lucanas','Ayacucho',1636,44.59 UNION 
SELECT '050522','San Pedro','Lucanas','Ayacucho',3019,733.03 UNION 
SELECT '050524','Santa Ana de Huaycahuacho','Lucanas','Ayacucho',669,50.63 UNION 
SELECT '050525','Santa Lucia','Lucanas','Ayacucho',889,1019.14 UNION 
SELECT '050529','Saisa','Lucanas','Ayacucho',933,585.4 UNION 
SELECT '050531','San Pedro de Palco','Lucanas','Ayacucho',1371,531.55 UNION 
SELECT '050532','San Cristobal','Lucanas','Ayacucho',2182,391.83 UNION 
SELECT '050601','Coracora','Parinacochas','Ayacucho',15679,1399.41 UNION 
SELECT '050604','Coronel Castañeda','Parinacochas','Ayacucho',1926,1108.04 UNION 
SELECT '050605','Chumpi','Parinacochas','Ayacucho',2680,366.3 UNION 
SELECT '050608','Pacapausa','Parinacochas','Ayacucho',2955,144.3 UNION 
SELECT '050611','Pullo','Parinacochas','Ayacucho',5003,1562.34 UNION 
SELECT '050612','Puyusca','Parinacochas','Ayacucho',2091,700.75 UNION 
SELECT '050615','San Francisco de Ravacayco','Parinacochas','Ayacucho',770,99.83 UNION 
SELECT '050616','Upahuacho','Parinacochas','Ayacucho',2817,587.35 UNION 
SELECT '050701','Huancapi','Victor Fajardo','Ayacucho',2049,223.35 UNION 
SELECT '050702','Alcamenca','Victor Fajardo','Ayacucho',2428,125.11 UNION 
SELECT '050703','Apongo','Victor Fajardo','Ayacucho',1420,171.58 UNION 
SELECT '050704','Canaria','Victor Fajardo','Ayacucho',4057,263.88 UNION 
SELECT '050706','Cayara','Victor Fajardo','Ayacucho',1204,69.25 UNION 
SELECT '050707','Colca','Victor Fajardo','Ayacucho',1078,69.57 UNION 
SELECT '050708','Huaya','Victor Fajardo','Ayacucho',3284,162.23 UNION 
SELECT '050709','Huamanquiquia','Victor Fajardo','Ayacucho',1248,67.33 UNION 
SELECT '050710','Huancaraylla','Victor Fajardo','Ayacucho',1207,165.49 UNION 
SELECT '050713','Sarhua','Victor Fajardo','Ayacucho',2778,373.14 UNION 
SELECT '050714','Vilcanchos','Victor Fajardo','Ayacucho',2733,498.54 UNION 
SELECT '050715','Asquipata','Victor Fajardo','Ayacucho',444,70.72 UNION 
SELECT '050801','Sancos','Huanca Sancos','Ayacucho',3632,1289.7 UNION 
SELECT '050802','Sacsamarca','Huanca Sancos','Ayacucho',1637,673.03 UNION 
SELECT '050803','Santiago de Lucanamarca','Huanca Sancos','Ayacucho',2683,658.26 UNION 
SELECT '050804','Carapo','Huanca Sancos','Ayacucho',2543,241.34 UNION 
SELECT '050901','Vilcas Huaman','Vilcas Huaman','Ayacucho',8545,216.89 UNION 
SELECT '050902','Vischongo','Vilcas Huaman','Ayacucho',4828,268.87 UNION 
SELECT '050903','Accomarca','Vilcas Huaman','Ayacucho',939,82.43 UNION 
SELECT '050904','Carhuanca','Vilcas Huaman','Ayacucho',1018,56.91 UNION 
SELECT '050905','Concepcion','Vilcas Huaman','Ayacucho',3193,215.03 UNION 
SELECT '050906','Huambalpa','Vilcas Huaman','Ayacucho',2206,150.76 UNION 
SELECT '050907','Saurama','Vilcas Huaman','Ayacucho',1297,95.15 UNION 
SELECT '050908','Independencia','Vilcas Huaman','Ayacucho',1583,85.28 UNION 
SELECT '051001','Pausa','Paucar del Sara Sara','Ayacucho',2845,242.78 UNION 
SELECT '051002','Colta','Paucar del Sara Sara','Ayacucho',1179,277.29 UNION 
SELECT '051003','Corculla','Paucar del Sara Sara','Ayacucho',445,97.05 UNION 
SELECT '051004','Lampa','Paucar del Sara Sara','Ayacucho',2590,289.45 UNION 
SELECT '051005','Marcabamba','Paucar del Sara Sara','Ayacucho',786,122.53 UNION 
SELECT '051006','Oyolo','Paucar del Sara Sara','Ayacucho',1226,820.13 UNION 
SELECT '051007','Pararca','Paucar del Sara Sara','Ayacucho',669,57.91 UNION 
SELECT '051008','San Javier de Alpabamba','Paucar del Sara Sara','Ayacucho',551,92.87 UNION 
SELECT '051009','San Jose de Ushua','Paucar del Sara Sara','Ayacucho',179,17.33 UNION 
SELECT '051010','Sara Sara','Paucar del Sara Sara','Ayacucho',735,79.58 UNION 
SELECT '051101','Querobamba','Sucre','Ayacucho',2792,275.65 UNION 
SELECT '051102','Belen','Sucre','Ayacucho',772,41.46 UNION 
SELECT '051103','Chalcos','Sucre','Ayacucho',635,58.43 UNION 
SELECT '051104','San Salvador de Quije','Sucre','Ayacucho',1679,144.63 UNION 
SELECT '051105','Paico','Sucre','Ayacucho',837,79.65 UNION 
SELECT '051106','Santiago de Paucaray','Sucre','Ayacucho',724,62.65 UNION 
SELECT '051107','San Pedro de Larcay','Sucre','Ayacucho',1053,310.07 UNION 
SELECT '051108','Soras','Sucre','Ayacucho',1331,357.97 UNION 
SELECT '051109','Huacaña','Sucre','Ayacucho',694,132.73 UNION 
SELECT '051110','Chilcayoc','Sucre','Ayacucho',568,33.06 UNION 
SELECT '051111','Morcolla','Sucre','Ayacucho',1035,289.34 UNION 
SELECT '060101','Cajamarca','Cajamarca','Cajamarca',251097,382.74 UNION 
SELECT '060102','Asuncion','Cajamarca','Cajamarca',13508,210.18 UNION 
SELECT '060103','Cospan','Cajamarca','Cajamarca',7882,558.79 UNION 
SELECT '060104','Chetilla','Cajamarca','Cajamarca',4319,73.94 UNION 
SELECT '060105','Encañada','Cajamarca','Cajamarca',24290,635.06 UNION 
SELECT '060106','Jesus','Cajamarca','Cajamarca',14742,267.78 UNION 
SELECT '060107','Los Baños del Inca','Cajamarca','Cajamarca',43401,276.4 UNION 
SELECT '060108','Llacanora','Cajamarca','Cajamarca',5404,49.42 UNION 
SELECT '060109','Magdalena','Cajamarca','Cajamarca',9689,215.38 UNION 
SELECT '060110','Matara','Cajamarca','Cajamarca',3542,59.74 UNION 
SELECT '060111','Namora','Cajamarca','Cajamarca',10740,180.69 UNION 
SELECT '060112','San Juan','Cajamarca','Cajamarca',5232,69.66 UNION 
SELECT '060201','Cajabamba','Cajabamba','Cajamarca',30798,192.29 UNION 
SELECT '060202','Cachachi','Cajabamba','Cajamarca',26990,820.81 UNION 
SELECT '060203','Condebamba','Cajabamba','Cajamarca',14006,204.6 UNION 
SELECT '060205','Sitacocha','Cajabamba','Cajamarca',8910,589.94 UNION 
SELECT '060301','Celendin','Celendin','Cajamarca',28319,409 UNION 
SELECT '060302','Cortegana','Celendin','Cajamarca',8878,233.31 UNION 
SELECT '060303','Chumuch','Celendin','Cajamarca',3198,196.3 UNION 
SELECT '060304','Huasmin','Celendin','Cajamarca',13621,437.5 UNION 
SELECT '060305','Jorge Chavez','Celendin','Cajamarca',593,53.34 UNION 
SELECT '060306','Jose Galvez','Celendin','Cajamarca',2497,58.01 UNION 
SELECT '060307','Miguel Iglesias','Celendin','Cajamarca',5613,235.73 UNION 
SELECT '060308','Oxamarca','Celendin','Cajamarca',6977,292.52 UNION 
SELECT '060309','Sorochuco','Celendin','Cajamarca',9881,170.02 UNION 
SELECT '060310','Sucre','Celendin','Cajamarca',6085,270.98 UNION 
SELECT '060311','Utco','Celendin','Cajamarca',1417,100.79 UNION 
SELECT '060312','La Libertad de Pallan','Celendin','Cajamarca',9101,184.09 UNION 
SELECT '060401','Contumaza','Contumaza','Cajamarca',8461,358.28 UNION 
SELECT '060403','Chilete','Contumaza','Cajamarca',2733,133.94 UNION 
SELECT '060404','Guzmango','Contumaza','Cajamarca',3146,49.88 UNION 
SELECT '060405','San Benito','Contumaza','Cajamarca',3845,486.55 UNION 
SELECT '060406','Cupisnique','Contumaza','Cajamarca',1457,280.2 UNION 
SELECT '060407','Tantarica','Contumaza','Cajamarca',3303,149.7 UNION 
SELECT '060408','Yonan','Contumaza','Cajamarca',7907,547.25 UNION 
SELECT '060409','Santa Cruz de Toled','Contumaza','Cajamarca',1044,64.53 UNION 
SELECT '060501','Cutervo','Cutervo','Cajamarca',56382,422.27 UNION 
SELECT '060502','Callayuc','Cutervo','Cajamarca',10280,316.05 UNION 
SELECT '060503','Cujillo','Cutervo','Cajamarca',3040,108.93 UNION 
SELECT '060504','Choros','Cutervo','Cajamarca',3595,276.96 UNION 
SELECT '060505','La Ramada','Cutervo','Cajamarca',4862,30.27 UNION 
SELECT '060506','Pimpingos','Cutervo','Cajamarca',5697,186.04 UNION 
SELECT '060507','Querocotillo','Cutervo','Cajamarca',17001,697.1 UNION 
SELECT '060508','San Andres de Cutervo','Cutervo','Cajamarca',5240,133.4 UNION 
SELECT '060509','San Juan de Cutervo','Cutervo','Cajamarca',1981,60.87 UNION 
SELECT '060510','San Luis de Lucma','Cutervo','Cajamarca',4042,109.74 UNION 
SELECT '060511','Santa Cruz','Cutervo','Cajamarca',2889,128 UNION 
SELECT '060512','Santo Domingo de La Capilla','Cutervo','Cajamarca',5649,103.74 UNION 
SELECT '060513','Santo Tomas','Cutervo','Cajamarca',7931,279.61 UNION 
SELECT '060514','Socota','Cutervo','Cajamarca',10720,134.83 UNION 
SELECT '060515','Toribio Casanova','Cutervo','Cajamarca',1262,40.65 UNION 
SELECT '060601','Chota','Chota','Cajamarca',48903,261.75 UNION 
SELECT '060602','Anguia','Chota','Cajamarca',4296,123.01 UNION 
SELECT '060603','Cochabamba','Chota','Cajamarca',6401,130.01 UNION 
SELECT '060604','Conchan','Chota','Cajamarca',7060,180.23 UNION 
SELECT '060605','Chadin','Chota','Cajamarca',4104,66.53 UNION 
SELECT '060606','Chiguirip','Chota','Cajamarca',4663,51.44 UNION 
SELECT '060607','Chimban','Chota','Cajamarca',3684,198.99 UNION 
SELECT '060608','Huambos','Chota','Cajamarca',9490,240.72 UNION 
SELECT '060609','Lajas','Chota','Cajamarca',12505,120.73 UNION 
SELECT '060610','Llama','Chota','Cajamarca',8037,494.94 UNION 
SELECT '060611','Miracosta','Chota','Cajamarca',3924,415.69 UNION 
SELECT '060612','Paccha','Chota','Cajamarca',5335,93.97 UNION 
SELECT '060613','Pion','Chota','Cajamarca',1566,141.05 UNION 
SELECT '060614','Querocoto','Chota','Cajamarca',8918,301.07 UNION 
SELECT '060615','Tacabamba','Chota','Cajamarca',20132,196.25 UNION 
SELECT '060616','Tocmoche','Chota','Cajamarca',993,222.38 UNION 
SELECT '060617','San Juan de Licupis','Chota','Cajamarca',969,205.01 UNION 
SELECT '060618','Choropampa','Chota','Cajamarca',2553,171.59 UNION 
SELECT '060619','Chalamarca','Chota','Cajamarca',11274,179.74 UNION 
SELECT '060701','Bambamarca','Hualgayoc','Cajamarca',82744,451.38 UNION 
SELECT '060702','Chugur','Hualgayoc','Cajamarca',3601,99.6 UNION 
SELECT '060703','Hualgayoc','Hualgayoc','Cajamarca',16979,226.17 UNION 
SELECT '060801','Jaen','Jaen','Cajamarca',101726,537.25 UNION 
SELECT '060802','Bellavista','Jaen','Cajamarca',15310,870.55 UNION 
SELECT '060803','Colasay','Jaen','Cajamarca',10447,735.73 UNION 
SELECT '060804','Chontali','Jaen','Cajamarca',10232,428.55 UNION 
SELECT '060805','Pomahuaca','Jaen','Cajamarca',10190,732.8 UNION 
SELECT '060806','Pucara','Jaen','Cajamarca',7703,240.3 UNION 
SELECT '060807','Sallique','Jaen','Cajamarca',8730,373.89 UNION 
SELECT '060808','San Felipe','Jaen','Cajamarca',6266,255.49 UNION 
SELECT '060809','San Jose del Alto','Jaen','Cajamarca',7209,634.11 UNION 
SELECT '060810','Santa Rosa','Jaen','Cajamarca',11363,282.8 UNION 
SELECT '060811','Las Pirias','Jaen','Cajamarca',4009,60.41 UNION 
SELECT '060812','Huabal','Jaen','Cajamarca',6956,80.69 UNION 
SELECT '060901','Santa Cruz','Santa Cruz','Cajamarca',12431,102.51 UNION 
SELECT '060902','Catache','Santa Cruz','Cajamarca',10048,609.16 UNION 
SELECT '060903','Chancaybaños','Santa Cruz','Cajamarca',3899,120.04 UNION 
SELECT '060904','La Esperanza','Santa Cruz','Cajamarca',2560,59.7 UNION 
SELECT '060905','Ninabamba','Santa Cruz','Cajamarca',2759,60.04 UNION 
SELECT '060906','Pulan','Santa Cruz','Cajamarca',4438,155.67 UNION 
SELECT '060907','Sexi','Santa Cruz','Cajamarca',571,192.87 UNION 
SELECT '060908','Uticyacu','Santa Cruz','Cajamarca',1606,43.38 UNION 
SELECT '060909','Yauyucan','Santa Cruz','Cajamarca',3610,35.37 UNION 
SELECT '060910','Andabamba','Santa Cruz','Cajamarca',1494,7.61 UNION 
SELECT '060911','Saucepampa','Santa Cruz','Cajamarca',1848,31.58 UNION 
SELECT '061001','San Miguel','San Miguel','Cajamarca',15894,368.26 UNION 
SELECT '061002','Calquis','San Miguel','Cajamarca',4425,339 UNION 
SELECT '061003','La Florida','San Miguel','Cajamarca',2157,61.33 UNION 
SELECT '061004','Llapa','San Miguel','Cajamarca',6086,132.68 UNION 
SELECT '061005','Nanchoc','San Miguel','Cajamarca',1550,358.94 UNION 
SELECT '061006','Niepos','San Miguel','Cajamarca',4001,158.88 UNION 
SELECT '061007','San Gregorio','San Miguel','Cajamarca',2263,308.05 UNION 
SELECT '061008','San Silvestre de Cochan','San Miguel','Cajamarca',4449,131.62 UNION 
SELECT '061009','El Prado','San Miguel','Cajamarca',1300,71.44 UNION 
SELECT '061010','Union Agua Blanca','San Miguel','Cajamarca',3577,171.71 UNION 
SELECT '061011','Tongod','San Miguel','Cajamarca',4900,163.89 UNION 
SELECT '061012','Catilluc','San Miguel','Cajamarca',3495,197.31 UNION 
SELECT '061013','Bolivar','San Miguel','Cajamarca',1462,78.97 UNION 
SELECT '061101','San Ignacio','San Ignacio','Cajamarca',37862,381.88 UNION 
SELECT '061102','Chirinos','San Ignacio','Cajamarca',14355,351.91 UNION 
SELECT '061103','Huarango','San Ignacio','Cajamarca',20589,922.35 UNION 
SELECT '061104','Namballe','San Ignacio','Cajamarca',11717,663.51 UNION 
SELECT '061105','La Coipa','San Ignacio','Cajamarca',21056,376.09 UNION 
SELECT '061106','San Jose de Lourdes','San Ignacio','Cajamarca',22147,1482.75 UNION 
SELECT '061107','Tabaconas','San Ignacio','Cajamarca',22002,798.59 UNION 
SELECT '061201','Pedro Galvez','San Marcos','Cajamarca',21549,238.74 UNION 
SELECT '061202','Ichocan','San Marcos','Cajamarca',1624,76.11 UNION 
SELECT '061203','Gregorio Pita','San Marcos','Cajamarca',6666,212.81 UNION 
SELECT '061204','Jose Manuel Quiroz','San Marcos','Cajamarca',3961,115.42 UNION 
SELECT '061205','Eduardo Villanueva','San Marcos','Cajamarca',2288,63.13 UNION 
SELECT '061206','Jose Sabogal','San Marcos','Cajamarca',15303,594.31 UNION 
SELECT '061207','Chancay','San Marcos','Cajamarca',3337,61.8 UNION 
SELECT '061301','San Pablo','San Pablo','Cajamarca',13586,197.92 UNION 
SELECT '061302','San Bernardino','San Pablo','Cajamarca',4830,167.12 UNION 
SELECT '061303','San Luis','San Pablo','Cajamarca',1255,42.88 UNION 
SELECT '061304','Tumbaden','San Pablo','Cajamarca',3590,264.37 UNION 
SELECT '070101','Cusco','Cusco','Cusco',121667,116.22 UNION 
SELECT '070102','Ccorca','Cusco','Cusco',2483,188.56 UNION 
SELECT '070103','Poroy','Cusco','Cusco',8020,14.96 UNION 
SELECT '070104','San Jeronimo','Cusco','Cusco',48224,103.34 UNION 
SELECT '070105','San Sebastian','Cusco','Cusco',118312,89.44 UNION 
SELECT '070106','Santiago','Cusco','Cusco',91838,69.72 UNION 
SELECT '070107','Saylla','Cusco','Cusco',5599,28.38 UNION 
SELECT '070108','Wanchaq','Cusco','Cusco',65188,6.38 UNION 
SELECT '070201','Acomayo','Acomayo','Cusco',5627,141.27 UNION 
SELECT '070202','Acopia','Acomayo','Cusco',2336,91.72 UNION 
SELECT '070203','Acos','Acomayo','Cusco',2286,137.55 UNION 
SELECT '070204','Pomacanchi','Acomayo','Cusco',9092,275.56 UNION 
SELECT '070205','Rondocan','Acomayo','Cusco',2281,180.22 UNION 
SELECT '070206','Sangarara','Acomayo','Cusco',3733,78.29 UNION 
SELECT '070207','Mosoc Llacta','Acomayo','Cusco',2321,43.61 UNION 
SELECT '070301','Anta','Anta','Cusco',16833,202.58 UNION 
SELECT '070302','Chinchaypujio','Anta','Cusco',4434,390.58 UNION 
SELECT '070303','Huarocondo','Anta','Cusco',5875,228.62 UNION 
SELECT '070304','Limatambo','Anta','Cusco',9813,512.92 UNION 
SELECT '070305','Mollepata','Anta','Cusco',2674,284.48 UNION 
SELECT '070306','Pucyura','Anta','Cusco',4242,37.75 UNION 
SELECT '070307','Zurite','Anta','Cusco',3714,52.33 UNION 
SELECT '070308','Cachimayo','Anta','Cusco',2274,43.28 UNION 
SELECT '070309','Ancahuasi','Anta','Cusco',7015,123.58 UNION 
SELECT '070401','Calca','Calca','Cusco',23824,311.01 UNION 
SELECT '070402','Coya','Calca','Cusco',4034,71.43 UNION 
SELECT '070403','Lamay','Calca','Cusco',5821,94.22 UNION 
SELECT '070404','Lares','Calca','Cusco',7227,527.26 UNION 
SELECT '070405','Pisac','Calca','Cusco',10285,148.25 UNION 
SELECT '070406','San Salvador','Calca','Cusco',5674,128.07 UNION 
SELECT '070407','Taray','Calca','Cusco',4745,53.78 UNION 
SELECT '070408','Yanatile','Calca','Cusco',13588,3080.47 UNION 
SELECT '070501','Yanaoca','Canas','Cusco',10178,292.97 UNION 
SELECT '070502','Checca','Canas','Cusco',6315,503.76 UNION 
SELECT '070503','Kunturkanki','Canas','Cusco',5781,376.19 UNION 
SELECT '070504','Langui','Canas','Cusco',2567,187.1 UNION 
SELECT '070505','Layo','Canas','Cusco',6447,452.56 UNION 
SELECT '070506','Pampamarca','Canas','Cusco',2075,29.91 UNION 
SELECT '070507','Quehue','Canas','Cusco',3578,143.46 UNION 
SELECT '070508','Tupac Amaru','Canas','Cusco',2961,117.81 UNION 
SELECT '070601','Sicuani','Canchis','Cusco',60903,645.88 UNION 
SELECT '070602','Combapata','Canchis','Cusco',5432,182.5 UNION 
SELECT '070603','Checacupe','Canchis','Cusco',4984,962.34 UNION 
SELECT '070604','Marangani','Canchis','Cusco',11287,432.65 UNION 
SELECT '070605','Pitumarca','Canchis','Cusco',7616,1117.54 UNION 
SELECT '070606','San Pablo','Canchis','Cusco',4557,524.06 UNION 
SELECT '070607','San Pedro','Canchis','Cusco',2773,54.91 UNION 
SELECT '070608','Tinta','Canchis','Cusco',5642,79.39 UNION 
SELECT '070701','Santo Tomas','Chumbivilcas','Cusco',26992,1924.08 UNION 
SELECT '070702','Capacmarca','Chumbivilcas','Cusco',4620,271.81 UNION 
SELECT '070703','Colquemarca','Chumbivilcas','Cusco',8630,449.49 UNION 
SELECT '070704','Chamaca','Chumbivilcas','Cusco',8971,674.19 UNION 
SELECT '070705','Livitaca','Chumbivilcas','Cusco',13526,758.2 UNION 
SELECT '070706','Llusco','Chumbivilcas','Cusco',7173,315.42 UNION 
SELECT '070707','Quiñota','Chumbivilcas','Cusco',4990,221.05 UNION 
SELECT '070708','Velille','Chumbivilcas','Cusco',8580,756.84 UNION 
SELECT '070801','Espinar','Espinar','Cusco',33970,747.78 UNION 
SELECT '070802','Condoroma','Espinar','Cusco',1431,513.36 UNION 
SELECT '070803','Coporaque','Espinar','Cusco',18004,1564.46 UNION 
SELECT '070804','Ocoruro','Espinar','Cusco',1588,353.15 UNION 
SELECT '070805','Pallpata','Espinar','Cusco',5593,815.56 UNION 
SELECT '070806','Pichigua','Espinar','Cusco',3629,288.76 UNION 
SELECT '070807','Suyckutambo','Espinar','Cusco',2781,652.13 UNION 
SELECT '070808','Alto Pichigua','Espinar','Cusco',3171,375.89 UNION 
SELECT '070901','Santa Ana','La Convencion','Cusco',35206,359.4 UNION 
SELECT '070902','Echarate','La Convencion','Cusco',37130,19135.5 UNION 
SELECT '070903','Huayopata','La Convencion','Cusco',4539,524.02 UNION 
SELECT '070904','Maranura','La Convencion','Cusco',5949,150.3 UNION 
SELECT '070905','Ocobamba','La Convencion','Cusco',6852,840.93 UNION 
SELECT '070906','Santa Teresa','La Convencion','Cusco',6418,1340.38 UNION 
SELECT '070907','Vilcabamba','La Convencion','Cusco',13869,3318.86 UNION 
SELECT '070908','Quellouno','La Convencion','Cusco',18320,799.68 UNION 
SELECT '070909','Kimbiri','La Convencion','Cusco',14893,905.69 UNION 
SELECT '070910','Pichari','La Convencion','Cusco',20538,730.45 UNION 
SELECT '071001','Paruro','Paruro','Cusco',3400,153.42 UNION 
SELECT '071002','Accha','Paruro','Cusco',3839,244.75 UNION 
SELECT '071003','Ccapi','Paruro','Cusco',3749,334.85 UNION 
SELECT '071004','Colcha','Paruro','Cusco',1189,139.98 UNION 
SELECT '071005','Huanoquite','Paruro','Cusco',5700,362.67 UNION 
SELECT '071006','Omacha','Paruro','Cusco',7205,436.21 UNION 
SELECT '071007','Yaurisque','Paruro','Cusco',2522,90.8 UNION 
SELECT '071008','Paccaritambo','Paruro','Cusco',2076,142.61 UNION 
SELECT '071009','Pillpinto','Paruro','Cusco',1254,79.13 UNION 
SELECT '071101','Paucartambo','Paucartambo','Cusco',13491,1079.23 UNION 
SELECT '071102','Caicay','Paucartambo','Cusco',2768,110.72 UNION 
SELECT '071103','Colquepata','Paucartambo','Cusco',10767,467.68 UNION 
SELECT '071104','Challabamba','Paucartambo','Cusco',11389,746.56 UNION 
SELECT '071105','Kosñipata','Paucartambo','Cusco',5692,3745.68 UNION 
SELECT '071106','Huancarani','Paucartambo','Cusco',7774,145.14 UNION 
SELECT '071201','Urcos','Quispicanchi','Cusco',9412,134.65 UNION 
SELECT '071202','Andahuaylillas','Quispicanchi','Cusco',5558,84.6 UNION 
SELECT '071203','Camanti','Quispicanchi','Cusco',2094,3174.93 UNION 
SELECT '071204','Ccarhuayo','Quispicanchi','Cusco',3173,313.89 UNION 
SELECT '071205','Ccatca','Quispicanchi','Cusco',18128,307.72 UNION 
SELECT '071206','Cusipata','Quispicanchi','Cusco',4795,248.03 UNION 
SELECT '071207','Huaro','Quispicanchi','Cusco',4508,106.28 UNION 
SELECT '071208','Lucre','Quispicanchi','Cusco',4051,118.78 UNION 
SELECT '071209','Marcapata','Quispicanchi','Cusco',4533,1687.91 UNION 
SELECT '071210','Ocongate','Quispicanchi','Cusco',15889,952.66 UNION 
SELECT '071211','Oropesa','Quispicanchi','Cusco',7428,74.44 UNION 
SELECT '071212','Quiquijana','Quispicanchi','Cusco',11100,360.9 UNION 
SELECT '071301','Urubamba','Urubamba','Cusco',21424,128.28 UNION 
SELECT '071302','Chinchero','Urubamba','Cusco',9896,94.57 UNION 
SELECT '071303','Huayllabamba','Urubamba','Cusco',5332,102.47 UNION 
SELECT '071304','Machupicchu','Urubamba','Cusco',8471,271.44 UNION 
SELECT '071305','Maras','Urubamba','Cusco',5900,131.85 UNION 
SELECT '071306','Ollantaytambo','Urubamba','Cusco',11347,640.25 UNION 
SELECT '071307','Yucay','Urubamba','Cusco',3390,70.57 UNION 
SELECT '080101','Huancavelica','Huancavelica','Huancavelica',41284,514.1 UNION 
SELECT '080102','Acobambilla','Huancavelica','Huancavelica',4730,758.32 UNION 
SELECT '080103','Acoria','Huancavelica','Huancavelica',37509,535.1 UNION 
SELECT '080104','Conayca','Huancavelica','Huancavelica',1212,37.79 UNION 
SELECT '080105','Cuenca','Huancavelica','Huancavelica',1942,50.25 UNION 
SELECT '080106','Huachocolpa','Huancavelica','Huancavelica',2886,336.28 UNION 
SELECT '080108','Huayllahuara','Huancavelica','Huancavelica',724,38.8 UNION 
SELECT '080109','Izcuchaca','Huancavelica','Huancavelica',868,12.19 UNION 
SELECT '080110','Laria','Huancavelica','Huancavelica',1453,78.45 UNION 
SELECT '080111','Manta','Huancavelica','Huancavelica',1876,154.14 UNION 
SELECT '080112','Mariscal Caceres','Huancavelica','Huancavelica',1058,5.63 UNION 
SELECT '080113','Moya','Huancavelica','Huancavelica',2539,94.08 UNION 
SELECT '080114','Nuevo Occoro','Huancavelica','Huancavelica',2728,211.56 UNION 
SELECT '080115','Palca','Huancavelica','Huancavelica',3214,82.08 UNION 
SELECT '080116','Pilchaca','Huancavelica','Huancavelica',487,42.97 UNION 
SELECT '080117','Vilca','Huancavelica','Huancavelica',3060,317.76 UNION 
SELECT '080118','Yauli','Huancavelica','Huancavelica',34557,319.92 UNION 
SELECT '080119','Ascension','Huancavelica','Huancavelica',12711,432.24 UNION 
SELECT '080120','Huando','Huancavelica','Huancavelica',7695,193.9 UNION 
SELECT '080201','Acobamba','Acobamba','Huancavelica',10258,123.02 UNION 
SELECT '080202','Anta','Acobamba','Huancavelica',9711,91.36 UNION 
SELECT '080203','Andabamba','Acobamba','Huancavelica',5758,81.85 UNION 
SELECT '080204','Caja','Acobamba','Huancavelica',2837,82.39 UNION 
SELECT '080205','Marcas','Acobamba','Huancavelica',2402,155.87 UNION 
SELECT '080206','Paucara','Acobamba','Huancavelica',38507,225.6 UNION 
SELECT '080207','Pomacocha','Acobamba','Huancavelica',3941,53.66 UNION 
SELECT '080208','Rosario','Acobamba','Huancavelica',7985,97.07 UNION 
SELECT '080301','Lircay','Angaraes','Huancavelica',25333,818.84 UNION 
SELECT '080302','Anchonga','Angaraes','Huancavelica',8216,72.4 UNION 
SELECT '080303','Callanmarca','Angaraes','Huancavelica',757,26.02 UNION 
SELECT '080304','Congalla','Angaraes','Huancavelica',4165,215.64 UNION 
SELECT '080305','Chincho','Angaraes','Huancavelica',3578,182.7 UNION 
SELECT '080306','Huayllay Grande','Angaraes','Huancavelica',2240,33.28 UNION 
SELECT '080307','Huanca-Huanca','Angaraes','Huancavelica',1773,109.96 UNION 
SELECT '080308','Julcamarca','Angaraes','Huancavelica',1801,48.61 UNION 
SELECT '080309','San Antonio de Antaparco','Angaraes','Huancavelica',7834,33.42 UNION 
SELECT '080310','Santo Tomas de Pata','Angaraes','Huancavelica',2735,133.57 UNION 
SELECT '080311','Secclla','Angaraes','Huancavelica',3885,167.99 UNION 
SELECT '080312','Ccochaccasa','Angaraes','Huancavelica',2665,116.6 UNION 
SELECT '080401','Castrovirreyna','Castrovirreyna','Huancavelica',3265,937.94 UNION 
SELECT '080402','Arma','Castrovirreyna','Huancavelica',1439,304.85 UNION 
SELECT '080403','Aurahua','Castrovirreyna','Huancavelica',2275,360.97 UNION 
SELECT '080405','Capillas','Castrovirreyna','Huancavelica',1452,397.95 UNION 
SELECT '080406','Cocas','Castrovirreyna','Huancavelica',916,87.95 UNION 
SELECT '080408','Chupamarca','Castrovirreyna','Huancavelica',1233,373.78 UNION 
SELECT '080409','Huachos','Castrovirreyna','Huancavelica',1676,172.01 UNION 
SELECT '080410','Huamatambo','Castrovirreyna','Huancavelica',379,54.16 UNION 
SELECT '080414','Mollepampa','Castrovirreyna','Huancavelica',1695,165.65 UNION 
SELECT '080422','San Juan','Castrovirreyna','Huancavelica',440,207.25 UNION 
SELECT '080427','Tantara','Castrovirreyna','Huancavelica',717,113.01 UNION 
SELECT '080428','Ticrapo','Castrovirreyna','Huancavelica',1598,187 UNION 
SELECT '080429','Santa Ana','Castrovirreyna','Huancavelica',2195,622.1 UNION 
SELECT '080501','Pampas','Tayacaja','Huancavelica',9335,109.07 UNION 
SELECT '080502','Acostambo','Tayacaja','Huancavelica',4110,168.06 UNION 
SELECT '080503','Acraquia','Tayacaja','Huancavelica',5014,110.27 UNION 
SELECT '080504','Ahuaycha','Tayacaja','Huancavelica',5619,90.96 UNION 
SELECT '080506','Colcabamba','Tayacaja','Huancavelica',12376,312.18 UNION 
SELECT '080509','Daniel Hernandez','Tayacaja','Huancavelica',10381,106.92 UNION 
SELECT '080511','Huachocolpa','Tayacaja','Huancavelica',6534,292 UNION 
SELECT '080512','Huaribamba','Tayacaja','Huancavelica',4472,150.69 UNION 
SELECT '080515','Ñahuimpuquio','Tayacaja','Huancavelica',1876,67.39 UNION 
SELECT '080517','Pazos','Tayacaja','Huancavelica',7281,227.86 UNION 
SELECT '080518','Quishuar','Tayacaja','Huancavelica',904,31.54 UNION 
SELECT '080519','Salcabamba','Tayacaja','Huancavelica',4584,192.52 UNION 
SELECT '080520','San Marcos de Rocchac','Tayacaja','Huancavelica',2856,281.71 UNION 
SELECT '080523','Surcubamba','Tayacaja','Huancavelica',4926,271.75 UNION 
SELECT '080525','Tintay Puncu','Tayacaja','Huancavelica',9140,257.73 UNION 
SELECT '080526','Salcahuasi','Tayacaja','Huancavelica',3294,117.98 UNION 
SELECT '080601','Ayavi','Huaytara','Huancavelica',597,201.26 UNION 
SELECT '080602','Cordova','Huaytara','Huancavelica',2898,104.59 UNION 
SELECT '080603','Huayacundo Arma','Huaytara','Huancavelica',469,12.81 UNION 
SELECT '080604','Huaytara','Huaytara','Huancavelica',2108,401.25 UNION 
SELECT '080605','Laramarca','Huaytara','Huancavelica',823,205.05 UNION 
SELECT '080606','Ocoyo','Huaytara','Huancavelica',2488,154.71 UNION 
SELECT '080607','Pilpichaca','Huaytara','Huancavelica',3765,2162.92 UNION 
SELECT '080608','Querco','Huaytara','Huancavelica',1044,697.31 UNION 
SELECT '080609','Quito-Arma','Huaytara','Huancavelica',767,222.32 UNION 
SELECT '080610','San Antonio de Cusicancha','Huaytara','Huancavelica',1676,255.86 UNION 
SELECT '080611','San Francisco de Sangayaico','Huaytara','Huancavelica',557,70.7 UNION 
SELECT '080612','San Isidro','Huaytara','Huancavelica',1194,174.95 UNION 
SELECT '080613','Santiago de Chocorvos','Huaytara','Huancavelica',2842,1150.2 UNION 
SELECT '080614','Santiago de Quirahuara','Huaytara','Huancavelica',658,169.32 UNION 
SELECT '080615','Santo Domingo de Capillas','Huaytara','Huancavelica',982,248.56 UNION 
SELECT '080616','Tambo','Huaytara','Huancavelica',313,226.58 UNION 
SELECT '080701','Churcampa','Churcampa','Huancavelica',5961,135.48 UNION 
SELECT '080702','Anco','Churcampa','Huancavelica',6609,150.18 UNION 
SELECT '080703','Chinchihuasi','Churcampa','Huancavelica',3410,162.21 UNION 
SELECT '080704','El Carmen','Churcampa','Huancavelica',3050,77.07 UNION 
SELECT '080705','La Merced','Churcampa','Huancavelica',1639,73.32 UNION 
SELECT '080706','Locroja','Churcampa','Huancavelica',4179,92.48 UNION 
SELECT '080707','Paucarbamba','Churcampa','Huancavelica',7336,97.72 UNION 
SELECT '080708','San Miguel de Mayocc','Churcampa','Huancavelica',1239,38.43 UNION 
SELECT '080709','San Pedro de Coris','Churcampa','Huancavelica',4451,128.9 UNION 
SELECT '080710','Pachamarca','Churcampa','Huancavelica',2917,156.29 UNION 
SELECT '080711','Cosme','Churcampa','Huancavelica',4141,106.34 UNION 
SELECT '090101','Huanuco','Huanuco','Huanuco',88542,126.23 UNION 
SELECT '090102','Chinchao','Huanuco','Huanuco',14099,795.78 UNION 
SELECT '090103','Churubamba','Huanuco','Huanuco',28908,507.31 UNION 
SELECT '090104','Margos','Huanuco','Huanuco',10021,206.57 UNION 
SELECT '090105','Quisqui','Huanuco','Huanuco',8392,172.74 UNION 
SELECT '090106','San Francisco de Cayran','Huanuco','Huanuco',5575,146.24 UNION 
SELECT '090107','San Pedro de Chaulan','Huanuco','Huanuco',8121,266.36 UNION 
SELECT '090108','Santa Maria del Valle','Huanuco','Huanuco',20984,446.63 UNION 
SELECT '090109','Yarumayo','Huanuco','Huanuco',3139,60.94 UNION 
SELECT '090110','Amarilis','Huanuco','Huanuco',79545,131.68 UNION 
SELECT '090111','Pillco Marca','Huanuco','Huanuco',28110,76.61 UNION 
SELECT '090112','Yacus','Huanuco','Huanuco',7390,69.9 UNION 
SELECT '090201','Ambo','Ambo','Huanuco',17328,288.8 UNION 
SELECT '090202','Cayna','Ambo','Huanuco',3377,166.05 UNION 
SELECT '090203','Colpas','Ambo','Huanuco',2388,174.34 UNION 
SELECT '090204','Conchamarca','Ambo','Huanuco',6938,104.81 UNION 
SELECT '090205','Huacar','Ambo','Huanuco',7642,234.23 UNION 
SELECT '090206','San Francisco','Ambo','Huanuco',3233,121.21 UNION 
SELECT '090207','San Rafael','Ambo','Huanuco',12278,443.63 UNION 
SELECT '090208','Tomay Kichwa','Ambo','Huanuco',3857,42.11 UNION 
SELECT '090301','La Union','Dos de Mayo','Huanuco',6302,167.1 UNION 
SELECT '090307','Chuquis','Dos de Mayo','Huanuco',6030,151.25 UNION 
SELECT '090312','Marias','Dos de Mayo','Huanuco',9957,637.24 UNION 
SELECT '090314','Pachas','Dos de Mayo','Huanuco',13450,264.74 UNION 
SELECT '090316','Quivilla','Dos de Mayo','Huanuco',3296,33.6 UNION 
SELECT '090317','Ripan','Dos de Mayo','Huanuco',7150,75.04 UNION 
SELECT '090321','Shunqui','Dos de Mayo','Huanuco',2478,32.26 UNION 
SELECT '090322','Sillapata','Dos de Mayo','Huanuco',2430,70.53 UNION 
SELECT '090323','Yanas','Dos de Mayo','Huanuco',3339,36.31 UNION 
SELECT '090401','Llata','Huamalies','Huanuco',15299,411.35 UNION 
SELECT '090402','Arancay','Huamalies','Huanuco',1603,158.33 UNION 
SELECT '090403','Chavin de Pariarca','Huamalies','Huanuco',3721,89.25 UNION 
SELECT '090404','Jacas Grande','Huamalies','Huanuco',5998,236.99 UNION 
SELECT '090405','Jircan','Huamalies','Huanuco',3739,84.81 UNION 
SELECT '090406','Miraflores','Huamalies','Huanuco',3592,96.74 UNION 
SELECT '090407','Monzon','Huamalies','Huanuco',29863,1521.39 UNION 
SELECT '090408','Punchao','Huamalies','Huanuco',2599,42.24 UNION 
SELECT '090409','Puños','Huamalies','Huanuco',4316,101.75 UNION 
SELECT '090410','Singa','Huamalies','Huanuco',3342,151.7 UNION 
SELECT '090411','Tantamayo','Huamalies','Huanuco',3035,249.95 UNION 
SELECT '090501','Huacrachuco','Marañon','Huanuco',15942,704.63 UNION 
SELECT '090502','Cholon','Marañon','Huanuco',10428,2125.19 UNION 
SELECT '090505','San Buenaventura','Marañon','Huanuco',2744,86.54 UNION 
SELECT '090601','Rupa-Rupa','Leoncio Prado','Huanuco',51713,266.52 UNION 
SELECT '090602','Daniel Alomias Robles','Leoncio Prado','Huanuco',8011,702.46 UNION 
SELECT '090603','Hermilio Valdizan','Leoncio Prado','Huanuco',4065,112.2 UNION 
SELECT '090604','Luyando','Leoncio Prado','Huanuco',10078,100.32 UNION 
SELECT '090605','Mariano Damaso Beraun','Leoncio Prado','Huanuco',9433,766.27 UNION 
SELECT '090606','Jose Crespo y Castillo','Leoncio Prado','Huanuco',25403,2120.66 UNION 
SELECT '090701','Panao','Pachitea','Huanuco',25270,1580.86 UNION 
SELECT '090702','Chaglla','Pachitea','Huanuco',14914,1103.58 UNION 
SELECT '090704','Molino','Pachitea','Huanuco',15486,235.5 UNION 
SELECT '090706','Umari','Pachitea','Huanuco',22098,149.08 UNION 
SELECT '090801','Honoria','Puerto Inca','Huanuco',6330,798.05 UNION 
SELECT '090802','Puerto Inca','Puerto Inca','Huanuco',7538,2147.18 UNION 
SELECT '090803','Codo del Pozuzo','Puerto Inca','Huanuco',6630,3322.04 UNION 
SELECT '090804','Tournavista','Puerto Inca','Huanuco',4559,2228.46 UNION 
SELECT '090805','Yuyapichis','Puerto Inca','Huanuco',6616,1845.62 UNION 
SELECT '090901','Huacaybamba','Huacaybamba','Huanuco',7290,586.21 UNION 
SELECT '090902','Pinra','Huacaybamba','Huanuco',8974,283.71 UNION 
SELECT '090903','Canchabamba','Huacaybamba','Huanuco',3324,186.83 UNION 
SELECT '090904','Cochabamba','Huacaybamba','Huanuco',3650,684.87 UNION 
SELECT '091001','Jesus','Lauricocha','Huanuco',5712,449.9 UNION 
SELECT '091002','Baños','Lauricocha','Huanuco',7184,152.66 UNION 
SELECT '091003','San Francisco de Asis','Lauricocha','Huanuco',2126,84.3 UNION 
SELECT '091004','Queropalca','Lauricocha','Huanuco',3090,131.15 UNION 
SELECT '091005','San Miguel de Cauri','Lauricocha','Huanuco',10381,811.75 UNION 
SELECT '091006','Rondos','Lauricocha','Huanuco',7687,169.42 UNION 
SELECT '091007','Jivia','Lauricocha','Huanuco',2925,61.31 UNION 
SELECT '091101','Chavinillo','Yarowilca','Huanuco',5943,205.16 UNION 
SELECT '091102','Aparicio Pomares','Yarowilca','Huanuco',5488,183.14 UNION 
SELECT '091103','Cahuac','Yarowilca','Huanuco',4687,29.5 UNION 
SELECT '091104','Chacabamba','Yarowilca','Huanuco',3760,16.53 UNION 
SELECT '091105','Jacas Chico','Yarowilca','Huanuco',2038,36.16 UNION 
SELECT '091106','Obas','Yarowilca','Huanuco',5435,123.16 UNION 
SELECT '091107','Pampamarca','Yarowilca','Huanuco',2039,72.68 UNION 
SELECT '091108','Choras','Yarowilca','Huanuco',3665,61.14 UNION 
SELECT '100101','Ica','Ica','Ica',134249,887.51 UNION 
SELECT '100102','La Tinguiña','Ica','Ica',36909,98.34 UNION 
SELECT '100103','Los Aquijes','Ica','Ica',19987,90.92 UNION 
SELECT '100104','Parcona','Ica','Ica',56336,17.39 UNION 
SELECT '100105','Pueblo Nuevo','Ica','Ica',4843,33.12 UNION 
SELECT '100106','Salas','Ica','Ica',24557,651.72 UNION 
SELECT '100107','San Jose de los Molinos','Ica','Ica',6360,363.2 UNION 
SELECT '100108','San Juan Bautista','Ica','Ica',15214,26.39 UNION 
SELECT '100109','Santiago','Ica','Ica',30313,2783.73 UNION 
SELECT '100110','Subtanjalla','Ica','Ica',29063,193.97 UNION 
SELECT '100111','Yauca del Rosario','Ica','Ica',972,1289.1 UNION 
SELECT '100112','Tate','Ica','Ica',4719,7.07 UNION 
SELECT '100113','Pachacutec','Ica','Ica',6949,34.47 UNION 
SELECT '100114','Ocucaje','Ica','Ica',3816,1417.12 UNION 
SELECT '100201','Chincha Alta','Chincha','Ica',65322,238.34 UNION 
SELECT '100202','Chavin','Chincha','Ica',1470,426.17 UNION 
SELECT '100203','Chincha Baja','Chincha','Ica',12536,72.52 UNION 
SELECT '100204','El Carmen','Chincha','Ica',13734,789.9 UNION 
SELECT '100205','Grocio Prado','Chincha','Ica',24910,190.53 UNION 
SELECT '100206','San Pedro de Huacarpana','Chincha','Ica',1700,222.45 UNION 
SELECT '100207','Sunampe','Chincha','Ica',28435,16.76 UNION 
SELECT '100208','Tambo de Mora','Chincha','Ica',5110,22 UNION 
SELECT '100209','Alto Laran','Chincha','Ica',7663,298.83 UNION 
SELECT '100210','Pueblo Nuevo','Chincha','Ica',63297,209.45 UNION 
SELECT '100211','San Juan de Yanac','Chincha','Ica',269,500.4 UNION 
SELECT '100301','Nazca','Nazca','Ica',27249,1252.25 UNION 
SELECT '100302','Changuillo','Nazca','Ica',1457,946.94 UNION 
SELECT '100303','El Ingenio','Nazca','Ica',2697,552.39 UNION 
SELECT '100304','Marcona','Nazca','Ica',12510,1955.2 UNION 
SELECT '100305','Vista Alegre','Nazca','Ica',15935,527.3 UNION 
SELECT '100401','Pisco','Pisco','Ica',54716,24.56 UNION 
SELECT '100402','Huancano','Pisco','Ica',1577,905.14 UNION 
SELECT '100403','Humay','Pisco','Ica',6041,1112.96 UNION 
SELECT '100404','Independencia','Pisco','Ica',14928,272.34 UNION 
SELECT '100405','Paracas','Pisco','Ica',7390,1420 UNION 
SELECT '100406','San Andres','Pisco','Ica',13733,39.45 UNION 
SELECT '100407','San Clemente','Pisco','Ica',22548,127.22 UNION 
SELECT '100408','Tupac Amaru Inca','Pisco','Ica',18366,55.48 UNION 
SELECT '100501','Palpa','Palpa','Ica',7279,147.44 UNION 
SELECT '100502','Llipata','Palpa','Ica',1516,186.18 UNION 
SELECT '100503','Rio Grande','Palpa','Ica',2236,315.52 UNION 
SELECT '100504','Santa Cruz','Palpa','Ica',987,255.7 UNION 
SELECT '100505','Tibillo','Palpa','Ica',316,328.04 UNION 
SELECT '110101','Huancayo','Huancayo','Junin',119025,237.55 UNION 
SELECT '110103','Carhuacallanga','Huancayo','Junin',1398,13.78 UNION 
SELECT '110104','Colca','Huancayo','Junin',2068,113.25 UNION 
SELECT '110105','Cullhuas','Huancayo','Junin',2204,108.01 UNION 
SELECT '110106','Chacapampa','Huancayo','Junin',810,120.72 UNION 
SELECT '110107','Chicche','Huancayo','Junin',901,45.92 UNION 
SELECT '110108','Chilca','Huancayo','Junin',87993,8.3 UNION 
SELECT '110109','Chongos Alto','Huancayo','Junin',1339,701.75 UNION 
SELECT '110112','Chupuro','Huancayo','Junin',1752,13.56 UNION 
SELECT '110113','El Tambo','Huancayo','Junin',166163,73.56 UNION 
SELECT '110114','Huacrapuquio','Huancayo','Junin',1274,24.1 UNION 
SELECT '110116','Hualhuas','Huancayo','Junin',4630,24.82 UNION 
SELECT '110118','Huancan','Huancayo','Junin',21744,12 UNION 
SELECT '110119','Huasicancha','Huancayo','Junin',842,47.61 UNION 
SELECT '110120','Huayucachi','Huancayo','Junin',8665,13.13 UNION 
SELECT '110121','Ingenio','Huancayo','Junin',2507,53.29 UNION 
SELECT '110122','Pariahuanca','Huancayo','Junin',5767,617.5 UNION 
SELECT '110123','Pilcomayo','Huancayo','Junin',17062,20.18 UNION 
SELECT '110124','Pucara','Huancayo','Junin',5008,110.49 UNION 
SELECT '110125','Quichuay','Huancayo','Junin',1745,34.79 UNION 
SELECT '110126','Quilcas','Huancayo','Junin',4268,167.98 UNION 
SELECT '110127','San Agustin','Huancayo','Junin',11955,23.09 UNION 
SELECT '110128','San Jeronimo de Tunan','Huancayo','Junin',10420,20.99 UNION 
SELECT '110131','Santo Domingo de Acobamba','Huancayo','Junin',7776,778.02 UNION 
SELECT '110132','Saño','Huancayo','Junin',4082,11.59 UNION 
SELECT '110133','Sapallanga','Huancayo','Junin',12879,119.02 UNION 
SELECT '110134','Sicaya','Huancayo','Junin',8166,42.73 UNION 
SELECT '110136','Viques','Huancayo','Junin',2247,3.57 UNION 
SELECT '110201','Concepcion','Concepcion','Junin',15010,18.29 UNION 
SELECT '110202','Aco','Concepcion','Junin',1592,37.8 UNION 
SELECT '110203','Andamarca','Concepcion','Junin',4536,694.9 UNION 
SELECT '110204','Comas','Concepcion','Junin',6073,825.29 UNION 
SELECT '110205','Cochas','Concepcion','Junin',1757,165.05 UNION 
SELECT '110206','Chambara','Concepcion','Junin',2882,113.21 UNION 
SELECT '110207','Heroinas Toledo','Concepcion','Junin',1193,25.83 UNION 
SELECT '110208','Manzanares','Concepcion','Junin',1391,20.58 UNION 
SELECT '110209','Mariscal Castilla','Concepcion','Junin',1652,743.84 UNION 
SELECT '110210','Matahuasi','Concepcion','Junin',5171,24.74 UNION 
SELECT '110211','Mito','Concepcion','Junin',1369,25.21 UNION 
SELECT '110212','Nueve de Julio','Concepcion','Junin',1485,7.28 UNION 
SELECT '110213','Orcotuna','Concepcion','Junin',4168,44.61 UNION 
SELECT '110214','Santa Rosa de Ocopa','Concepcion','Junin',2030,13.91 UNION 
SELECT '110215','San Jose de Quero','Concepcion','Junin',6106,314.8 UNION 
SELECT '110301','Jauja','Jauja','Junin',14536,10.1 UNION 
SELECT '110302','Acolla','Jauja','Junin',7215,122.4 UNION 
SELECT '110303','Apata','Jauja','Junin',4084,421.62 UNION 
SELECT '110304','Ataura','Jauja','Junin',1155,5.9 UNION 
SELECT '110305','Canchayllo','Jauja','Junin',1658,974.69 UNION 
SELECT '110306','El Mantaro','Jauja','Junin',2562,17.76 UNION 
SELECT '110307','Huamali','Jauja','Junin',1809,20.19 UNION 
SELECT '110308','Huaripampa','Jauja','Junin',836,14.19 UNION 
SELECT '110309','Huertas','Jauja','Junin',1644,11.82 UNION 
SELECT '110310','Janjaillo','Jauja','Junin',681,31.57 UNION 
SELECT '110311','Julcan','Jauja','Junin',671,24.78 UNION 
SELECT '110312','Leonor Ordoñez','Jauja','Junin',1480,20.34 UNION 
SELECT '110313','Llocllapampa','Jauja','Junin',1001,110.6 UNION 
SELECT '110314','Marco','Jauja','Junin',1590,28.8 UNION 
SELECT '110315','Masma','Jauja','Junin',2065,14.26 UNION 
SELECT '110316','Molinos','Jauja','Junin',1522,312.17 UNION 
SELECT '110317','Monobamba','Jauja','Junin',1055,295.83 UNION 
SELECT '110318','Muqui','Jauja','Junin',960,11.74 UNION 
SELECT '110319','Muquiyauyo','Jauja','Junin',2210,19.86 UNION 
SELECT '110320','Paca','Jauja','Junin',988,34.22 UNION 
SELECT '110321','Paccha','Jauja','Junin',1805,90.86 UNION 
SELECT '110322','Pancan','Jauja','Junin',1280,10.89 UNION 
SELECT '110323','Parco','Jauja','Junin',1152,32.82 UNION 
SELECT '110324','Pomacancha','Jauja','Junin',1975,281.61 UNION 
SELECT '110325','Ricran','Jauja','Junin',1567,319.95 UNION 
SELECT '110326','San Lorenzo','Jauja','Junin',2509,22.15 UNION 
SELECT '110327','San Pedro de Chunan','Jauja','Junin',839,8.44 UNION 
SELECT '110328','Sincos','Jauja','Junin',4912,236.74 UNION 
SELECT '110329','Tunan Marca','Jauja','Junin',1165,30.07 UNION 
SELECT '110330','Yauli','Jauja','Junin',1304,93.15 UNION 
SELECT '110331','Curicaca','Jauja','Junin',1645,64.68 UNION 
SELECT '110332','Masma Chicche','Jauja','Junin',757,29.86 UNION 
SELECT '110333','Sausa','Jauja','Junin',3081,4.5 UNION 
SELECT '110334','Yauyos','Jauja','Junin',9360,20.54 UNION 
SELECT '110401','Junin','Junin','Junin',9492,883.8 UNION 
SELECT '110402','Carhuamayo','Junin','Junin',7768,219.68 UNION 
SELECT '110403','Ondores','Junin','Junin',1828,254.46 UNION 
SELECT '110404','Ulcumayo','Junin','Junin',5783,1129.37 UNION 
SELECT '110501','Tarma','Tarma','Junin',46130,459.95 UNION 
SELECT '110502','Acobamba','Tarma','Junin',13586,97.84 UNION 
SELECT '110503','Huaricolca','Tarma','Junin',3251,162.31 UNION 
SELECT '110504','Huasahuasi','Tarma','Junin',15398,652.15 UNION 
SELECT '110505','La Union','Tarma','Junin',3124,140.4 UNION 
SELECT '110506','Palca','Tarma','Junin',5585,378.08 UNION 
SELECT '110507','Palcamayo','Tarma','Junin',9573,169.24 UNION 
SELECT '110508','San Pedro de Cajas','Tarma','Junin',5669,537.31 UNION 
SELECT '110509','Tapo','Tarma','Junin',6073,151.88 UNION 
SELECT '110601','La Oroya','Yauli','Junin',12577,388.42 UNION 
SELECT '110602','Chacapalpa','Yauli','Junin',704,183.06 UNION 
SELECT '110603','Huay-Huay','Yauli','Junin',1474,179.94 UNION 
SELECT '110604','Marcapomacocha','Yauli','Junin',1297,888.56 UNION 
SELECT '110605','Morococha','Yauli','Junin',4262,265.67 UNION 
SELECT '110606','Paccha','Yauli','Junin',1649,323.69 UNION 
SELECT '110607','Santa Barbara de Carhuacayan','Yauli','Junin',2374,646.29 UNION 
SELECT '110608','Suitucancha','Yauli','Junin',1014,216.47 UNION 
SELECT '110609','Yauli','Yauli','Junin',5113,424.16 UNION 
SELECT '110610','Santa Rosa de Sacco','Yauli','Junin',10413,101.09 UNION 
SELECT '110701','Satipo','Satipo','Junin',43554,732.02 UNION 
SELECT '110702','Coviriali','Satipo','Junin',6332,145.13 UNION 
SELECT '110703','Llaylla','Satipo','Junin',6417,180.39 UNION 
SELECT '110704','Mazamari','Satipo','Junin',65014,2219.63 UNION 
SELECT '110705','Pampa Hermosa','Satipo','Junin',10899,566.82 UNION 
SELECT '110706','Pangoa','Satipo','Junin',60587,3679.4 UNION 
SELECT '110707','Rio Negro','Satipo','Junin',29250,714.98 UNION 
SELECT '110708','Rio Tambo','Satipo','Junin',61259,10349.9 UNION 
SELECT '110801','Chanchamayo','Chanchamayo','Junin',24866,919.72 UNION 
SELECT '110802','San Ramon','Chanchamayo','Junin',27630,591.67 UNION 
SELECT '110803','Vitoc','Chanchamayo','Junin',1734,313.85 UNION 
SELECT '110804','San Luis de Shuaro','Chanchamayo','Junin',7395,212.49 UNION 
SELECT '110805','Pichanaqui','Chanchamayo','Junin',71598,1496.59 UNION 
SELECT '110806','Perene','Chanchamayo','Junin',77635,1191.16 UNION 
SELECT '110901','Chupaca','Chupaca','Junin',22407,21.7 UNION 
SELECT '110902','Ahuac','Chupaca','Junin',5932,70.44 UNION 
SELECT '110903','Chongos Bajo','Chupaca','Junin',4006,100.95 UNION 
SELECT '110904','Huachac','Chupaca','Junin',4027,22.01 UNION 
SELECT '110905','Huamancaca Chico','Chupaca','Junin',6126,9.4 UNION 
SELECT '110906','San Juan de Yscos','Chupaca','Junin',2123,24.7 UNION 
SELECT '110907','San Juan de Jarpa','Chupaca','Junin',3597,137.02 UNION 
SELECT '110908','Tres de Diciembre','Chupaca','Junin',2111,14.66 UNION 
SELECT '110909','Yanacancha','Chupaca','Junin',3547,743.4 UNION 
SELECT '120101','Trujillo','Trujillo','La Libertad',329127,39.36 UNION 
SELECT '120102','Huanchaco','Trujillo','La Libertad',72237,332.14 UNION 
SELECT '120103','Laredo','Trujillo','La Libertad',36353,335.44 UNION 
SELECT '120104','Moche','Trujillo','La Libertad',35945,25.25 UNION 
SELECT '120105','Salaverry','Trujillo','La Libertad',19095,295.88 UNION 
SELECT '120106','Simbal','Trujillo','La Libertad',4433,390.55 UNION 
SELECT '120107','Victor Larco Herrera','Trujillo','La Libertad',66607,18.02 UNION 
SELECT '120109','Poroto','Trujillo','La Libertad',3127,276.01 UNION 
SELECT '120110','El Porvenir','Trujillo','La Libertad',196333,36.7 UNION 
SELECT '120111','La Esperanza','Trujillo','La Libertad',190881,15.55 UNION 
SELECT '120112','Florencia de Mora','Trujillo','La Libertad',42978,1.99 UNION 
SELECT '120201','Bolivar','Bolivar','La Libertad',4921,740.58 UNION 
SELECT '120202','Bambamarca','Bolivar','La Libertad',3992,165.2 UNION 
SELECT '120203','Condormarca','Bolivar','La Libertad',2047,331.26 UNION 
SELECT '120204','Longotea','Bolivar','La Libertad',2242,192.88 UNION 
SELECT '120205','Ucuncha','Bolivar','La Libertad',787,98.41 UNION 
SELECT '120206','Uchumarca','Bolivar','La Libertad',2762,190.53 UNION 
SELECT '120301','Huamachuco','Sanchez Carrion','La Libertad',65142,424.13 UNION 
SELECT '120302','Cochorco','Sanchez Carrion','La Libertad',9588,258.04 UNION 
SELECT '120303','Curgos','Sanchez Carrion','La Libertad',8712,99.5 UNION 
SELECT '120304','Chugay','Sanchez Carrion','La Libertad',19316,416.31 UNION 
SELECT '120305','Marcabal','Sanchez Carrion','La Libertad',17296,229.57 UNION 
SELECT '120306','Sanagoran','Sanchez Carrion','La Libertad',15424,324.38 UNION 
SELECT '120307','Sarin','Sanchez Carrion','La Libertad',10241,340.08 UNION 
SELECT '120308','Sartimbamba','Sanchez Carrion','La Libertad',14090,394.37 UNION 
SELECT '120401','Otuzco','Otuzco','La Libertad',28048,444.13 UNION 
SELECT '120402','Agallpampa','Otuzco','La Libertad',9997,258.56 UNION 
SELECT '120403','Charat','Otuzco','La Libertad',2814,68.89 UNION 
SELECT '120404','Huaranchal','Otuzco','La Libertad',5138,149.65 UNION 
SELECT '120405','La Cuesta','Otuzco','La Libertad',690,39.25 UNION 
SELECT '120408','Paranday','Otuzco','La Libertad',746,21.46 UNION 
SELECT '120409','Salpo','Otuzco','La Libertad',6142,192.74 UNION 
SELECT '120410','Sinsicap','Otuzco','La Libertad',8808,452.95 UNION 
SELECT '120411','Usquil','Otuzco','La Libertad',27986,445.82 UNION 
SELECT '120413','Mache','Otuzco','La Libertad',3129,37.32 UNION 
SELECT '120501','San Pedro de Lloc','Pacasmayo','La Libertad',17017,697.01 UNION 
SELECT '120503','Guadalupe','Pacasmayo','La Libertad',45031,165.37 UNION 
SELECT '120504','Jequetepeque','Pacasmayo','La Libertad',3997,50.98 UNION 
SELECT '120506','Pacasmayo','Pacasmayo','La Libertad',28458,30.84 UNION 
SELECT '120508','San Jose','Pacasmayo','La Libertad',12790,181.06 UNION 
SELECT '120601','Tayabamba','Pataz','La Libertad',15100,339.13 UNION 
SELECT '120602','Buldibuyo','Pataz','La Libertad',3823,227.39 UNION 
SELECT '120603','Chillia','Pataz','La Libertad',14060,300.04 UNION 
SELECT '120604','Huaylillas','Pataz','La Libertad',3691,89.73 UNION 
SELECT '120605','Huancaspata','Pataz','La Libertad',6532,247.48 UNION 
SELECT '120606','Huayo','Pataz','La Libertad',4527,124.63 UNION 
SELECT '120607','Ongon','Pataz','La Libertad',1817,1394.89 UNION 
SELECT '120608','Parcoy','Pataz','La Libertad',22442,304.99 UNION 
SELECT '120609','Pataz','Pataz','La Libertad',9408,467.44 UNION 
SELECT '120610','Pias','Pataz','La Libertad',1293,371.67 UNION 
SELECT '120611','Taurija','Pataz','La Libertad',3067,130.09 UNION 
SELECT '120612','Urpay','Pataz','La Libertad',2809,99.61 UNION 
SELECT '120613','Santiago de Challas','Pataz','La Libertad',2520,129.44 UNION 
SELECT '120701','Santiago de Chuco','Santiago de Chuco','La Libertad',20781,1073.63 UNION 
SELECT '120702','Cachicadan','Santiago de Chuco','La Libertad',8320,266.5 UNION 
SELECT '120703','Mollebamba','Santiago de Chuco','La Libertad',2411,69.69 UNION 
SELECT '120704','Mollepata','Santiago de Chuco','La Libertad',2682,71.2 UNION 
SELECT '120705','Quiruvilca','Santiago de Chuco','La Libertad',14549,549.14 UNION 
SELECT '120706','Santa Cruz de Chuca','Santiago de Chuco','La Libertad',3222,165.12 UNION 
SELECT '120707','Sitabamba','Santiago de Chuco','La Libertad',3367,310.23 UNION 
SELECT '120708','Angasmarca','Santiago de Chuco','La Libertad',7592,153.45 UNION 
SELECT '120801','Ascope','Ascope','La Libertad',6676,290.18 UNION 
SELECT '120802','Chicama','Ascope','La Libertad',15796,870.58 UNION 
SELECT '120803','Chocope','Ascope','La Libertad',9342,95.73 UNION 
SELECT '120804','Santiago de Cao','Ascope','La Libertad',19896,154.55 UNION 
SELECT '120805','Magdalena de Cao','Ascope','La Libertad',3347,163.01 UNION 
SELECT '120806','Paijan','Ascope','La Libertad',26433,79.69 UNION 
SELECT '120807','Razuri','Ascope','La Libertad',9358,317.3 UNION 
SELECT '120808','Casa Grande','Ascope','La Libertad',31875,687.6 UNION 
SELECT '120901','Chepen','Chepen','La Libertad',49927,287.34 UNION 
SELECT '120902','Pacanga','Chepen','La Libertad',24913,583.93 UNION 
SELECT '120903','Pueblo Nuevo','Chepen','La Libertad',15458,271.16 UNION 
SELECT '121001','Julcan','Julcan','La Libertad',11630,208.49 UNION 
SELECT '121002','Carabamba','Julcan','La Libertad',6418,254.28 UNION 
SELECT '121003','Calamarca','Julcan','La Libertad',5604,207.57 UNION 
SELECT '121004','Huaso','Julcan','La Libertad',7304,431.05 UNION 
SELECT '121101','Cascas','Gran Chimu','La Libertad',14386,465.67 UNION 
SELECT '121102','Lucma','Gran Chimu','La Libertad',7210,280.38 UNION 
SELECT '121103','Marmot','Gran Chimu','La Libertad',2054,300.25 UNION 
SELECT '121104','Sayapullo','Gran Chimu','La Libertad',7994,238.47 UNION 
SELECT '121201','Viru','Viru','La Libertad',71152,1072.95 UNION 
SELECT '121202','Chao','Viru','La Libertad',42779,1736.87 UNION 
SELECT '121203','Guadalupito','Viru','La Libertad',10166,404.72 UNION 
SELECT '130101','Chiclayo','Chiclayo','Lambayeque',298467,50.35 UNION 
SELECT '130102','Chongoyape','Chiclayo','Lambayeque',18101,712 UNION 
SELECT '130103','Eten','Chiclayo','Lambayeque',10599,84.78 UNION 
SELECT '130104','Eten Puerto','Chiclayo','Lambayeque',2160,14.48 UNION 
SELECT '130105','Lagunas','Chiclayo','Lambayeque',10436,429.27 UNION 
SELECT '130106','Monsefu','Chiclayo','Lambayeque',32314,44.94 UNION 
SELECT '130107','Nueva Arica','Chiclayo','Lambayeque',2331,208.63 UNION 
SELECT '130108','Oyotun','Chiclayo','Lambayeque',9879,455.4 UNION 
SELECT '130109','Picsi','Chiclayo','Lambayeque',9965,56.92 UNION 
SELECT '130110','Pimentel','Chiclayo','Lambayeque',46075,66.53 UNION 
SELECT '130111','Reque','Chiclayo','Lambayeque',15386,47.03 UNION 
SELECT '130112','Jose Leonardo Ortiz','Chiclayo','Lambayeque',199144,28.22 UNION 
SELECT '130113','Santa Rosa','Chiclayo','Lambayeque',13030,14.09 UNION 
SELECT '130114','Saña','Chiclayo','Lambayeque',12397,313.9 UNION 
SELECT '130115','La Victoria','Chiclayo','Lambayeque',93069,29.36 UNION 
SELECT '130116','Cayalti','Chiclayo','Lambayeque',15915,162.86 UNION 
SELECT '130117','Patapo','Chiclayo','Lambayeque',22843,182.81 UNION 
SELECT '130118','Pomalca','Chiclayo','Lambayeque',25831,80.35 UNION 
SELECT '130119','Pucala','Chiclayo','Lambayeque',8958,175.81 UNION 
SELECT '130120','Tuman','Chiclayo','Lambayeque',30713,130.34 UNION 
SELECT '130201','Ferreñafe','Ferreñafe','Lambayeque',35919,62.18 UNION 
SELECT '130202','Incahuasi','Ferreñafe','Lambayeque',15733,443.91 UNION 
SELECT '130203','Cañaris','Ferreñafe','Lambayeque',14787,284.88 UNION 
SELECT '130204','Pitipo','Ferreñafe','Lambayeque',24214,558.18 UNION 
SELECT '130205','Pueblo Nuevo','Ferreñafe','Lambayeque',13619,28.88 UNION 
SELECT '130206','Manuel Antonio Mesones Muro','Ferreñafe','Lambayeque',4254,200.57 UNION 
SELECT '130301','Lambayeque','Lambayeque','Lambayeque',79914,330.73 UNION 
SELECT '130302','Chochope','Lambayeque','Lambayeque',1122,79.27 UNION 
SELECT '130303','Illimo','Lambayeque','Lambayeque',9415,24.37 UNION 
SELECT '130304','Jayanca','Lambayeque','Lambayeque',18039,680.96 UNION 
SELECT '130305','Mochumi','Lambayeque','Lambayeque',19467,103.7 UNION 
SELECT '130306','Morrope','Lambayeque','Lambayeque',47455,1041.66 UNION 
SELECT '130307','Motupe','Lambayeque','Lambayeque',26985,557.37 UNION 
SELECT '130308','Olmos','Lambayeque','Lambayeque',41587,5583.47 UNION 
SELECT '130309','Pacora','Lambayeque','Lambayeque',7299,87.79 UNION 
SELECT '130310','Salas','Lambayeque','Lambayeque',13056,991.8 UNION 
SELECT '130311','San Jose','Lambayeque','Lambayeque',16851,46.73 UNION 
SELECT '130312','Tucume','Lambayeque','Lambayeque',23288,67 UNION 
SELECT '140101','Lima','Lima','Lima',269858,21.98 UNION 
SELECT '140102','Ancon','Lima','Lima',42124,285.45 UNION 
SELECT '140103','Ate','Lima','Lima',672160,77.72 UNION 
SELECT '140104','Breña','Lima','Lima',75882,3.22 UNION 
SELECT '140105','Carabayllo','Lima','Lima',322936,303.31 UNION 
SELECT '140106','Comas','Lima','Lima',545685,48.75 UNION 
SELECT '140107','Chaclacayo','Lima','Lima',44890,39.5 UNION 
SELECT '140108','Chorrillos','Lima','Lima',341322,38.94 UNION 
SELECT '140109','La Victoria','Lima','Lima',169270,8.74 UNION 
SELECT '140110','La Molina','Lima','Lima',182603,65.75 UNION 
SELECT '140111','Lince','Lima','Lima',49833,3.03 UNION 
SELECT '140112','Lurigancho','Lima','Lima',232902,236.47 UNION 
SELECT '140113','Lurin','Lima','Lima',90818,180.26 UNION 
SELECT '140114','Magdalena del Mar','Lima','Lima',55786,3.61 UNION 
SELECT '140115','Miraflores','Lima','Lima',82898,9.62 UNION 
SELECT '140116','Pachacamac','Lima','Lima',139067,160.23 UNION 
SELECT '140117','Pueblo Libre','Lima','Lima',77322,4.38 UNION 
SELECT '140118','Pucusana','Lima','Lima',18284,37.39 UNION 
SELECT '140119','Puente Piedra','Lima','Lima',378910,72.81 UNION 
SELECT '140120','Punta Hermosa','Lima','Lima',8104,119.5 UNION 
SELECT '140121','Punta Negra','Lima','Lima',8500,130.5 UNION 
SELECT '140122','Rimac','Lima','Lima',165451,11.87 UNION 
SELECT '140123','San Bartolo','Lima','Lima',8200,45.01 UNION 
SELECT '140124','San Isidro','Lima','Lima',54298,11.1 UNION 
SELECT '140125','Barranco','Lima','Lima',29424,3.33 UNION 
SELECT '140126','San Martin de Porres','Lima','Lima',741417,36.82 UNION 
SELECT '140127','San Miguel','Lima','Lima',139399,10.72 UNION 
SELECT '140128','Santa Maria del Mar','Lima','Lima',1721,9.81 UNION 
SELECT '140129','Santa Rosa','Lima','Lima',20112,21.35 UNION 
SELECT '140130','Santiago de Surco','Lima','Lima',363183,35.89 UNION 
SELECT '140131','Surquillo','Lima','Lima',92908,3.46 UNION 
SELECT '140132','Villa Maria del Triunfo','Lima','Lima',473036,70.57 UNION 
SELECT '140133','Jesus Maria','Lima','Lima',72804,4.57 UNION 
SELECT '140134','Independencia','Lima','Lima',223827,14.56 UNION 
SELECT '140135','El Agustino','Lima','Lima',198366,12.54 UNION 
SELECT '140136','San Juan de Miraflores','Lima','Lima',422389,22.97 UNION 
SELECT '140137','San Juan de Lurigancho','Lima','Lima',1156300,131.25 UNION 
SELECT '140138','San Luis','Lima','Lima',59377,3.49 UNION 
SELECT '140139','Cieneguilla','Lima','Lima',50486,240.33 UNION 
SELECT '140140','San Borja','Lima','Lima',114479,9.96 UNION 
SELECT '140141','Villa El Salvador','Lima','Lima',489583,35.46 UNION 
SELECT '140142','Los Olivos','Lima','Lima',390742,18.25 UNION 
SELECT '140143','Santa Anita','Lima','Lima',242026,10.69 UNION 
SELECT '140201','Cajatambo','Cajatambo','Lima',2260,567.96 UNION 
SELECT '140205','Copa','Cajatambo','Lima',803,212.16 UNION 
SELECT '140206','Gorgor','Cajatambo','Lima',2774,309.95 UNION 
SELECT '140207','Huancapon','Cajatambo','Lima',982,146.1 UNION 
SELECT '140208','Manas','Cajatambo','Lima',982,279.04 UNION 
SELECT '140301','Canta','Canta','Lima',2900,123.09 UNION 
SELECT '140302','Arahuay','Canta','Lima',796,134.29 UNION 
SELECT '140303','Huamantanga','Canta','Lima',1349,488.09 UNION 
SELECT '140304','Huaros','Canta','Lima',785,333.45 UNION 
SELECT '140305','Lachaqui','Canta','Lima',904,137.87 UNION 
SELECT '140306','San Buenaventura','Canta','Lima',567,106.26 UNION 
SELECT '140307','Santa Rosa de Quives','Canta','Lima',8388,408.11 UNION 
SELECT '140401','San Vicente de Cañete','Cañete','Lima',58091,513.15 UNION 
SELECT '140402','Calango','Cañete','Lima',2434,530.89 UNION 
SELECT '140403','Cerro Azul','Cañete','Lima',8489,105.08 UNION 
SELECT '140404','Coayllo','Cañete','Lima',1097,590.99 UNION 
SELECT '140405','Chilca','Cañete','Lima',16350,475.47 UNION 
SELECT '140406','Imperial','Cañete','Lima',41037,53.16 UNION 
SELECT '140407','Lunahuana','Cañete','Lima',4921,500.33 UNION 
SELECT '140408','Mala','Cañete','Lima',35929,129.31 UNION 
SELECT '140409','Nuevo Imperial','Cañete','Lima',24623,329.3 UNION 
SELECT '140410','Pacaran','Cañete','Lima',1842,258.72 UNION 
SELECT '140411','Quilmana','Cañete','Lima',15823,437.4 UNION 
SELECT '140412','San Antonio','Cañete','Lima',4371,37.15 UNION 
SELECT '140413','San Luis','Cañete','Lima',13420,38.53 UNION 
SELECT '140414','Santa Cruz de Flores','Cañete','Lima',2898,100.06 UNION 
SELECT '140415','Zuñiga','Cañete','Lima',1912,198.01 UNION 
SELECT '140416','Asia','Cañete','Lima',9902,277.36 UNION 
SELECT '140501','Huacho','Huaura','Lima',60196,717.02 UNION 
SELECT '140502','Ambar','Huaura','Lima',2761,929.68 UNION 
SELECT '140504','Caleta de Carquin','Huaura','Lima',7055,2.04 UNION 
SELECT '140505','Checras','Huaura','Lima',1864,166.37 UNION 
SELECT '140506','Hualmay','Huaura','Lima',29448,5.81 UNION 
SELECT '140507','Huaura','Huaura','Lima',36793,484.43 UNION 
SELECT '140508','Leoncio Prado','Huaura','Lima',2004,300.13 UNION 
SELECT '140509','Paccho','Huaura','Lima',2225,229.25 UNION 
SELECT '140511','Santa Leonor','Huaura','Lima',1462,375.49 UNION 
SELECT '140512','Santa Maria','Huaura','Lima',35132,127.51 UNION 
SELECT '140513','Sayan','Huaura','Lima',24941,1310.77 UNION 
SELECT '140516','Vegueta','Huaura','Lima',23091,253.7 UNION 
SELECT '140601','Matucana','Huarochiri','Lima',3584,179.44 UNION 
SELECT '140602','Antioquia','Huarochiri','Lima',1246,387.98 UNION 
SELECT '140603','Callahuanca','Huarochiri','Lima',4357,57.47 UNION 
SELECT '140604','Carampoma','Huarochiri','Lima',1907,234.21 UNION 
SELECT '140605','San Pedro de Casta','Huarochiri','Lima',1325,79.91 UNION 
SELECT '140606','Cuenca','Huarochiri','Lima',397,60.02 UNION 
SELECT '140607','Chicla','Huarochiri','Lima',7881,244.1 UNION 
SELECT '140608','Huanza','Huarochiri','Lima',2851,227.01 UNION 
SELECT '140609','Huarochiri','Huarochiri','Lima',1251,249.09 UNION 
SELECT '140610','Lahuaytambo','Huarochiri','Lima',651,81.88 UNION 
SELECT '140611','Langa','Huarochiri','Lima',822,80.99 UNION 
SELECT '140612','Mariatana','Huarochiri','Lima',1325,168.63 UNION 
SELECT '140613','Ricardo Palma','Huarochiri','Lima',6358,34.59 UNION 
SELECT '140614','San Andres de Tupicocha','Huarochiri','Lima',1272,83.35 UNION 
SELECT '140615','San Antonio','Huarochiri','Lima',5785,563.59 UNION 
SELECT '140616','San Bartolome','Huarochiri','Lima',2409,43.91 UNION 
SELECT '140617','San Damian','Huarochiri','Lima',1137,343.22 UNION 
SELECT '140618','Sangallaya','Huarochiri','Lima',569,81.92 UNION 
SELECT '140619','San Juan de Tantaranche','Huarochiri','Lima',477,137.16 UNION 
SELECT '140620','San Lorenzo de Quinti','Huarochiri','Lima',1547,467.58 UNION 
SELECT '140621','San Mateo','Huarochiri','Lima',5120,425.6 UNION 
SELECT '140622','San Mateo de Otao','Huarochiri','Lima',1599,123.91 UNION 
SELECT '140623','San Pedro de Huancayre','Huarochiri','Lima',248,41.75 UNION 
SELECT '140624','Santa Cruz de Cocachacra','Huarochiri','Lima',2541,41.5 UNION 
SELECT '140625','Santa Eulalia','Huarochiri','Lima',12476,111.12 UNION 
SELECT '140626','Santiago de Anchucaya','Huarochiri','Lima',526,94.01 UNION 
SELECT '140627','Santiago de Tuna','Huarochiri','Lima',762,54.25 UNION 
SELECT '140628','Santo Domingo de los Olleros','Huarochiri','Lima',5026,552.32 UNION 
SELECT '140629','Surco','Huarochiri','Lima',1973,102.58 UNION 
SELECT '140630','Huachupampa','Huarochiri','Lima',3003,76.02 UNION 
SELECT '140631','Laraos','Huarochiri','Lima',2452,104.51 UNION 
SELECT '140632','San Juan de Iris','Huarochiri','Lima',1891,124.31 UNION 
SELECT '140701','Yauyos','Yauyos','Lima',2905,327.17 UNION 
SELECT '140702','Alis','Yauyos','Lima',1233,142.06 UNION 
SELECT '140703','Ayauca','Yauyos','Lima',2293,438.79 UNION 
SELECT '140704','Ayaviri','Yauyos','Lima',675,238.83 UNION 
SELECT '140705','Azangaro','Yauyos','Lima',519,79.84 UNION 
SELECT '140706','Cacra','Yauyos','Lima',383,213.79 UNION 
SELECT '140707','Carania','Yauyos','Lima',378,122.13 UNION 
SELECT '140708','Cochas','Yauyos','Lima',449,27.73 UNION 
SELECT '140709','Colonia','Yauyos','Lima',1288,323.96 UNION 
SELECT '140710','Chocos','Yauyos','Lima',1236,213.37 UNION 
SELECT '140711','Huampara','Yauyos','Lima',175,54.03 UNION 
SELECT '140712','Huancaya','Yauyos','Lima',1424,283.6 UNION 
SELECT '140713','Huangascar','Yauyos','Lima',549,50.46 UNION 
SELECT '140714','Huantan','Yauyos','Lima',943,516.35 UNION 
SELECT '140715','Huañec','Yauyos','Lima',485,37.54 UNION 
SELECT '140716','Laraos','Yauyos','Lima',725,402.85 UNION 
SELECT '140717','Lincha','Yauyos','Lima',966,221.22 UNION 
SELECT '140718','Miraflores','Yauyos','Lima',447,226.24 UNION 
SELECT '140719','Omas','Yauyos','Lima',562,295.35 UNION 
SELECT '140720','Quinches','Yauyos','Lima',961,113.33 UNION 
SELECT '140721','Quinocay','Yauyos','Lima',530,153.13 UNION 
SELECT '140722','San Joaquin','Yauyos','Lima',452,41.24 UNION 
SELECT '140723','San Pedro de Pilas','Yauyos','Lima',364,97.39 UNION 
SELECT '140724','Tanta','Yauyos','Lima',504,347.15 UNION 
SELECT '140725','Tauripampa','Yauyos','Lima',405,530.86 UNION 
SELECT '140726','Tupe','Yauyos','Lima',648,321.15 UNION 
SELECT '140727','Tomas','Yauyos','Lima',1151,297.93 UNION 
SELECT '140728','Viñac','Yauyos','Lima',1906,165.23 UNION 
SELECT '140729','Vitis','Yauyos','Lima',665,101.79 UNION 
SELECT '140730','Hongos','Yauyos','Lima',388,103.8 UNION 
SELECT '140731','Madean','Yauyos','Lima',804,220.72 UNION 
SELECT '140732','Putinza','Yauyos','Lima',489,66.44 UNION 
SELECT '140733','Catahuasi','Yauyos','Lima',943,123.86 UNION 
SELECT '140801','Huaral','Huaral','Lima',104610,640.76 UNION 
SELECT '140802','Atavillos Alto','Huaral','Lima',626,347.69 UNION 
SELECT '140803','Atavillos Bajo','Huaral','Lima',1135,164.89 UNION 
SELECT '140804','Aucallama','Huaral','Lima',20446,729.41 UNION 
SELECT '140805','Chancay','Huaral','Lima',65014,150.11 UNION 
SELECT '140806','Ihuari','Huaral','Lima',2344,467.67 UNION 
SELECT '140807','Lampian','Huaral','Lima',389,144.97 UNION 
SELECT '140808','Pacaraos','Huaral','Lima',385,294.04 UNION 
SELECT '140809','San Miguel de Acos','Huaral','Lima',777,48.16 UNION 
SELECT '140810','Veintisiete de Noviembre','Huaral','Lima',414,204.27 UNION 
SELECT '140811','Santa Cruz de Andamarca','Huaral','Lima',1469,216.92 UNION 
SELECT '140812','Sumbilca','Huaral','Lima',948,259.38 UNION 
SELECT '140901','Barranca','Barranca','Lima',73485,158.82 UNION 
SELECT '140902','Paramonga','Barranca','Lima',22373,408.59 UNION 
SELECT '140903','Pativilca','Barranca','Lima',20032,278.64 UNION 
SELECT '140904','Supe','Barranca','Lima',23345,512.92 UNION 
SELECT '140905','Supe Puerto','Barranca','Lima',11898,11.51 UNION 
SELECT '141001','Oyon','Oyon','Lima',15066,890.43 UNION 
SELECT '141002','Navan','Oyon','Lima',1235,227.16 UNION 
SELECT '141003','Caujul','Oyon','Lima',1076,105.5 UNION 
SELECT '141004','Andajes','Oyon','Lima',1058,148.18 UNION 
SELECT '141005','Pachangara','Oyon','Lima',3485,252.05 UNION 
SELECT '141006','Cochamarca','Oyon','Lima',1653,265.55 UNION 
SELECT '150101','Iquitos','Maynas','Loreto',151072,358.15 UNION 
SELECT '150102','Alto Nanay','Maynas','Loreto',3064,14290.81 UNION 
SELECT '150103','Fernando Lores','Maynas','Loreto',20646,4476.19 UNION 
SELECT '150104','Las Amazonas','Maynas','Loreto',9926,6593.64 UNION 
SELECT '150105','Mazan','Maynas','Loreto',14057,9884.28 UNION 
SELECT '150106','Napo','Maynas','Loreto',16695,24049.95 UNION 
SELECT '150107','Putumayo','Maynas','Loreto',4341,10886.41 UNION 
SELECT '150108','Torres Causana','Maynas','Loreto',5238,6795.14 UNION 
SELECT '150110','Indiana','Maynas','Loreto',11273,3297.76 UNION 
SELECT '150111','Punchana','Maynas','Loreto',94201,1573.39 UNION 
SELECT '150112','Belen','Maynas','Loreto',77641,632.8 UNION 
SELECT '150113','San Juan Bautista','Maynas','Loreto',161819,3117.05 UNION 
SELECT '150114','Teniente Manuel Clavero','Maynas','Loreto',5926,9488.52 UNION 
SELECT '150201','Yurimaguas','Alto Amazonas','Loreto',74047,2187.67 UNION 
SELECT '150202','Balsapuerto','Alto Amazonas','Loreto',18042,2954.17 UNION 
SELECT '150205','Jeberos','Alto Amazonas','Loreto',5453,4253.68 UNION 
SELECT '150206','Lagunas','Alto Amazonas','Loreto',14584,5929.16 UNION 
SELECT '150210','Santa Cruz','Alto Amazonas','Loreto',4535,2222.31 UNION 
SELECT '150211','Teniente Cesar Lopez Rojas','Alto Amazonas','Loreto',6743,1292.03 UNION 
SELECT '150301','Nauta','Loreto','Loreto',30631,6672.35 UNION 
SELECT '150302','Parinari','Loreto','Loreto',7331,12934.74 UNION 
SELECT '150303','Tigre','Loreto','Loreto',8664,19785.7 UNION 
SELECT '150304','Urarinas','Loreto','Loreto',15270,15434.46 UNION 
SELECT '150305','Trompeteros','Loreto','Loreto',11196,12246.01 UNION 
SELECT '150401','Requena','Requena','Loreto',31004,3038.56 UNION 
SELECT '150402','Alto Tapiche','Requena','Loreto',2139,9013.8 UNION 
SELECT '150403','Capelo','Requena','Loreto',4564,842.37 UNION 
SELECT '150404','Emilio San Martin','Requena','Loreto',7637,4572.56 UNION 
SELECT '150405','Maquia','Requena','Loreto',8508,4792.06 UNION 
SELECT '150406','Puinahua','Requena','Loreto',6170,6149.49 UNION 
SELECT '150407','Saquena','Requena','Loreto',5025,2081.42 UNION 
SELECT '150408','Soplin','Requena','Loreto',707,4711.38 UNION 
SELECT '150409','Tapiche','Requena','Loreto',1245,2014.23 UNION 
SELECT '150410','Jenaro Herrera','Requena','Loreto',5754,1517.43 UNION 
SELECT '150411','Yaquerana','Requena','Loreto',3090,10947.16 UNION 
SELECT '150501','Contamana','Ucayali','Loreto',28098,10675.13 UNION 
SELECT '150502','Vargas Guerra','Ucayali','Loreto',9125,1846.49 UNION 
SELECT '150503','Padre Marquez','Ucayali','Loreto',7901,2475.66 UNION 
SELECT '150504','Pampa Hermosa','Ucayali','Loreto',11081,7346.98 UNION 
SELECT '150505','Sarayacu','Ucayali','Loreto',16913,6303.17 UNION 
SELECT '150506','Inahuaya','Ucayali','Loreto',2751,646.04 UNION 
SELECT '150601','Ramon Castilla','Mariscal Ramon Castilla','Loreto',25020,7163.07 UNION 
SELECT '150602','Pebas','Mariscal Ramon Castilla','Loreto',17653,11048.35 UNION 
SELECT '150603','Yavari','Mariscal Ramon Castilla','Loreto',16315,13807.54 UNION 
SELECT '150604','San Pablo','Mariscal Ramon Castilla','Loreto',16675,5045.58 UNION 
SELECT '150701','Barranca','Datem del Marañon','Loreto',14043,7235.53 UNION 
SELECT '150702','Andoas','Datem del Marañon','Loreto',12869,11540.66 UNION 
SELECT '150703','Cahuapanas','Datem del Marañon','Loreto',8639,4685.11 UNION 
SELECT '150704','Manseriche','Datem del Marañon','Loreto',10707,3493.77 UNION 
SELECT '150705','Morona','Datem del Marañon','Loreto',13609,10776.95 UNION 
SELECT '150706','Pastaza','Datem del Marañon','Loreto',6496,8908.91 UNION 
SELECT '160101','Tambopata','Tambopata','Madre de Dios',84207,22218.56 UNION 
SELECT '160102','Inambari','Tambopata','Madre de Dios',10818,4256.82 UNION 
SELECT '160103','Las Piedras','Tambopata','Madre de Dios',6101,7032.21 UNION 
SELECT '160104','Laberinto','Tambopata','Madre de Dios',5329,2760.9 UNION 
SELECT '160201','Manu','Manu','Madre de Dios',3321,8166.65 UNION 
SELECT '160202','Fitzcarrald','Manu','Madre de Dios',1641,10955.29 UNION 
SELECT '160203','Madre de Dios','Manu','Madre de Dios',13835,7234.81 UNION 
SELECT '160204','Huepetuhe','Manu','Madre de Dios',6802,1478.42 UNION 
SELECT '160301','Iñapari','Tahuamanu','Madre de Dios',1659,14853.66 UNION 
SELECT '160302','Iberia','Tahuamanu','Madre de Dios',9486,2549.32 UNION 
SELECT '160303','Tahuamanu','Tahuamanu','Madre de Dios',3658,3793.9 UNION 
SELECT '170101','Moquegua','Mariscal Nieto','Moquegua',59387,3949.04 UNION 
SELECT '170102','Carumas','Mariscal Nieto','Moquegua',5805,2256.31 UNION 
SELECT '170103','Cuchumbaya','Mariscal Nieto','Moquegua',2228,67.58 UNION 
SELECT '170104','San Cristobal','Mariscal Nieto','Moquegua',4190,542.73 UNION 
SELECT '170105','Torata','Mariscal Nieto','Moquegua',5784,1793.37 UNION 
SELECT '170106','Samegua','Mariscal Nieto','Moquegua',6581,62.55 UNION 
SELECT '170201','Omate','General Sanchez Cerro','Moquegua',4661,250.64 UNION 
SELECT '170202','Coalaque','General Sanchez Cerro','Moquegua',1104,247.58 UNION 
SELECT '170203','Chojata','General Sanchez Cerro','Moquegua',2685,847.94 UNION 
SELECT '170204','Ichuña','General Sanchez Cerro','Moquegua',5048,1017.74 UNION 
SELECT '170205','La Capilla','General Sanchez Cerro','Moquegua',2326,776.04 UNION 
SELECT '170206','Lloque','General Sanchez Cerro','Moquegua',2087,254.45 UNION 
SELECT '170207','Matalaque','General Sanchez Cerro','Moquegua',1236,557.23 UNION 
SELECT '170208','Puquina','General Sanchez Cerro','Moquegua',2469,550.99 UNION 
SELECT '170209','Quinistaquillas','General Sanchez Cerro','Moquegua',1487,193.79 UNION 
SELECT '170210','Ubinas','General Sanchez Cerro','Moquegua',3714,874.57 UNION 
SELECT '170211','Yunga','General Sanchez Cerro','Moquegua',2514,110.74 UNION 
SELECT '170301','Ilo','Ilo','Moquegua',69079,295.51 UNION 
SELECT '170302','El Algarrobal','Ilo','Moquegua',332,747 UNION 
SELECT '170303','Pacocha','Ilo','Moquegua',3319,338.08 UNION 
SELECT '180101','Chaupimarca','Pasco','Pasco',25724,6.66 UNION 
SELECT '180103','Huachon','Pasco','Pasco',4762,846.3 UNION 
SELECT '180104','Huariaca','Pasco','Pasco',8278,133.07 UNION 
SELECT '180105','Huayllay','Pasco','Pasco',11564,1026.87 UNION 
SELECT '180106','Ninacaca','Pasco','Pasco',3297,508.92 UNION 
SELECT '180107','Pallanchacra','Pasco','Pasco',5040,73.69 UNION 
SELECT '180108','Paucartambo','Pasco','Pasco',25070,782.19 UNION 
SELECT '180109','San Francisco de Asis de Yarusyacan','Pasco','Pasco',9518,117.7 UNION 
SELECT '180110','Simon Bolivar','Pasco','Pasco',11404,697.15 UNION 
SELECT '180111','Ticlacayan','Pasco','Pasco',14863,748.43 UNION 
SELECT '180112','Tinyahuarco','Pasco','Pasco',6346,94.49 UNION 
SELECT '180113','Vicco','Pasco','Pasco',2173,173.3 UNION 
SELECT '180114','Yanacancha','Pasco','Pasco',30792,165.11 UNION 
SELECT '180201','Yanahuanca','Daniel Alcides Carrion','Pasco',12963,921.06 UNION 
SELECT '180202','Chacayan','Daniel Alcides Carrion','Pasco',4439,198.58 UNION 
SELECT '180203','Goyllarisquizga','Daniel Alcides Carrion','Pasco',4234,23.17 UNION 
SELECT '180204','Paucar','Daniel Alcides Carrion','Pasco',1721,134.18 UNION 
SELECT '180205','San Pedro de Pillao','Daniel Alcides Carrion','Pasco',1883,92.17 UNION 
SELECT '180206','Santa Ana de Tusi','Daniel Alcides Carrion','Pasco',23892,353.11 UNION 
SELECT '180207','Tapuc','Daniel Alcides Carrion','Pasco',4533,60.19 UNION 
SELECT '180208','Vilcabamba','Daniel Alcides Carrion','Pasco',1563,102.35 UNION 
SELECT '180301','Oxapampa','Oxapampa','Pasco',14438,419.85 UNION 
SELECT '180302','Chontabamba','Oxapampa','Pasco',3598,457.09 UNION 
SELECT '180303','Huancabamba','Oxapampa','Pasco',6628,1182.15 UNION 
SELECT '180304','Puerto Bermudez','Oxapampa','Pasco',18016,8014.31 UNION 
SELECT '180305','Villa Rica','Oxapampa','Pasco',20633,859.23 UNION 
SELECT '180306','Pozuzo','Oxapampa','Pasco',9818,750.87 UNION 
SELECT '180307','Palcazu','Oxapampa','Pasco',11282,2912.16 UNION 
SELECT '180308','Constitución','Oxapampa','Pasco',12105,3171.49 UNION 
SELECT '190101','Piura','Piura','Piura',158034,196.15 UNION 
SELECT '190103','Castilla','Piura','Piura',147546,656.69 UNION 
SELECT '190104','Catacaos','Piura','Piura',74562,2286.97 UNION 
SELECT '190105','La Arena','Piura','Piura',38483,171.24 UNION 
SELECT '190106','La Union','Piura','Piura',41736,320.9 UNION 
SELECT '190107','Las Lomas','Piura','Piura',27290,557.69 UNION 
SELECT '190109','Tambo Grande','Piura','Piura',123352,1496.75 UNION 
SELECT '190113','Cura Mori','Piura','Piura',19168,217.41 UNION 
SELECT '190114','El Tallan','Piura','Piura',5215,100.98 UNION 
SELECT '190201','Ayabaca','Ayabaca','Piura',38963,1549.99 UNION 
SELECT '190202','Frias','Ayabaca','Piura',24461,565.31 UNION 
SELECT '190203','Lagunas','Ayabaca','Piura',7425,190.82 UNION 
SELECT '190204','Montero','Ayabaca','Piura',6619,130.57 UNION 
SELECT '190205','Pacaipampa','Ayabaca','Piura',25060,981.5 UNION 
SELECT '190206','Sapillica','Ayabaca','Piura',12442,267.09 UNION 
SELECT '190207','Sicchez','Ayabaca','Piura',1829,33.1 UNION 
SELECT '190208','Suyo','Ayabaca','Piura',12471,1078.61 UNION 
SELECT '190209','Jilili','Ayabaca','Piura',2768,104.73 UNION 
SELECT '190210','Paimas','Ayabaca','Piura',10504,319.67 UNION 
SELECT '190301','Huancabamba','Huancabamba','Piura',30956,446.75 UNION 
SELECT '190302','Canchaque','Huancabamba','Piura',8173,306.41 UNION 
SELECT '190303','Huarmaca','Huancabamba','Piura',41688,1908.22 UNION 
SELECT '190304','Sondor','Huancabamba','Piura',8679,336.53 UNION 
SELECT '190305','Sondorillo','Huancabamba','Piura',10910,226.09 UNION 
SELECT '190306','El Carmen de La Frontera','Huancabamba','Piura',14195,702.81 UNION 
SELECT '190307','San Miguel de El Faique','Huancabamba','Piura',9067,201.6 UNION 
SELECT '190308','Lalaquiz','Huancabamba','Piura',4666,138.95 UNION 
SELECT '190401','Chulucanas','Morropon','Piura',76815,842.26 UNION 
SELECT '190402','Buenos Aires','Morropon','Piura',8147,245.12 UNION 
SELECT '190403','Chalaco','Morropon','Piura',9190,151.96 UNION 
SELECT '190404','Morropon','Morropon','Piura',14240,169.96 UNION 
SELECT '190405','Salitral','Morropon','Piura',8470,614.03 UNION 
SELECT '190406','Santa Catalina de Mossa','Morropon','Piura',4187,76.76 UNION 
SELECT '190407','Santo Domingo','Morropon','Piura',7335,187.32 UNION 
SELECT '190408','La Matanza','Morropon','Piura',12912,1043.61 UNION 
SELECT '190409','Yamango','Morropon','Piura',9715,216.91 UNION 
SELECT '190410','San Juan de Bigote','Morropon','Piura',6747,245.21 UNION 
SELECT '190501','Paita','Paita','Piura',96707,706.31 UNION 
SELECT '190502','Amotape','Paita','Piura',2336,90.82 UNION 
SELECT '190503','Arenal','Paita','Piura',1049,8.19 UNION 
SELECT '190504','La Huaca','Paita','Piura',11921,599.51 UNION 
SELECT '190505','Colan','Paita','Piura',12625,124.93 UNION 
SELECT '190506','Tamarindo','Paita','Piura',4632,63.67 UNION 
SELECT '190507','Vichayal','Paita','Piura',4901,134.36 UNION 
SELECT '190601','Sullana','Sullana','Piura',180896,529.73 UNION 
SELECT '190602','Bellavista','Sullana','Piura',38621,3.09 UNION 
SELECT '190603','Lancones','Sullana','Piura',13525,2152.99 UNION 
SELECT '190604','Marcavelica','Sullana','Piura',29411,1687.98 UNION 
SELECT '190605','Miguel Checa','Sullana','Piura',8861,480.26 UNION 
SELECT '190606','Querecotillo','Sullana','Piura',25675,270.08 UNION 
SELECT '190607','Salitral','Sullana','Piura',6834,28.27 UNION 
SELECT '190608','Ignacio Escudero','Sullana','Piura',20502,306.53 UNION 
SELECT '190701','Pariñas','Talara','Piura',91278,1116.99 UNION 
SELECT '190702','El Alto','Talara','Piura',7114,491.33 UNION 
SELECT '190703','La Brea','Talara','Piura',11926,692.96 UNION 
SELECT '190704','Lobitos','Talara','Piura',1685,233.01 UNION 
SELECT '190705','Mancora','Talara','Piura',13045,100.19 UNION 
SELECT '190706','Los Organos','Talara','Piura',9510,165.01 UNION 
SELECT '190801','Sechura','Sechura','Piura',44407,5710.85 UNION 
SELECT '190802','Vice','Sechura','Piura',14475,261.01 UNION 
SELECT '190803','Bernal','Sechura','Piura',7477,71.74 UNION 
SELECT '190804','Bellavista de La Union','Sechura','Piura',4498,13.88 UNION 
SELECT '190805','Cristo Nos Valga','Sechura','Piura',4067,234.37 UNION 
SELECT '190806','Rinconada Llicuar','Sechura','Piura',3298,19.44 UNION 
SELECT '200101','Puno','Puno','Puno',146095,460.63 UNION 
SELECT '200102','Acora','Puno','Puno',28363,1941.09 UNION 
SELECT '200103','Atuncolla','Puno','Puno',5778,124.74 UNION 
SELECT '200104','Capachica','Puno','Puno',11436,117.06 UNION 
SELECT '200105','Coata','Puno','Puno',8265,104 UNION 
SELECT '200106','Chucuito','Puno','Puno',6807,121.18 UNION 
SELECT '200107','Huata','Puno','Puno',10988,130.37 UNION 
SELECT '200108','Mañazo','Puno','Puno',5400,410.67 UNION 
SELECT '200109','Paucarcolla','Puno','Puno',5254,170.04 UNION 
SELECT '200110','Pichacani','Puno','Puno',5298,1633.48 UNION 
SELECT '200111','San Antonio','Puno','Puno',4025,376.75 UNION 
SELECT '200112','Tiquillaca','Puno','Puno',1725,455.71 UNION 
SELECT '200113','Vilque','Puno','Puno',3163,193.29 UNION 
SELECT '200114','Plateria','Puno','Puno',7674,238.59 UNION 
SELECT '200115','Amantani','Puno','Puno',4538,15 UNION 
SELECT '200201','Azangaro','Azangaro','Puno',28809,706.13 UNION 
SELECT '200202','Achaya','Azangaro','Puno',4619,132.23 UNION 
SELECT '200203','Arapa','Azangaro','Puno',7707,329.85 UNION 
SELECT '200204','Asillo','Azangaro','Puno',17767,392.38 UNION 
SELECT '200205','Caminaca','Azangaro','Puno',3543,146.88 UNION 
SELECT '200206','Chupa','Azangaro','Puno',13200,143.21 UNION 
SELECT '200207','Jose Domingo Choquehuanca','Azangaro','Puno',5595,69.73 UNION 
SELECT '200208','Muñani','Azangaro','Puno',8367,764.49 UNION 
SELECT '200210','Potoni','Azangaro','Puno',6586,602.95 UNION 
SELECT '200212','Saman','Azangaro','Puno',14541,188.59 UNION 
SELECT '200213','San Anton','Azangaro','Puno',10186,514.84 UNION 
SELECT '200214','San Jose','Azangaro','Puno',5838,372.73 UNION 
SELECT '200215','San Juan de Salinas','Azangaro','Puno',4430,106 UNION 
SELECT '200216','Santiago de Pupuja','Azangaro','Puno',5400,301.27 UNION 
SELECT '200217','Tirapata','Azangaro','Puno',3141,198.73 UNION 
SELECT '200301','Macusani','Carabaya','Puno',13291,1029.56 UNION 
SELECT '200302','Ajoyani','Carabaya','Puno',2140,413.11 UNION 
SELECT '200303','Ayapata','Carabaya','Puno',12540,1091.61 UNION 
SELECT '200304','Coasa','Carabaya','Puno',16619,3572.92 UNION 
SELECT '200305','Corani','Carabaya','Puno',4035,852.99 UNION 
SELECT '200306','Crucero','Carabaya','Puno',9497,836.37 UNION 
SELECT '200307','Ituata','Carabaya','Puno',6501,1200.79 UNION 
SELECT '200308','Ollachea','Carabaya','Puno',5765,595.79 UNION 
SELECT '200309','San Gaban','Carabaya','Puno',4199,2029.22 UNION 
SELECT '200310','Usicayos','Carabaya','Puno',24668,644.04 UNION 
SELECT '200401','Juli','Chucuito','Puno',21619,720.38 UNION 
SELECT '200402','Desaguadero','Chucuito','Puno',32339,178.21 UNION 
SELECT '200403','Huacullani','Chucuito','Puno',23781,705.28 UNION 
SELECT '200406','Pisacoma','Chucuito','Puno',13871,959.34 UNION 
SELECT '200407','Pomata','Chucuito','Puno',16206,382.58 UNION 
SELECT '200410','Zepita','Chucuito','Puno',19161,546.57 UNION 
SELECT '200412','Kelluyo','Chucuito','Puno',26051,485.77 UNION 
SELECT '200501','Huancane','Huancane','Puno',18727,381.62 UNION 
SELECT '200502','Cojata','Huancane','Puno',4501,881.18 UNION 
SELECT '200504','Inchupalla','Huancane','Puno',3422,289.03 UNION 
SELECT '200506','Pusi','Huancane','Puno',6515,148.42 UNION 
SELECT '200507','Rosaspata','Huancane','Puno',5326,301.47 UNION 
SELECT '200508','Taraco','Huancane','Puno',14483,198.02 UNION 
SELECT '200509','Vilque Chico','Huancane','Puno',8480,499.38 UNION 
SELECT '200511','Huatasani','Huancane','Puno',5634,106.73 UNION 
SELECT '200601','Lampa','Lampa','Puno',10351,675.82 UNION 
SELECT '200602','Cabanilla','Lampa','Puno',5383,443.04 UNION 
SELECT '200603','Calapuja','Lampa','Puno',1506,141.3 UNION 
SELECT '200604','Nicasio','Lampa','Puno',2710,134.35 UNION 
SELECT '200605','Ocuviri','Lampa','Puno',3246,878.26 UNION 
SELECT '200606','Palca','Lampa','Puno',2871,483.96 UNION 
SELECT '200607','Paratia','Lampa','Puno',9675,745.08 UNION 
SELECT '200608','Pucara','Lampa','Puno',5201,537.6 UNION 
SELECT '200609','Santa Lucia','Lampa','Puno',7620,1595.67 UNION 
SELECT '200610','Vilavila','Lampa','Puno',4449,156.65 UNION 
SELECT '200701','Ayaviri','Melgar','Puno',22568,1013.14 UNION 
SELECT '200702','Antauta','Melgar','Puno',4447,636.17 UNION 
SELECT '200703','Cupi','Melgar','Puno',3519,214.25 UNION 
SELECT '200704','Llalli','Melgar','Puno',5003,216.36 UNION 
SELECT '200705','Macari','Melgar','Puno',8772,673.78 UNION 
SELECT '200706','Nuñoa','Melgar','Puno',11106,2200.16 UNION 
SELECT '200707','Orurillo','Melgar','Puno',11009,379.05 UNION 
SELECT '200708','Santa Rosa','Melgar','Puno',7526,790.38 UNION 
SELECT '200709','Umachiri','Melgar','Puno',4504,323.56 UNION 
SELECT '200801','Sandia','Sandia','Puno',12478,580.13 UNION 
SELECT '200803','Cuyocuyo','Sandia','Puno',4768,503.91 UNION 
SELECT '200804','Limbani','Sandia','Puno',4422,2112.34 UNION 
SELECT '200805','Phara','Sandia','Puno',4905,400.9 UNION 
SELECT '200806','Patambuco','Sandia','Puno',3967,462.72 UNION 
SELECT '200807','Quiaca','Sandia','Puno',2413,447.9 UNION 
SELECT '200808','San Juan del Oro','Sandia','Puno',14201,197.14 UNION 
SELECT '200810','Yanahuaya','Sandia','Puno',2244,670.61 UNION 
SELECT '200811','Alto Inambari','Sandia','Puno',9765,1124.88 UNION 
SELECT '200812','San Pedro de Putina Punco','Sandia','Puno',14560,5361.88 UNION 
SELECT '200901','Juliaca','San Roman','Puno',235221,533.5 UNION 
SELECT '200902','Cabana','San Roman','Puno',4224,191.23 UNION 
SELECT '200903','Cabanillas','San Roman','Puno',5459,1267.06 UNION 
SELECT '200904','Caracoto','San Roman','Puno',5608,285.87 UNION 
SELECT '201001','Yunguyo','Yunguyo','Puno',27385,170.59 UNION 
SELECT '201002','Unicachi','Yunguyo','Puno',3889,11.1 UNION 
SELECT '201003','Anapia','Yunguyo','Puno',3376,9.54 UNION 
SELECT '201004','Copani','Yunguyo','Puno',5040,47.37 UNION 
SELECT '201005','Cuturapi','Yunguyo','Puno',1245,21.74 UNION 
SELECT '201006','Ollaraya','Yunguyo','Puno',5376,23.67 UNION 
SELECT '201007','Tinicachi','Yunguyo','Puno',1629,6.2 UNION 
SELECT '201101','Putina','San Antonio de Putina','Puno',27607,1021.92 UNION 
SELECT '201102','Pedro Vilca Apaza','San Antonio de Putina','Puno',3054,565.81 UNION 
SELECT '201103','Quilcapuncu','San Antonio de Putina','Puno',5929,516.66 UNION 
SELECT '201104','Ananea','San Antonio de Putina','Puno',33728,939.56 UNION 
SELECT '201105','Sina','San Antonio de Putina','Puno',1761,163.43 UNION 
SELECT '201201','Ilave','El Collao','Puno',59120,874.57 UNION 
SELECT '201202','Pilcuyo','El Collao','Puno',13172,157 UNION 
SELECT '201203','Santa Rosa','El Collao','Puno',7989,2524.02 UNION 
SELECT '201204','Capazo','El Collao','Puno',2351,1039.25 UNION 
SELECT '201205','Conduriri','El Collao','Puno',4496,1005.67 UNION 
SELECT '201301','Moho','Moho','Puno',16058,494.36 UNION 
SELECT '201302','Conima','Moho','Puno',3064,72.95 UNION 
SELECT '201303','Tilali','Moho','Puno',2769,48.15 UNION 
SELECT '201304','Huayrapata','Moho','Puno',4282,388.35 UNION 
SELECT '210101','Moyobamba','Moyobamba','San Martin',87833,2737.57 UNION 
SELECT '210102','Calzada','Moyobamba','San Martin',4435,95.38 UNION 
SELECT '210103','Habana','Moyobamba','San Martin',2078,91.25 UNION 
SELECT '210104','Jepelacio','Moyobamba','San Martin',22049,360.03 UNION 
SELECT '210105','Soritor','Moyobamba','San Martin',35837,387.76 UNION 
SELECT '210106','Yantalo','Moyobamba','San Martin',3536,100.32 UNION 
SELECT '210201','Saposoa','Huallaga','San Martin',11436,545.43 UNION 
SELECT '210202','Piscoyacu','Huallaga','San Martin',3958,184.87 UNION 
SELECT '210203','Sacanche','Huallaga','San Martin',2602,143.15 UNION 
SELECT '210204','Tingo de Saposoa','Huallaga','San Martin',661,37.29 UNION 
SELECT '210205','Alto Saposoa','Huallaga','San Martin',3296,1347.34 UNION 
SELECT '210206','El Eslabon','Huallaga','San Martin',3965,122.77 UNION 
SELECT '210301','Lamas','Lamas','San Martin',12528,79.82 UNION 
SELECT '210303','Barranquita','Lamas','San Martin',5140,1065.12 UNION 
SELECT '210304','Caynarachi','Lamas','San Martin',8040,1678.69 UNION 
SELECT '210305','Cuñumbuqui','Lamas','San Martin',4815,191.46 UNION 
SELECT '210306','Pinto Recodo','Lamas','San Martin',11115,524.07 UNION 
SELECT '210307','Rumisapa','Lamas','San Martin',2514,39.19 UNION 
SELECT '210311','Shanao','Lamas','San Martin',3659,24.59 UNION 
SELECT '210313','Tabalosos','Lamas','San Martin',13492,485.25 UNION 
SELECT '210314','Zapatero','Lamas','San Martin',4823,175 UNION 
SELECT '210315','Alonso de Alvarado','Lamas','San Martin',19886,294.2 UNION 
SELECT '210316','San Roque de Cumbaza','Lamas','San Martin',1466,525.15 UNION 
SELECT '210401','Juanjui','Mariscal Caceres','San Martin',26662,335.19 UNION 
SELECT '210402','Campanilla','Mariscal Caceres','San Martin',7672,2249.83 UNION 
SELECT '210403','Huicungo','Mariscal Caceres','San Martin',6630,9830.17 UNION 
SELECT '210404','Pachiza','Mariscal Caceres','San Martin',4205,1839.51 UNION 
SELECT '210405','Pajarillo','Mariscal Caceres','San Martin',6192,244.03 UNION 
SELECT '210501','Rioja','Rioja','San Martin',24222,185.69 UNION 
SELECT '210502','Posic','Rioja','San Martin',1706,54.65 UNION 
SELECT '210503','Yorongos','Rioja','San Martin',3741,74.53 UNION 
SELECT '210504','Yuracyacu','Rioja','San Martin',3914,13.74 UNION 
SELECT '210505','Nueva Cajamarca','Rioja','San Martin',47637,330.31 UNION 
SELECT '210506','Elias Soplin Vargas','Rioja','San Martin',13897,199.64 UNION 
SELECT '210507','San Fernando','Rioja','San Martin',3360,63.53 UNION 
SELECT '210508','Pardo Miguel','Rioja','San Martin',23572,1131.87 UNION 
SELECT '210509','Awajun','Rioja','San Martin',12342,481.08 UNION 
SELECT '210601','Tarapoto','San Martin','San Martin',75656,67.81 UNION 
SELECT '210602','Alberto Leveau','San Martin','San Martin',645,268.4 UNION 
SELECT '210604','Cacatachi','San Martin','San Martin',3466,75.36 UNION 
SELECT '210606','Chazuta','San Martin','San Martin',8206,966.38 UNION 
SELECT '210607','Chipurana','San Martin','San Martin',1818,500.44 UNION 
SELECT '210608','El Porvenir','San Martin','San Martin',2841,483.21 UNION 
SELECT '210609','Huimbayoc','San Martin','San Martin',3262,1609.07 UNION 
SELECT '210610','Juan Guerra','San Martin','San Martin',3167,196.5 UNION 
SELECT '210611','Morales','San Martin','San Martin',30844,43.91 UNION 
SELECT '210612','Papaplaya','San Martin','San Martin',1975,686.19 UNION 
SELECT '210616','San Antonio','San Martin','San Martin',1345,93.03 UNION 
SELECT '210619','Sauce','San Martin','San Martin',16808,103 UNION 
SELECT '210620','Shapaja','San Martin','San Martin',1472,270.44 UNION 
SELECT '210621','La Banda de Shilcayo','San Martin','San Martin',43596,286.68 UNION 
SELECT '210701','Bellavista','Bellavista','San Martin',13643,287.12 UNION 
SELECT '210702','San Rafael','Bellavista','San Martin',7706,98.32 UNION 
SELECT '210703','San Pablo','Bellavista','San Martin',9128,362.49 UNION 
SELECT '210704','Alto Biavo','Bellavista','San Martin',7368,6117.12 UNION 
SELECT '210705','Huallaga','Bellavista','San Martin',3118,210.42 UNION 
SELECT '210706','Bajo Biavo','Bellavista','San Martin',20617,975.43 UNION 
SELECT '210801','Tocache','Tocache','San Martin',25393,1142.04 UNION 
SELECT '210802','Nuevo Progreso','Tocache','San Martin',12370,860.98 UNION 
SELECT '210803','Polvora','Tocache','San Martin',14439,2174.48 UNION 
SELECT '210804','Shunte','Tocache','San Martin',983,964.21 UNION 
SELECT '210805','Uchiza','Tocache','San Martin',20197,723.73 UNION 
SELECT '210901','Picota','Picota','San Martin',8314,218.72 UNION 
SELECT '210902','Buenos Aires','Picota','San Martin',3287,272.97 UNION 
SELECT '210903','Caspisapa','Picota','San Martin',2130,81.44 UNION 
SELECT '210904','Pilluana','Picota','San Martin',683,239.27 UNION 
SELECT '210905','Pucacaca','Picota','San Martin',2431,230.72 UNION 
SELECT '210906','San Cristobal','Picota','San Martin',1427,29.63 UNION 
SELECT '210907','San Hilarion','Picota','San Martin',5756,96.55 UNION 
SELECT '210908','Tingo de Ponasa','Picota','San Martin',4889,340.01 UNION 
SELECT '210909','Tres Unidos','Picota','San Martin',5349,246.52 UNION 
SELECT '210910','Shamboyacu','Picota','San Martin',12188,415.58 UNION 
SELECT '211001','San Jose de Sisa','El Dorado','San Martin',11954,299.9 UNION 
SELECT '211002','Agua Blanca','El Dorado','San Martin',2385,168.19 UNION 
SELECT '211003','Shatoja','El Dorado','San Martin',3281,24.07 UNION 
SELECT '211004','San Martin','El Dorado','San Martin',13834,562.57 UNION 
SELECT '211005','Santa Rosa','El Dorado','San Martin',10704,243.41 UNION 
SELECT '220101','Tacna','Tacna','Tacna',80845,1877.78 UNION 
SELECT '220102','Calana','Tacna','Tacna',3338,108.38 UNION 
SELECT '220104','Inclan','Tacna','Tacna',8125,1414.82 UNION 
SELECT '220107','Pachia','Tacna','Tacna',1971,603.68 UNION 
SELECT '220108','Palca','Tacna','Tacna',1728,1417.86 UNION 
SELECT '220109','Pocollay','Tacna','Tacna',22319,265.65 UNION 
SELECT '220110','Sama','Tacna','Tacna',2679,1115.98 UNION 
SELECT '220111','Alto de La Alianza','Tacna','Tacna',40652,371.4 UNION 
SELECT '220112','Ciudad Nueva','Tacna','Tacna',39060,173.42 UNION 
SELECT '220113','Coronel Gregorio Albarracin Lanchipa','Tacna','Tacna',123662,187.74 UNION 
SELECT '220201','Tarata','Tarata','Tacna',3233,864.31 UNION 
SELECT '220205','Heroes Albarracin','Tarata','Tacna',676,372.41 UNION 
SELECT '220206','Estique','Tarata','Tacna',741,312.85 UNION 
SELECT '220207','Estique-Pampa','Tarata','Tacna',703,185.61 UNION 
SELECT '220210','Sitajara','Tarata','Tacna',728,251.24 UNION 
SELECT '220211','Susapaya','Tarata','Tacna',746,373.21 UNION 
SELECT '220212','Tarucachi','Tarata','Tacna',412,113.27 UNION 
SELECT '220213','Ticaco','Tarata','Tacna',547,347.06 UNION 
SELECT '220301','Locumba','Jorge Basadre','Tacna',2641,968.99 UNION 
SELECT '220302','Ite','Jorge Basadre','Tacna',3415,848.18 UNION 
SELECT '220303','Ilabaya','Jorge Basadre','Tacna',2806,1111.39 UNION 
SELECT '220401','Candarave','Candarave','Tacna',3008,1111.03 UNION 
SELECT '220402','Cairani','Candarave','Tacna',1299,371.17 UNION 
SELECT '220403','Curibaya','Candarave','Tacna',174,126.98 UNION 
SELECT '220404','Huanuara','Candarave','Tacna',909,95.61 UNION 
SELECT '220405','Quilahuani','Candarave','Tacna',1229,37.66 UNION 
SELECT '220406','Camilaca','Candarave','Tacna',1468,518.65 UNION 
SELECT '230101','Tumbes','Tumbes','Tumbes',115562,158.14 UNION 
SELECT '230102','Corrales','Tumbes','Tumbes',24561,131.6 UNION 
SELECT '230103','La Cruz','Tumbes','Tumbes',9444,65.23 UNION 
SELECT '230104','Pampas de Hospital','Tumbes','Tumbes',7239,727.75 UNION 
SELECT '230105','San Jacinto','Tumbes','Tumbes',8704,598.72 UNION 
SELECT '230106','San Juan de La Virgen','Tumbes','Tumbes',4160,118.71 UNION 
SELECT '230201','Zorritos','Contralmirante Villar','Tumbes',12785,644.52 UNION 
SELECT '230202','Casitas','Contralmirante Villar','Tumbes',2088,855.36 UNION 
SELECT '230203','Canoas de Punta Sal','Contralmirante Villar','Tumbes',5700,623.34 UNION 
SELECT '230301','Zarumilla','Zarumilla','Tumbes',23148,113.25 UNION 
SELECT '230302','Matapalo','Zarumilla','Tumbes',2529,392.29 UNION 
SELECT '230303','Papayal','Zarumilla','Tumbes',5348,193.53 UNION 
SELECT '230304','Aguas Verdes','Zarumilla','Tumbes',24781,46.06 UNION 
SELECT '240101','Callao','Callao','Callao',410795,45.65 UNION 
SELECT '240102','Bellavista','Callao','Callao',72625,4.56 UNION 
SELECT '240103','La Punta','Callao','Callao',3184,18.38 UNION 
SELECT '240104','Carmen de La Legua','Callao','Callao',40833,2.12 UNION 
SELECT '240105','La Perla','Callao','Callao',60011,2.75 UNION 
SELECT '240106','Ventanilla','Callao','Callao',402038,69.93 UNION 
SELECT '250101','Calleria','Coronel Portillo','Ucayali',159364,10485.41 UNION 
SELECT '250102','Yarinacocha','Coronel Portillo','Ucayali',101126,596.2 UNION 
SELECT '250103','Masisea','Coronel Portillo','Ucayali',13150,14102.19 UNION 
SELECT '250104','Campoverde','Coronel Portillo','Ucayali',16324,1194.1 UNION 
SELECT '250105','Iparia','Coronel Portillo','Ucayali',12193,8029.12 UNION 
SELECT '250106','Nueva Requena','Coronel Portillo','Ucayali',5699,1857.82 UNION 
SELECT '250107','Manantay','Coronel Portillo','Ucayali',83040,579.91 UNION 
SELECT '250201','Padre Abad','Padre Abad','Ucayali',26614,4689.2 UNION 
SELECT '250202','Irazola','Padre Abad','Ucayali',10830,998.93 UNION 
SELECT '250203','Curimana','Padre Abad','Ucayali',8956,2134.04 UNION 
SELECT '250301','Raymondi','Atalaya','Ucayali',35109,14504.99 UNION 
SELECT '250302','Tahuania','Atalaya','Ucayali',8284,7010.09 UNION 
SELECT '250303','Yurua','Atalaya','Ucayali',2716,9175.58 UNION 
SELECT '250304','Sepahua','Atalaya','Ucayali',9193,8223.63 UNION 
SELECT '250401','Purus','Purus','Ucayali',4657,17847.76 UNION 
SELECT '999999','-','-','-',0,0  

--Copiar estructura de tabla sin data
select * 
into desarrollo.tb_Ubigeo
from dbo.tb_Ubigeo where 1=0

--5
select idUbigeo,departamento, provincia,distrito from dbo.tb_Ubigeo--prod
intersect
select idUbigeo, departamento, provincia,distrito from desarrollo.tb_Ubigeo--des