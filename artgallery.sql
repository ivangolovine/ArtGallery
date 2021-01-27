DROP TABLE RENTALINFO CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERLOCATION CASCADE CONSTRAINTS;
DROP TABLE artworkPurchased CASCADE CONSTRAINTS;
DROP TABLE art_order CASCADE CONSTRAINTS;
DROP TABLE artwork CASCADE CONSTRAINTS;
DROP TABLE exhibition CASCADE CONSTRAINTS;
DROP TABLE SPECIFIC_ADDRESS CASCADE CONSTRAINTS;
DROP TABLE BROAD_ADDRESS CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE artist CASCADE CONSTRAINTS;


CREATE TABLE artist (
	ArtistID NUMBER PRIMARY KEY,
	Firstname VARCHAR2(25) NOT NULL,
	Lastname VARCHAR2(25) NOT NULL,
	Email VARCHAR(40),
	PhoneNumber VARCHAR2(12),
	LocationID NUMBER UNIQUE NOT NULL);

CREATE TABLE customer (
	CustomerID NUMBER PRIMARY KEY,
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR(40) NOT NULL,
	PhoneNumber VARCHAR2(12));
    
SELECT COUNT(CustomerID) AS Number_of_Customers from customer;
SELECT COUNT(ArtworkID) AS Number_of_Sculptures from artwork WHERE typeArt='Sculpture';

CREATE TABLE  "SPECIFIC_ADDRESS" (
   	LocationID NUMBER PRIMARY KEY, 
	StreetAddress VARCHAR2(25), 
	PostalCode VARCHAR2(25)
   );
   
SELECT LocationID, StreetAddress, PostalCode from SPECIFIC_ADDRESS WHERE NOT StreetAddress like '%Sesame%';
   
CREATE TABLE  "BROAD_ADDRESS"(	
	PostalCode VARCHAR2(25) PRIMARY KEY, 
	CITY VARCHAR2(25), 
	COUNTRY VARCHAR2(25));

CREATE TABLE exhibition (
	ExhibitionID NUMBER PRIMARY KEY,
	Gallery_Title VARCHAR(50),
	StartDate DATE,
	EndDate DATE);

CREATE TABLE artwork (
	ArtworkID NUMBER PRIMARY KEY,
	ArtistID NUMBER REFERENCES artist(ArtistID),
	NameArt VARCHAR2(100),
	ExhibitionID NUMBER REFERENCES exhibition(ExhibitionID),
	DateAdded DATE NOT NULL,
	SizeArt VARCHAR2(20) NOT NULL,
	Price NUMBER,
	TypeArt VARCHAR(40),
	MediumArt VARCHAR(50),
	TimePeriod VARCHAR(15),
	YearCreated NUMBER
	);

SELECT ArtworkID, NameArt, Price from artwork where price < 3000;
CREATE TABLE  art_order (	
	OrderID NUMBER PRIMARY KEY, 
	CustomerID NUMBER REFERENCES customer(CustomerID), 
	DELIVERY_DATE DATE NOT NULL, 
	RentalID NUMBER UNIQUE
   );

CREATE TABLE  artworkPurchased(	
	OrderID NUMBER REFERENCES art_order(OrderID), 
	ArtworkID NUMBER REFERENCES artwork(ArtworkID));

CREATE TABLE  "CUSTOMERLOCATION"(
	"CustomerID" NUMBER REFERENCES customer(CustomerID), 
	"LocationID" NUMBER REFERENCES SPECIFIC_ADDRESS(LocationID));

CREATE TABLE payment (
	PaymentID NUMBER PRIMARY KEY,
	OrderID NUMBER REFERENCES art_order(OrderID) NOT NULL,
	CustomerID NUMBER REFERENCES customer(CustomerID) NOT NULL,
	PaymentAmount NUMBER NOT NULL,
	DatePayment DATE NOT NULL);

CREATE TABLE "RENTALINFO"(
	"RentalID" NUMBER PRIMARY KEY REFERENCES art_order(RentalID), 
	"RentalStartDate" DATE NOT NULL, 
	"RentalLength" NUMBER
   );
   
