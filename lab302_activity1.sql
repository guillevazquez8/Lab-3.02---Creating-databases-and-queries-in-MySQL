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
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `authorID_UNIQUE` (`author_id` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO authors (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_title` VARCHAR(100) NOT NULL,
  `author_id` INT NOT NULL,
  `word_count` INT NOT NULL,
  `views` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `author_id_idx` (`author_id` ASC) VISIBLE,
  UNIQUE INDEX `book_id_UNIQUE` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO books (book_title, author_id, word_count, views) VALUES
('Best Paint Colors', 1, 814, 14),
('Small Space Decorating Tips', 2, 1146, 221),
('Hot Accessories', 1, 986, 105),
('Mixing Textures', 1, 765, 22),
('Kitchen Refresh', 2, 1242, 307),
('Homemade Art Hacks', 1, 1002, 193),
('Refinishing Wood Floors', 3, 1571, 7542);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
