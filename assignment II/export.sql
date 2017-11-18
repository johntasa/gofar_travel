--------------------------------------------------------
-- Archivo creado  - viernes-noviembre-17-2017   
--------------------------------------------------------
DROP VIEW "DBA_JOHNTASA"."HIGHEST_BALANCE_RB";
DROP VIEW "DBA_JOHNTASA"."INFORMATION_OF_BILLS";
DROP TABLE "DBA_JOHNTASA"."BILL_DETAILS";
DROP TABLE "DBA_JOHNTASA"."BILLS";
DROP TABLE "DBA_JOHNTASA"."COST_CENTERS";
DROP TABLE "DBA_JOHNTASA"."ITEMS";
DROP TABLE "DBA_JOHNTASA"."PATIENTS";
DROP SEQUENCE "DBA_JOHNTASA"."BILL_DETAILS_SEQ";
DROP SEQUENCE "DBA_JOHNTASA"."BILLS_SEQ";
DROP SEQUENCE "DBA_JOHNTASA"."COST_CENTERS_SEQ";
DROP SEQUENCE "DBA_JOHNTASA"."ITEMS_SEQ";
DROP SEQUENCE "DBA_JOHNTASA"."PATIENTS_SEQ";
DROP PROCEDURE "DBA_JOHNTASA"."INCREASE_CURR_PRICE_ITEMS";
DROP FUNCTION "DBA_JOHNTASA"."QUANTITY_BY_COST_CENTER";
DROP FUNCTION "DBA_JOHNTASA"."TOTAL_BY_COST_CENTER";
--------------------------------------------------------
--  DDL for View HIGHEST_BALANCE_RB
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "DBA_JOHNTASA"."HIGHEST_BALANCE_RB" ("PATIENT_ID", "NAME", "ADDRESS", "DATE_BILL", "TOTAL", "TOTAL_ROOM_BOARD") AS 
  SELECT "PATIENT_ID","NAME","ADDRESS","DATE_BILL","TOTAL","TOTAL_ROOM_BOARD" FROM
(SELECT P.PATIENT_ID, P.NAME, P.ADDRESS, B.DATE_BILL, B.TOTAL, TOTAL_BY_COST_CENTER(100,B.BILL_ID) AS TOTAL_ROOM_BOARD
FROM PATIENTS P
JOIN BILLS B
ON B.PATIENT_ID = P.PATIENT_ID
ORDER BY TOTAL_ROOM_BOARD DESC) 
WHERE ROWNUM = 1
;
--------------------------------------------------------
--  DDL for View INFORMATION_OF_BILLS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "DBA_JOHNTASA"."INFORMATION_OF_BILLS" ("PATIENT_ID", "NAME", "ADDRESS", "DATE_BILL", "DATE_ADMITED", "DATE_DISCHARGE", "TOTAL_ITEMS_ROOM_BOARD", "BALANCE_ROOM_AND_BOARD", "TOTAL_ITEMS_LABORATORY", "BALANCE_LABORATORY", "TOTAL_ITEMS_RADIOLOGY", "BALANCE_RADIOLOGY") AS 
  SELECT P.PATIENT_ID, P.NAME, P.ADDRESS, B.DATE_BILL, B.DATE_ADMITED, B.DATE_DISCHARGE,
    QUANTITY_BY_COST_CENTER(100,B.BILL_ID) AS TOTAL_ITEMS_ROOM_BOARD, TOTAL_BY_COST_CENTER(100,B.BILL_ID) AS BALANCE_ROOM_AND_BOARD,
    QUANTITY_BY_COST_CENTER(110,B.BILL_ID) AS TOTAL_ITEMS_LABORATORY, TOTAL_BY_COST_CENTER(110,B.BILL_ID) AS BALANCE_LABORATORY, 
    QUANTITY_BY_COST_CENTER(125,B.BILL_ID) AS TOTAL_ITEMS_RADIOLOGY, TOTAL_BY_COST_CENTER(125,B.BILL_ID) AS BALANCE_RADIOLOGY
