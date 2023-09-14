drop table TITLESAUTHORS;
drop table TITLESEDITORS;
drop table TITLES;
drop table AUTHORS;
drop table EDITORS;
drop table PUBLISHERS;

CREATE TABLE PUBLISHERS
(PUB_ID VARCHAR(40) NOT NULL,
PUB_NAME VARCHAR(255),
PUB_ADDRESS VARCHAR(255),
PUB_CITY VARCHAR(255),
CONSTRAINT PK_PUBLISHERS PRIMARY KEY(PUB_ID));

CREATE TABLE TITLES(
TITLE_ID VARCHAR(40) NOT NULL,
TITLE VARCHAR(255),
TYPE VARCHAR(255),
PRICE DECIMAL(8,3),
EXPECTED_SALES DECIMAL(8,3),
D_PUBLISHING DATE,
PRE_PUBLISHING DECIMAL(8,3),
PUB_ID VARCHAR(40) NOT NULL,
CONSTRAINT PK_TITLES PRIMARY KEY(TITLE_ID),
CONSTRAINT FK_TITLES_PUBLISHERS FOREIGN KEY(PUB_ID) REFERENCES PUBLISHERS(PUB_ID));

CREATE TABLE AUTHORS
(AU_ID VARCHAR(40) NOT NULL,
AU_NAME VARCHAR(255),
AU_SURNAME VARCHAR(255),
AU_TELEPHONE VARCHAR(255),
AU_ADDRESS VARCHAR(255),
AU_CITY VARCHAR(255),
CONSTRAINT PK_AUTHORS PRIMARY KEY(AU_ID));

CREATE TABLE TITLESAUTHORS
(TITLE_ID VARCHAR(40) NOT NULL,
AU_ID VARCHAR(40) NOT NULL,
AUTHOR_ORDER DECIMAL(8,3),
PERCENTAGE_PARTICIPATION DECIMAL(8,3),
CONSTRAINT PK_TITLESAUTHORS PRIMARY KEY(TITLE_ID,AU_ID),
CONSTRAINT FK_TITLESAUTHORS_TITLES FOREIGN KEY(TITLE_ID) REFERENCES TITLES(TITLE_ID),CONSTRAINT FK_TITLESAUTHORS_AUTHORS FOREIGN KEY(AU_ID) REFERENCES AUTHORS(AU_ID));

CREATE TABLE EDITORS(
ED_ID VARCHAR(40) NOT NULL,
ED_NAME VARCHAR(255),
ED_SURNAME VARCHAR(255),
ED_TELEPHONE VARCHAR(255),
ED_ADDRESS VARCHAR(255),
ED_CITY VARCHAR(255),
ED_CHIEF VARCHAR(40),
CONSTRAINT PK_EDITORS PRIMARY KEY(ED_ID),
CONSTRAINT FK_EDITORS_EDITORS FOREIGN KEY(ED_CHIEF) REFERENCES EDITORS(ED_ID));


CREATE TABLE TITLESEDITORS
(TITLE_ID VARCHAR(20) NOT NULL,
ED_ID VARCHAR(20) NOT NULL,
EDITOR_ORDER DECIMAL(8,3),
CONSTRAINT PK_TITLESEDITORS PRIMARY KEY(TITLE_ID,ED_ID),
CONSTRAINT FK_TITLESEDITORS_EDITORS FOREIGN KEY(ED_ID) REFERENCES EDITORS(ED_ID),
CONSTRAINT FK_TITLESEDITORS_TITLES FOREIGN KEY(TITLE_ID) REFERENCES TITLES(TITLE_ID));