INSERT INTO artist VALUES (123, 'Dawn', 'Lol', 'lol@gmail.com', '6471234567', 00001);
INSERT INTO artist VALUES (456, 'Smith', 'Jones', 'sje@gmail.com', '4167898907', 00002);
INSERT INTO artist VALUES (789, 'Lee', 'Li', 'leelol@gmail.com', '4136547890', 00003);
INSERT INTO artist VALUES (367, 'Sally', 'Hong', 'bluesky@yahoo.ca', '6475781265', 00004);
INSERT INTO artist VALUES (148, 'James', 'Lone', 'jleartist@gmail.com', '4134563421', 00005);
INSERT INTO artist VALUES (001,'Leo','Da Vinci', '', '', 00006);
INSERT INTO artist VALUES (007,'Leonardo','Capablanca','leoartsales@gmail.com', '441342634990', 00007);
INSERT INTO artist VALUES (333,'Kyle','Denise', 'slmyartkyle@gmail.com', '8896342111', 00008);
INSERT INTO artist VALUES (432,'Taylor','Octavian','taywrkmadd@gmail.com', '99345234428', 00009);
INSERT INTO artist VALUES (578,'Sophia','Charlemagne', '', '', 00010);
INSERT INTO artist VALUES (912,'Anthony','Constantinous', 'anyforsalem@gmail.com', '90421563421', 00011);
INSERT INTO artist VALUES (754,'Kendrick','Van Gogh', '', '', 00012);
INSERT INTO artist VALUES (332,'Louis','Picasso','', '', 00013);
INSERT INTO artist VALUES (719,'Seagle','Aivazovsky', '', '', 00014);
INSERT INTO artist VALUES (900,'Tyler','Willendorf','germartistmai@gmail.com', '8914574423', 00015);
INSERT INTO artist VALUES (891,'Pablo','Southerland', 'jennysellsart@gmail.com', '6784543234', 00016);
INSERT INTO artist VALUES (783,'Jean-Antoine','Watteau','', '', 00017);
INSERT INTO artist VALUES (549,'Paul','Dillet','randomgall@gmail.com', '8893455678', 00018);
INSERT INTO artist VALUES (130,'Albert','Neuhuys','albertsales34@gmail.com', '1134373422', 00019);


INSERT INTO exhibition VALUES (1,'Oldendel', '2020-1-08','2020-1-15');
INSERT INTO exhibition VALUES (2,'Tulipshaw', '2019-2-08','2019-2-15');
INSERT INTO exhibition VALUES (3,'Relicmilie', '2019-2-08','2019-2-20');
INSERT INTO exhibition VALUES (4,'Skipleaf', '2019-3-18','2019-3-25');
INSERT INTO exhibition VALUES (5,'Leafmill', '2019-3-18','2019-3-25');


INSERT INTO artwork VALUES (4560, 123, 'uhm', 1, '2019-12-17', 'Medium', 2345,'Painting', 'Oil on Canvas','1900s', 2016);
INSERT INTO artwork VALUES (7891, 456, 'Bleu', 2, '2019-2-08', 'Large', 1356,'Painting', 'Acrylic on Canvas','1950-Present', 2019);
INSERT INTO artwork VALUES (2345, 789, 'Oythus', 3, '2019-2-08', 'Large', 1098,'Painting', 'Watercolor on Hot Pressed Paper','1950-Present', 2003);
INSERT INTO artwork VALUES (6778, 367, 'Rackaro', 4, '2019-3-18', 'Large', 5000,'Statue', 'Copper','1950-Present', 2006);
INSERT INTO artwork VALUES (8674, 148, 'Lenveyas', 5, '2019-3-18', 'Large', 5670,'Statue', 'Copper','1950-Present', 2019);
INSERT INTO artwork VALUES (1049, 1,'Amour', 5, '2019-7-20', 'Small', 9670,'Painting', 'Oil on Canvas','Renaissance', 1490);
INSERT INTO artwork VALUES (7369, 7,'Belle Nuit', 1, '2019-2-25', 'Medium', 5010,'Painting', 'Tempera','1950-Present', 2000);
INSERT INTO artwork VALUES (9730, 333,'La Ciel', 1, '2019-10-01', 'Large', 9080,'Statue', 'Marble','1950-Present', 1990);
INSERT INTO artwork VALUES (4999, 432,'War and Peace', 2, '2019-12-19', 'Medium', 7000,'Sculpture', 'Marble','1900s', 1940);
INSERT INTO artwork VALUES (9764, 578,'Lords', 2, '2019-12-19', 'Large', 2323,'Painting', 'Pastel','Neoclassical', 1803);
INSERT INTO artwork VALUES (6892, 912,'Prince Augusto', 2, '2019-12-19', 'Large', 1089,'Painting', 'Acrylic on Canvas','1900s', 1949);
INSERT INTO artwork VALUES (3436, 754,'Silent Night', 3, '2019-2-25', 'Small', 7171,'Sculpture', 'Ivory','Medieval', 1343);
INSERT INTO artwork VALUES (5313, 332,'Outers', 3, '2019-2-25', 'Small', 8899,'Sculpture', 'Marble','Romantic', 1842);
INSERT INTO artwork VALUES (6604, 900,'Glory', 1, '2019-2-25', 'Small', 6899,'Sculpture', 'Marble','1950-Present', 1954);
INSERT INTO artwork VALUES (1340, 891,'Dimension', 1, '2019-2-25', 'Small', 9999,'Sculpture', 'Marble','1950-Present', 2007);
INSERT INTO artwork VALUES (4949, 783,'Calm', 4, '2019-4-12', 'Large', 4591,'Painting', 'Oil on Canvas','Baroque', 1940);
INSERT INTO artwork VALUES (9814, 549,'Calamity', 4, '2019-4-13', 'Large', 6735,'Painting', 'Acrylic on Canvas','1950-Present', 1967);
INSERT INTO artwork VALUES (6645, 130,'Reflection', 4, '2019-2-25', 'Small', 8899,'Sculpture', 'Gypsum','Realistic', 1895);


