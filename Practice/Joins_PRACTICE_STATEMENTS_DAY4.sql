-- inner join
SELECT AccountHolder, BALANCE, Amount
  FROM
      Transactions t
			INNER JOIN
	  Accounts a
			ON a.ProductID = t.ID;
            
-- left outer join
SELECT AccountHolder, BALANCE, Amount
  FROM Accounts a
  LEFT OUTER JOIN Transactions
			   ON a.ProductID = AccountID;
               
-- inner join again
SELECT a.ProductID, AccountHolder, Balance, Fees, t.ID, Amount, TransType, AccountID
  FROM
	  Accounts a
			INNER JOIN
	Transactions t
			ON a.ProductID = t.ID;
            
-- left outer join again, doen't look l ike you can have a.ProductID or t.ID
SELECT AccountHolder, Balance, Fees, Amount, TransType, AccountID
  FROM Accounts a
  LEFT OUTER JOIN Transactions
			   ON a.ProductID = AccountID;