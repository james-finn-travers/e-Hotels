CREATE TABLE HotelChain (
    ID serial PRIMARY KEY, 
    NumHotels int
);

CREATE TABLE InstCentralOffice (
    HotelChainID int NOT NULL REFERENCES HotelChain(ID),
    Address varchar(20) NOT NULL,
    PRIMARY KEY(HotelChainID, Address) 
);

CREATE TABLE ChainPhone (
    HotelChainID int NOT NULL REFERENCES HotelChain(ID),
    PhoneNum bigint NOT NULL CHECK (PhoneNum>=1000000000 AND PhoneNum <=999999999999999),
    PRIMARY KEY(HotelChainID, PhoneNum) 
);

CREATE TABLE ChainEmail (
    HotelChainID int NOT NULL REFERENCES HotelChain(ID),
    EmailAddr VARCHAR(255) NOT NULL CHECK (EmailAddr LIKE '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    PRIMARY KEY (HotelChainID, EmailAddr)
);



CREATE TABLE Hotel (
    HotelAddr varchar(20) PRIMARY KEY, 
    NumRooms int, 
    StarRating int CHECK (StarRating<= 5 AND StarRating>=0), 
    HotelChainID int NOT NULL REFERENCES HotelChain(ID),
);

CREATE TABLE HotelPhone (
    HotelAddr varchar(20) NOT NULL REFERENCES Hotel(HotelAddr), 
    PhoneNum bigint NOT NULL CHECK (PhoneNum>=1000000000 AND PhoneNum <=999999999999999),
    PRIMARY KEY (HotelAddr, PhoneNum)
);

CREATE TABLE HotelEmail (
    HotelAddr varchar(20) NOT NULL REFERENCES Hotel(HotelAddr), 
    EmailAddr VARCHAR(255) NOT NULL CHECK (EmailAddr LIKE '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    PRIMARY KEY (HotelAddr, EmailAddr)
);

CREATE TABLE Room(
    HotelAddr varchar(20) NOT NULL REFERENCES Hotel(HotelAddr), 
    RoomNum int, 
    Price decimal(10,2), 
    Capacity smallint, 
    View varchar(8) CHECK (View in ('Mountain', 'Sea','None')), 
    Extendable bool,
    PRIMARY KEY (HotelAddr, RoomNum)
);

CREATE TABLE InstProblem (
    HotelAddr varchar(20) NOT NULL REFERENCES Room(HotelAddr), 
    RoomNum int REFERENCES Room(RoomNum),
    Type varchar(40),
    PRIMARY KEY (HotelAddr, RoomNum,Type)
);

CREATE TABLE InstAmenity (
    HotelAddr varchar(20) NOT NULL REFERENCES Room(HotelAddr), 
    RoomNum int REFERENCES Room(RoomNum),
    Type varchar(40),
    PRIMARY KEY (HotelAddr, RoomNum,Type)
);

CREATE TABLE Employee(
    SINOrSSN int PRIMARY KEY CHECK (SINOrSSN >=1000000000 AND SINOrSSN<=999999999),
    FirstName varchar(20) NOT NULL, 
    MiddleName varchar(20) NOT NULL, 
    LastName varchar(20) NOT NULL, 
    Address varchar(20) NOT NULL, 
    Role varchar(20) NOT NULL, 
    HotelAddr varchar(20) NOT NULL REFERENCES Hotel(HotelAddr)
);

CREATE TABLE Manages(
    SINOrSNN int REFERENCES Employee(SINOrSSN), 
    HotelAddr varchar(20) REFERENCES Employee(HotelAddr),
    PRIMARY KEY(SINOrSSN, HotelAddr)
) ;

CREATE TABLE Customer(
    ID varchar(20) PRIMARY KEY, 
    FirstName varchar(20) NOT NULL, 
    MiddleName varchar(20) NOT NULL, 
    LastName varchar(20) NOT NULL, 
    Address varchar(20) NOT NULL, 
    IDType varchar(20) NOT NULL, 
    Date_Reg date NOT NULL
);

CREATE TABLE Booking(
    HotelAddr varchar(20) NOT NULL REFERENCES Room(HotelAddr), 
    RoomNum int REFERENCES Room(RoomNum),
    CheckInDate Date,
    CustomerID NOT NULL REFERENCES Customer(ID),
    CheckOutDate Date, 
    Duration int,
    PRIMARY KEY (HotelAddr, RoomNumber, CheckInDate)
);


CREATE TABLE Renting(
    HotelAddr varchar(20) NOT NULL REFERENCES Room(HotelAddr), 
    RoomNum int REFERENCES Room(RoomNum),
    CheckInDate Date,
    CustomerID NOT NULL REFERENCES Customer(ID), 
    CheckOutDate Date, 
    Duration int, 
    Balance decimal(10,2), 
    Employee-SINOrSSN int NOT NULL REFERENCES Employee(SINOrSSN),
    PRIMARY KEY (HotelAddr, RoomNumber, CheckInDate)
);

CREATE TABLE Payment(
    HotelAddr varchar(20) NOT NULL REFERENCES Renting(HotelAddr), 
    RoomNum int REFERENCES Renting(RoomNum),
    CheckInDate Date REFERENCES Renting(CheckInDate), 
    CustomerID NOT NULL REFERENCES Customer(ID),
    PaymentAmount decimal(10,2) CHECK (PaymentAmount>0),
    PaymentDate Date NOT NULL,
    PRIMARY KEY(HotelAddr, RoomNumber, CheckInDate)
);

CREATE TABLE Archive(
    ArchiveID serial PRIMARY KEY, 
    CheckInDate date,
    CheckOutDate date, 
    Duration int, 
    Balance decimal(10,2), 
    Type char(7) CHECK(Type in ('Renting','Booking'))
);

CREATE TRIGGER archive_renting AFTER INSERT ON Renting
BEGIN
	INSERT INTO Archive Values
    (0,NEW.CheckInDate,NEW.CheckOutDate,NEW.Duration,NEW.Balance,'Renting');
END;

CREATE TRIGGER archive_booking AFTER INSERT ON Booking
BEGIN
	INSERT INTO Archive Values
    (0,NEW.CheckInDate,NEW.CheckOutDate,NEW.Duration,NEW.Balance,'Booking');
END;

CREATE TRIGGER add_payment AFTER INSERT ON Payment
BEGIN
	UPDATE Renting
    SET balance = balance - NEW.PaymentAmount
    WHERE Renting.HotelAddr = NEW.HotelAddr AND Renting.RoomNumber = NEW.RoomNumber AND Renting.CheckInDate = NEW.CheckInDate;
END;

CREATE TRIGGER add_hotel AFTER INSERT ON Hotel
BEGIN
	UPDATE HotelChain
    SET NumHotels = NumHotels + 1
    WHERE HotelChain.ID = NEW.HotelChainID;
END;

CREATE TRIGGER remove_hotel AFTER DELETE ON Hotel
BEGIN
	UPDATE HotelChain
    SET NumHotels = NumHotels - 1
    WHERE HotelChain.ID = OLD.HotelChainID;
END;

CREATE TRIGGER add_room AFTER INSERT ON Room
BEGIN
	UPDATE Hotel
    SET NumRooms = NumRooms + 1
    WHERE Hotel.HotelAddr  = NEW.HotelAddr;
END;

CREATE TRIGGER remove_room AFTER DELETE ON Room
BEGIN
	UPDATE Hotel
    SET NumRooms = NumRooms - 1
    WHERE Hotel.HotelAddr  = NEW.HotelAddr;
END;
