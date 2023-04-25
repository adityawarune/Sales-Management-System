DROP TABLE CartoonMovie;

DROP TABLE ComicBook;

DROP TABLE OrderLineItem;

DROP TABLE StoreItems;

DROP TABLE CustOrder;

DROP TABLE Customer;

----

CREATE TABLE Customer (CustId INTEGER PRIMARY KEY, CustType VARCHAR2(10) CHECK (CustType = 'Regular' OR CustType = 'Gold'), Name VARCHAR2(50), Address VARCHAR2(100), Phone INTEGER UNIQUE NOT NULL, Email VARCHAR2(50) UNIQUE NOT NULL, DateJoined DATE, Coupons INTEGER);

CREATE TABLE CustOrder (OrderId INTEGER PRIMARY KEY, CustId INTEGER, FOREIGN KEY (CustId) REFERENCES Customer(CustId), DateOfOrder DATE, ShippingFee DECIMAL(10,2), Tax DECIMAL(10,2), Discount DECIMAL(10,2), ShippingDate DATE, CONSTRAINT DateCheck CHECK (ShippingDate >= DateOfOrder), Total DECIMAL(10,2));

CREATE TABLE OrderLineItem (OrderId INTEGER, FOREIGN KEY (OrderId) REFERENCES CustOrder(OrderId), LineId INTEGER PRIMARY KEY, ItemId INTEGER, Quantity INTEGER);

CREATE TABLE StoreItems (ItemId INTEGER PRIMARY KEY, Price DECIMAL(10,2), NoOfCopies Integer CHECK (NoOfCopies >= 0));

CREATE TABLE ComicBook (ItemId INTEGER, FOREIGN KEY (ItemId) REFERENCES StoreItems(ItemId), Title VARCHAR2(100) PRIMARY KEY, PublishedDate DATE);

CREATE TABLE CartoonMovie (ItemId INTEGER, FOREIGN KEY (ItemId) REFERENCES StoreItems(ItemId), Title VARCHAR2(100) PRIMARY KEY, StudioName VARCHAR2(50), Description VARCHAR2(1000));
