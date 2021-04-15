--CA Project - Burger Shack
--C19717889 - Alan Murphy
--TU 856



DROP TABLE branch CASCADE CONSTRAINTS;

DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE customerbooking CASCADE CONSTRAINTS;

DROP TABLE employee CASCADE CONSTRAINTS;

DROP TABLE fine CASCADE CONSTRAINTS;

DROP TABLE sitdown CASCADE CONSTRAINTS;

DROP TABLE groupparty CASCADE CONSTRAINTS;

DROP VIEW over30;    


CREATE TABLE branch (
    branchid_pk  NUMBER(7) NOT NULL,
    branchaddress VARCHAR2(225) NOT NULL,
    branchphone VARCHAR2(10) NOT NULL,
    employee_employeeid_pk  NUMBER(7)
);


CREATE TABLE customer (
    custid_pk  NUMBER(7) NOT NULL,
    custname   VARCHAR2(60) NOT NULL,
    custadd    VARCHAR2(225) NOT NULL,
    custemail  VARCHAR2(30) NOT NULL,
    custphone  VARCHAR2 (10) NOT NULL,
    custage    NUMBER (3)
);



CREATE TABLE customerbooking (
    bookingid_pk        NUMBER(7) NOT NULL,
    bookingtime         TIMESTAMP NOT NULL,
    bookingmaxpeople    NUMBER NOT NULL,
    customer_custid_pk  NUMBER(7) NOT NULL
);



CREATE TABLE employee (
    employeeid_pk       NUMBER(7) NOT NULL,
    employeename        VARCHAR2(60) NOT NULL,
    employeeadd         VARCHAR2(225) NOT NULL,
    employeephone       NUMBER (10)NOT NULL,
    employeeemail       VARCHAR2(30) NOT NULL,
    employeedob         DATE,
    employeestartdate   DATE 
);

--EMPOYEE TABLE CONSTRAINTS

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employeeid_pk );


CREATE TABLE fine (
    fineid_pk                     NUMBER(7) NOT NULL,
    custadd                       VARCHAR2(225) NOT NULL,
    finetime                      NUMBER(9, 2),
    customer_custid_pk            NUMBER(7) NOT NULL,
    customerbooking_bookingid_pk  NUMBER(7) NOT NULL,
    customerbooking_custid_fk     NUMBER(7) NOT NULL
);

--FINE TABLE CONSTRAINTS
ALTER TABLE fine ADD CONSTRAINT fine_pk PRIMARY KEY ( fineid_pk, customer_custid_pk );


CREATE TABLE sitdown (
    tableid_pk                    NUMBER(7) NOT NULL PRIMARY KEY,
    tabletype                     NUMBER (2) NOT NULL,
    tablelocation                 VARCHAR2(20) NOT NULL,
    employeeid_pk                 NUMBER(7) NOT NULL,
    CHECK (tabletype BETWEEN 2 AND 9 AND tabletype NOT IN (3, 5, 7)),
    CONSTRAINT sitdown_employee_fk FOREIGN KEY (employeeid_pk ) REFERENCES employee(employeeid_pk ));
    
    

CREATE TABLE groupparty (
   tableid_pk       NUMBER(7) NOT NULL,
   employeeid_pk    NUMBER(7) NOT NULL,
   groupname        VARCHAR2(60) NOT NULL,
   groupemail       VARCHAR2(30) NOT NULL,
   groupadd         VARCHAR2(225) NOT NULL,
   groupphone       VARCHAR2(10)NOT NULL,
   PRIMARY KEY (tableid_pk, employeeid_pk),
   CONSTRAINT group_party_tableid_fk FOREIGN KEY (tableid_pk ) REFERENCES sitdown(tableid_pk ),
   CONSTRAINT group_party_employee_fk FOREIGN KEY (employeeid_pk ) REFERENCES employee(employeeid_pk ));
  

--BRANCH TABLE CONSTRAINTS
--ALTER TABLE branch ADD CONSTRAINT branch_pk PRIMARY KEY ( branchid_pk );
--ALTER TABLE branch ADD CONSTRAINT branch_phone_unique UNIQUE ( branchphone );


