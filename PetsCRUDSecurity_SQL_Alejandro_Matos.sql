/* 1. Create a user for your database. */
CREATE USER IF NOT EXISTS 'alexjmatos'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'alexjmatos'@'localhost';

/* 2. Create the database employees. */
DROP DATABASE IF EXISTS pets; 
CREATE DATABASE pets;
USE pets;

/* 3. Create table employees with columns socialSecurityNumber, firstName, lastName, birthday, employeeType and departmentName. */
DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
	id INT PRIMARY KEY AUTO_INCREMENT,
    petName VARCHAR(255) NOT NULL,
    petType VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    weight DECIMAL(15,2) NOT NULL,
    height DECIMAL(15,2) NOT NULL
);

/* 4. Add data to the tables */
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Puca', 'DOG', '2019-04-10', 0.9, 20.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Cookie', 'DOG', '2020-09-20', 2.3, 25.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Luna', 'CAT', '2018-07-25', 4.5, 46.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Shadow', 'CAT', '2019-11-12', 5.0, 48.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Tweety', 'BIRD', '2020-01-27', 0.20, 9.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Baldy', 'BIRD', '2020-02-15', 0.15, 8.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Sunny', 'OTHER', '2018-03-21', 3.15, 17.00);
INSERT INTO pets (petName, petType, birthday, weight, height) VALUES ('Ozzy', 'OTHER', '2016-04-10', 13.15, 45.00);