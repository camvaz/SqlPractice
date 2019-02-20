# TRIGGERS

DELIMITER |

CREATE TRIGGER `mydb`.`UpdateEstado` AFTER UPDATE ON `mydb`.`Estado`
	FOR EACH ROW BEGIN
		
        IF NEW.`idEstado` THEN
			UPDATE `mydb`.`Municipio`
            SET `mydb`.`Municipio`.`Estado_idEstado` = NEW.`idEstado`
            WHERE `mydb`.`Municipio`.`Estado_idEstado` = NEW.OLD.`idEstado`;
            
            UPDATE `mydb`.`Vivienda`
            SET `mydb`.`Vivienda`.`Municipio_Estado_idEstado` = NEW.`idEstado`
            WHERE `mydb`.`Vivienda`.`Municipio_Estado_idEstado` = NEW.OLD.`idEstado`;
        END IF;
        
    END
    |

DELIMITER |

CREATE TRIGGER `mydb`.`UpdatePersona` BEFORE UPDATE ON `mydb`.`Persona`
	FOR EACH ROW BEGIN
		
        IF NEW.`idPersona` THEN
			UPDATE `mydb`.`Persona_has_Vivienda` 
			SET `mydb`.`Persona_has_Vivienda`.`Persona_idPersona` = NEW.`idPersona` 
			WHERE `mydb`.`Persona_has_Vivienda`.`Persona_idPersona` = NEW.OLD.`claveElector`;
		END IF;
        
        IF NEW.`JefeFamilia_ClaveElector` LIKE NEW.`claveElector` THEN
			UPDATE `mydb`.`Persona_has_Vivienda` 
			SET `mydb`.`Persona_has_Vivienda`.`Persona_JefeFamilia_claveElector`= NEW.`JefeFamilia_claveElector`
			WHERE `mydb`.`Persona_has_Vivienda`.`Persona_JefeFamilia_claveElector`= NEW.OLD.`JefeFamilia_claveElector`;
            
            UPDATE `mydb`.`Persona`
            SET `mydb`.`Persona`.`JefeFamilia_claveElector` = NEW.`claveElector`
            WHERE `mydb`.`Persona`.`JefeFamilia_claveElector` LIKE NEW.OLD.`claveElector`;
            
            UPDATE `mydb`.`JefeFamilia`
            SET `mydb`.`JefeFamilia`.`claveElector` = NEW.`claveElector`
            WHERE `mydb`.`JefeFamilia`.`claveElector` LIKE NEW.OLD.`claveElector`;
        END IF;
    
    END
    |
    
DELIMITER |

CREATE TRIGGER `mydb`.`UpdateMunicipio` AFTER UPDATE ON `mydb`.`Municipio`
	FOR EACH ROW BEGIN
		
        IF NEW.`idMunicipio` THEN
			UPDATE `mydb`.`Vivienda`
            SET `mydb`.`Vivienda`.`Municipio_idMunicipio` = NEW.`idMunicipio`
            WHERE `mydb`.`Vivienda`.`Municipio_idMunicipio` = NEW.OLD.`idMunicipio`;
		END IF;
        
        IF NEW.`Estado_idEstado` THEN
			UPDATE `mydb`.`Vivienda`
            SET `mydb`.`Vivienda`.`Municipio_Estado_idEstado` = NEW.`Estado_idEstado`
            WHERE `mydb`.`Vivienda`.`Municipio_Estado_idEstado` = NEW.OLD.`Estado_idEstado`;
        END IF;
        
	END
    |
    
DELIMITER |

CREATE TRIGGER `mydb`.`UpdateVivienda` AFTER UPDATE ON `mydb`.`Vivienda`
	FOR EACH ROW BEGIN
    
		IF NEW.`idVivienda` THEN
			UPDATE `mydb`.`Persona_has_Vivienda`
            SET `mydb`.`Persona_has_Vivienda`.`Vivienda_idVivienda` = NEW.`idVivienda`
            WHERE `mydb`.`Persona_has_Vivienda`.`Vivienda_idVivienda` = NEW.OLD.`idVivienda`;
        END IF;
    
    END
    |
    
DELIMITER ;
DROP TRIGGER `mydb`.`UpdateEstado`;
DROP TRIGGER `mydb`.`UpdatePersona`;