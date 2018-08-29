SELECT * FROM product WHERE listprice = 57.50
   and productid = 1;
   
SELECT * FROM product WHERE listprice > 55;

SELECT * FROM product ORDER BY code desc;

SELECT MAX(listprice) FROM product;

SELECT COUNT(listprice) FROM product WHERE listprice = 57.50;

SELECT p.ProductID, p.Code FROM product AS p;

SELECT * FROM product ORDER BY productid;

