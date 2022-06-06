-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sts
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sts` DEFAULT CHARACTER SET utf8 ;
USE `sts` ;

-- -----------------------------------------------------
-- Table `sts`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`player` (
  `player_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_name` VARCHAR(45) NOT NULL,
  `time_played` TIME NOT NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`character` (
  `character_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `character_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`character_id`),
  UNIQUE INDEX `character_id_UNIQUE` (`character_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`encounter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`encounter` (
  `encounter_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `encounter_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`encounter_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`completion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`completion` (
  `completion_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `encounter_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`completion_id`),
  INDEX `fk_death_encounter1_idx` (`encounter_id` ASC) VISIBLE,
  CONSTRAINT `fk_completion_encounter1`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `sts`.`encounter` (`encounter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`run`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`run` (
  `run_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` INT UNSIGNED NOT NULL,
  `character_id` INT UNSIGNED NOT NULL,
  `completion_id` INT UNSIGNED NOT NULL,
  `time` TIME NOT NULL,
  `ascension` INT NOT NULL,
  `floor` INT NOT NULL,
  `patch` DOUBLE NOT NULL,
  PRIMARY KEY (`run_id`),
  INDEX `fk_run_player1_idx` (`player_id` ASC) VISIBLE,
  INDEX `fk_run_character1_idx` (`character_id` ASC) VISIBLE,
  INDEX `fk_run_death1_idx` (`completion_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `sts`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_character`
    FOREIGN KEY (`character_id`)
    REFERENCES `sts`.`character` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_death`
    FOREIGN KEY (`completion_id`)
    REFERENCES `sts`.`completion` (`completion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`relic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`relic` (
  `relic_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `relic_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`relic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`card` (
  `card_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `character_id` INT UNSIGNED NOT NULL,
  `card_name` VARCHAR(45) NOT NULL,
  `keyword` VARCHAR(45) NOT NULL,
  `type` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`card_id`),
  INDEX `fk_card_character1_idx` (`character_id` ASC) VISIBLE,
  CONSTRAINT `fk_card_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `sts`.`character` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`enemy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`enemy` (
  `enemy_id` INT NOT NULL AUTO_INCREMENT,
  `enemy_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`enemy_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`potion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`potion` (
  `potion_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `potion_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`potion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`run_has_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`run_has_card` (
  `run_id` INT UNSIGNED NOT NULL,
  `card_id` INT UNSIGNED NOT NULL,
  `card_taken` TINYINT NOT NULL,
  `card_used` INT NULL,
  `card_removed` TINYINT NULL,
  `card_bought` TINYINT NULL,
  PRIMARY KEY (`run_id`, `card_id`),
  INDEX `fk_run_has_card_card1_idx` (`card_id` ASC) VISIBLE,
  INDEX `fk_run_has_card_run1_idx` (`run_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_has_card_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `sts`.`run` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_card_card1`
    FOREIGN KEY (`card_id`)
    REFERENCES `sts`.`card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`run_has_relic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`run_has_relic` (
  `run_id` INT UNSIGNED NOT NULL,
  `relic_id` INT UNSIGNED NOT NULL,
  `relic_taken` VARCHAR(45) NOT NULL,
  `relic_bought` VARCHAR(45) NULL,
  PRIMARY KEY (`run_id`, `relic_id`),
  INDEX `fk_run_has_relic_relic1_idx` (`relic_id` ASC) VISIBLE,
  INDEX `fk_run_has_relic_run1_idx` (`run_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_has_relic_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `sts`.`run` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_relic_relic1`
    FOREIGN KEY (`relic_id`)
    REFERENCES `sts`.`relic` (`relic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`run_has_encounter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`run_has_encounter` (
  `run_id` INT UNSIGNED NOT NULL,
  `encounter_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`run_id`, `encounter_id`),
  INDEX `fk_run_has_encounter_encounter1_idx` (`encounter_id` ASC) VISIBLE,
  INDEX `fk_run_has_encounter_run1_idx` (`run_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_has_encounter_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `sts`.`run` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_encounter_encounter1`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `sts`.`encounter` (`encounter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`run_has_potion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`run_has_potion` (
  `run_id` INT UNSIGNED NOT NULL,
  `potion_id` INT UNSIGNED NOT NULL,
  `potion_taken` TINYINT NOT NULL,
  `potion_used` TINYINT NOT NULL,
  `potion_bought` TINYINT NULL,
  `potion_dropped` TINYINT NULL,
  PRIMARY KEY (`run_id`, `potion_id`),
  INDEX `fk_run_has_potion_potion1_idx` (`potion_id` ASC) VISIBLE,
  INDEX `fk_run_has_potion_run1_idx` (`run_id` ASC) VISIBLE,
  CONSTRAINT `fk_run_has_potion_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `sts`.`run` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_potion_potion1`
    FOREIGN KEY (`potion_id`)
    REFERENCES `sts`.`potion` (`potion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sts`.`encounter_has_enemy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sts`.`encounter_has_enemy` (
  `encounter_id` INT UNSIGNED NOT NULL,
  `enemy_id` INT NOT NULL,
  PRIMARY KEY (`encounter_id`, `enemy_id`),
  INDEX `fk_encounter_has_enemy1_enemy1_idx` (`enemy_id` ASC) VISIBLE,
  INDEX `fk_encounter_has_enemy1_encounter1_idx` (`encounter_id` ASC) VISIBLE,
  CONSTRAINT `fk_encounter_has_enemy1_encounter1`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `sts`.`encounter` (`encounter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encounter_has_enemy1_enemy1`
    FOREIGN KEY (`enemy_id`)
    REFERENCES `sts`.`enemy` (`enemy_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
