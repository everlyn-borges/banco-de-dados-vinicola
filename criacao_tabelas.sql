-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vinicola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vinicola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vinicola` DEFAULT CHARACTER SET utf8 ;
USE `vinicola` ;

-- -----------------------------------------------------
-- Table `vinicola`.`Regiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vinicola`.`Regiao` (
  `codRegiao` BIGINT NOT NULL AUTO_INCREMENT,
  `nomeRegiao` VARCHAR(100) NOT NULL,
  `descricaoRegiao` TEXT NULL,
  PRIMARY KEY (`codRegiao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vinicola`.`Vinicola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vinicola`.`Vinicola` (
  `codVinicola` BIGINT NOT NULL AUTO_INCREMENT,
  `nomeVinicola` VARCHAR(100) NOT NULL,
  `descricaoVinicola` TEXT NULL,
  `foneVinicola` VARCHAR(15) NULL,
  `emailVinicola` VARCHAR(15) NULL,
  `codRegiao` BIGINT NOT NULL,
  PRIMARY KEY (`codVinicola`),
  INDEX `codRegiao_idx` (`codRegiao` ASC) VISIBLE,
  CONSTRAINT `codRegiao`
    FOREIGN KEY (`codRegiao`)
    REFERENCES `vinicola`.`Regiao` (`codRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vinicola`.`Vinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vinicola`.`Vinho` (
  `codVinho` BIGINT NOT NULL AUTO_INCREMENT,
  `nomeVinho` VARCHAR(50) NOT NULL,
  `tipoVinho` VARCHAR(30) NOT NULL,
  `anoVinho` INT NOT NULL,
  `descricaoVinho` TEXT NULL,
  `codVinicola` BIGINT NOT NULL,
  PRIMARY KEY (`codVinho`),
  INDEX `codVinicola_idx` (`codVinicola` ASC) VISIBLE,
  CONSTRAINT `codVinicola`
    FOREIGN KEY (`codVinicola`)
    REFERENCES `vinicola`.`Vinicola` (`codVinicola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
