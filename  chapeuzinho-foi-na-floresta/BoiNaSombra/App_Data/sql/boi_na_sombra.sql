SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Investidor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Investidor` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Investidor` (
  `InvestidorId` INT NOT NULL AUTO_INCREMENT ,
  `Email` VARCHAR(45) NOT NULL ,
  `Senha` VARCHAR(15) NOT NULL ,
  `Nome` VARCHAR(45) NOT NULL ,
  `DataNasc` VARCHAR(10) NOT NULL ,
  `CPF` VARCHAR(11) NOT NULL ,
  `RG` VARCHAR(45) NOT NULL ,
  `EmissorRG` VARCHAR(8) NOT NULL ,
  `EstadoRG` VARCHAR(2) NOT NULL ,
  `Endereco` VARCHAR(45) NOT NULL ,
  `Cidade` VARCHAR(20) NOT NULL ,
  `Estado` VARCHAR(2) NOT NULL ,
  `CEP` VARCHAR(8) NOT NULL ,
  `FoneResidencial` VARCHAR(13) NOT NULL ,
  `FoneComercial` VARCHAR(13) NULL ,
  `FoneCelular` VARCHAR(13) NOT NULL ,
  `Banco` VARCHAR(30) NOT NULL ,
  `Agencia` VARCHAR(10) NOT NULL ,
  `Conta` VARCHAR(10) NOT NULL ,
  `NivelConta` INT NOT NULL ,
  `Status` TINYINT(1)  NOT NULL ,
  `ImgRG` BLOB NULL ,
  `imgCompResidencia` BLOB NULL ,
  `imgContrato` BLOB NULL ,
  `okRG` BINARY NULL ,
  `okCPF` BINARY NULL ,
  `okResidencia` BINARY NULL ,
  `okContrato` BINARY NULL ,
  `AprovadoPor` INT NOT NULL ,
  `DataAprovacao` VARCHAR(10) NULL ,
  PRIMARY KEY (`InvestidorId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuarios` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `UsuarioId` INT NOT NULL AUTO_INCREMENT ,
  `Nome` VARCHAR(45) NULL ,
  `Privilegio` INT NULL ,
  PRIMARY KEY (`UsuarioId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parceiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Parceiro` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Parceiro` (
  `ParceiroId` INT NOT NULL AUTO_INCREMENT ,
  `Email` VARCHAR(45) NOT NULL ,
  `Senha` VARCHAR(15) NOT NULL ,
  `Nome` VARCHAR(45) NOT NULL ,
  `DataNasc` VARCHAR(10) NOT NULL ,
  `CPF` VARCHAR(11) NOT NULL ,
  `RG` VARCHAR(45) NOT NULL ,
  `EmissorRG` VARCHAR(8) NOT NULL ,
  `EstadoRG` VARCHAR(2) NOT NULL ,
  `Endereco` VARCHAR(45) NOT NULL ,
  `Cidade` VARCHAR(20) NOT NULL ,
  `Estado` VARCHAR(2) NOT NULL ,
  `CEP` VARCHAR(8) NOT NULL ,
  `FoneResidencial` VARCHAR(13) NOT NULL ,
  `FoneComercial` VARCHAR(13) NULL ,
  `FoneCelular` VARCHAR(13) NOT NULL ,
  `Banco` VARCHAR(30) NOT NULL ,
  `Agencia` VARCHAR(10) NOT NULL ,
  `Conta` VARCHAR(10) NOT NULL ,
  `NivelConta` INT NOT NULL ,
  `ImgRG` BLOB NULL ,
  `imgCompResidencia` BLOB NULL ,
  `imgContrato` BLOB NULL ,
  `okRG` BINARY NULL ,
  `okCPF` BINARY NULL ,
  `okResidencia` BINARY NULL ,
  `okContrato` BINARY NULL ,
  `AprovadoPor` INT NOT NULL ,
  `DataAprovacao` VARCHAR(10) NULL ,
  PRIMARY KEY (`ParceiroId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Contrato` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Contrato` (
  `InvestidorId` INT NOT NULL ,
  `ParceiroId` INT NOT NULL ,
  `Data` VARCHAR(10) NULL ,
  PRIMARY KEY (`InvestidorId`, `ParceiroId`) ,
  INDEX `fk_Investidor_has_Parceiro_Parceiro1` (`ParceiroId` ASC) ,
  INDEX `fk_Investidor_has_Parceiro_Investidor` (`InvestidorId` ASC) ,
  CONSTRAINT `fk_Investidor_has_Parceiro_Investidor`
    FOREIGN KEY (`InvestidorId` )
    REFERENCES `mydb`.`Investidor` (`InvestidorId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Investidor_has_Parceiro_Parceiro1`
    FOREIGN KEY (`ParceiroId` )
    REFERENCES `mydb`.`Parceiro` (`ParceiroId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fazendas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fazendas` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fazendas` (
  `FazendaId` INT NOT NULL ,
  `ParceiroId` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `Hectares` INT NULL ,
  `Localizacao` VARCHAR(45) NULL ,
  PRIMARY KEY (`FazendaId`, `ParceiroId`) ,
  INDEX `fk_Fazendas_Parceiro1` (`ParceiroId` ASC) ,
  CONSTRAINT `fk_Fazendas_Parceiro1`
    FOREIGN KEY (`ParceiroId` )
    REFERENCES `mydb`.`Parceiro` (`ParceiroId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