INSERT INTO customer VALUES (00982,'Tom','Nook', 'randomemail@yahoo.com','212-234-3344');
INSERT INTO customer VALUES (00983,'Timmy','Nook', 'randomemail1@yahoo.com','212-456-3646');
INSERT INTO customer VALUES (00984,'Tommy','Nook', 'randomemail2@yahoo.com','212-789-3567');
INSERT INTO customer VALUES (00985,'Thomas','Nook', 'email@gmail.com','312-264-2354');
INSERT INTO customer VALUES (00986,'Tome','Nook', 'email@gmail.com','312-316-6666');
INSERT INTO customer VALUES (00987,'Timothy','Nook', 'email@gmail.com','312-387-3264');


INSERT INTO specific_address VALUES(00001, '123 Cherry Lane', 'A1AB1B');
INSERT INTO specific_address VALUES(00002, '456 Cherry Lane', 'A1AB1B');
INSERT INTO specific_address VALUES(00004, '123 Main', 'N1N8C8');
INSERT INTO specific_address VALUES(00005, '7 Elgin', 'LOL123');
INSERT INTO specific_address VALUES(00006, '10 Champs Elysees', 'UM4D67');
INSERT INTO specific_address VALUES(00007, '10 Downing Street', 'H1K8G0');
INSERT INTO specific_address VALUES(000020, '123 Sesame Street', '09303');
INSERT INTO specific_address VALUES(000021, '124 Sesame Street', '09303');
INSERT INTO specific_address VALUES(000022, '125 Sesame Street', '09303');
INSERT INTO specific_address VALUES(000023, '126 Sesame Street', '09303');
INSERT INTO specific_address VALUES(000024, '127 Sesame Street', '09303');
INSERT INTO specific_address VALUES(000025, '128 Sesame Street', '09303');

INSERT INTO broad_address VALUES('A1AB1B', 'Toronto', 'CA');
INSERT INTO broad_address VALUES('N1N8C8','Scarborough', 'CA');
INSERT INTO broad_address VALUES('LOL123', 'Brampton', 'CA');
INSERT INTO broad_address VALUES('UM4D67','Markham', 'CA');
INSERT INTO broad_address VALUES('H1K8G0', 'Toronto', 'CA');
INSERT INTO broad_address VALUES('09303', 'New York', 'USA');


INSERT INTO art_order VALUES (100987,982,'2021-4-25',00001);
INSERT INTO art_order VALUES (100988,983,'2019-4-30',00002);
INSERT INTO art_order VALUES (100989,984,'2019-5-05',00003);
INSERT INTO art_order VALUES (100990,985,'2019-2-20',00004);
INSERT INTO art_order VALUES (100991,986,'2019-3-18',00005);
INSERT INTO art_order VALUES (100992,987,'2021-4-20',00006);

INSERT INTO rentalinfo VALUES (00002,'2019-4-30',31);
INSERT INTO rentalinfo VALUES (00003,'2019-5-05',60);
INSERT INTO rentalinfo VALUES (00004,'2019-2-20',78);
INSERT INTO rentalinfo VALUES (00005,'2019-3-18',6);

INSERT INTO artworkpurchased VALUES (100987,6645);
INSERT INTO artworkpurchased VALUES (100992,9814);

INSERT INTO payment VALUES (200987,100987,982,250,'2019-5-01');
INSERT INTO payment VALUES (200988,100988,983,450,'2019-4-29');
INSERT INTO payment VALUES (200989,100989,984,450,'2019-4-30');
INSERT INTO payment VALUES (200990,100990,985,150,'2019-5-01');
INSERT INTO payment VALUES (200991,100991,986,1000,'2019-4-29');
INSERT INTO payment VALUES (200992,100992,987,1249,'2019-4-30');

INSERT INTO customerlocation VALUES (982, 20);
INSERT INTO customerlocation VALUES (983, 21);
INSERT INTO customerlocation VALUES (984, 22);
INSERT INTO customerlocation VALUES (985, 23);
INSERT INTO customerlocation VALUES (986, 24);
INSERT INTO customerlocation VALUES (987, 25);

SELECT 'Average Price of Sculptures', AVG(Price)
FROM  artwork
WHERE TypeArt = 'Sculpture';