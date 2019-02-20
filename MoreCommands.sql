# QUERYS CITLALI

# Consultas-Estado
SELECT * FROM mydb.estado;

SELECT * FROM mydb.estado E where E.Poblacion between '300400' and '630612';

SELECT COUNT(*) FROM mydb.estado;

SELECT Nombre FROM  mydb.estado E group by E.Nombre ;

SELECT sum(Poblacion) FROM Estado;

SELECT Nombre, HusoHorario, PIB from mydb.Estado E order by  E.Nombre desc;

SELECT HusoHorario AS alias_Horario from mydb.estado;

SELECT min(Poblacion) from mydb.estado;

SELECT max(Poblacion) from mydb.estado;

SELECT e.Nombre, e.idEstado, e.Poblacion, e.Altitud FROM estado AS e;

# Consultas Municipio

SELECT * FROM mydb.municipio;

SELECT * FROM mydb.municipio where Nombre Like '%a'; 

SELECT * FROM mydb.municipio where Superficie>=52.68;

SELECT * FROM mydb.municipio where Estado_idEstado='1' or idMunicipio=101;

SELECT idMunicipio, Nombre from mydb.municipio UNION SELECT idEstado, Nombre from estado;

SELECT IndiceDesarrolloHumano AS IDH from mydb.municipio; /*Columna*/

SELECT min(Superficie) from mydb.municipio;

SELECT max(IndiceDesarrolloHumano) from mydb.municipio;

SELECT Nombre AS Nomb, Estado_idEstado AS IdEdo FROM municipio;

SELECT m.Nombre, m.idMunicipio FROM municipio AS m;

SELECT * from municipio where estado_idEstado<'3' OR estado_idEstado>60;

# Consultas-Vivienda

SELECT * FROM mydb.vivienda;
SELECT `mydb`.`Vivienda`.`NumeroInterior`, `mydb`.`Vivienda`.`Calle`, `mydb`.`Vivienda`.`Colonia` from `mydb`.`Vivienda` where `mydb`.`Vivienda`.`CodigoPostal`>='72543' and `mydb`.`Vivienda`.`idVivienda`>='2000';
SELECT distinct Municipio_idMunicipio from Vivienda;
SELECT avg(CodigoPostal) from Vivienda;
SELECT * FROM mydb.Vivienda where Colonia Like 'f%s';
SELECT *FROM mydb.Vivienda where Calle in ('Nanche', 'Pinos', 'Bugambilias');
SELECT NumeroExterior AS alias_NumExt from mydb.Vivienda;
SELECT NumeroInterior AS alias_NumInt from mydb.Vivienda;
SELECT min(idVivienda) from mydb.vivienda;
SELECT max(CodigoPostal) from mydb.vivienda;
SELECT v.Calle, v.idVivienda, v.Colonia, v.NumeroExterior, v.NumeroInterior FROM vivienda AS v;

# Consultas-Persona

SELECT * FROM mydb.persona;
SELECT * FROM mydb.persona where ApellidoPaterno Like 'C%S'; 
SELECT * FROM mydb.persona where vivienda_idvivienda='3021' or jefefamilia_claveElector='ABC123';
SELECT FechaNacimiento AS FechaNac, claveElector AS clavElect FROM persona;
SELECT p.Nombre, p.idPersona, p.ApellidoMaterno FROM persona AS p;
SELECT * FROM persona AS p;
SELECT max(FechaNacimiento) from mydb.persona;
SELECT * FROM mydb.persona where ApellidoPaterno Like '%z'; 
SELECT COUNT(*) FROM mydb.persona;
SELECT *FROM mydb.persona where  jefefamilia_claveElector in ('ABC123', '789GH1', '3021' '1031');
SELECT idPersona, ApellidoPaterno, ApellidoMaterno, Nombre from persona;
SELECT * from persona order by  idPersona, ApellidoPaterno, ApellidoMaterno, Nombre asc;
SELECT sum(idPersona) FROM persona;
SELECT * FROM `mydb`.`persona` GROUP BY `mydb`.`persona`.`claveElector` HAVING idPersona > 11000;
SELECT `mydb`.`Persona`.`idPersona`, `mydb`.`Persona`.`Nombre` FROM `mydb`.`Persona` LIMIT 5 OFFSET 1;
SELECT AVG(`mydb`.`Persona`.`idPersona`) FROM `mydb`.`Persona`;
SELECT SUM(`mydb`.`Persona`.`idPersona`) FROM `mydb`.`Persona`;

SELECT CONCAT(`mydb`.`Estado`.`Nombre`, " Con uso horario de: ", `mydb`.`Estado`.`HusoHorario`) AS cadenaConcatenada FROM `mydb`.`Estado`;

CREATE TEMPORARY TABLE `mydb`.`tempTable` SELECT * FROM `mydb`.`Municipio` WHERE idMunicipio % 2 = 0;
SELECT * FROM `mydb`.`tempTable`;

SELECT 1+1 FROM DUAL;

SELECT 14/2+5*2^2 FROM DUAL;

SELECT 'tabla dual' FROM DUAL;