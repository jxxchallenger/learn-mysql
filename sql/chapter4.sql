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