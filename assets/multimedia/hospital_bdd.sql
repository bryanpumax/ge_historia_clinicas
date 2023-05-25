-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital_bdd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital_bdd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital_bdd` DEFAULT CHARACTER SET utf8 ;
USE `hospital_bdd` ;

-- -----------------------------------------------------
-- Table `hospital_bdd`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`paciente` (
  `idpaciente` INT NOT NULL AUTO_INCREMENT,
  `nombres_paciente` VARCHAR(50) NOT NULL,
  `apellidos_paciente` VARCHAR(50) NOT NULL,
  `sexo_paciente` VARCHAR(50) NOT NULL,
  `edad_paciente` VARCHAR(2) NOT NULL,
  `cedula_paciente` VARCHAR(20) NOT NULL,
  `estadoCivil_paciente` VARCHAR(20) NULL,
  `fechaNacimiento_paciente` DATE NOT NULL,
  `tipoSangre_paciente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idpaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`informacion_contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`informacion_contacto` (
  `idinformacion_contacto` INT NOT NULL AUTO_INCREMENT,
  `telefono_personal` VARCHAR(20) NOT NULL,
  `domicilio_personal` VARCHAR(100) NOT NULL,
  `nombres_madre` VARCHAR(50) NULL,
  `nombres_padre` VARCHAR(50) NULL,
  `telefono_padres` VARCHAR(20) NULL,
  `paciente_idpaciente` INT NOT NULL,
  PRIMARY KEY (`idinformacion_contacto`),
  INDEX `fk_informacion_contacto_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  CONSTRAINT `fk_informacion_contacto_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `hospital_bdd`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`antecedentes_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`antecedentes_paciente` (
  `idantecedentes_paciente` INT NOT NULL AUTO_INCREMENT,
  `tipo_enfermedad` VARCHAR(100) NULL,
  `fecha_diagnostico` DATE NULL,
  `tratamiento_recibido` VARCHAR(500) NULL,
  `estado_actual` VARCHAR(100) NOT NULL,
  `antecedentes_enf_fam` VARCHAR(100) NULL,
  `paciente_idpaciente` INT NOT NULL,
  PRIMARY KEY (`idantecedentes_paciente`),
  INDEX `fk_antecedentes_paciente_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  CONSTRAINT `fk_antecedentes_paciente_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `hospital_bdd`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`alergias_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`alergias_paciente` (
  `idalergias_paciente` INT NOT NULL AUTO_INCREMENT,
  `tipo_alergia` VARCHAR(100) NULL,
  `gravedad_alergia` VARCHAR(100) NULL,
  `paciente_idpaciente` INT NOT NULL,
  PRIMARY KEY (`idalergias_paciente`),
  INDEX `fk_alergias_paciente_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  CONSTRAINT `fk_alergias_paciente_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `hospital_bdd`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`examen` (
  `idexamen` INT NOT NULL AUTO_INCREMENT,
  `tipo_examen` VARCHAR(50) NOT NULL,
  `nombre_examen` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idexamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`administrador` (
  `idadministrador` INT NOT NULL AUTO_INCREMENT,
  `nombre_administrador` VARCHAR(50) NULL,
  `cedula_administrador` VARCHAR(20) NULL,
  `contraseña_administrador` VARCHAR(30) NULL,
  PRIMARY KEY (`idadministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `nombres_medico` VARCHAR(50) NOT NULL,
  `apellidos_medico` VARCHAR(50) NOT NULL,
  `sexo_medico` VARCHAR(10) NOT NULL,
  `telefono_medico` VARCHAR(20) NOT NULL,
  `especialidad_medico` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`atencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`atencion` (
  `idatencion` INT NOT NULL AUTO_INCREMENT,
  `tipo_atencion` ENUM('Consulta general', 'Consulta ambulatoria', 'Emergencia') NULL,
  `fecha_atencion` DATE NOT NULL,
  `notas` VARCHAR(200) NULL,
  `fecha_diagnostico` DATE NULL,
  `descripcion_diagnostico` VARCHAR(500) NULL,
  `administrador_idadministrador` INT NOT NULL,
  `paciente_idpaciente` INT NOT NULL,
  `medico_idmedico` INT NOT NULL,
  PRIMARY KEY (`idatencion`),
  INDEX `fk_atencion_administrador1_idx` (`administrador_idadministrador` ASC) VISIBLE,
  INDEX `fk_atencion_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  INDEX `fk_atencion_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
  CONSTRAINT `fk_atencion_administrador1`
    FOREIGN KEY (`administrador_idadministrador`)
    REFERENCES `hospital_bdd`.`administrador` (`idadministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `hospital_bdd`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_medico1`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `hospital_bdd`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`detalle_examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`detalle_examen` (
  `iddetalle_examen` INT NOT NULL AUTO_INCREMENT,
  `examen_idexamen` INT NOT NULL,
  `atencion_idatencion` INT NOT NULL,
  PRIMARY KEY (`iddetalle_examen`),
  INDEX `fk_detalle_examen_examen1_idx` (`examen_idexamen` ASC) VISIBLE,
  INDEX `fk_detalle_examen_atencion1_idx` (`atencion_idatencion` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_examen_examen1`
    FOREIGN KEY (`examen_idexamen`)
    REFERENCES `hospital_bdd`.`examen` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_examen_atencion1`
    FOREIGN KEY (`atencion_idatencion`)
    REFERENCES `hospital_bdd`.`atencion` (`idatencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`resultados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`resultados` (
  `idresultados` INT NOT NULL AUTO_INCREMENT,
  `resultados` VARCHAR(500) NOT NULL,
  `observaciones` VARCHAR(500) NOT NULL,
  `detalle_examen_iddetalle_examen` INT NOT NULL,
  PRIMARY KEY (`idresultados`),
  INDEX `fk_resultados_detalle_examen1_idx` (`detalle_examen_iddetalle_examen` ASC) VISIBLE,
  CONSTRAINT `fk_resultados_detalle_examen1`
    FOREIGN KEY (`detalle_examen_iddetalle_examen`)
    REFERENCES `hospital_bdd`.`detalle_examen` (`iddetalle_examen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital_bdd`.`tratamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital_bdd`.`tratamiento` (
  `idtratamiento` INT NOT NULL AUTO_INCREMENT,
  `medicamento` VARCHAR(500) NOT NULL,
  `frecuencia` VARCHAR(500) NULL,
  `dosis` VARCHAR(500) NOT NULL,
  `atencion_idatencion` INT NOT NULL,
  PRIMARY KEY (`idtratamiento`),
  INDEX `fk_tratamiento_atencion1_idx` (`atencion_idatencion` ASC) VISIBLE,
  CONSTRAINT `fk_tratamiento_atencion1`
    FOREIGN KEY (`atencion_idatencion`)
    REFERENCES `hospital_bdd`.`atencion` (`idatencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
