select substring('Petroleos Mexicano','1', '9') AS ´ExtractString´ from `mydb`.`vivienda`;

select substring('Ciudad de México','2', '7') AS ´ExtractString´ from `mydb`.`estado`;

select `nombre`, `apellidoPaterno`, `apellidoMaterno` from `mydb`.`persona`;

select *from `mydb`.`Estado` where PIB='3';

select *from  `mydb`.`persona` where `mydb`.`Persona`.`FechaNacimiento` between '1960-02-09' and '1995-02-09';

create temporary table Ubicacion (idEstado int NOT NULL, idMunicipio int NOT NULL  , nombre varchar(30) NOT NULL , FechaActualizada datetime NOT NULL ,  primary key (`idMunicipio`, `idEstado`));

select count(*), `claveElector` from `mydb`.`persona` group by `claveElector` having  count(*);

SELECT COUNT(*) FROM DUAL;
SELECT 'ABCDEF12345' FROM DUAL;

SELECT 123792.52 FROM DUAL;

SELECT 15+10-5*5/5 FROM DUAL;

select `superficie` from `mydb`.`municipio` UNION ALL 	select `superficie`  from `mydb`.`estado` order by `superficie`;

select `Persona_idPersona` from `mydb`.`persona_has_vivienda` union select  `claveElector` from `mydb`.`jefefamilia`;

select persona.claveElector, jefefamilia.claveElector, idpersona, nombre from persona inner join jefefamilia on persona.claveElector=jefefamilia.claveElector;

