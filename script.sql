
/* Setting properties */

SET NAMES WIN1251;
SET SQL DIALECT 3;
CONNECT 'localhost/3050:C:/TST.FDB' USER 'SYSDBA' PASSWORD 'masterkey';
SET AUTODDL ON;

/* ----- Creating Tables ----- */

/* DOCS */
CREATE TABLE DOCS (
    ID_PERSON VARCHAR(10) NOT NULL,
    NDOC VARCHAR(30));


INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'17',
	'���1'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'17',
	'���2'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'16',
	'���2'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'16',
	'���1'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'15',
	'���1'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'15',
	'���2'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'15',
	'���3'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'14',
	'���3'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'14',
	'���2'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'13',
	'���2'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'13',
	'���3'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'13',
	'���4'
);

INSERT INTO PERSON (
	ID_PERSON,
	NDOC
) VALUES (
	'13',
	'���5'
);



/* PERSON */
CREATE TABLE PERSON (
    ID INTEGER NOT NULL,
    LAST_NAME VARCHAR(30),
    FIRST_NAME VARCHAR(30),
    SUR_NAME VARCHAR(30),
    BIRTHDAY DATE,
    UDATE TIMESTAMP DEFAULT 'now');



INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	2,
	'������',
	'����',
	'���������',
	'1990-05-30',
	'2024-05-30 22:04:52.846'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	3,
	'������',
	'����',
	'���������',
	'1990-05-30',
	'2024-05-30 22:05:52.451'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	4,
	'�������',
	'����',
	'��������',
	'1990-05-30',
	'2024-05-30 22:06:12.014'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	5,
	'������',
	'������',
	'��������',
	'1990-05-30',
	'2024-05-30 22:06:25.910'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	6,
	'������',
	'������',
	'��������',
	'1990-05-30',
	'2024-05-30 22:07:29.452'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	8,
	'�������',
	'����',
	'��������',
	'1990-05-30',
	'2024-05-30 22:10:22.755'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	9,
	'�������',
	'�������',
	'��������',
	'1990-05-30',
	'2024-05-30 22:11:17.940'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	10,
	'�������',
	'����',
	'����������',
	'1990-05-30',
	'2024-05-30 22:11:27.670'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	11,
	'��������',
	'����',
	'���������',
	'1990-05-30',
	'2024-05-30 22:11:40.594'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	12,
	'��������',
	'����',
	'��������',
	'1990-05-30',
	'2024-05-30 22:11:46.025'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	13,
	'��������',
	'����',
	'��������',
	'1990-05-30',
	'2024-05-30 22:11:56.710'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	14,
	'������',
	'�������',
	'��������',
	'1990-05-30',
	'2024-05-30 22:13:59.796'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	15,
	'������',
	'�������',
	'���������',
	'1990-05-30',
	'2024-05-30 22:14:06.887'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	16,
	'������',
	'�������',
	'���������',
	'1990-05-30',
	'2024-05-30 22:14:32.215'
);

INSERT INTO PERSON (
	ID,
	LAST_NAME,
	FIRST_NAME,
	SUR_NAME,
	BIRTHDAY,
	UDATE
) VALUES (
	17,
	'������',
	'�������',
	'��������',
	'1990-05-30',
	'2024-05-30 22:14:36.406'
);



/* ----- Creating Sequences ----- */

/* GEN_ID_PERSON */
CREATE OR ALTER SEQUENCE GEN_ID_PERSON START WITH 0 INCREMENT BY 1;

/* ----- Creating Triggers for Table stubs ----- */

/* PERSON_BI (STUB) */
SET TERM ^;
CREATE OR ALTER TRIGGER PERSON_BI
	FOR PERSON BEFORE INSERT
AS BEGIN END^

SET TERM ;^

/* ----- Creating Triggers for Table ----- */

/* PERSON_BI */
SET TERM ^;
CREATE OR ALTER TRIGGER PERSON_BI FOR PERSON
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
IF (NEW.ID IS NULL) THEN
NEW.ID = GEN_ID(GEN_ID_person,1);
END^
SET TERM ;^
