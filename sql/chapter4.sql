CREATE DATABASE IF NOT EXISTS rookery
DEFAULT CHARACTER SET = utf8
DEFAULT COLLATE=utf8_general_ci;

CREATE TABLE `birds` (
  `bird_id` INT(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` VARCHAR(255) DEFAULT NULL,
  `common_name` VARCHAR(50) DEFAULT NULL,
  `family_id` INT(11) DEFAULT NULL,
  `description` TEXT,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;