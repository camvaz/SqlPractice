CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `idEstado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Superficie` INT NULL,
  `Poblacion` INT NULL,
  `Altitud` INT NULL,
  `HusoHorario` VARCHAR(6) NULL,
  `PIB` INT NULL,
  `PIBPerCapita` INT NULL,
  PRIMARY KEY (`idEstado`),
  INDEX `Name` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Municipio` (
  `idMunicipio` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `IndiceDesarrolloHumano` DOUBLE NULL,
  `Superficie` DOUBLE NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idMunicipio`, `Estado_idEstado`),
  INDEX `fk_Municipio_Estado_idx` (`Estado_idEstado` ASC) VISIBLE,
  INDEX `Name` (`Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Municipio_Estado`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `mydb`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vivienda` (
  `idVivienda` INT NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `NumeroExterior` INT NOT NULL,
  `NumeroInterior` VARCHAR(45) NOT NULL,
  `Colonia` VARCHAR(45) NOT NULL,
  `CodigoPostal` VARCHAR(7) NOT NULL,
  `Superficie` INT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Municipio_Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idVivienda`, `Municipio_idMunicipio`, `Municipio_Estado_idEstado`),
  INDEX `fk_Vivienda_Municipio1_idx` (`Municipio_idMunicipio` ASC, `Municipio_Estado_idEstado` ASC) VISIBLE,
  INDEX `Direccion` (`Calle` ASC, `NumeroExterior` ASC, `Colonia` ASC) VISIBLE,
  CONSTRAINT `fk_Vivienda_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio` , `Municipio_Estado_idEstado`)
    REFERENCES `mydb`.`Municipio` (`idMunicipio` , `Estado_idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JefeFamilia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JefeFamilia` (
  `claveElector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`claveElector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `ApellidoPaterno` VARCHAR(45) NOT NULL,
  `ApellidoMaterno` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `claveElector` VARCHAR(45) NULL,
  `JefeFamilia_claveElector` VARCHAR(45) NOT NULL,
  `Vivienda_idVivienda` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `JefeFamilia_claveElector`, `Vivienda_idVivienda`),
  INDEX `idxNombre` (`Nombre` ASC, `ApellidoPaterno` ASC, `ApellidoMaterno` ASC) INVISIBLE,
  INDEX `idxNacimiento` (`FechaNacimiento` ASC) VISIBLE,
  INDEX `fk_Persona_JefeFamilia1_idx` (`JefeFamilia_claveElector` ASC) VISIBLE,
  INDEX `fk_Persona_Vivienda1_idx` (`Vivienda_idVivienda` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_JefeFamilia1`
    FOREIGN KEY (`JefeFamilia_claveElector`)
    REFERENCES `mydb`.`JefeFamilia` (`claveElector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_Vivienda1`
    FOREIGN KEY (`Vivienda_idVivienda`)
    REFERENCES `mydb`.`Vivienda` (`idVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona_has_Vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona_has_Vivienda` (
  `Persona_idPersona` INT NOT NULL,
  `Persona_JefeFamilia_claveElector` VARCHAR(45) NOT NULL,
  `Vivienda_idVivienda` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Persona_JefeFamilia_claveElector`, `Vivienda_idVivienda`),
  INDEX `fk_Persona_has_Vivienda_Vivienda1_idx` (`Vivienda_idVivienda` ASC) VISIBLE,
  INDEX `fk_Persona_has_Vivienda_Persona1_idx` (`Persona_idPersona` ASC, `Persona_JefeFamilia_claveElector` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Vivienda_Persona1`
    FOREIGN KEY (`Persona_idPersona` , `Persona_JefeFamilia_claveElector`)
    REFERENCES `mydb`.`Persona` (`idPersona` , `JefeFamilia_claveElector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Vivienda_Vivienda1`
    FOREIGN KEY (`Vivienda_idVivienda`)
    REFERENCES `mydb`.`Vivienda` (`idVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;