-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UniCC3Mb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UniCC3Mb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UniCC3Mb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------
USE `UniCC3Mb` ;

-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Professor` (
  `matricula` INT NOT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Disciplina` (
  `codigo` INT NOT NULL,
  `vagas` SMALLINT NULL,
  `semestre` ENUM('1', '2') NULL,
  `Materia_codigo` INT NOT NULL,
  `Professor_matricula` INT NOT NULL,
  PRIMARY KEY (`codigo`, `Materia_codigo`, `Professor_matricula`),
  INDEX `fk_Disciplina_Materia1_idx` (`Materia_codigo` ASC) VISIBLE,
  INDEX `fk_Disciplina_Professor2_idx` (`Professor_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_Materia1`
    FOREIGN KEY (`Materia_codigo`)
    REFERENCES `UniCC3Mb`.`Materia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disciplina_Professor2`
    FOREIGN KEY (`Professor_matricula`)
    REFERENCES `UniCC3Mb`.`Professor` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Professor` (
  `matricula` INT NOT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Curso` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(80) NULL,
  `cargaHoraria` INT NULL DEFAULT 3600,
  `coordenador` INT NOT NULL,
  PRIMARY KEY (`codigo`, `coordenador`),
  INDEX `fk_Curso_Professor1_idx` (`coordenador` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_Professor1`
    FOREIGN KEY (`coordenador`)
    REFERENCES `UniCC3Mb`.`Professor` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Materia` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(80) NULL,
  `cargaHoraria` INT NULL DEFAULT 40,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`PreRequisitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`PreRequisitos` (
  `Materia_codigo` INT NOT NULL,
  `Materia_codigo1` INT NOT NULL,
  PRIMARY KEY (`Materia_codigo`, `Materia_codigo1`),
  INDEX `fk_Materia_has_Materia_Materia2_idx` (`Materia_codigo1` ASC) VISIBLE,
  INDEX `fk_Materia_has_Materia_Materia1_idx` (`Materia_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Materia_has_Materia_Materia1`
    FOREIGN KEY (`Materia_codigo`)
    REFERENCES `UniCC3Mb`.`Materia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_has_Materia_Materia2`
    FOREIGN KEY (`Materia_codigo1`)
    REFERENCES `UniCC3Mb`.`Materia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Curso_has_Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Curso_has_Materia` (
  `Curso_codigo` INT NOT NULL,
  `Materia_codigo` INT NOT NULL,
  PRIMARY KEY (`Curso_codigo`, `Materia_codigo`),
  INDEX `fk_Curso_has_Materia_Materia1_idx` (`Materia_codigo` ASC) VISIBLE,
  INDEX `fk_Curso_has_Materia_Curso1_idx` (`Curso_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Materia_Curso1`
    FOREIGN KEY (`Curso_codigo`)
    REFERENCES `UniCC3Mb`.`Curso` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Materia_Materia1`
    FOREIGN KEY (`Materia_codigo`)
    REFERENCES `UniCC3Mb`.`Materia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Disciplina` (
  `codigo` INT NOT NULL,
  `vagas` SMALLINT NULL,
  `semestre` ENUM('1', '2') NULL,
  `Materia_codigo` INT NOT NULL,
  `Professor_matricula` INT NOT NULL,
  PRIMARY KEY (`codigo`, `Materia_codigo`, `Professor_matricula`),
  INDEX `fk_Disciplina_Materia1_idx` (`Materia_codigo` ASC) VISIBLE,
  INDEX `fk_Disciplina_Professor2_idx` (`Professor_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_Materia1`
    FOREIGN KEY (`Materia_codigo`)
    REFERENCES `UniCC3Mb`.`Materia` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disciplina_Professor2`
    FOREIGN KEY (`Professor_matricula`)
    REFERENCES `UniCC3Mb`.`Professor` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Alunos` (
  `matricula` INT NOT NULL,
  `Curso_codigo` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Alunos_Curso1_idx` (`Curso_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Curso1`
    FOREIGN KEY (`Curso_codigo`)
    REFERENCES `UniCC3Mb`.`Curso` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Emails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Emails` (
  `email` INT NOT NULL,
  `Alunos_matricula` INT NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_Emails_Alunos1_idx` (`Alunos_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Emails_Alunos1`
    FOREIGN KEY (`Alunos_matricula`)
    REFERENCES `UniCC3Mb`.`Alunos` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniCC3Mb`.`Disciplina_has_Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniCC3Mb`.`Disciplina_has_Alunos` (
  `Disciplina_codigo` INT NOT NULL,
  `Disciplina_Materia_codigo` INT NOT NULL,
  `Alunos_matricula` INT NOT NULL,
  PRIMARY KEY (`Disciplina_codigo`, `Disciplina_Materia_codigo`, `Alunos_matricula`),
  INDEX `fk_Disciplina_has_Alunos_Alunos1_idx` (`Alunos_matricula` ASC) VISIBLE,
  INDEX `fk_Disciplina_has_Alunos_Disciplina1_idx` (`Disciplina_codigo` ASC, `Disciplina_Materia_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_has_Alunos_Disciplina1`
    FOREIGN KEY (`Disciplina_codigo` , `Disciplina_Materia_codigo`)
    REFERENCES `UniCC3Mb`.`Disciplina` (`codigo` , `Materia_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disciplina_has_Alunos_Alunos1`
    FOREIGN KEY (`Alunos_matricula`)
    REFERENCES `UniCC3Mb`.`Alunos` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
