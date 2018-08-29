-- create and select the database
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

-- create the Product table
CREATE TABLE Accounts
 (
  ProductID      INT            PRIMARY KEY  AUTO_INCREMENT,
  AccountHolder  VARCHAR(20)    NOT NULL     UNIQUE,
  Balance        DECIMAL(10,2)  NOT NULL,
  Fees           DECIMAL(10,2)  NOT NULL
);

-- insert some rows into the Product table
INSERT INTO Accounts VALUES
(1, 'rachael baumann', 8888.00, 250.00),
(2, 'michael page', 5444.00, 175.00),
(3, 'angie snyder', 3333.00, 88.00),
(4, 'robert mahoney', 3322.00, 88.00);

CREATE TABLE Transactions
 (
  ID             INT            PRIMARY KEY  AUTO_INCREMENT,
  Amount         DECIMAL(10,2)  NOT NULL,
  TransType      VARCHAR(20)    NOT NULL,
  AccountID      INT            NOT NULL,
  FOREIGN KEY (AccountID) REFERENCES Accounts(ProductID)
);

INSERT INTO Transactions VALUES
(1, 500.00, 'deposit', 3),
(2, -200.00, 'withdrawl', 4),
(3, 200.00, 'deposit', 4),
(4, 248.00, 'deposit', 1);

-- create a user and grant privileges to that user
-- GRANT SELECT, INSERT, DELETE, UPDATE
-- ON bank_db.*
-- TO bank_db_user@localhost
-- IDENTIFIED BY 'password';