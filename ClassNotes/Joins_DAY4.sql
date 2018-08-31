-- inner join, join accountholder, balance, and fees from accounts with amount and transtype from transactions
SELECT AccountHolder, Balance, Fees, Amount, TransType, t.ID -- if I had two ID's, I can use the proper alias to denote which ID to use
  FROM 
      Accounts a -- a is an alias
			INNER JOIN
	  Transactions t -- t is an alias
		    ON a.ProductID = t.ID;
        
-- you can switch the position of transactions and accounts
SELECT AccountHolder, Balance, Fees, Amount, TransType, t.ID
  FROM 
  	  Transactions t -- t is an alias
			INNER JOIN
      Accounts a -- a is an alias
		    ON a.ProductID = t.ID;
            
-- left outer join
SELECT AccountHolder, Balance, Fees, Amount, TransType
  FROM accounts accts
  LEFT OUTER JOIN Transactions -- don't need alias here
               ON accts.ProductID = AccountID;
               

