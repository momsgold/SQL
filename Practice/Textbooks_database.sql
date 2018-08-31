-- create and select the database
DROP DATABASE IF EXISTS textbooks_db;
CREATE DATABASE textbooks_db;
USE textbooks_db;

-- create the Products table
CREATE TABLE Products
 (
  ProductID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Textbook       VARCHAR(50)    NOT NULL     UNIQUE,
  Price          DECIMAL(5,2)  NOT NULL
);

-- insert some rows into the Products table
INSERT INTO Products VALUES
(1, 'Fluid Dynamics', 250.00),
(2, 'Thermodynamics', 300.00),
(3, 'Calculus 3', 185.00);

-- create the BuyerInformation table
CREATE TABLE BuyerInformation
(
ID            INT              PRIMARY KEY     AUTO_INCREMENT,
Textbooks     VARCHAR(50)      NOT NULL,
Buyer         VARCHAR(50)      NOT NULL,
FOREIGN KEY (Textbooks) REFERENCES Products(Textbook)
);

-- insert rows into BuyerInformation table
INSERT INTO BuyerInformation VALUES
(1, 'thermodynamics', 'rachael baumann'),
(2, 'thermodynamics', 'john falconer'),
(3, 'calculus 3', 'neil hendren');

-- insert row into table
INSERT INTO Products VALUES
(4, 'Separations and Mass Transfer', 325.00),
(5, 'Physical Chemicstry', 275.00);

INSERT INTO BuyerInformation VALUES
(4, 'Physical Chemicstry', 'rachael baumann'),
(5, 'Physical Chemicstry', 'john falconer');

-- combine tables
SELECT Textbooks, Buyer, Textbook, Price
  FROM
      BuyerInformation bi
          INNER JOIN
	  Products p 
		  ON bi.ID = p.ProductID;