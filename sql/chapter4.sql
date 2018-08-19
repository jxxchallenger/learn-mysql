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