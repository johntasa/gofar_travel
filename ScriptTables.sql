CREATE TABLE Patients (
  patient_Id number NOT NULL,
  name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  state varchar(50) NOT NULL,
  zip varchar(10) NOT NULL,
	CONSTRAINT patient_Pk PRIMARY KEY (patient_Id)
);

/

CREATE SEQUENCE patients_Seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

/

CREATE TABLE Bills (
  bill_Id number NOT NULL,
  date_Bill varchar(255) NOT NULL,
  date_Admited varchar(255) NOT NULL,
  date_Discharge varchar(255) NOT NULL,
  total varchar(100) NOT NULL,
  patient_Id number NOT NULL,
	CONSTRAINT bill_Pk PRIMARY KEY (bill_Id),
  	CONSTRAINT patient_Id_Fk FOREIGN KEY (patient_Id) REFERENCES Patients (patient_Id)
);

/

CREATE SEQUENCE bills_Seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

/

CREATE TABLE BillDetails (
  billdetail_Id number NOT NULL,
  charged_Date varchar(255) NOT NULL,
  charged_Item varchar(500) NOT NULL,
  bill_Id number NOT NULL,
	CONSTRAINT billdetail_Pk PRIMARY KEY (billdetail_Id),
	CONSTRAINT bill_Id_Fk FOREIGN KEY (bill_Id) REFERENCES Bills (bill_Id)
);

/

CREATE SEQUENCE billdetails_Seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

/

CREATE TABLE CostCenters (
  cost_Center_Id number NOT NULL,
  description varchar(500) NOT NULL,
	CONSTRAINT costcenter_Pk PRIMARY KEY (cost_Center_Id)
);

/

CREATE SEQUENCE costcenters_Seq
 START WITH     100
 INCREMENT BY   5
 NOCACHE
 NOCYCLE;

/


CREATE TABLE Items (
  item_Id number NOT NULL,
  description varchar(500) NOT NULL,
  charged_Price varchar(100) NOT NULL,
  cost_Center_Id number NOT NULL,
	CONSTRAINT item_Pk PRIMARY KEY (item_Id),
	CONSTRAINT cost_Center_Id_Fk FOREIGN KEY (cost_Center_Id) REFERENCES CostCenters (cost_Center_Id)
);

/

CREATE SEQUENCE items_Seq
 START WITH     5
 INCREMENT BY   5
 NOCACHE
 NOCYCLE;

/

CREATE TABLE Detail_Item (
  billdetail_Id number NOT NULL,
  item_Id number NOT NULL,
	CONSTRAINT detail_Item_Pk PRIMARY KEY (billdetail_Id,item_Id),
	CONSTRAINT billdetail_Id_Fk FOREIGN KEY (billdetail_Id) REFERENCES BillDetails (billdetail_Id),
	CONSTRAINT item_Id_Fk FOREIGN KEY (item_Id) REFERENCES Items (item_Id)
);

/


INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Arsenio Lambert','P.O. Box 393, 8388 A, Avenue','Barghe','LOM','6256 UW');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Moana Barrera','Ap #853-7231 Leo. St.','Lac-Serent','QC','622235');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Camden Klein','784-5329 Nec, Rd.','Vaulx-lez-Chimay','HE','604214');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Ralph Carney','8728 Pellentesque Av.','Guadalajara','Castilla - La Mancha','21325');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Wylie Berry','2437 Sodales St.','San Vicente','SJ','90301-833');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Chandler Franco','9103 Quis Street','Miami','FL','558451');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Signe Allen','9549 Augue Street','Vierzon','CE','2010 BS');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Sarah Adams','P.O. Box 578, 5039 Purus. Avenue','Galway','Connacht','73433');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Timon Pratt','P.O. Box 446, 2905 Sed Ave','Sosnowiec','Sl?skie','2687');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Abra Hewitt','Ap #496-7455 Scelerisque, Ave','Bloomington','MN','8349');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Iris Cunningham','267-8926 Amet, St.','Belfast','U','43983-571');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Angela Witt','Ap #916-4964 Sem. Avenue','Tumba','Stockholms län','60213');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Hoyt Burke','8008 Cursus St.','Uyo','AK','66994');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Anjolie Valentine','303-7357 Vitae, Avenue','Vienna','Vienna','10619');
INSERT INTO Patients (patient_Id,name,address,city,state,zip) VALUES (patients_Seq.nextval,'Brock Baker','P.O. Box 496, 8347 Enim, Street','Cumberland','Ontario','0155 FV');

INSERT INTO CostCenters (cost_Center_Id,description) VALUES (costcenters_Seq.nextval,'Room & Board');
INSERT INTO CostCenters (cost_Center_Id,description) VALUES (costcenters_Seq.nextval,'Laboratory');
INSERT INTO CostCenters (cost_Center_Id,description) VALUES (costcenters_Seq.nextval,'Radiology');
INSERT INTO CostCenters (cost_Center_Id,description) VALUES (costcenters_Seq.nextval,'Physiology');
INSERT INTO CostCenters (cost_Center_Id,description) VALUES (costcenters_Seq.nextval,'Bacteriology');

INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Semi-prv Room','$200.00','100');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Television','$5.00','100');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Glucose','$25.00','105');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Culture','$20.00','105');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'X-ray chest','$30.00','110');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'X-ray head','$35.00','110');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'CT scan','$53.00','110');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Physical Therapy','$5.00','115');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Gym','$5.00','115');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Aquificae','$150.00','120');
INSERT INTO Items (item_Id,description,charged_Price,cost_Center_Id) VALUES (items_Seq.nextval,'Gemmatimonadetes','$125.00','120');