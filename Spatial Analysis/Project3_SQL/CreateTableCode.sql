CREATE TABLE CUSTOMER
(
NAME_CUS  CHAR(20)     NOT NULL,
CITY_CUS  CHAR(20)     NOT NULL,
ADDR_CUS  VARCHAR(255) NOT NULL,
PRIMARY KEY(NAME_CUS)
);

INSERT INTO CUSTOMER(NAME_CUS,CITY_CUS,ADDR_CUS)
VALUES
('Mohammad Naderi','Isfahan','khodami st,golha ally,p2,v1'),
('Ali Sharifi','Tehran','Valiasr st,atlas ally,p40,v2'),
('Mohammad Rezai','Semnan','Sina st,motlaq ally,p31,v2'),
('Maryam Momen','Isfahan','Toos st,pazooki ally,p5,v1'),
('Amir Tavasoli','Isfahan','Hooshyar st,Rajabi ally,p75,v5'),
('Negin Bayatani','Tehran','Ehsani st,Khoonraz ally,p75,v5'),
('Zahra Kiani','Tehran','Vanak st,Mirdamad ally,p12,v3');


CREATE TABLE ACCOUNT
(
ACC_ID            NUMERIC  NOT NULL,
NAME_BANK         CHAR(20) NOT NULL,
BALANCE_ACC       NUMERIC  NOT NULL,
PRIMARY KEY(ACC_ID)
);

INSERT INTO ACCOUNT(ACC_ID,NAME_BANK,BALANCE_ACC)
VALUES
(6037956849378,'SHAHED',120000000),
(6031956864394,'AZADI',9500000000),
(6547956894312,'ESLAMI',64000000),
(6189956854321,'MOALEM',120000000),
(6037289212378,'1402',3600000000),
(6021486493786,'POONAK',730000000),
(6082481907877,'1402',88000000);


CREATE TABLE DEPOSITER
(
NAME_DEP    CHAR(20)  NOT NULL,
ACC_DEP     NUMERIC   NOT NULL,
PRIMARY KEY (NAME_DEP),
FOREIGN KEY (ACC_DEP) REFERENCES ACCOUNT(ACC_ID),
FOREIGN KEY (NAME_DEP) REFERENCES CUSTOMER(NAME_CUS)
);

INSERT INTO DEPOSITER(NAME_DEP,ACC_DEP)
VALUES
('Ali Sharifi',6031956864394),
('Negin Bayatani',6189956854321),
('Mohammad Naderi',6037956849378),
('Maryam Momen',6021486493786),
('Amir Tavasoli',6547956894312),
('Mohammad Rezai',6082481907877),
('Zahra Kiani',6037289212378);


CREATE TABLE BORROWER
(
LNUM        INT        NOT NULL,
NAME_BOR    CHAR(20)   NOT NULL,
PRIMARY KEY (LNUM),
FOREIGN KEY (NAME_BOR) REFERENCES CUSTOMER(NAME_CUS),
FOREIGN KEY (NAME_BOR) REFERENCES DEPOSITER(NAME_DEP)
);

INSERT INTO BORROWER(NAME_BOR,LNUM)
VALUES
('Ali Sharifi',21),
('Zahra Kiani',83),
('Mohammad Rezai',67),
('Negin Bayatani',34),
('Mohammad Naderi',49);


CREATE TABLE LOAN
(
LOAN_NUM    INT       NOT NULL,
LNAME_BANK  CHAR(20)  NOT NULL,
AMOUNT      NUMERIC   NOT NULL,
PRIMARY KEY (LOAN_NUM),
FOREIGN KEY (LOAN_NUM) REFERENCES BORROWER(LNUM)
);

INSERT INTO LOAN(LOAN_NUM,LNAME_BANK,AMOUNT)
VALUES
(21,'1402',150000000),
(34,'Azadi',500000000),
(49,'Azadi',70000000),
(67,'SHAHED',2500000000),
(83,'1402',100000000);


CREATE TABLE BRANCH
(
NAME_BR CHAR(20) NOT NULL,
CITY_BR CHAR(20) NOT NULL,
ASSET   NUMERIC  NOT NULL,
PRIMARY KEY (NAME_BR)
);

INSERT INTO BRANCH(NAME_BR,CITY_BR,ASSET)
VALUES
('SHAHED','Isfahan',1000000000),
('AZADI','Tehran',250000000000),
('ESLAMI','Semnan',2000000000),
('MOALEM','Isfahan',15000000000),
('1402','Tehran',400000000000),
('POONAK','Tehran',8000000000);
