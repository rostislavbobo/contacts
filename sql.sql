USE contacts_rostislav;

# DROP TABLE IF EXISTS phone;
# DROP TABLE IF EXISTS attachment;
# DROP TABLE IF EXISTS address;
# DROP TABLE IF EXISTS people;

CREATE TABLE `people` (
  `id`                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name`          VARCHAR(20)      NOT NULL,
  `last_name`           VARCHAR(20)      NOT NULL,
  `sur_name`            VARCHAR(20),
  `birth_date`          TIMESTAMP        NULL,
  `sex`                 ENUM('m', 'f'),
  `nationality`         VARCHAR(20),
  `relationship_status` ENUM('nosel', 'sngl', 'rel', 'eng', 'mar', 'lov', 'cmpl', 'srch'),
  `web_site`            VARCHAR(50),
  `email`               VARCHAR(50)      NOT NULL UNIQUE,
  `job`                 VARCHAR(50),
  `photo`               MEDIUMBLOB,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;

CREATE TABLE `address` (
  `id`        INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `people_id` INT(11) UNSIGNED NOT NULL,
  `country`   VARCHAR(20)      NOT NULL,
  `city`      VARCHAR(20),
  `street`    VARCHAR(50),
  `house`     VARCHAR(10),
  `apartment` VARCHAR(10),
  `index`     VARCHAR(10),
  PRIMARY KEY (`id`),
  FOREIGN KEY (people_id) REFERENCES people (id)
    ON DELETE CASCADE
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;

CREATE TABLE `attachment` (
  `id`              INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `people_id`       INT(11) UNSIGNED NOT NULL,
  `attachment_name` VARCHAR(50)      NOT NULL,
  `birth_date`      TIMESTAMP        NOT NULL,
  `comment`         VARCHAR(200),
  PRIMARY KEY (`id`),
  FOREIGN KEY (people_id) REFERENCES people (id)
    ON DELETE CASCADE
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;

CREATE TABLE `phone` (
  `id`            INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `people_id`     INT(11) UNSIGNED NOT NULL,
  `country_code`  VARCHAR(5),
  `operator_code` VARCHAR(5),
  `phone_number`  VARCHAR(7)       NOT NULL,
  `phone_type`    ENUM('h', 'm'),
  `comment`       VARCHAR(200),
  PRIMARY KEY (`id`),
  FOREIGN KEY (people_id) REFERENCES people (id)
    ON DELETE CASCADE
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;


INSERT INTO people (first_name, last_name, sur_name, birth_date, sex, nationality, relationship_status, web_site, email, job)
VALUES (first1, last1, surname1, ?, ?, ?, ?, ?, ?, ?)