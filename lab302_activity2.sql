-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab3.02_activity2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lab3.02_activity2` ;

-- -----------------------------------------------------
-- Schema lab3.02_activity2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab3.02_activity2` DEFAULT CHARACTER SET utf8 ;
USE `lab3.02_activity2` ;

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`customers` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(45) NOT NULL,
  `customerStatus` VARCHAR(45) NULL DEFAULT 'None',
  `customerTotalMileage` INT NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE INDEX `customerID_UNIQUE` (`customerID` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO customers (customerName, customerStatus, customerTotalMileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`aircrafts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`aircrafts` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`aircrafts` (
  `aircraftID` INT NOT NULL AUTO_INCREMENT,
  `aircraftModel` VARCHAR(45) NOT NULL,
  `aircraftTotalSeats` INT NOT NULL,
  PRIMARY KEY (`aircraftID`),
  UNIQUE INDEX `aircraftID_UNIQUE` (`aircraftID` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO aircrafts (aircraftModel, aircraftTotalSeats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`flights`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`flights` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`flights` (
  `flightID` INT NOT NULL AUTO_INCREMENT,
  `flightNumber` VARCHAR(45) NOT NULL,
  `flightMileage` INT NOT NULL,
  `aircraftID` INT NOT NULL,
  PRIMARY KEY (`flightID`),
  UNIQUE INDEX `flightID_UNIQUE` (`flightID` ASC) VISIBLE,
  INDEX `fk_flight_aircraft_idx` (`aircraftID` ASC) INVISIBLE,
  CONSTRAINT `fk_flight_aircraft`
    FOREIGN KEY (`aircraftID`)
    REFERENCES `lab3.02_activity2`.`aircrafts` (`aircraftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO flights (flightNumber, flightMileage, aircraftID) VALUES
('DL143', 135, 1),
('DL122', 4370, 2),
('DL53', 2078, 3),
('DL222', 1765, 3),
('DL37', 531, 1);

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`customerDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`customerDetails` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`customerDetails` (
  `customerDetailsID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `flightID` INT NOT NULL,
  PRIMARY KEY (`customerDetailsID`),
  UNIQUE INDEX `customerDetailsID_UNIQUE` (`customerDetailsID` ASC) VISIBLE,
  INDEX `fk_customerDetails_flight_idx` (`flightID` ASC) VISIBLE,
  INDEX `fk_customerDetails_customer_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_customerDetails_flight`
    FOREIGN KEY (`flightID`)
    REFERENCES `lab3.02_activity2`.`flights` (`flightID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customerDetails_customer`
    FOREIGN KEY (`customerID`)
    REFERENCES `lab3.02_activity2`.`customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO customerDetails (customerID, flightID) VALUES
(1, 1),
(1, 2),
(1, 1),
(1, 1),
(1, 1),
(2, 2),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 1),
(4, 5),
(5, 1),
(5, 2),
(6, 4),
(7, 4),
(8, 4);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