FROM PATIENTS P
JOIN BILLS B
ON B.PATIENT_ID = P.PATIENT_ID
;
--------------------------------------------------------
--  DDL for Table BILL_DETAILS
--------------------------------------------------------

  CREATE TABLE "DBA_JOHNTASA"."BILL_DETAILS" 
   (	"BILLDETAIL_ID" NUMBER, 
	"CHARGED_DATE" DATE, 
	"ITEM_ID" NUMBER, 
	"BILL_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BILLS
--------------------------------------------------------

  CREATE TABLE "DBA_JOHNTASA"."BILLS" 
   (	"BILL_ID" NUMBER, 
	"DATE_BILL" DATE, 
	"DATE_ADMITED" DATE, 
	"DATE_DISCHARGE" DATE, 
	"TOTAL" NUMBER(8,2), 
	"PATIENT_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table COST_CENTERS
--------------------------------------------------------

  CREATE TABLE "DBA_JOHNTASA"."COST_CENTERS" 
   (	"COST_CENTER_ID" NUMBER, 
	"DESCRIPTION" VARCHAR2(500 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ITEMS
--------------------------------------------------------

  CREATE TABLE "DBA_JOHNTASA"."ITEMS" 
   (	"ITEM_ID" NUMBER, 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"PRICE" NUMBER(8,2), 
	"COST_CENTER_ID" NUMBER, 
	"UNITS_AVAILABLE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table PATIENTS
--------------------------------------------------------

  CREATE TABLE "DBA_JOHNTASA"."PATIENTS" 
   (	"PATIENT_ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"CITY" VARCHAR2(255 BYTE), 
	"STATE" VARCHAR2(50 BYTE), 
	"ZIP" VARCHAR2(10 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Sequence BILL_DETAILS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DBA_JOHNTASA"."BILL_DETAILS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BILLS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DBA_JOHNTASA"."BILLS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COST_CENTERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DBA_JOHNTASA"."COST_CENTERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 5 START WITH 100 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ITEMS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DBA_JOHNTASA"."ITEMS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 5 START WITH 5 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PATIENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DBA_JOHNTASA"."PATIENTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE ;
REM INSERTING into DBA_JOHNTASA.BILL_DETAILS
SET DEFINE OFF;
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('1',to_date('14/07/08','DD/MM/RR'),'2000','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('2',to_date('14/07/08','DD/MM/RR'),'2005','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('3',to_date('15/07/08','DD/MM/RR'),'2000','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('4',to_date('16/07/08','DD/MM/RR'),'2000','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('5',to_date('14/07/08','DD/MM/RR'),'1580','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('6',to_date('15/07/08','DD/MM/RR'),'1585','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('7',to_date('15/07/08','DD/MM/RR'),'3010','1');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('8',to_date('12/11/17','DD/MM/RR'),'2000','2');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('9',to_date('12/11/17','DD/MM/RR'),'3020','2');
Insert into DBA_JOHNTASA.BILL_DETAILS (BILLDETAIL_ID,CHARGED_DATE,ITEM_ID,BILL_ID) values ('10',to_date('13/11/17','DD/MM/RR'),'2005','3');
REM INSERTING into DBA_JOHNTASA.BILLS
SET DEFINE OFF;
Insert into DBA_JOHNTASA.BILLS (BILL_ID,DATE_BILL,DATE_ADMITED,DATE_DISCHARGE,TOTAL,PATIENT_ID) values ('1',to_date('20/07/08','DD/MM/RR'),to_date('14/07/08','DD/MM/RR'),to_date('17/07/08','DD/MM/RR'),'680','12345');
Insert into DBA_JOHNTASA.BILLS (BILL_ID,DATE_BILL,DATE_ADMITED,DATE_DISCHARGE,TOTAL,PATIENT_ID) values ('2',to_date('12/11/17','DD/MM/RR'),to_date('12/11/17','DD/MM/RR'),to_date('12/11/17','DD/MM/RR'),'253','1');
Insert into DBA_JOHNTASA.BILLS (BILL_ID,DATE_BILL,DATE_ADMITED,DATE_DISCHARGE,TOTAL,PATIENT_ID) values ('3',to_date('13/11/17','DD/MM/RR'),to_date('13/11/17','DD/MM/RR'),to_date('13/11/17','DD/MM/RR'),'5','2');
REM INSERTING into DBA_JOHNTASA.COST_CENTERS
SET DEFINE OFF;
Insert into DBA_JOHNTASA.COST_CENTERS (COST_CENTER_ID,DESCRIPTION) values ('100','Room & Board');
Insert into DBA_JOHNTASA.COST_CENTERS (COST_CENTER_ID,DESCRIPTION) values ('110','Laboratory');
Insert into DBA_JOHNTASA.COST_CENTERS (COST_CENTER_ID,DESCRIPTION) values ('125','Radiology');
Insert into DBA_JOHNTASA.COST_CENTERS (COST_CENTER_ID,DESCRIPTION) values ('130','Physiology');
Insert into DBA_JOHNTASA.COST_CENTERS (COST_CENTER_ID,DESCRIPTION) values ('135','Bacteriology');
REM INSERTING into DBA_JOHNTASA.ITEMS
SET DEFINE OFF;
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('2000','Semi-prv Room','200','100',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('2005','Television','5','100',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('1580','Glucose','25','110',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('1585','Culture','20','110',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('3010','X-ray chest','30','125',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('3015','X-ray head','35','125',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('3020','CT scan','53','125',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('2500','Physical Therapy','5','130',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('2510','Gym','5','130',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('1000','Aquificae','150','135',null);
Insert into DBA_JOHNTASA.ITEMS (ITEM_ID,DESCRIPTION,PRICE,COST_CENTER_ID,UNITS_AVAILABLE) values ('1020','Gemmatimonadetes','125','135',null);
REM INSERTING into DBA_JOHNTASA.PATIENTS
SET DEFINE OFF;
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('12345','Mary Baker','300 Oak Street','Boulder','CO','80638');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('1','Moana Barrera','Ap #853-7231 Leo. St.','Lac-Serent','QC','622235');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('2','Camden Klein','784-5329 Nec, Rd.','Vaulx-lez-Chimay','HE','604214');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('3','Ralph Carney','8728 Pellentesque Av.','Guadalajara','Castilla - La Mancha','21325');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('4','Wylie Berry','2437 Sodales St.','San Vicente','SJ','90301-833');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('5','Chandler Franco','9103 Quis Street','Miami','FL','558451');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('6','Signe Allen','9549 Augue Street','Vierzon','CE','2010 BS');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('7','Sarah Adams','P.O. Box 578, 5039 Purus. Avenue','Galway','Connacht','73433');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('8','Timon Pratt','P.O. Box 446, 2905 Sed Ave','Sosnowiec','Sl?skie','2687');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('9','Abra Hewitt','Ap #496-7455 Scelerisque, Ave','Bloomington','MN','8349');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('10','Iris Cunningham','267-8926 Amet, St.','Belfast','U','43983-571');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('11','Angela Witt','Ap #916-4964 Sem. Avenue','Tumba','Stockholms län','60213');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('12','Hoyt Burke','8008 Cursus St.','Uyo','AK','66994');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('13','Anjolie Valentine','303-7357 Vitae, Avenue','Vienna','Vienna','10619');
Insert into DBA_JOHNTASA.PATIENTS (PATIENT_ID,NAME,ADDRESS,CITY,STATE,ZIP) values ('14','Brock Baker','P.O. Box 496, 8347 Enim, Street','Cumberland','Ontario','0155 FV');
--------------------------------------------------------
--  DDL for Index ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBA_JOHNTASA"."ITEM_PK" ON "DBA_JOHNTASA"."ITEMS" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COST_CENTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBA_JOHNTASA"."COST_CENTER_PK" ON "DBA_JOHNTASA"."COST_CENTERS" ("COST_CENTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BILLDETAIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBA_JOHNTASA"."BILLDETAIL_PK" ON "DBA_JOHNTASA"."BILL_DETAILS" ("BILLDETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BILL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBA_JOHNTASA"."BILL_PK" ON "DBA_JOHNTASA"."BILLS" ("BILL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PATIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DBA_JOHNTASA"."PATIENT_PK" ON "DBA_JOHNTASA"."PATIENTS" ("PATIENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Trigger UPDATE_ITEM_UNITS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DBA_JOHNTASA"."UPDATE_ITEM_UNITS" AFTER INSERT ON BILL_DETAILS
FOR EACH ROW
BEGIN
    UPDATE ITEMS IT SET UNITS_AVAILABLE = UNITS_AVAILABLE - 1 WHERE IT.ITEM_ID = :NEW.ITEM_ID;
END;
/
ALTER TRIGGER "DBA_JOHNTASA"."UPDATE_ITEM_UNITS" ENABLE;
--------------------------------------------------------
--  DDL for Procedure INCREASE_CURR_PRICE_ITEMS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DBA_JOHNTASA"."INCREASE_CURR_PRICE_ITEMS" AS
	NEW_CURRENT_PRICE ITEMS.PRICE%TYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Start execution...');		

	FOR ITEM IN (SELECT IT.ITEM_ID, CC.DESCRIPTION, IT.PRICE, CC.COST_CENTER_ID FROM ITEMS IT
                  JOIN COST_CENTERS CC 
                  ON IT.COST_CENTER_ID = CC.COST_CENTER_ID
                  WHERE CC.COST_CENTER_ID IN (100, 110, 125))
	LOOP
		IF(ITEM.DESCRIPTION IN ('Room '||chr(38)||' Board')) THEN
        NEW_CURRENT_PRICE := ITEM.PRICE * 1.02; --EQ 0.02
			ELSE IF(ITEM.DESCRIPTION IN ('Laboratory')) THEN
          NEW_CURRENT_PRICE := ITEM.PRICE * 1.035; --EQ 0.03
				ELSE
					NEW_CURRENT_PRICE := ITEM.PRICE * 1.04; --EQ 0.05
			END IF;
		END IF;

        DBMS_OUTPUT.PUT_LINE('EL VALOR ANTERIOR ES: ' ||ITEM.PRICE|| ' Y EL ACTUAL ES: ' ||NEW_CURRENT_PRICE);

		UPDATE ITEMS IT SET PRICE = NEW_CURRENT_PRICE WHERE IT.ITEM_ID = ITEM.ITEM_ID;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE('ACTUALIZACIÓN EXITOSA');		
END;

/
--------------------------------------------------------
--  DDL for Function QUANTITY_BY_COST_CENTER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBA_JOHNTASA"."QUANTITY_BY_COST_CENTER" (cost_centerid number, billid number) RETURN NUMBER IS
    rpta NUMBER;
BEGIN
    SELECT COUNT(IT.PRICE) into rpta
    FROM BILLS B 
    JOIN BILL_DETAILS BD
    ON BD.BILL_ID = B.BILL_ID
    JOIN ITEMS IT
    ON IT.ITEM_ID = BD.ITEM_ID
    WHERE B.BILL_ID = billid AND IT.COST_CENTER_ID = cost_centerid;

    RETURN rpta;
END;

/
--------------------------------------------------------
--  DDL for Function TOTAL_BY_COST_CENTER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "DBA_JOHNTASA"."TOTAL_BY_COST_CENTER" (cost_centerid number, billid number) RETURN DECIMAL IS
    rpta DECIMAL := 0;
BEGIN
    SELECT SUM (IT.PRICE) into rpta
    FROM BILLS B 
    JOIN BILL_DETAILS BD
    ON BD.BILL_ID = B.BILL_ID
    JOIN ITEMS IT
    ON IT.ITEM_ID = BD.ITEM_ID
    WHERE B.BILL_ID = billid AND IT.COST_CENTER_ID = cost_centerid;

    IF rpta is null THEN
        rpta := 0;
    END IF;

    RETURN rpta;
END;

/
--------------------------------------------------------
--  Constraints for Table COST_CENTERS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."COST_CENTERS" ADD CONSTRAINT "COST_CENTER_PK" PRIMARY KEY ("COST_CENTER_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."COST_CENTERS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."COST_CENTERS" MODIFY ("COST_CENTER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BILL_DETAILS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" ADD CONSTRAINT "BILLDETAIL_PK" PRIMARY KEY ("BILLDETAIL_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" MODIFY ("BILL_ID" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" MODIFY ("CHARGED_DATE" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" MODIFY ("BILLDETAIL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PATIENTS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" ADD CONSTRAINT "PATIENT_PK" PRIMARY KEY ("PATIENT_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("ZIP" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."PATIENTS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BILLS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."BILLS" ADD CONSTRAINT "BILL_PK" PRIMARY KEY ("BILL_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."BILLS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."BILLS" MODIFY ("DATE_BILL" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."BILLS" MODIFY ("BILL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."ITEMS" ADD CONSTRAINT "ITEM_PK" PRIMARY KEY ("ITEM_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."ITEMS" MODIFY ("COST_CENTER_ID" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."ITEMS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."ITEMS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "DBA_JOHNTASA"."ITEMS" MODIFY ("ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BILL_DETAILS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" ADD CONSTRAINT "BILL_ID_FK" FOREIGN KEY ("BILL_ID")
	  REFERENCES "DBA_JOHNTASA"."BILLS" ("BILL_ID") ENABLE;
  ALTER TABLE "DBA_JOHNTASA"."BILL_DETAILS" ADD CONSTRAINT "ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "DBA_JOHNTASA"."ITEMS" ("ITEM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BILLS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."BILLS" ADD CONSTRAINT "PATIENT_ID_FK" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "DBA_JOHNTASA"."PATIENTS" ("PATIENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "DBA_JOHNTASA"."ITEMS" ADD CONSTRAINT "COST_CENTER_ID_FK" FOREIGN KEY ("COST_CENTER_ID")
	  REFERENCES "DBA_JOHNTASA"."COST_CENTERS" ("COST_CENTER_ID") ENABLE;