--CUSTOMER TABLE CONTRIANTS
ALTER TABLE customer ADD constraint check_cust_age CHECK ( custage >= 18);
ALTER TABLE Customer ADD CONSTRAINT CHECK_CUST_EMAIL CHECK ( custemail LIKE '%@%' );
ALTER TABLE customer ADD CONSTRAINT customerprimary_pk PRIMARY KEY ( custid_pk );
--ALTER TABLE customer ADD CONSTRAINT cust_phone_unique UNIQUE ( custphone );


--CUSTOMER BOOKING TABLE CONSTRAINTS
ALTER TABLE customerbooking ADD constraint check_max_people CHECK (bookingMaxPeople <= 6);
--ALTER TABLE CustomerBooking ADD CONSTRAINT CHECK_MAX_TIME CHECK ( bookingmaxtime > 2 );
ALTER TABLE customerbooking ADD CONSTRAINT customerbooking_pk PRIMARY KEY ( bookingid_pk, customer_custid_pk  );


--EMPOYEE TABLE CONSTRAINTS
ALTER TABLE employee ADD constraint email_like CHECK ( employeeemail LIKE '%@burgershack.com%' );


--GROUPPARTY TABLE CONSTRAINTS
ALTER TABLE groupparty ADD constraint look_email_party CHECK (groupemail LIKE '%@%' );


--BRANCH FOREIGN KEY CONSTRAINTS
ALTER TABLE branch ADD CONSTRAINT branch_employee_fk 
FOREIGN KEY ( employee_employeeid_pk )
REFERENCES employee ( employeeid_pk );


--CUSTOMER FOREIGN KEY CONSTRAINTS
ALTER TABLE customerbooking ADD CONSTRAINT customerbooking_customer_fk 
FOREIGN KEY ( customer_custid_pk ) REFERENCES customer ( custid_pk );


--FINE FOREIGN KEY CONSTRAINTS
ALTER TABLE fine ADD CONSTRAINT fine_customer_fk 
FOREIGN KEY ( customer_custid_pk ) REFERENCES customer ( custid_pk );

ALTER TABLE fine ADD CONSTRAINT fine_customerbooking_fk 
FOREIGN KEY ( customerbooking_bookingid_pk,customerbooking_custid_fk )
REFERENCES customerbooking ( bookingid_pk, customer_custid_pk );




--INSERT DATA INTO EMPLOYEE TABLE
INSERT INTO employee (employeeid_pk, employeename, employeeadd, employeephone, employeeemail, employeedob, employeestartdate) 
VALUES(987654, 'Alan Murphy', '1 Main Street, This Old Town, Dublin 1', 01607222, 'alan@burgershack.com', TO_DATE('12/04/1991', 'DD/MM/YYYY'), TO_DATE('1/10/2020', 'DD/MM/YYYY') );
INSERT INTO employee (employeeid_pk, employeename, employeeadd, employeephone, employeeemail, employeedob, employeestartdate) 
VALUES(456789, 'Amber Murphy', '44 Newberry, Kilcullen, Co. Kildare', 0879874367, 'amber@burgershack.com', TO_DATE('24/10/2002', 'DD/MM/YYYY'), TO_DATE('26/12/2018', 'DD/MM/YYYY') );
INSERT INTO employee (employeeid_pk, employeename, employeeadd, employeephone, employeeemail, employeedob, employeestartdate) 
VALUES(113467, 'Caoimhe Murphy', '78 Long Road, Terenure, Dublin 6', 0836543219, 'caoimhe@burgershack.com', TO_DATE('07/05/1998', 'DD/MM/YYYY'), TO_DATE('13/09/2016', 'DD/MM/YYYY') );
INSERT INTO employee (employeeid_pk, employeename, employeeadd, employeephone, employeeemail, employeedob, employeestartdate) 
VALUES(445621, 'Prince Rogers', '78 Purple Road, Paisley Park, Dublin 16', 0833334444, 'prince@burgershack.com', TO_DATE('04/06/1977', 'DD/MM/YYYY'), TO_DATE('20/03/2017', 'DD/MM/YYYY') );
INSERT INTO employee (employeeid_pk, employeename, employeeadd, employeephone, employeeemail, employeedob, employeestartdate) 
VALUES(336655, 'John Doyle', '12 The Court, Ballinteer, Dublin 16', 0831188997, 'john@burgershack.com', TO_DATE('17/03/1984', 'DD/MM/YYYY'), TO_DATE('03/01/2014', 'DD/MM/YYYY') );


