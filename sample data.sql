SET search_path="e-Hotel";

INSERT INTO HotelChain (NumHotels) VALUES
(5),
(3),
(7);

INSERT INTO InstCentralOffice (HotelChainID, Address) VALUES 
(1, '123 Main St'),
(2, '456 Oak Ave'),
(3, '789 Pine Rd');

INSERT INTO ChainPhone (HotelChainID, PhoneNum) VALUES 
(1, 1234567890),
(1, 9876543210),
(2, 1122334455),
(3, 5566778899);

INSERT INTO ChainEmail (HotelChainID, EmailAddr) VALUES 
(1, 'contact@chain.com'),
(2, 'info@chain.com'),
(3, 'support@chain.com');

INSERT INTO Hotel (HotelAddr, NumRooms, StarRating, HotelChainID) VALUES 
('101 Beach Blvd', 100, 4, 1),
('202 Mountain Rd', 150, 5, 1),
('303 City St', 80, 3, 2),
('404 Desert Dr', 50, 2, 3);

INSERT INTO HotelPhone (HotelAddr, PhoneNum) VALUES 
('101 Beach Blvd', 1234567891),
('202 Mountain Rd', 2345678901),
('303 City St', 3456789012),
('404 Desert Dr', 4567890123);

INSERT INTO HotelEmail (HotelAddr, EmailAddr) VALUES 
('101 Beach Blvd', 'beach@hotel1.com'),
('202 Mountain Rd', 'mountain@hotel2.com'),
('303 City St', 'city@hotel3.com'),
('404 Desert Dr', 'desert@hotel4.com');

INSERT INTO Room (HotelAddr, RoomNum, Price, Capacity, View, Extendable) VALUES 
('101 Beach Blvd', 101, 150.00, 2, 'Sea', true),
('101 Beach Blvd', 102, 120.00, 2, 'Sea', false),
('202 Mountain Rd', 201, 200.00, 3, 'Mountain', true),
('303 City St', 301, 100.00, 1, 'None', false),
('404 Desert Dr', 401, 80.00, 1, 'None', true);

INSERT INTO InstProblem (HotelAddr, RoomNum, Type) VALUES 
('101 Beach Blvd', 101, 'AC Broken'),
('202 Mountain Rd', 201, 'Shower Leak'),
('303 City St', 301, 'No Hot Water');

INSERT INTO InstAmenity (HotelAddr, RoomNum, Type) VALUES 
('101 Beach Blvd', 101, 'Wi-Fi'),
('202 Mountain Rd', 201, 'Mini Bar'),
('303 City St', 301, 'TV'),
('404 Desert Dr', 401, 'Air Conditioning');

INSERT INTO Employee (SINOrSSN, FirstName, MiddleName, LastName, Address, Role, HotelAddr) VALUES 
(123456789, 'John', 'A', 'Doe', '101 Beach Blvd', 'Manager', '101 Beach Blvd'),
(234567890, 'Jane', 'B', 'Smith', '202 Mountain Rd', 'Receptionist', '202 Mountain Rd'),
(345678901, 'Jim', 'C', 'Brown', '303 City St', 'Housekeeping', '303 City St');

INSERT INTO Manages (SINOrSSN, HotelAddr) VALUES 
(123456789, '101 Beach Blvd'),
(234567890, '202 Mountain Rd');

INSERT INTO Customer (ID, FirstName, MiddleName, LastName, Address, IDType, Date_Reg) VALUES 
('C001', 'Alice', 'X', 'Johnson', '123 Elm St', 'Passport', '2025-01-01'),
('C002', 'Bob', 'Y', 'Davis', '456 Oak St', 'ID Card', '2025-02-15');

INSERT INTO Booking (HotelAddr, RoomNum, CheckInDate, CustomerID, CheckOutDate, Duration) VALUES 
('101 Beach Blvd', 101, '2025-03-20', 'C001', '2025-03-22', 2),
('303 City St', 301, '2025-03-21', 'C002', '2025-03-24', 3);

INSERT INTO Renting (HotelAddr, RoomNum, CheckInDate, CustomerID, CheckOutDate, Duration, Balance, EmployeeSINOrSSN) VALUES 
('101 Beach Blvd', 101, '2025-03-20', 'C001', '2025-03-22', 2, 300.00, 123456789),
('303 City St', 301, '2025-03-21', 'C002', '2025-03-24', 3, 240.00, 345678901);

INSERT INTO Payment (HotelAddr, RoomNum, CheckInDate, CustomerID, PaymentAmount, PaymentDate) VALUES 
('101 Beach Blvd', 101, '2025-03-20', 'C001', 300.00, '2025-03-19'),
('303 City St', 301, '2025-03-21', 'C002', 240.00, '2025-03-20');