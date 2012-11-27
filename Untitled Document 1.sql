SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `libra_development` ;
USE `libra_development` ;

-- -----------------------------------------------------
-- Table `libra_development`.`books`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `libra_development`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(25) NOT NULL ,
  `author` VARCHAR(25) NULL ,
  `classmark` VARCHAR(10) NULL ,
  `category` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libra_development`.`employees`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `libra_development`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fname` VARCHAR(15) NOT NULL ,
  `lname` VARCHAR(15) NOT NULL ,
  `dept` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libra_development`.`book_checkouts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `libra_development`.`book_checkouts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `book_id` INT NOT NULL ,
  `employee_id` INT NULL ,
  `borrow_date` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_book_checkouts_1` (`book_id` ASC) ,
  INDEX `fk_book_checkouts_2` (`employee_id` ASC) ,
  CONSTRAINT `fk_book_checkouts_1`
    FOREIGN KEY (`book_id` )
    REFERENCES `libra_development`.`books` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_checkouts_2`
    FOREIGN KEY (`employee_id` )
    REFERENCES `libra_development`.`employees` (`id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

