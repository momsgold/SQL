-- create and select the database
DROP DATABASE IF EXISTS mathematica;
CREATE DATABASE mathematica;
USE mathematica;

-- create Demonstrations table
CREATE TABLE Demonstrations
(
ID			INT					PRIMARY KEY			AUTO_INCREMENT,
Demos		VARCHAR(50)			NOT NULL			UNIQUE
);

-- insert rows into Demonstrations table
INSERT INTO Demonstrations VALUES
(1, 'Forces on a Partially Submerged Gate'),
(2, 'Vapor-Liquid-Liquid Equilibrium'),
(3, 'Fugacities in an Ideal Binary Mixture'),
(4, 'Transient Conduction therough a Plane Wall');


-- create Author table
CREATE TABLE Author
(
ID				INT					PRIMARY KEY			AUTO_INCREMENT,
Demo			VARCHAR(50)			NOT NULL,
Author			VARCHAR(50)			NOT NULL,
CoAuthor		VARCHAR(50)			NULL,
FOREIGN KEY (Demo) REFERENCES Demonstrations (Demos)
-- FOREIGN KEY (Demo) REFERENCES Demonstrations (Demos)
);

-- insert rows into Author table
INSERT INTO Author VALUES
(1, 'Forces on a Partially Submerged Gate', 'Rachael Baumann', 'Neil Hendren'),
(2, 'Vapor-Liquid-Liquid Equilibrium', 'Megan MaGuire', 'Neil Hendren'),
(3, 'Fugacitites in an Ideal Binary Mixture', 'Garrison Vigil', NULL),
(4, 'Transient Conduction through a Plane Wall', 'Rachel Saker', 'Rachael Baumann');