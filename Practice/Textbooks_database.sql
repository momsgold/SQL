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
Textbook      VARCHAR(50)      NOT NULL,
Buyer         VARCHAR(50)      NOT NULL,
ProductID	  INT			   NOT NULL,
FOREIGN KEY (Textbook) REFERENCES Products(Textbook)
);

-- insert rows into BuyerInformation table
INSERT INTO BuyerInformation VALUES
(1, 'thermodynamics', 'rachael baumann', 2),
(2, 'thermodynamics', 'john falconer', 2),
(3, 'calculus 3', 'neil hendren', 3);

-- create Invoice table
CREATE TABLE Invoice
(
ID				INT				PRIMARY KEY     AUTO_INCREMENT,
Textbook	    VARCHAR(50)     NOT NULL,
OrderNumber     INT             NOT NULL,
ProductID		int				NOT NULL,
FOREIGN KEY (Textbook) REFERENCES Products(Textbook)
);

-- insert rows into Invoice table
INSERT INTO Invoice VALUES
(1, 'Fluid Dynamics', 123, 1),
(2, 'Thermodynamics', 456, 2),
(3, 'Fluid Dynamics', 789, 1);


-- insert additional rows into products table
INSERT INTO Products VALUES
(4, 'Separations and Mass Transfer', 325.00),
(5, 'Physical Chemicstry', 275.00);

-- insert additional rows into buyerinformation table
INSERT INTO BuyerInformation VALUES
(4, 'Physical Chemicstry', 'rachael baumann', 4),
(5, 'Physical Chemicstry', 'john falconer', 4);

-- insert additional rows into invoice table
INSERT INTO Invoice VALUES
(4, 'Separations and Mass Transfer', 101112, 4),
(5, 'Physical Chemicstry', 131415, 3);

-- join products and buyerinformation
SELECT p.ProductID, p.Textbook, Price, buyer, bi.ID
  FROM
	  Products p 
         INNER JOIN
	  BuyerInformation bi
         ON p.ProductID = bi.ID;
         
-- join all three tables
SELECT p.Textbook, Price, Buyer, OrderNumber
  FROM
	Products p
         INNER JOIN
    BuyerInformation bi
         ON p.ProductID = bi.ID
    Invoice iv
         ON iv.ID = p.ProductID;
         
-- select even ID's from products textbook in products
SELECT DISTINCT Textbook FROM Products
		  WHERE MOD(ProductID, 2) = 0;

-- update price of Fluid Dyanamics book
UPDATE Products SET Price = 275 WHERE ProductID = 1;

-- insert row 6 into Products
INSERT INTO Products VALUES
(6, 'Organinc Chemistry', 315.00);

-- delete ID 6 from Products
DELETE FROM Products WHERE ProductID = 6;