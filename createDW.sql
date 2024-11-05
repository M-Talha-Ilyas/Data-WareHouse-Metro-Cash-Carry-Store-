use warehouse;
drop table if exists FACTS;
drop table if exists PRODUCTSs;
drop table if exists CUSTOMERSs;
drop table if exists STORES;
drop table if exists SUPPLIERS;
drop table if exists DATES;




  CREATE TABLE `PRODUCTSs` (
  `PRODUCT_ID` VARCHAR(6) NOT NULL, 
  `PRODUCT_NAME` VARCHAR(30) NOT NULL, 
  `PRICE` DECIMAL(5,2) DEFAULT (0.0) NOT NULL,
   CONSTRAINT PRODUCTS_PK PRIMARY KEY (PRODUCT_ID));

CREATE TABLE `CUSTOMERSs` (
  `CUSTOMER_ID` VARCHAR(4) NOT NULL, 
  CONSTRAINT CUSTOMERS_PK PRIMARY KEY (CUSTOMER_ID));

CREATE TABLE `STORES` (
  `STORE_ID` VARCHAR(4) NOT NULL, 
  `STORE_NAME` VARCHAR(20) NOT NULL, 
  CONSTRAINT STORES_PK PRIMARY KEY ( STORE_ID));


CREATE TABLE `SUPPLIERS` (
  `SUPPLIER_ID` VARCHAR(5) NOT NULL, 
  `SUPPLIER_NAME` VARCHAR(30) NOT NULL,  
  CONSTRAINT SUPPLIERS_PK PRIMARY KEY ( SUPPLIER_ID));


CREATE TABLE `DATES` (
`DATE_ID` VARCHAR(25) NOT NULL,
`TIME_ID` VARCHAR(25) NOT NULL,

CONSTRAINT DATE_PK PRIMARY KEY ( DATE_ID));

CREATE TABLE `FACTS` (
`TRANSACTION_ID` INT  NOT NULL,
`DATE_ID` VARCHAR(25) NOT NULL,
`PRODUCT_ID` VARCHAR(6) NOT NULL, 
`STORE_ID` VARCHAR(4) NOT NULL,
`SUPPLIER_ID` VARCHAR(5) NOT NULL, 
`CUSTOMER_ID` VARCHAR(4) NOT NULL, 
`SALE` DECIMAL(5,2) DEFAULT (0.0) NOT NULL,
   
CONSTRAINT FACTS_PK PRIMARY KEY (TRANSACTION_ID,PRODUCT_ID,STORE_ID,SUPPLIER_ID,CUSTOMER_ID,DATE_ID),
FOREIGN KEY ( DATE_ID) REFERENCES DATES( DATE_ID),

FOREIGN KEY ( PRODUCT_ID) REFERENCES PRODUCTSs( PRODUCT_ID),

FOREIGN KEY ( STORE_ID) REFERENCES STORES( STORE_ID),
FOREIGN KEY ( DATE_ID) REFERENCES DATES( DATE_ID),


FOREIGN KEY ( CUSTOMER_ID) REFERENCES CUSTOMERSs( CUSTOMER_ID),

FOREIGN KEY ( SUPPLIER_ID) REFERENCES SUPPLIERS( SUPPLIER_ID)

);

  # select * from facts;