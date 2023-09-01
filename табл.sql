CREATE TABLE Client(
	cID INTEGER,
	cPassword varchar(16) CHECK (length(cPassword) > 8), 
	cMailLog varchar(30), 
	cName varchar(30) NOT NULL, 
	cSurname varchar(30) NOT NULL,
	cPhone varchar(16), 
	CONSTRAINT login UNIQUE (cMailLog),
	PRIMARY KEY (cID AUTOINCREMENT)
);

CREATE TABLE CTour(
	tID INTEGER,
	cID INTEGER,
	cDate date, 
	cTerm varchar(7), 
	cPeople INTEGER,
	cStatusPay INTEGER CHECK (cStatusPay = 1 or cStatusPay = 0),
	FOREIGN KEY (tID) REFERENCES Tour(tID),
	FOREIGN KEY (cID) REFERENCES Client(cID)
);

CREATE TABLE Tour(
	tID INTEGER, 
	tPrice INTEGER CHECK (tPrice >= 0), 
	tHotelName varchar(100) NOT NULL, 
	tStartDate date, 
	tStatus INTEGER NOT NULL CHECK (tStatus = 1 or tStatus = 0), 
	tPlace varchar(100) NOT NULL, 
	tDetails varchar, 
	PRIMARY KEY (tID AUTOINCREMENT)
);

CREATE TABLE Hotel(
	hID INTEGER,
	hName varchar(100) NOT NULL,
	hPrice INTEGER,
	hLocation varchar(100),
	hNumber varchar(16),
	hRoom varchar(225),
	PRIMARY KEY (hID AUTOINCREMENT)
);

CREATE TABLE ReservTransp(
	tID INTEGER,
	trID INTEGER,
	rtID INTEGER,
	rtDate date,
	rtClient varchar(100),
	PRIMARY KEY (rtID AUTOINCREMENT),
	FOREIGN KEY (tID) REFERENCES Tour(tID),
	FOREIGN KEY (trID) REFERENCES Transport(trID)	
);

CREATE TABLE Transport(
	trID INTEGER,
	trType varchar(50),
	trPrice INTEGER,
	PRIMARY KEY (trID AUTOINCREMENT)	
);