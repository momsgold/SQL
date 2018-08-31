-- insert a row into account table
INSERT INTO Accounts VALUES
(5, 'hillary clinton', 200000.00, 0.00);

-- insert a row into accounts, using only 3 field titles
INSERT INTO Accounts (AccountHolder, Balance, Fees)
     VALUES ('dave grohl', 5000000.00, 0.00);
   
-- TRY to insert a row into accounts, but the order is wrong and the headers don't match the row of data
INSERT INTO Accounts (Balance, AccountHolder, Fees) -- this is wrong, accountholder needs to go first
     VALUES ('cher', 15000000.00, 0.00);

-- insert all data but ID into Accounts, in different order than table really is
INSERT INTO Accounts (Balance, AccountHolder, Fees) -- you have to reorder your table data
     VALUES (15000000.00, 'cher', 0.00);
     
-- change accountholder to 'barack h obama' for ID = 6
UPDATE Accounts
   SET AccountHolder = 'barack h obama'
 WHERE ProductID = 6;
 
-- set all the fees in accounts to 0
UPDATE Accounts
   SET Fees = 0.00;
   
-- select rows where the balance is <= 10,000
SELECT * FROM Accounts WHERE Balance <= 10000;

-- set fees to 100 when the balance is <= 10,000
UPDATE Accounts
   SET Fees = 100
 WHERE Balance <= 10000;
 
-- check that row is correct before you change anything
SELECT * FROM Accounts
		WHERE ProductID = 7;
        
-- delete dave grohl from table
DELETE FROM Accounts
      WHERE ProductID = 7;
      
-- check more than one row in table
SELECT * FROM Accounts
        WHERE ProductID IN (1,3,5);
        
-- select all last names that begin with a certain letter, this is a wildcard
SELECT * FROM Accounts
        WHERE AccountHolder LIKE '% B%';
        
-- select all names that have a certain letter in it, this is a wildcard
SELECT * FROM Accounts
        WHERE AccountHolder LIKE '%B%';
        
-- select a row from accounts where the first name starts with A
SELECT * FROM Accounts
        WHERE AccountHolder LIKE 'A%';
        
-- select a row from accounts where the first name starts with A or R
SELECT * FROM Accounts
        WHERE AccountHolder LIKE 'A%'
           OR AccountHolder LIKE 'R%';
           
-- shorten previous lines of code, REGEXP is regular expression. the carrot says the letter is the first letter of the expression.
-- if you remove the carrot, it will look for expressions with any letter that starts with "A" or "R"
SELECT * FROM Accounts
        WHERE AccountHolder REGEXP "^[AR].*";

-- pull up all balances
SELECT Balance FROM Accounts;

-- pull up all balances that are not duplicated
SELECT DISTINCT(Balance) FROM Accounts;

SELECT * FROM Accounts;