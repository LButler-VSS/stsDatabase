USE `sts` ;
-- -----------------------------------------------------
-- Table `sts`.`character`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/character.csv' 
INTO TABLE `sts`.`character` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`encounter`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/encounter.csv' 
INTO TABLE `sts`.`encounter` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`run`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/run.csv' 
INTO TABLE `sts`.`run` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`relic`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/relic.csv' 
INTO TABLE `sts`.`relic` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`card`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/card.csv' 
INTO TABLE `sts`.`card` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`enemy`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/enemy.csv' 
INTO TABLE `sts`.`enemy` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`potion`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/potion.csv' 
INTO TABLE `sts`.`potion` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`run_has_card`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/run_has_card.csv' 
INTO TABLE `sts`.`run_has_card` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`run_has_relic`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/run_has_relic.csv' 
INTO TABLE `sts`.`run_has_relic` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`run_has_encounter`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/run_has_encounter.csv' 
INTO TABLE `sts`.`run_has_encounter` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`run_has_potion`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/run_has_potion.csv' 
INTO TABLE `sts`.`run_has_potion` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -----------------------------------------------------
-- Table `sts`.`encounter_has_enemy`
-- -----------------------------------------------------
LOAD DATA INFILE '/csv tables/encounter_has_enemy.csv' 
INTO TABLE `sts`.`encounter_has_enemy` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
