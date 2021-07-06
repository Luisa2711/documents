-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema InfoVuelo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema InfoVuelo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `InfoVuelo` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema vuelo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vuelo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vuelo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `InfoVuelo` ;

-- -----------------------------------------------------
-- Table `InfoVuelo`.`Aerolinea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Aerolinea` (
  `idAerolinea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAerolinea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Avion` (
  `idAvion` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Capacidad` VARCHAR(45) NOT NULL,
  `Aerolinea_idAerolinea` INT NOT NULL,
  PRIMARY KEY (`idAvion`, `Aerolinea_idAerolinea`),
  INDEX `fk_Avion_Aerolinea1_idx` (`Aerolinea_idAerolinea` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Aeropuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Aeropuerto` (
  `idAeropuerto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idAeropuerto`, `Pais_idPais`),
  INDEX `fk_Aeropuerto_Pais1_idx` (`Pais_idPais` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Pasajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Pasajero` (
  `idPasajero` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Tipo_documento` VARCHAR(45) NOT NULL,
  `Num_documento` INT NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idPasajero`, `Pais_idPais`),
  INDEX `fk_Pasajero_Pais1_idx` (`Pais_idPais` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Precio` INT NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Observaciones` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idReserva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Pago` (
  `idPago` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Total` INT NOT NULL,
  `Pasajero_idPasajero` INT NOT NULL,
  `Reserva_idReserva` INT NOT NULL,
  PRIMARY KEY (`idPago`, `Pasajero_idPasajero`, `Reserva_idReserva`),
  INDEX `fk_Pago_Pasajero1_idx` (`Pasajero_idPasajero` ASC) VISIBLE,
  INDEX `fk_Pago_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Tarifa` (
  `idTarifa` INT NOT NULL,
  `Clase` VARCHAR(10) NOT NULL,
  `Precio` INT NOT NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Asiento` (
  `idAsiento` INT NOT NULL,
  `Letra` VARCHAR(2) NOT NULL,
  `Fila` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idAsiento`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `InfoVuelo`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InfoVuelo`.`Vuelo` (
  `Aeropuerto_idAeropuerto1` INT NOT NULL,
  `Aeropuerto_Pais_idPais` INT NOT NULL,
  `Reserva_idReserva` INT NOT NULL,
  `Tarifa_idTarifa` INT NOT NULL,
  `Avion_idAvion` INT NOT NULL,
  `Asiento_idAsiento1` INT NOT NULL,
  PRIMARY KEY (`Aeropuerto_idAeropuerto1`, `Aeropuerto_Pais_idPais`, `Reserva_idReserva`, `Tarifa_idTarifa`, `Avion_idAvion`, `Asiento_idAsiento1`),
  INDEX `fk_Vuelo_Aeropuerto1_idx` (`Aeropuerto_idAeropuerto1` ASC, `Aeropuerto_Pais_idPais` ASC) VISIBLE,
  INDEX `fk_Vuelo_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE,
  INDEX `fk_Vuelo_Tarifa1_idx` (`Tarifa_idTarifa` ASC) VISIBLE,
  INDEX `fk_Vuelo_Avion1_idx` (`Avion_idAvion` ASC) VISIBLE,
  INDEX `fk_Vuelo_Asiento1_idx` (`Asiento_idAsiento1` ASC) VISIBLE)
ENGINE = InnoDB;

USE `vuelo` ;

-- -----------------------------------------------------
-- Table `vuelo`.`aerolinea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`aerolinea` (
  `idAerolinea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idAerolinea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`aeropuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`aeropuerto` (
  `idAeropuerto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `idPais` INT NOT NULL,
  PRIMARY KEY (`idAeropuerto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`asiento` (
  `idAsiento` INT NOT NULL AUTO_INCREMENT,
  `letra` VARCHAR(2) NULL DEFAULT NULL,
  `fila` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`idAsiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`avion` (
  `idAvion` INT NOT NULL AUTO_INCREMENT,
  `idAerolinea` INT NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  `capacidad` INT NOT NULL,
  PRIMARY KEY (`idAvion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`pago` (
  `idPago` INT NOT NULL AUTO_INCREMENT,
  `idReserva` INT NOT NULL,
  `idPasajero` INT NOT NULL,
  `total` DOUBLE(10,2) NOT NULL,
  `fecha` DATE NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`idPago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`pasajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`pasajero` (
  `idPasajero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `tipo_documento` VARCHAR(30) NOT NULL,
  `num_documento` INT NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idPasajero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `costo` DOUBLE(10,2) NOT NULL,
  `fecha` DATE NULL DEFAULT '0000-00-00',
  `observacion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idReserva`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`tarifa` (
  `idTarifa` INT NOT NULL AUTO_INCREMENT,
  `precio` DECIMAL(10,2) NOT NULL,
  `clase` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vuelo`.`vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vuelo`.`vuelo` (
  `idAsiento` INT NOT NULL AUTO_INCREMENT,
  `idAeropuerto` INT NOT NULL,
  `idReserva` INT NOT NULL,
  `idAvion` INT NOT NULL,
  `idTarifa` INT NOT NULL,
  PRIMARY KEY (`idAsiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