--INSERT DATA INTO BRANCH TABLE
INSERT INTO branch (branchid_pk, branchaddress, branchphone, employee_employeeid_pk ) 
VALUES(1234592, '77 Old Street, This Old Town, Dublin 1', 01607811, 987654);
INSERT INTO branch (branchid_pk, branchaddress, branchphone, employee_employeeid_pk ) 
VALUES(2345618, '40 Old Town Avenue, Dublin 16', 01607112, 456789);
INSERT INTO branch (branchid_pk, branchaddress, branchphone, employee_employeeid_pk ) 
VALUES(9564564, '13 Henry Street, This Old Town, Dublin 1', 01607889, 113467);
INSERT INTO branch (branchid_pk, branchaddress, branchphone, employee_employeeid_pk ) 
VALUES(4651275, '65 Fast Avenue, Tallaght, Dublin 24', 01647650, 445621);
INSERT INTO branch (branchid_pk, branchaddress, branchphone, employee_employeeid_pk ) 
VALUES(5563217, '107 Sleepy Town, Portebello, Dublin 8', 01978452, 336655);


--INSERT DATA INTO CUSTOMER TABLE
INSERT INTO customer (custid_pk, custname, custadd, custemail, custphone, custage ) 
VALUES(9512311, 'Al Murphy', '11 Aranleigh Court, Rathfanham, Dublin 14', 'almurphy@gmail.com', 0879513571, 29);
INSERT INTO customer (custid_pk, custname, custadd, custemail, custphone, custage ) 
VALUES(9544127, 'Joey The Lips', '13 The Snapper, Barrys Town, Dublin 19', 'joey@hotmail.com', 0879596457, 52);
INSERT INTO customer (custid_pk, custname, custadd, custemail, custphone, custage ) 
VALUES(9644567, 'Mary O Connell', '97 The Court, Ballyboden, Dublin 14', 'mary@gmail.com', 0878987453, 43);
INSERT INTO customer (custid_pk, custname, custadd, custemail, custphone, custage ) 
VALUES(9544789, 'Janey Mack', '207 Francis Street, The Liberties, Dublin 2', 'janie@hotmail.com', 0871132145, 24);
INSERT INTO customer (custid_pk, custname, custadd, custemail, custphone, custage ) 
VALUES(9511226, 'Robbie Murphy', '2 Terry Street, Lucan, Dublin 15', 'robbie@hotmail.com', 0871132145, 37);


--INSERT DATA INTO BOOKING TABLE
INSERT INTO customerbooking (bookingid_pk, bookingtime, bookingmaxpeople, customer_custid_pk ) 
VALUES(1166547, to_timestamp('01/12/2020 12:00:00.00','DD/MM/YYYY HH24:MI:SS.FF'), 6, 9512311);
INSERT INTO customerbooking (bookingid_pk, bookingtime, bookingmaxpeople, customer_custid_pk ) 
VALUES(1145679, to_timestamp('24/11/2020 14:30:00.00','DD/MM/YYYY HH24:MI:SS.FF'), 2, 9544127);
INSERT INTO customerbooking (bookingid_pk, bookingtime, bookingmaxpeople, customer_custid_pk ) 
VALUES(1785423, to_timestamp('30/11/2020 17:00:00.00','DD/MM/YYYY HH24:MI:SS.FF'), 4, 9644567);
INSERT INTO customerbooking (bookingid_pk, bookingtime, bookingmaxpeople, customer_custid_pk ) 
VALUES(1933254, to_timestamp('03/12/2020 20:30:00.00','DD/MM/YYYY HH24:MI:SS.FF'), 4, 9544789);
INSERT INTO customerbooking (bookingid_pk, bookingtime, bookingmaxpeople, customer_custid_pk ) 
VALUES(1247568, to_timestamp('06/12/2020 16:00:00.00','DD/MM/YYYY HH24:MI:SS.FF'), 6, 9511226);


