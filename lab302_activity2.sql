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
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_status` VARCHAR(45) NULL DEFAULT 'None',
  `customer_total_mileage` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customerID_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO customers (customer_name, customer_status, customer_total_mileage) VALUES
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
  `aircraft_id` INT NOT NULL AUTO_INCREMENT,
  `aircraft_model` VARCHAR(45) NOT NULL,
  `aircraft_total_seats` INT NOT NULL,
  PRIMARY KEY (`aircraft_id`),
  UNIQUE INDEX `aircraftID_UNIQUE` (`aircraft_id` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO aircrafts (aircraft_model, aircraft_total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`flights`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`flights` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`flights` (
  `flight_id` INT NOT NULL AUTO_INCREMENT,
  `flight_number` VARCHAR(45) NOT NULL,
  `flight_mileage` INT NOT NULL,
  `aircraft_id` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE INDEX `flightID_UNIQUE` (`flight_id` ASC) VISIBLE,
  INDEX `fk_flight_aircraft_idx` (`aircraft_id` ASC) INVISIBLE,
  CONSTRAINT `fk_flight_aircraft`
    FOREIGN KEY (`aircraft_id`)
    REFERENCES `lab3.02_activity2`.`aircrafts` (`aircraft_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO flights (flight_number, flight_mileage, aircraft_id) VALUES
('DL143', 135, 1),
('DL122', 4370, 2),
('DL53', 2078, 3),
('DL222', 1765, 3),
('DL37', 531, 1);

-- -----------------------------------------------------
-- Table `lab3.02_activity2`.`customer_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3.02_activity2`.`customer_details` ;

CREATE TABLE IF NOT EXISTS `lab3.02_activity2`.`customer_details` (
  `customer_details_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  PRIMARY KEY (`customer_details_id`),
  UNIQUE INDEX `customer_details_id_UNIQUE` (`customer_details_id` ASC) VISIBLE,
  INDEX `fk_customer_details_flight_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_customer_details_customer_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_details_flight`
    FOREIGN KEY (`flight_id`)
    REFERENCES `lab3.02_activity2`.`flights` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_details_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab3.02_activity2`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO customerDetails (customer_id, flight_id) VALUES
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
