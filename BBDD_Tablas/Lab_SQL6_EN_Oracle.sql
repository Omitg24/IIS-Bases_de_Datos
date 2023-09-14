DROP TABLE SALE;
DROP TABLE ISDONE;
DROP TABLE AGENCY;
DROP TABLE WHOLESALER;
DROP TABLE HAS;
DROP TABLE DISCOUNT;
DROP TABLE CUSTOMER;
DROP TABLE OFFER;

CREATE TABLE OFFER(
OF_CODE VARCHAR(5) NOT NULL,
ORIGIN VARCHAR(40),DESTINATION VARCHAR(40),
CONSTRAINT PK_OFFER PRIMARY KEY(OF_CODE));

CREATE TABLE CUSTOMER(DNI VARCHAR(9) NOT NULL,NAME VARCHAR(40),
CONSTRAINT PK_CUSTOMER PRIMARY KEY(DNI));

CREATE TABLE DISCOUNT(DIS_CODE VARCHAR(5) NOT NULL,
PERCENTAGE DECIMAL(12,3),
CONSTRAINT PK_DISCOUNT PRIMARY KEY(DIS_CODE));

CREATE TABLE HAS(DIS_CODE VARCHAR(5) NOT NULL,
DNI VARCHAR(8) NOT NULL,
CONSTRAINT PK_HAS PRIMARY KEY(DIS_CODE,DNI),
CONSTRAINT FK_HAS_CUSTOMER FOREIGN KEY(DNI) REFERENCES CUSTOMER(DNI),
CONSTRAINT FK_HAS_DISCOUNT FOREIGN KEY(DIS_CODE) REFERENCES DISCOUNT(DIS_CODE));

CREATE TABLE WHOLESALER(WHO_CODE VARCHAR(5) NOT NULL,
WHO_NAME VARCHAR(40),
TYPE VARCHAR(20),
CONSTRAINT PK_WHOLESALER PRIMARY KEY(WHO_CODE));

CREATE TABLE AGENCY(AG_CODE VARCHAR(5) NOT NULL,
AG_NAME VARCHAR(40),NUMBER_SALES DECIMAL(12,3),
WHO_CODE VARCHAR(5) NOT NULL,
CONSTRAINT PK_AGENCY PRIMARY KEY(AG_CODE),
CONSTRAINT FK_AGENCY_WHOLESALER FOREIGN KEY(WHO_CODE) REFERENCES WHOLESALER(WHO_CODE));

CREATE TABLE ISDONE(OF_CODE VARCHAR(5) NOT NULL,
AG_CODE VARCHAR(5) NOT NULL,
PRICE DECIMAL(12,3),
SEATS_AVAILABLE DECIMAL(12,3),
CONSTRAINT PK_ISDONE PRIMARY KEY(OF_CODE,AG_CODE),
CONSTRAINT FK_ISDONE_OFFER FOREIGN KEY(OF_CODE) REFERENCES OFFER(OF_CODE),
CONSTRAINT FK_ISDONE_AGENCY FOREIGN KEY(AG_CODE) REFERENCES AGENCY(AG_CODE));

CREATE TABLE SALE(DNI VARCHAR(9) NOT NULL,
AG_CODE VARCHAR(5) NOT NULL,
OF_CODE VARCHAR(5) NOT NULL,PAY_INSTALMENTS VARCHAR(1),
FINAL_AMOUNT DECIMAL(12,3),
CONSTRAINT PK_SALE PRIMARY KEY(DNI,AG_CODE,OF_CODE),
CONSTRAINT FK_SALE_CUSTOMER FOREIGN KEY(DNI) REFERENCES CUSTOMER(DNI),
CONSTRAINT FK_SALE_ISDONE FOREIGN KEY(OF_CODE,AG_CODE) REFERENCES ISDONE(OF_CODE,AG_CODE));