--INSERT DATA INTO FINE TABLE
INSERT INTO fine (fineid_pk, custadd, customer_custid_pk, customerbooking_bookingid_pk, customerbooking_custid_fk ) 
VALUES(2241653, '11 Aranleigh Court, Rathfanham, Dublin 14' , 9512311, 1166547, 9512311);
INSERT INTO fine (fineid_pk, custadd, customer_custid_pk, customerbooking_bookingid_pk, customerbooking_custid_fk ) 
VALUES(2188965, '13 The Snapper, Barrys Town, Dublin 19' , 9544127, 1145679, 9544127);
INSERT INTO fine (fineid_pk, custadd, customer_custid_pk, customerbooking_bookingid_pk, customerbooking_custid_fk ) 
VALUES(2236547, '97 The Court, Ballyboden, Dublin 14' , 9644567, 1785423, 9644567);
INSERT INTO fine (fineid_pk, custadd, customer_custid_pk, customerbooking_bookingid_pk, customerbooking_custid_fk ) 
VALUES(2349519, '207 Francis Street, The Liberties, Dublin 2' , 9544789, 1933254, 9544789);
INSERT INTO fine (fineid_pk, custadd, customer_custid_pk, customerbooking_bookingid_pk, customerbooking_custid_fk ) 
VALUES(2261378, '2 Terry Street, Lucan, Dublin 15' , 9511226, 1247568, 9511226);


--INSERT DATA INTO SITDOWN TABLE
INSERT INTO sitdown (tableid_pk, tabletype, tablelocation, employeeid_pk ) 
VALUES(4312567, 2, 'Window', 987654);
INSERT INTO sitdown (tableid_pk, tabletype, tablelocation, employeeid_pk ) 
VALUES(4312556, 4, 'Interior', 456789);
INSERT INTO sitdown (tableid_pk, tabletype, tablelocation, employeeid_pk ) 
VALUES(4313654, 2, 'Interior', 113467);
INSERT INTO sitdown (tableid_pk, tabletype, tablelocation, employeeid_pk ) 
VALUES(4323654, 8, 'Window', 445621);
INSERT INTO sitdown (tableid_pk, tabletype, tablelocation, employeeid_pk ) 
VALUES(4223654, 6, 'Window', 336655);


--INSERT DATA INTO GROUPPARTY TABLE
INSERT INTO groupparty (tableid_pk, employeeid_pk, groupname, groupemail, groupadd, groupphone ) 
VALUES(4312567, 987654, 'Sean Murphy', 'sean@gmail.com', '23 Tall Street, Castlebar, Co. Mayo', 0852300591);
INSERT INTO groupparty (tableid_pk, employeeid_pk, groupname, groupemail, groupadd, groupphone ) 
VALUES(4312556, 456789, 'Johnny Lennon', 'john@gmail.com', '44 Abbey Road, De North Side, Dublin 1', 0862165544);
INSERT INTO groupparty (tableid_pk, employeeid_pk, groupname, groupemail, groupadd, groupphone ) 
VALUES(4313654, 113467, 'Shay Brown', 'shay@hotmail.com', '11 Talbot Street, Over The Liffey, Dublin 1', 0831236547);
INSERT INTO groupparty (tableid_pk, employeeid_pk, groupname, groupemail, groupadd, groupphone ) 
VALUES(4323654, 445621, 'Cat Greally', 'cat@gmail.com', '76 Thomas Street, The Liberties, Dublin 2', 0852316789);
INSERT INTO groupparty (tableid_pk, employeeid_pk, groupname, groupemail, groupadd, groupphone ) 
VALUES(4223654, 336655, 'Amber Murphy', 'amber@hotmail.com', '44 Newberry, Newbridge, Co. Kildare', 0832345678);



--SELECT * FROM employee;

--SELECT * FROM branch;

