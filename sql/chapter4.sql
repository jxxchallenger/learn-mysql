CREATE DATABASE IF NOT EXISTS rookery
DEFAULT CHARACTER SET = utf8
DEFAULT COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `birds` (
  `bird_id` INT NOT NULL AUTO_INCREMENT,
  `scientific_name` VARCHAR(255) DEFAULT NULL,
  `common_name` VARCHAR(50) DEFAULT NULL,
  `family_id` INT DEFAULT NULL,
  `description` TEXT,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO birds(scientific_name, common_name)
VALUES('Charadrius vociferus', 'killdeer'),
('Gavia immer', 'Great Northern Loon'),
('Aix sponsa', 'Wood Duck'),
('Chordeiles minor', 'Common Nighthawk'),
('Sitta carolinensis', 'White-breasted Nuthatch'),
('Apteryx mantelli', 'North Island Brown Kiwi');

CREATE DATABASE IF NOT EXISTS birdwatchers
DEFAULT CHARACTER SET = utf8
DEFAULT COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS birdwatchers.humans (
  `human_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `formal_title` VARCHAR(25) DEFAULT NULL,
  `name_first` VARCHAR(25) DEFAULT NULL,
  `name_last` VARCHAR(25) DEFAULT NULL,
  `email_address` VARCHAR(255)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO birdwatchers.humans(formal_title, name_first, name_last, email_address)
VALUES
('Mr.', 'Russell', 'Dyer', 'russel@qq.com'),
('Mr.', 'Richard', 'Stringer', 'richard@qq.com'),
('Ms.', 'Rusty', 'Osborne', 'rusty@qq.com'),
('Ms.', 'Lexi', 'Hollar', 'lexi@qq.com');

CREATE TABLE IF NOT EXISTS rookery.bird_families (
	family_id INT AUTO_INCREMENT PRIMARY KEY,
  scientific_name VARCHAR(255) UNIQUE,
  brief_description VARCHAR(255)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS rookery.bird_orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  scientific_name VARCHAR(255) UNIQUE,
  brief_description VARCHAR(255),
  order_image BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE bird_orders;

CREATE TABLE IF NOT EXISTS rookery.bird_orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  scientific_name VARCHAR(255) UNIQUE,
  brief_description TEXT,
  order_image BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS rookery.birds_wing_shapes (
  wing_id CHAR(2) UNIQUE,
  wing_shape CHAR(25),
  wing_example BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

SHOW CREATE TABLE birds_wing_shapes;

CREATE TABLE IF NOT EXISTS rookery.birds_body_shapes (
  body_id CHAR(3) UNIQUE,
  body_shape CHAR(25),
  body_example BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS rookery.birds_bill_shapes (
  bill_id CHAR(2) UNIQUE,
  bill_shape CHAR(25),
  bill_example BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;

#--------------------- chapter 5 ------------------------

ALTER TABLE rookery.bird_families ADD COLUMN order_id INT;

ALTER TABLE rookery.birds ADD COLUMN wing_id CHAR(2);

ALTER TABLE rookery.birds DROP COLUMN wing_id;

ALTER TABLE rookery.birds ADD COLUMN wing_id CHAR(2) AFTER family_id;

ALTER TABLE rookery.birds ADD COLUMN body_id CHAR(2) AFTER wing_id,
ADD COLUMN bill_id CHAR(2) AFTER body_id,
ADD COLUMN endanger BIT DEFAULT b'1' AFTER bill_id,
CHANGE COLUMN common_name common_name VARCHAR(255);

UPDATE rookery.`birds` SET endanger = 0 WHERE bird_id IN (1, 2, 4, 5);

ALTER TABLE rookery.birds MODIFY COLUMN endanger
ENUM(
  'Extinct',
  'Extinct in wild',
  'Threatened - Critically Endangered',
  'Threatened - Endangered',
  'Threatened - Vulnerable',
  'Lower Risk - Conservation Dependent',
  'Lower Risk - Near Threatened',
  'Lower Risk - Least Concern'
) AFTER family_id;

CREATE TABLE IF NOT EXISTS rookery.conservation_status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  conservation_category CHAR(10),
  conservation_state CHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO rookery.`conservation_status`(conservation_category, conservation_state) 
VALUES('Extinct', 'Extinct'),
('Extinct', 'Extinct in wild'),
('Threatened', 'Critically Endangered'),
('Threatened', 'Endangered'),
('Threatened', 'Vulnerable'),
('Lower Risk', 'Conservation Dependent'),
('Lower Risk', 'Near Threatened'),
('Lower Risk', 'Least Concern');

ALTER TABLE rookery.`birds` CHANGE COLUMN endanger conservation_status_id INT DEFAULT 8;

ALTER TABLE rookery.`birds` AUTO_INCREMENT = 10;

CREATE TABLE IF NOT EXISTS rookery.birds_new LIKE rookery.`birds`;

CREATE TABLE IF NOT EXISTS rookery.birds_details SELECT bird_id, description FROM rookery.`birds`;

ALTER TABLE rookery.`birds` DROP COLUMN description;

ALTER TABLE birdwatchers.`humans` ADD INDEX human_names (name_last, name_first);

ALTER TABLE rookery.`conservation_status` DROP PRIMARY KEY,
CHANGE status_id conservation_status_id INT PRIMARY KEY AUTO_INCREMENT;
