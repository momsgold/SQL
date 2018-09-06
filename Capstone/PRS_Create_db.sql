-- CREATE AND SELECT DATABASE
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- CREATE user TABLE
CREATE TABLE user
(
ID					INT					PRIMARY KEY						AUTO_INCREMENT,
UserName			VARCHAR(20)			NOT NULL						UNIQUE,
Password			VARCHAR(10)			NOT NULL,
FirstName			VARCHAR(20)			NOT NULL,
LastName			VARCHAR(20)			NOT NULL,
PhoneNumber			VARCHAR(12)			NOT NULL,
Email				VARCHAR(75)			NOT NULL,
IsReviewer			TINYINT(1)			NOT NULL,
IsAdmin				TINYINT(1)			NOT NULL,
IsActive			TINYINT(1)			DEFAULT 1						NOT NULL,
DateCreated			DATETIME			DEFAULT CURRENT_TIMESTAMP		NOT NULL,
DateUpdated			DATETIME			DEFAULT CURRENT_TIMESTAMP		NOT NULL,
UpdatedByUser		INT					DEFAULT 1						NOT NULL
);

-- INISER ROWS INTO user TABLE
INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com', 1, 1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com', 1, 1);
-- (1, 'rachaelbaumann', 'queen', 'Rachael', 'Baumann', '303-335-8774', 'baumann.rachael@gmail.com', 0, 0, 0, '2018-08-31 1:21:42', '2018-08-31 1:21:42', 1);

-- CREATE vendor TABLE
CREATE TABLE vendor
(
ID							INT						PRIMARY KEY						AUTO_INCREMENT,
Code						VARCHAR(10)				NOT NULL						UNIQUE,
Name						VARCHAR(255)			NOT NULL,
Address						VARCHAR(255)			NOT NULL,
City						VARCHAR(255)			NOT NULL,
State						VARCHAR(2)				NOT NULL,
Zip							VARCHAR(5)				NOT NULL,
PhoneNumber					VARCHAR(12)				NOT NULL,
Email						VARCHAR(100)			NOT NULL,
IsPreApproved				TINYINT(1)				NOT NULL,
IsActive					TINYINT(1)				DEFAULT 1						NOT NULL,
DateCreated					DATETIME				DEFAULT CURRENT_TIMESTAMP		NOT NULL,
DateUpdated					DATETIME				DEFAULT CURRENT_TIMESTAMP		NOT NULL,
UpdatedByUser				INT						DEFAULT 1						NOT NULL
);

-- INSERT ROWS INTO vendor TABLE
INSERT INTO vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, IsPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

-- (1, 'Java', 'Rachael Baumann', '1845 S. Jackson Street', 'Denver', 'CO', '80210', '303-335-8774', 'baumann.rachael@gmail.com', 0, 1, '2018-08-31 1:45:01', '2018-08-31 1:45:01', 1);
-- DELETE FROM vendor WHERE ID = 1;

-- CREATE purchaserequest table
CREATE TABLE purchaserequest
(
ID						INT							PRIMARY KEY						AUTO_INCREMENT,
UserID					INT							NOT NULL,
Description				VARCHAR(100)				NOT NULL,
Justification			VARCHAR(255)				NOT NULL,
DateNeeded				DATE						NOT NULL,
DeliveryMode			VARCHAR(25)					NOT NULL,
Status					VARCHAR(20)					NOT NULL,
Total					DECIMAL(10,2)				NOT NULL,
SubmittedDate			DATETIME,					-- NULLABLE,
ReasonForRejection		VARCHAR(100)				NOT NULL,
IsActive				TINYINT(1)					DEFAULT 1						NOT NULL,
DateCreated 			DATETIME					DEFAULT CURRENT_TIMESTAMP		NOT NULL,
DateUpdated 			DATETIME					DEFAULT CURRENT_TIMESTAMP		NOT NULL,
UpdatedByUser 			INT							DEFAULT 1						NOT NULL,
FOREIGN KEY (UserID) REFERENCES user(ID)
);

-- TEST TEST TEST
-- INSERT INTO purchaserequest (ID, UserID, Total, SubmittedDate) VALUES
-- (1, 1, 259.99, '2018-08-31 2:59:05');

-- CREATE product TABLE
CREATE TABLE product
(
ID						INT						PRIMARY KEY						AUTO_INCREMENT,
VendorID				INT						NOT NULL,
PartNumber				VARCHAR(50)				NOT NULL,
Name					VARCHAR(150)			NOT NULL,
Price					DECIMAL(10,2)			NOT NULL,
Unit					VARCHAR(255),			-- NULLABLE,
PhotoPath				VARCHAR(255),			-- NULLABLE,
IsActive				TinyInt(1)				DEFAULT 1						NOT NULL,
DateCreated				DATETIME				DEFAULT CURRENT_TIMESTAMP		NOT NULL,
DateUpdated				DATETIME				DEFAULT CURRENT_TIMESTAMP		NOT NULL,
UpdatedByUser			INT						DEFAULT 1						NOT NULL,
FOREIGN KEY (VendorID) REFERENCES vendor(ID),
CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber) -- vendor_part is the contraint name (click on wrench)
);

-- CREATE purchaserequastlineitem table
CREATE TABLE purchaserequestlineitem
(
ID							INT					PRIMARY KEY						AUTO_INCREMENT,
PurchaseRequestID			INT					NOT NULL,
ProductID					INT					NOT NULL,
Quantity					INT					NOT NULL,
IsActive					TinyInt(1)			DEFAULT 1						NOT NULL,	
DateCreated					DATETIME			DEFAULT CURRENT_TIMESTAMP		NOT NULL,
DateUpdated					DATETIME			DEFAULT CURRENT_TIMESTAMP		NOT NULL,
UpdatedByUser				INT					DEFAULT 1						NOT NULL,
FOREIGN KEY (ProductID) REFERENCES product(ID),
FOREIGN KEY (PurchaseRequestID) REFERENCES purchaserequest(ID),
CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID) 
);


-- INSERT ROWS INTO product TABLE
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (1, 1, 'ME280LL', 'iPad Mini 2', 296.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (2, 2, 'ME280LL', 'iPad Mini 2', 299.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (3, 3, '105810', 'Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap', 8.99, '1 Ream / 500 Sheets', NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (4, 4, '122374', 'HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case', 29.99, '1 Case, 10 Reams, 500 Sheets per ream', NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (5, 4, '784551', 'Logitech M325 Wireless Optical Mouse, Ambidextrous, Black', 14.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (6, 4, '382955', 'Staples Mouse Pad, Black', 2.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (7, 4, '2122178', 'AOC 24-Inch Class LED Monitor', 99.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (8, 4, '2460649', 'Laptop HP Notebook 15-AY163NR', 529.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (9, 4, '2256788','Laptop Dell i3552-3240BLK 15.6\"', 239.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (10, 4, 'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"', 224.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (11, 4, '940600', 'Canon imageCLASS Copier (D530)', 99.99, NULL, NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (12, 5, '228148', 'Acer Aspire ATC-780A-UR12 Desktop Computer', 399.99,'', '/images/AcerAspireDesktop.jpg');
INSERT INTO product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) VALUES (13, 5, '279364', 'Lenovo IdeaCentre All-In-One Desktop', 349.99,'', '/images/LenovoIdeaCenter.jpg');

-- MAKE user.email UNIQUE
ALTER TABLE user
ADD UNIQUE (Email);

-- Grant statemene
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;