-- PRACTICE STATEMENTS!
INSERT INTO Accounts VALUES
(9, 'anthony green', 5000.00, 50.00);

INSERT INTO Accounts VALUES
(10, 'meredith green', 4500.00, 45.00);

INSERT INTO Accounts (AccountHolder, Balance, Fees)
     VALUES ('tyler joseph',100000.00, 0.00);
     
INSERT INTO Accounts (AccountHolder, Balance, Fees)
     VALUES ('josh dun', 50000.00, 50.00);
     
INSERT INTO Accounts (ProductID, AccountHolder, Balance, Fees)
     VALUES (13, 'donovan melero', 1000.00, 25.00);
     
INSERT INTO Accounts VALUES
(14, 'anthony green 2', 0.00, 0.00);

UPDATE Accounts
SET Balance = 100.00
WHERE AccountHolder = 'anthony green 2';

UPDATE Accounts
SET Fees = 50.00;

UPDATE Accounts
SET Fees = 25.00
WHERE Balance > 1000;

DELETE FROM Accounts
WHERE AccountHolder = 'anthony green 2';

SELECT Balance FROM Accounts;

SELECT * FROM Accounts;

INSERT INTO Accounts VALUES
(14, 'annie baumann', 1000000.00, 0.00),
(15, 'lynda misali', 50000000.00, 10.00),
(16, 'pansy baumann', 1000.00, 25.00);

INSERT INTO Accounts (AccountHolder, Balance, Fees)
VALUES
('poop', 10.00, 0.00),
('butts', 5.00, 1.00);

DELETE FROM Accounts WHERE AccountHolder IN ('pooper', 'poop', 'butts');

UPDATE Accounts
SET Balance = 500
WHERE AccountHolder = 'pansy baumann';