--SELECT * FROM customer;

--SELECT * FROM customerbooking;

--SELECT * FROM customerbooking;

--SELECT * FROM fine;

--SELECT * FROM sitdown;

--SELECT * FROM groupparty;

--DML QUERIES--
--UPDATE USING SUB QUERY

--UPDATE customer 
--SET custphone = 0879874367 , custname = 'Tony Murphy', custemail = 'tony@gmail.com' 
--WHERE custid_pk = 9544789;

UPDATE groupparty 
SET  groupparty.groupadd = (SELECT employee.employeeadd
                            FROM employee
                            WHERE employee.employeeid_pk = groupparty.employeeid_pk);                         
                            
                            
--CASE FUNCTION
SELECT tableid_pk, tabletype, tablelocation,
CASE tabletype
    WHEN 2 THEN 'Two Seater Table'
    WHEN 4 THEN 'Four Seater Table'
    WHEN 6 THEN 'Six Seater Table'
    WHEN 8 THEN 'Eight Seater Table'
END "People Per Table"
FROM sitdown;


--DECODE FUNCTION
SELECT branchid_pk, branchaddress, branchphone,
decode (branchid_pk,
    1234592, 'D1 P2DD',
    2345618, 'D16 A12L',
    9564564, 'D1 P5DA',
    4651275, 'D24 X7YZ',
    5563217, 'D8 P8AB')
    "EIRCODE"
FROM branch;


--INNER JOIN USING GROUP BY 
SELECT employeename, count(tableid_pk) AS TableCount
FROM sitdown
INNER JOIN employee ON sitdown.employeeid_pk = employee.employeeid_pk
GROUP BY employeename;

--INNER JOIN USING GROUP BY 
SELECT custname, count(bookingid_pk) AS TotalBookings
FROM customerbooking
INNER JOIN customer ON customer.custid_pk = customerbooking.customer_custid_pk
WHERE custname like '%Joey%'
GROUP BY custname;


--LEFT OUTER JOIN 
SELECT groupparty.groupname, groupparty.tableid_pk, sitdown.tablelocation 
FROM groupparty 
LEFT OUTER JOIN sitdown ON groupparty.tableid_pk = sitdown.tableid_pk; 

--LEFT OUTER JOIN 
SELECT branch.branchid_pk, branch.employee_employeeid_pk, employee.employeename 
FROM branch
LEFT OUTER JOIN employee ON branch.employee_employeeid_pk = employee.employeeid_pk; 


--RIGHT OUTER JOIN 
SELECT employee.employeename, employee.employeeadd, employee.employeeid_pk, sitdown.tableid_pk, sitdown.tabletype, sitdown.tablelocation
FROM employee RIGHT OUTER JOIN sitdown
ON (employee.employeeid_pk = sitdown.employeeid_pk);


--RIGHT OUTER JOIN 
SELECT employee.employeename, employee.employeedob, employee.employeeid_pk, groupparty.groupname, groupparty.groupphone
FROM employee RIGHT OUTER JOIN groupparty
ON (employee.employeeid_pk = groupparty.employeeid_pk)
WHERE groupparty.groupname LIKE '%John%';


--UNION
SELECT groupname, groupphone, groupadd FROM groupparty JOIN sitdown USING (employeeid_pk) WHERE tabletype <= 2
UNION 
SELECT groupname, groupphone, groupadd FROM groupparty JOIN sitdown USING (employeeid_pk) WHERE tabletype BETWEEN 4 AND 6;


--INTERSECT
SELECT employeename, employeeemail, employeestartdate
FROM employee
LEFT OUTER JOIN groupparty ON employee.employeeid_pk = groupparty.employeeid_pk
INTERSECT
SELECT employeename, employeeemail, employeestartdate
FROM employee
RIGHT OUTER JOIN groupparty ON employee.employeeid_pk = groupparty.employeeid_pk
WHERE employee.employeename LIKE '%Murphy%';


--VIEW
CREATE VIEW over30 AS
SELECT custname, custage
FROM customer
WHERE custage > 30;

SELECT * FROM over30;

COMMIT;

