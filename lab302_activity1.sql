-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`authors` (
  `authorID` INT NOT NULL AUTO_INCREMENT,
  `authorName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`authorID`),
  UNIQUE INDEX `authorID_UNIQUE` (`authorID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `bookID` INT NOT NULL AUTO_INCREMENT,
  `bookTitle` VARCHAR(100) NOT NULL,
  `authorID` INT NOT NULL,
  `wordCount` INT NOT NULL,
  `views` INT NOT NULL,
  PRIMARY KEY (`bookID`),
  INDEX `authorID_idx` (`authorID` ASC) VISIBLE,
  UNIQUE INDEX `bookID_UNIQUE` (`bookID` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`authorID`)
    REFERENCES `mydb`.`authors` (`authorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
