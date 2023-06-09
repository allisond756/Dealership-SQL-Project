create table SALESTEAM (
	SALESPERSON_ID SERIAL primary key,
	FIRST_NAME VARCHAR(150),
	LAST_NAME VARCHAR(150)
);

create table CAR (
	CAR_ID SERIAL primary key,
	CAR_MODEL VARCHAR(150),
	CAR_MAKE VARCHAR(150),
	CAR_YEAR INTEGER,
	CAR_SERIAL INTEGER
);

create table CUSTOMER (
	CUSTOMER_ID SERIAL primary key,
	FIRST_NAME VARCHAR(150),
	LAST_NAME VARCHAR(150),
	BILLING_INFO VARCHAR(200)
);

create table INVOICES (
	INVOICE_ID SERIAL primary key,
	INVOICE_DATE DATE default CURRENT_DATE,
	INVOICE_AMOUNT NUMERIC(10,2),
	CAR_ID INTEGER,
	foreign KEY(CAR_ID) references CAR(CAR_ID),
	SALESPERSON_ID INTEGER,
	foreign KEY(SALESPERSON_ID) references SALESTEAM(SALESPERSON_ID),
	CUSTOMER_ID INTEGER,
	foreign KEY(CUSTOMER_ID) references CUSTOMER(CUSTOMER_ID)
);

create table MECHANICS (
	MECHANIC_ID SERIAL primary key,
	FIRST_NAME VARCHAR(150),
	LAST_NAME VARCHAR(150)
);

create table CARPARTS (
	PARTS_ID SERIAL primary key,
	PART_TYPE VARCHAR(150),
	PART_AMOUNT NUMERIC(10,2)
);

create table SERVICETICKETS (
	SERVICE_TICKET_ID SERIAL primary key,
	SERVICE_TOTAL NUMERIC(10,2),
	PARTS_ID INTEGER,
	foreign key(PARTS_ID) references CARPARTS(PARTS_ID),
	CUSTOMER_ID INTEGER,
	foreign KEY(CUSTOMER_ID) references CUSTOMER(CUSTOMER_ID),
	CAR_ID INTEGER,
	foreign KEY(CAR_ID) references CAR(CAR_ID),
	MECHANIC_ID INTEGER,
	foreign KEY(MECHANIC_ID) references MECHANICS(MECHANIC_ID)
);