INSERT INTO "OFFER" VALUES('of1','Madrid','Ginebra');
INSERT INTO "OFFER" VALUES('of2','Barcelona','Bruselas');
INSERT INTO "OFFER" VALUES('of3','Oviedo','Ginebra');
INSERT INTO "OFFER" VALUES('of4','Madrid','Milan');
INSERT INTO "OFFER" VALUES('of5','Madrid','Ginebra');
INSERT INTO "OFFER" VALUES('of6','Barcelona','Milan');
INSERT INTO "OFFER" VALUES('of7','Barcelona','Bruselas');
INSERT INTO "CUSTOMER" VALUES('1','Paco Fernandez');
INSERT INTO "CUSTOMER" VALUES('10','Maria Iglesias');
INSERT INTO "CUSTOMER" VALUES('2','Carmen Perez');
INSERT INTO "CUSTOMER" VALUES('3','Antonio Alvarez');
INSERT INTO "CUSTOMER" VALUES('4','Bernardo Boqueron');
INSERT INTO "CUSTOMER" VALUES('5','Carlos Cifuentes');
INSERT INTO "CUSTOMER" VALUES('6','Damian Duran');
INSERT INTO "CUSTOMER" VALUES('7','Ernesto Estevez');
INSERT INTO "CUSTOMER" VALUES('8','Fernando Fidalgo');
INSERT INTO "CUSTOMER" VALUES('9','Jose Garcia');
INSERT INTO "DISCOUNT" VALUES('d1',5.000);
INSERT INTO "DISCOUNT" VALUES('d10',4.000);
INSERT INTO "DISCOUNT" VALUES('d2',6.000);
INSERT INTO "DISCOUNT" VALUES('d3',2.000);
INSERT INTO "DISCOUNT" VALUES('d4',1.000);
INSERT INTO "DISCOUNT" VALUES('d5',15.000);
INSERT INTO "DISCOUNT" VALUES('d6',2.000);
INSERT INTO "DISCOUNT" VALUES('d7',3.000);
INSERT INTO "DISCOUNT" VALUES('d8',3.000);
INSERT INTO "DISCOUNT" VALUES('d9',2.000);
INSERT INTO "HAS" VALUES('d1','1');
INSERT INTO "HAS" VALUES('d1','3');
INSERT INTO "HAS" VALUES('d1','4');
INSERT INTO "HAS" VALUES('d10','2');
INSERT INTO "HAS" VALUES('d2','1');
INSERT INTO "HAS" VALUES('d2','6');
INSERT INTO "HAS" VALUES('d3','5');
INSERT INTO "HAS" VALUES('d7','10');
INSERT INTO "HAS" VALUES('d7','5');
INSERT INTO "HAS" VALUES('d7','9');
INSERT INTO "HAS" VALUES('d8','7');
INSERT INTO "WHOLESALER" VALUES('who1','Wholesaler1','flights');
INSERT INTO "WHOLESALER" VALUES('who2','Wholesaler2','packages');
INSERT INTO "WHOLESALER" VALUES('who3','Wholesaler3','packages');
INSERT INTO "WHOLESALER" VALUES('who4','Wholesaler4','hotels');
INSERT INTO "WHOLESALER" VALUES('who5','Wholesaler5','packages');
INSERT INTO "WHOLESALER" VALUES('who6','Wholesaler6','cruises');
INSERT INTO "WHOLESALER" VALUES('who7','Wholesaler7','packages');
INSERT INTO "WHOLESALER" VALUES('who8','Wholesaler8','cruises');
INSERT INTO "AGENCY" VALUES('ag1','Agency1',5.000,'who2');
INSERT INTO "AGENCY" VALUES('ag2','Agency2',1.000,'who2');
INSERT INTO "AGENCY" VALUES('ag3','Agency3',1.000,'who4');
INSERT INTO "AGENCY" VALUES('ag4','Agency4',1.000,'who5');
INSERT INTO "AGENCY" VALUES('ag5','Agency5',1.000,'who7');
INSERT INTO "AGENCY" VALUES('ag6','Agency6',2.000,'who5');
INSERT INTO "AGENCY" VALUES('ag7','Agency7',0.000,'who4');
INSERT INTO "ISDONE" VALUES('of1','ag1',100.000,2.000);
INSERT INTO "ISDONE" VALUES('of1','ag2',200.000,4.000);
INSERT INTO "ISDONE" VALUES('of1','ag6',115.000,1.000);
INSERT INTO "ISDONE" VALUES('of2','ag1',1000.000,2.000);
INSERT INTO "ISDONE" VALUES('of2','ag3',1140.000,4.000);
INSERT INTO "ISDONE" VALUES('of2','ag4',900.000,0.000);
INSERT INTO "ISDONE" VALUES('of3','ag1',2000.000,1.000);
INSERT INTO "ISDONE" VALUES('of3','ag5',1450.000,1.000);
INSERT INTO "ISDONE" VALUES('of3','ag6',1500.000,11.000);
INSERT INTO "ISDONE" VALUES('of5','ag1',300.000,1.000);
INSERT INTO "ISDONE" VALUES('of7','ag1',1200.000,1.000);
INSERT INTO "ISDONE" VALUES('of7','ag2',1270.000,1.000);
INSERT INTO "SALE" VALUES('1','ag1','of1','Y',223342.000);
INSERT INTO "SALE" VALUES('1','ag3','of2','N',15151.000);
INSERT INTO "SALE" VALUES('1','ag4','of2','N',123.000);
INSERT INTO "SALE" VALUES('2','ag1','of1','N',223342.000);
INSERT INTO "SALE" VALUES('2','ag3','of2','Y',15151.000);
INSERT INTO "SALE" VALUES('2','ag6','of3','Y',1235.000);
INSERT INTO "SALE" VALUES('3','ag1','of1','Y',150000.000);
INSERT INTO "SALE" VALUES('4','ag1','of1','Y',123000.000);
INSERT INTO "SALE" VALUES('5','ag3','of2','Y',15151.000);
INSERT INTO "SALE" VALUES('5','ag5','of3','N',12345.000);
COMMIT;