INSERT INTO "PUBLISHERS" VALUES('1','Prentice Hall','One Lake Street\n','New York');
INSERT INTO "PUBLISHERS" VALUES('2','Addison Wesley','75 Arlington Street','Boston');
INSERT INTO "PUBLISHERS" VALUES('3','John Wiley Sons','989 Market Street','San Francisco');
INSERT INTO "PUBLISHERS" VALUES('4','McGraw-Hill','Basauri, 17','Madrid');
INSERT INTO "PUBLISHERS" VALUES('5','Ra-ma','Av. Constitucion, 14','Barcelona');
INSERT INTO "PUBLISHERS" VALUES('6','IDG Books','65 Arlington Road','Washington');
INSERT INTO "TITLES" VALUES('1','About Face: The Essentials of User Interface Design','IU',13.000,100.000,to_date('1995-03-08','yyyy-mm-dd'),250.000,'6');
INSERT INTO "TITLES" VALUES('10','Human Computer Interaction','IU',90.000,45.000,to_date('2005-03-01','yyyy-mm-dd'),100.000,'1');
INSERT INTO "TITLES" VALUES('11','Usabilidad. Diseno de Sitios Web','IU',89.000,200.000,to_date('2004-04-08','yyyy-mm-dd'),110.000,'1');
INSERT INTO "TITLES" VALUES('2','Sistemas de Bases de Datos','BD',45.000,300.000,to_date('2005-03-28','yyyy-mm-dd'),24.000,'2');
INSERT INTO "TITLES" VALUES('3','Concepcion y Diseno de Bases de Datos','BD',39.000,225.000,to_date('1993-01-24','yyyy-mm-dd'),100.000,'5');
INSERT INTO "TITLES" VALUES('4','Introduccion a los Sistemas de Bases de Datos','BD',60.000,167.000,to_date('2001-11-01','yyyy-mm-dd'),45.000,'1');
INSERT INTO "TITLES" VALUES('5','Database Systems Concepts','BD',57.000,350.000,to_date('2005-09-21','yyyy-mm-dd'),67.000,'4');
INSERT INTO "TITLES" VALUES('6','Programacion en Java','PROG',29.000,34.000,to_date('2000-04-20','yyyy-mm-dd'),12.000,'4');
INSERT INTO "TITLES" VALUES('7','Introduccion a la Programacion con Java','PROG',43.000,27.000,to_date('2003-04-15','yyyy-mm-dd'),34.000,'2');
INSERT INTO "TITLES" VALUES('8','The Elements of User Interface Design','IU',67.000,45.000,to_date('1999-03-20','yyyy-mm-dd'),67.000,'3');
INSERT INTO "TITLES" VALUES('9','Principles and Guidelines uin Software UID','IU',87.000,20.000,to_date('2000-03-12','yyyy-mm-dd'),56.000,'1');
INSERT INTO "AUTHORS" VALUES('1','Jakob','Nielsen','349876543','111 River Street','Boston');
INSERT INTO "AUTHORS" VALUES('10','Abraham','Silberschatz',NULL,'Wiley Drive','Boston');
INSERT INTO "AUTHORS" VALUES('11','Henry','Korth','345678346','Crosspoint Blvd.\n','Oregon');
INSERT INTO "AUTHORS" VALUES('12','C.J.','Date','678976534','Freemont Boulevard\n','Ontario');
INSERT INTO "AUTHORS" VALUES('13','Adoracion','De Miguel','912356788','Canillas, 54','Madrid');
INSERT INTO "AUTHORS" VALUES('14','Thomas','Connolly','456783232','2 Clementi Loop','Singapore');
INSERT INTO "AUTHORS" VALUES('15','Carolyn','Begg','789645333','Boschstrasse ','Weinheim\n');
INSERT INTO "AUTHORS" VALUES('16','Alan','Cooper','567843566','Southern Gate,','Chichester');
INSERT INTO "AUTHORS" VALUES('2','Alan','Dix','567894324','10475 Crosspoint Boulevard','Indianapolis');
INSERT INTO "AUTHORS" VALUES('3','Janet','Finlay',NULL,'104 Boulevard','Los Angeles');
INSERT INTO "AUTHORS" VALUES('4','Deborah','Mayhew','678954322','Englewood Cliffs','New Jersey');
INSERT INTO "AUTHORS" VALUES('5','Theo','Mandel','349876543','1 Wiley Drive','New York');
INSERT INTO "AUTHORS" VALUES('6','David','Begg',NULL,'Market Street','California');
INSERT INTO "AUTHORS" VALUES('7','Gerald','Weiss','435678888','Market Crosspoint','Boston');
INSERT INTO "AUTHORS" VALUES('8','Luis','Joyanes','914567893','Serrano, 35','Madrid');
INSERT INTO "AUTHORS" VALUES('9','Ignacio ','Zahonero','914567892','Velazquez, 67','Madrid');

INSERT INTO "TITLESAUTHORS" VALUES('1','16',1.000,1.000);
INSERT INTO "TITLESAUTHORS" VALUES('10','2',1.000,0.750);
INSERT INTO "TITLESAUTHORS" VALUES('10','3',2.000,0.250);
INSERT INTO "TITLESAUTHORS" VALUES('11','1',1.000,1.000);
INSERT INTO "TITLESAUTHORS" VALUES('2','14',1.000,0.500);
INSERT INTO "TITLESAUTHORS" VALUES('2','15',2.000,0.500);
INSERT INTO "TITLESAUTHORS" VALUES('3','13',1.000,1.000);
INSERT INTO "TITLESAUTHORS" VALUES('4','12',1.000,1.000);
INSERT INTO "TITLESAUTHORS" VALUES('5','10',1.000,0.700);
INSERT INTO "TITLESAUTHORS" VALUES('5','11',2.000,0.200);
INSERT INTO "TITLESAUTHORS" VALUES('5','12',3.000,0.100);
INSERT INTO "TITLESAUTHORS" VALUES('6','8',1.000,0.600);
INSERT INTO "TITLESAUTHORS" VALUES('6','9',2.000,0.400);
INSERT INTO "TITLESAUTHORS" VALUES('7','6',1.000,0.500);
INSERT INTO "TITLESAUTHORS" VALUES('7','7',2.000,0.500);
INSERT INTO "TITLESAUTHORS" VALUES('8','5',1.000,1.000);
INSERT INTO "TITLESAUTHORS" VALUES('9','4',1.000,1.000);

INSERT INTO "EDITORS" VALUES('1','John','Osborn','678999767','Rosewood Drive','Danvers',NULL);
INSERT INTO "EDITORS" VALUES('14',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "EDITORS" VALUES('2','Amorette','Pedersen','567453333','Jillsdale Boulevard','California',NULL);
INSERT INTO "EDITORS" VALUES('4','Marta ','Caicoya','123567543','Av. de Madrid','Barcelona',NULL);
INSERT INTO "EDITORS" VALUES('6','Antonio','Nunez','6787t99888','Calle 4-25','Mexico',NULL);
INSERT INTO "EDITORS" VALUES('3','Miguel','Martin','453478944','Alcalde, 25','Madrid','4');
INSERT INTO "EDITORS" VALUES('5','Jose','Vazquez','567345222','Plaza de America','Valencia','6');
INSERT INTO "EDITORS" VALUES('8','Allen','Tucker','456756778','Freemont Boulevard\n','Boston',NULL);
INSERT INTO "EDITORS" VALUES('7','C.L.','Liu','334455669','Southern Gate','Illinois','8');
INSERT INTO "TITLESEDITORS" VALUES('1','1',1.000);
INSERT INTO "TITLESEDITORS" VALUES('1','2',2.000);
commit;
