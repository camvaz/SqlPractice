# JOINS Y AR

SELECT C1.`idMunicipio`, C2.`Calle`, C2.`Colonia` 
FROM `mydb`.`Municipio` C1 
INNER JOIN `mydb`.`Vivienda` C2 
ON C1.`idMunicipio` = C2.`Municipio_idMunicipio`;

SELECT C1.`idEstado`, C2.`idMunicipio`, C1.`Nombre`, C1.`Poblacion`
FROM `mydb`.`Estado` C1
LEFT JOIN `mydb`.`Municipio` C2
ON C1.`idEstado` = C2.`Estado_idEstado`;

SELECT C1.`idVivienda`, `mydb`.`Persona`.`idPersona`, `mydb`.`Persona`.`ApellidoPaterno`, `mydb`.`Persona`.`ApellidoMaterno`
FROM `mydb`.`Vivienda` C1
RIGHT JOIN `mydb`.`Persona` 
ON C1.`idVivienda` = `mydb`.`Persona`.`Vivienda_idVivienda`;

SELECT * FROM `mydb`.`Persona` t1
LEFT JOIN `mydb`.`Persona_has_Vivienda` t2 ON t1.`idPersona` = t2.`Persona_idPersona`
UNION ALL
SELECT * FROM `mydb`.`Persona` t1
RIGHT JOIN `mydb`.`Persona_has_Vivienda` t2 ON t1.`idPersona` = t2.`Persona_idPersona`
WHERE t1.`idPersona` IS NULL