SET search_path="e-Hotel";

INSERT INTO HotelChain (NumHotels) VALUES
(0),
(0),
(0),
(0),
(0);

INSERT INTO InstCentralOffice (HotelChainID, Address) VALUES 
(1, '123 Main St'),
(1, '10000 Yonge St'),
(2, '456 Oak Ave'),
(2, '979 Ave Ave'),
(3, '789 Pine Rd'),
(3, '886 Tree St'),
(4, '101 Elm Blvd'),
(4, '10000 Laurier St'),
(5, '202 Maple St'),
(5, '50 Yonge Blvd');

INSERT INTO ChainPhone (HotelChainID, PhoneNum) VALUES 
(1, 1234567890),
(1, 9876543210),
(2, 1122334455),
(3, 5566778899),
(4, 9988776655),
(5, 4433221100);

INSERT INTO ChainEmail (HotelChainID, EmailAddr) VALUES 
(1, 'contact@chain.com'),
(2, 'info@chain.com'),
(3, 'support@chain.com'),
(4,'buy@property.com'),
(5,'thechain@hotmail.com');

INSERT INTO Hotel (HotelAddr, NumRooms, City, StarRating, HotelChainID) VALUES
('101 Beach Blvd', 2,'Ottawa', 4, 1),
('202 Mountain Rd', 1, 'Kanata',5, 1),
('303 City St', 1, 'Ottawa',3, 2),
('404 Desert Dr', 1, 'Kanata',2, 3),
('505 Forest Ave', 5, 'Ottawa',4, 4),
('100 Grove Rd', 3, 'Kanata',1, 4),
('500 Yonge St', 8, 'Ottawa',1, 5),
('600 Bay St', 10, 'Toronto',2, 5),
('700 King St', 10, 'Toronto',3, 5),
('800 Queen St', 4, 'Toronto',4, 5);

INSERT INTO HotelPhone (HotelAddr, PhoneNum) VALUES 
('101 Beach Blvd', 1234567891),
('202 Mountain Rd', 2345678901),
('303 City St', 3456789012),
('404 Desert Dr', 4567890123),
('505 Forest Ave', 5678901234),
('100 Grove Rd', 6789012345),
('500 Yonge St', 7890123456),
('600 Bay St', 8901234567),
('700 King St', 9012345678),
('800 Queen St', 9123456789);

INSERT INTO HotelEmail (HotelAddr, EmailAddr) VALUES 
('101 Beach Blvd', 'beach@hotel1.com'),
('202 Mountain Rd', 'mountain@hotel2.com'),
('303 City St', 'city@hotel3.com'),
('404 Desert Dr', 'desert@hotel4.com'),
('100 Grove Rd', 'prop4@gmail.com'),
('500 Yonge St','hotel5@gmail.com'),
('600 Bay St', 'bayhotel@gmail.com'),
('700 King St','kinghotels@gmail.com'),
('800 Queen St', 'queenhotels@gmail.com');

INSERT INTO Room (HotelAddr, RoomNum, Price, Capacity, View, Extendable) VALUES 
('101 Beach Blvd', 101, 150.00, 2, 'Sea', true),
('101 Beach Blvd', 102, 120.00, 2, 'Sea', false),
('202 Mountain Rd', 201, 200.00, 3, 'Mountain', true),
('303 City St', 301, 100.00, 1, 'None', false),
('404 Desert Dr', 401, 80.00, 1, 'None', true),
('505 Forest Ave', 501, 130.00, 2, 'Sea', false),
('505 Forest Ave', 502, 140.00, 2, 'Mountain', true),
('505 Forest Ave', 503, 150.00, 2, 'None', false),
('505 Forest Ave', 504, 160.00, 2, 'Sea', true),
('505 Forest Ave', 505, 170.00, 2, 'Mountain', false),
('100 Grove Rd', 101, 50.00, 1, 'None', false),
('100 Grove Rd', 102, 60.00, 3, 'Sea', true),
('100 Grove Rd', 103, 70.00, 1, 'Mountain', false),
('500 Yonge St', 501, 50.00, 1, 'None', false),
('500 Yonge St', 502, 60.00, 5, 'Sea', true),
('500 Yonge St', 503, 70.00, 2, 'Mountain', false),
('500 Yonge St', 504, 80.00, 1, 'None', true),
('500 Yonge St', 505, 90.00, 4, 'Sea', false),
('500 Yonge St', 506, 100.00, 1, 'None', true),
('500 Yonge St', 507, 110.00, 1, 'None', false),
('500 Yonge St', 508, 120.00, 1, 'None', true),
('600 Bay St', 601, 50.00, 1, 'None', false),
('600 Bay St', 602, 60.00, 2, 'None', true),
('600 Bay St', 603, 70.00, 2, 'None', false),
('600 Bay St', 604, 80.00, 3, 'None', true),
('600 Bay St', 605, 90.00, 1, 'None', false),
('600 Bay St', 606, 100.00, 1, 'None', true),
('600 Bay St', 607, 110.00, 2, 'None', false),
('600 Bay St', 608, 120.00, 1, 'None', true),
('600 Bay St', 609, 130.00, 1, 'None', false),
('600 Bay St', 610, 140.00, 2, 'None', true),
('600 Bay St', 611, 140.00, 1, 'None', true),
('700 King St', 701, 50.00, 1, 'None', false),
('700 King St', 702, 60.00, 1, 'None', true),
('700 King St', 703, 70.00, 1, 'None', false),
('700 King St', 704, 80.00, 1, 'None', true),
('700 King St', 705, 90.00, 1, 'None', false),
('700 King St', 706, 100.00, 1, 'None', true),
('700 King St', 707, 110.00, 1, 'None', false),
('700 King St', 708, 120.00, 1, 'None', true),
('700 King St', 709, 130.00, 1, 'None', false),
('700 King St', 710, 140.00, 1, 'None', true),
('800 Queen St', 801, 50.00, 1, 'None', false),
('800 Queen St', 802, 60.00, 1, 'None', true),
('800 Queen St', 803, 70.00, 1, 'None', false),
('800 Queen St', 804, 80.00, 1, 'None', true);

INSERT INTO InstProblem (HotelAddr, RoomNum, Type) VALUES 
('101 Beach Blvd', 101, 'AC Broken'),
('202 Mountain Rd', 201, 'Shower Leak'),
('303 City St', 301, 'No Hot Water'),
('404 Desert Dr', 401, 'TV Not Working'),
('505 Forest Ave', 501, 'Wi-Fi Down'),
('100 Grove Rd', 101, 'AC Broken'),
('500 Yonge St', 501, 'Shower Leak'),
('500 Yonge St', 502, 'No Hot Water'),
('500 Yonge St', 503, 'TV Not Working'),
('500 Yonge St', 504, 'Wi-Fi Down'),
('500 Yonge St', 505, 'AC Broken');

INSERT INTO InstAmenity (HotelAddr, RoomNum, Type) VALUES 
('101 Beach Blvd', 101, 'Wi-Fi'),
('202 Mountain Rd', 201, 'Mini Bar'),
('303 City St', 301, 'TV'),
('404 Desert Dr', 401, 'Air Conditioning'),
('505 Forest Ave', 501, 'Balcony'),
('100 Grove Rd', 101, 'Wi-Fi'),
('500 Yonge St', 501, 'Mini Bar'),
('500 Yonge St', 502, 'TV'),
('500 Yonge St', 503, 'Air Conditioning'),
('500 Yonge St', 504, 'Balcony'),
('500 Yonge St', 505, 'Wi-Fi'),
('600 Bay St', 601, 'Mini Bar'),
('600 Bay St', 602, 'TV'),
('600 Bay St', 603, 'Air Conditioning'),
('600 Bay St', 604, 'Balcony'),
('600 Bay St', 605, 'Wi-Fi'),
('600 Bay St', 606, 'Mini Bar'),
('600 Bay St', 607, 'TV'),
('600 Bay St', 608, 'Air Conditioning'),
('600 Bay St', 609, 'Balcony'),
('600 Bay St', 610, 'Wi-Fi'),
('600 Bay St', 611, 'Mini Bar'),
('700 King St', 701, 'TV'),
('700 King St', 702, 'Air Conditioning'),
('700 King St', 703, 'Balcony'),
('700 King St', 704, 'Wi-Fi'),
('700 King St', 705, 'Mini Bar'),
('700 King St', 706, 'TV'),
('700 King St', 707, 'Air Conditioning'),
('700 King St', 708, 'Balcony'),
('700 King St', 709, 'Wi-Fi'),
('700 King St', 710, 'Mini Bar'),
('800 Queen St', 801, 'TV'),
('800 Queen St', 802, 'Air Conditioning'),
('800 Queen St', 803, 'Balcony'),
('800 Queen St', 804, 'Wi-Fi');

INSERT INTO Employee (SINOrSSN, FirstName, MiddleName, LastName, Address, Role, HotelAddr) VALUES 
(123456789, 'John', 'A', 'Doe', '101 Beach Blvd', 'Manager', '101 Beach Blvd'),
(234567890, 'Jane', 'B', 'Smith', '202 Mountain Rd', 'Receptionist', '202 Mountain Rd'),
(345678901, 'Jim', 'C', 'Brown', '303 City St', 'Housekeeping', '303 City St'),
(456789012, 'Jill', 'D', 'White', '404 Desert Dr', 'Maintenance', '404 Desert Dr'),
(567890123, 'Jack', 'E', 'Black', '505 Forest Ave', 'Security', '505 Forest Ave'),
(678901234, 'Jenny', 'F', 'Green', '100 Grove Rd', 'Manager', '100 Grove Rd'),
(789012345, 'Jerry', 'G', 'Blue', '100 Grove Rd', 'Receptionist', '100 Grove Rd'),
(890123456, 'Judy', 'H', 'Red', '100 Grove Rd', 'Housekeeping', '100 Grove Rd'),
(548709423, 'Joe', 'I', 'Yellow', '100 Grove Rd', 'Maintenance', '100 Grove Rd'),
(912345678, 'Janet', 'J', 'Purple', '100 Grove Rd', 'Security', '100 Grove Rd'),
(923456781, 'James', 'K', 'Orange', '100 Grove Rd', 'Manager', '100 Grove Rd'),
(934567882, 'Jill', 'L', 'Pink', '100 Grove Rd', 'Receptionist', '100 Grove Rd'),
(945678893, 'Jim', 'M', 'Brown', '100 Grove Rd', 'Housekeeping', '100 Grove Rd'),
(956789804, 'Jenny', 'N', 'Green', '100 Grove Rd', 'Maintenance', '100 Grove Rd'),
(967890915, 'Jack', 'O', 'Black', '100 Grove Rd', 'Security', '100 Grove Rd'),
(978901236, 'Jenny', 'P', 'Green', '500 Yonge St', 'Manager', '500 Yonge St'),
(989012347, 'Jerry', 'Q', 'Blue', '500 Yonge St', 'Receptionist', '500 Yonge St'),
(990123458, 'Judy', 'R', 'Red', '500 Yonge St', 'Housekeeping', '500 Yonge St'),
(901234569, 'Joe', 'S', 'Yellow', '500 Yonge St', 'Maintenance', '500 Yonge St'),
(913245678, 'Janet', 'T', 'Purple', '500 Yonge St', 'Security', '500 Yonge St'),
(924356789, 'James', 'U', 'Orange', '500 Yonge St', 'Manager', '500 Yonge St'),
(935467890, 'Jill', 'V', 'Pink', '500 Yonge St', 'Receptionist', '500 Yonge St'),
(946578901, 'Jim', 'W', 'Brown', '500 Yonge St', 'Housekeeping', '500 Yonge St'),
(957689012, 'Jenny', 'X', 'Green', '500 Yonge St', 'Maintenance', '500 Yonge St'),
(968790123, 'Jack', 'Y', 'Black', '500 Yonge St', 'Security', '500 Yonge St'),
(100001001, 'Paul', 'A', 'Walker', '600 Bay St', 'Manager', '600 Bay St'),
(100001002, 'Linda', 'B', 'Davis', '600 Bay St', 'Receptionist', '600 Bay St'),
(100001003, 'Mark', 'C', 'Lewis', '600 Bay St', 'Housekeeping', '600 Bay St'),
(100001004, 'Nancy', 'D', 'Evans', '600 Bay St', 'Maintenance', '600 Bay St'),
(100001005, 'Steve', 'E', 'Clark', '600 Bay St', 'Security', '600 Bay St'),
(100002001, 'Tom', 'F', 'Harris', '700 King St', 'Manager', '700 King St'),
(100002002, 'Emma', 'G', 'Robinson', '700 King St', 'Receptionist', '700 King St'),
(100002003, 'Lucas', 'H', 'White', '700 King St', 'Housekeeping', '700 King St'),
(100002004, 'Sophia', 'I', 'Moore', '700 King St', 'Maintenance', '700 King St'),
(100002005, 'Daniel', 'J', 'Hall', '700 King St', 'Security', '700 King St'),
(100003001, 'Ryan', 'K', 'Adams', '800 Queen St', 'Manager', '800 Queen St'),
(100003002, 'Olivia', 'L', 'Carter', '800 Queen St', 'Receptionist', '800 Queen St'),
(100003003, 'Ethan', 'M', 'Perez', '800 Queen St', 'Housekeeping', '800 Queen St'),
(100003004, 'Mia', 'N', 'Nelson', '800 Queen St', 'Maintenance', '800 Queen St'),
(100003005, 'Noah', 'O', 'Mitchell', '800 Queen St', 'Security', '800 Queen St');


INSERT INTO Manages (SINOrSSN, HotelAddr) VALUES 
(123456789, '101 Beach Blvd'),
(678901234, '100 Grove Rd'),
(234567890, '202 Mountain Rd'),
(345678901, '303 City St'),
(456789012, '404 Desert Dr'),
(567890123, '505 Forest Ave'),
(924356789, '500 Yonge St'),
(100001001, '600 Bay St'),
(100002001, '700 King St'),
(100003001, '800 Queen St');


INSERT INTO Customer (ID, FirstName, MiddleName, LastName, Address, IDType, Date_Reg) VALUES 
('C001', 'Alice', 'X', 'Johnson', '123 Elm St', 'Passport', '2025-01-01'),
('C002', 'Bob', 'Y', 'Davis', '456 Oak St', 'ID Card', '2025-02-15'),
('C003', 'Charlie', 'Z', 'Martinez', '789 Pine St', 'Driver License', '2025-03-01'),
('C004', 'David', 'W', 'Hernandez', '101 Elm St', 'Passport', '2025-04-01'),
('C005', 'Eve', 'V', 'Lopez', '202 Maple St', 'ID Card', '2025-05-01'),
('C006', 'Frank', 'U', 'Gonzalez', '303 Cedar St', 'Driver License', '2025-06-01'),
('C007', 'Grace', 'T', 'Wilson', '404 Pine St', 'Passport', '2025-07-01'),
('C008', 'Henry', 'S', 'Anderson', '505 Elm St', 'ID Card', '2025-08-01'),
('C009', 'Ivy', 'R', 'Thomas', '606 Maple St', 'Driver License', '2025-09-01'),
('C010', 'Jack', 'Q', 'Moore', '707 Cedar St', 'Passport', '2025-10-01'),
('C011', 'Kelly', 'P', 'Taylor', '808 Pine St', 'ID Card', '2025-11-01'),
('C012', 'Larry', 'O', 'Jackson', '909 Elm St', 'Driver License', '2025-12-01'),
('C013', 'Mary', 'N', 'White', '101 Maple St', 'Passport', '2026-01-01'),
('C014', 'Nancy', 'M', 'Harris', '202 Cedar St', 'ID Card', '2026-02-01'),
('C015', 'Oliver', 'L', 'Martin', '303 Pine St', 'Driver License', '2026-03-01'),
('C016', 'Peter', 'K', 'Thompson', '404 Elm St', 'Passport', '2026-04-01'),
('C017', 'Quinn', 'J', 'Garcia', '505 Maple St', 'ID Card', '2026-05-01'),
('C018', 'Rose', 'I', 'Martinez', '606 Cedar St', 'Driver License', '2026-06-01'),
('C019', 'Sam', 'H', 'Hernandez', '707 Pine St', 'Passport', '2026-07-01'),
('C020', 'Tom', 'G', 'Lopez', '808 Elm St', 'ID Card', '2026-08-01'),
('C021', 'Ursula', 'F', 'Gonzalez', '909 Maple St', 'Driver License', '2026-09-01'),
('C022', 'Victor', 'E', 'Wilson', '101 Cedar St', 'Passport', '2026-10-01'),
('C023', 'Wendy', 'D', 'Anderson', '202 Pine St', 'ID Card', '2026-11-01'),
('C024', 'Xavier', 'C', 'Thomas', '303 Elm St', 'Driver License', '2026-12-01'),
('C025', 'Yvonne', 'B', 'Moore', '404 Maple St', 'Passport', '2027-01-01'),
('C026', 'Zack', 'A', 'Taylor', '505 Cedar St', 'ID Card', '2027-02-01'),
('C027', 'Alice', 'X', 'Johnson', '123 Elm St', 'Passport', '2025-01-01'),
('C028', 'Bob', 'Y', 'Davis', '456 Oak St', 'ID Card', '2025-02-15'),
('C029', 'Charlie', 'Z', 'Martinez', '789 Pine St', 'Driver License', '2025-03-01'),
('C030', 'David', 'W', 'Hernandez', '101 Elm St', 'Passport', '2025-04-01'),
('C031', 'Eve', 'V', 'Lopez', '202 Maple St', 'ID Card', '2025-05-01'),
('C032', 'Frank', 'U', 'Gonzalez', '303 Cedar St', 'Driver License', '2025-06-01'),
('C033', 'Grace', 'T', 'Wilson', '404 Pine St', 'Passport', '2025-07-01'),
('C034', 'Henry', 'S', 'Anderson', '505 Elm St', 'ID Card', '2025-08-01'),
('C035', 'Ivy', 'R', 'Thomas', '606 Maple St', 'Driver License', '2025-09-01'),
('C036', 'Jack', 'Q', 'Moore', '707 Cedar St', 'Passport', '2025-10-01');

INSERT INTO Booking (HotelAddr, RoomNum, CheckInDate, CustomerID, CheckOutDate, Duration) VALUES 
('101 Beach Blvd', 101, '2025-03-20', 'C001', '2025-03-22', 2),
('303 City St', 301, '2025-03-21', 'C002', '2025-03-24', 3),
('404 Desert Dr', 401, '2025-03-22', 'C003', '2025-03-25', 3),
('505 Forest Ave', 501, '2025-03-23', 'C004', '2025-03-26', 3),
('505 Forest Ave', 502, '2025-03-24', 'C005', '2025-03-27', 3),
('100 Grove Rd', 101, '2025-03-25', 'C006', '2025-03-28', 3),
('100 Grove Rd', 102, '2025-03-26', 'C007', '2025-03-29', 3),
('100 Grove Rd', 103, '2025-03-27', 'C008', '2025-03-30', 3),
('100 Grove Rd', 101, '2025-03-28', 'C009', '2025-03-31', 3),
('100 Grove Rd', 102, '2025-03-29', 'C010', '2025-04-01', 3),
('100 Grove Rd', 103, '2025-03-30', 'C011', '2025-04-02', 3),
('100 Grove Rd', 101, '2025-03-31', 'C012', '2025-04-03', 3),
('500 Yonge St', 501, '2025-04-01', 'C013', '2025-04-04', 3),
('500 Yonge St', 502, '2025-04-02', 'C014', '2025-04-05', 3),
('500 Yonge St', 503, '2025-04-03', 'C015', '2025-04-06', 3),
('500 Yonge St', 504, '2025-04-04', 'C016', '2025-04-07', 3),
('500 Yonge St', 505, '2025-04-05', 'C017', '2025-04-08', 3),
('500 Yonge St', 506, '2025-04-06', 'C018', '2025-04-09', 3),
('500 Yonge St', 507, '2025-04-07', 'C019', '2025-04-10', 3),
('500 Yonge St', 508, '2025-04-08', 'C020', '2025-04-11', 3),
('600 Bay St', 601, '2025-04-09', 'C021', '2025-04-12', 3),
('600 Bay St', 602, '2025-04-10', 'C022', '2025-04-13', 3),
('600 Bay St', 603, '2025-04-11', 'C023', '2025-04-14', 3),
('600 Bay St', 604, '2025-04-12', 'C024', '2025-04-15', 3),
('600 Bay St', 605, '2025-04-13', 'C025', '2025-04-16', 3),
('600 Bay St', 606, '2025-04-14', 'C026', '2025-04-17', 3),
('600 Bay St', 607, '2025-04-15', 'C027', '2025-04-18', 3),
('600 Bay St', 608, '2025-04-16', 'C028', '2025-04-19', 3),
('600 Bay St', 609, '2025-04-17', 'C029', '2025-04-20', 3),
('600 Bay St', 610, '2025-04-18', 'C030', '2025-04-21', 3),
('700 King St', 701, '2025-04-19', 'C031', '2025-04-22', 3),
('700 King St', 702, '2025-04-20', 'C032', '2025-04-23', 3),
('700 King St', 703, '2025-04-21', 'C033', '2025-04-24', 3),
('700 King St', 704, '2025-04-22', 'C034', '2025-04-25', 3),
('700 King St', 705, '2025-04-23', 'C035', '2025-04-26', 3),
('700 King St', 706, '2025-04-24', 'C036', '2025-04-27', 3),
('700 King St', 707, '2025-04-25', 'C001', '2025-04-28', 3),
('700 King St', 708, '2025-04-26', 'C002', '2025-04-29', 3),
('700 King St', 709, '2025-04-27', 'C003', '2025-04-30', 3),
('700 King St', 710, '2025-04-28', 'C004', '2025-05-01', 3),
('800 Queen St', 801, '2025-04-29', 'C005', '2025-05-02', 3),
('800 Queen St', 802, '2025-04-30', 'C006', '2025-05-03', 3),
('800 Queen St', 803, '2025-05-01', 'C007', '2025-05-04', 3),
('800 Queen St', 804, '2025-05-02', 'C008', '2025-05-05', 3);

INSERT INTO Renting (HotelAddr, RoomNum, CheckInDate, CustomerID, CheckOutDate, Duration, Balance, EmployeeSINOrSSN) VALUES 
('101 Beach Blvd', 101, '2025-03-20', 'C001', '2025-03-22', 2, 300.00, 123456789),
('303 City St', 301, '2025-03-21', 'C002', '2025-03-24', 3, 240.00, 345678901),
('404 Desert Dr', 401, '2025-03-22', 'C003', '2025-03-25', 3, 240.00, 456789012),
('505 Forest Ave', 501, '2025-03-23', 'C004', '2025-03-26', 3, 390.00, 567890123),
('505 Forest Ave', 502, '2025-03-24', 'C005', '2025-03-27', 3, 420.00, 567890123),
('100 Grove Rd', 101, '2025-03-25', 'C006', '2025-03-28', 3, 150.00, 678901234),
('100 Grove Rd', 102, '2025-03-26', 'C007', '2025-03-29', 3, 180.00, 678901234),
('100 Grove Rd', 103, '2025-03-27', 'C008', '2025-03-30', 3, 210.00, 678901234),
('100 Grove Rd', 101, '2025-03-28', 'C009', '2025-03-31', 3, 210.00, 678901234),
('100 Grove Rd', 102, '2025-03-29', 'C010', '2025-04-01', 3, 240.00, 678901234),
('100 Grove Rd', 103, '2025-03-30', 'C011', '2025-04-02', 3, 270.00, 678901234),
('100 Grove Rd', 101, '2025-03-31', 'C012', '2025-04-03', 3, 270.00, 678901234),
('500 Yonge St', 501, '2025-04-01', 'C013', '2025-04-04', 3, 150.00, 978901234),
('500 Yonge St', 502, '2025-04-02', 'C014', '2025-04-05', 3, 180.00, 978901234),
('500 Yonge St', 503, '2025-04-03', 'C015', '2025-04-06', 3, 210.00, 978901234),
('500 Yonge St', 504, '2025-04-04', 'C016', '2025-04-07', 3, 240.00, 978901234),
('500 Yonge St', 505, '2025-04-05', 'C017', '2025-04-08', 3, 270.00, 978901234),
('500 Yonge St', 506, '2025-04-06', 'C018', '2025-04-09', 3, 300.00, 978901234),
('500 Yonge St', 507, '2025-04-07', 'C019', '2025-04-10', 3, 330.00, 978901234),
('500 Yonge St', 508, '2025-04-08', 'C020', '2025-04-11', 3, 360.00, 978901234),
('600 Bay St', 601, '2025-04-09', 'C021', '2025-04-12', 3, 150.00, 923456789),
('600 Bay St', 602, '2025-04-10', 'C022', '2025-04-13', 3, 180.00, 923456789),
('600 Bay St', 603, '2025-04-11', 'C023', '2025-04-14', 3, 210.00, 923456789),
('600 Bay St', 604, '2025-04-12', 'C024', '2025-04-15', 3, 240.00, 923456789),
('600 Bay St', 605, '2025-04-13', 'C025', '2025-04-16', 3, 270.00, 923456789),
('600 Bay St', 606, '2025-04-14', 'C026', '2025-04-17', 3, 300.00, 923456789),
('600 Bay St', 607, '2025-04-15', 'C027', '2025-04-18', 3, 330.00, 923456789),
('600 Bay St', 608, '2025-04-16', 'C028', '2025-04-19', 3, 360.00, 923456789),
('600 Bay St', 609, '2025-04-17', 'C029', '2025-04-20', 3, 390.00, 923456789),
('600 Bay St', 610, '2025-04-18', 'C030', '2025-04-21', 3, 420.00, 923456789),
('700 King St', 701, '2025-04-19', 'C031', '2025-04-22', 3, 150.00, 912345678),
('700 King St', 702, '2025-04-20', 'C032', '2025-04-23', 3, 180.00, 912345678),
('700 King St', 703, '2025-04-21', 'C033', '2025-04-24', 3, 210.00, 912345678),
('700 King St', 704, '2025-04-22', 'C034', '2025-04-25', 3, 240.00, 912345678),
('700 King St', 705, '2025-04-23', 'C035', '2025-04-26', 3, 270.00, 912345678),
('700 King St', 706, '2025-04-24', 'C036', '2025-04-27', 3, 300.00, 912345678),
('700 King St', 707, '2025-04-25', 'C001', '2025-04-28', 3, 330.00, 912345678),
('700 King St', 708, '2025-04-26', 'C002', '2025-04-29', 3, 360.00, 912345678),
('700 King St', 709, '2025-04-27', 'C003', '2025-04-30', 3, 390.00, 912345678),
('700 King St', 710, '2025-04-28', 'C004', '2025-05-01', 3, 420.00, 912345678),
('800 Queen St', 801, '2025-04-29', 'C005', '2025-05-02', 3, 150.00, 901234567),
('800 Queen St', 802, '2025-04-30', 'C006', '2025-05-03', 3, 180.00, 901234567),
('800 Queen St', 803, '2025-05-01', 'C007', '2025-05-04', 3, 210.00, 901234567),
('800 Queen St', 804, '2025-05-02', 'C008', '2025-05-05', 3, 240.00, 901234567);

INSERT INTO Payment (HotelAddr, RoomNum, CheckInDate, CustomerID, PaymentAmount, PaymentDate) VALUES
('101 Beach Blvd', 101, '2025-03-20', 'C001', 300.00, '2025-03-19'),
('303 City St', 301, '2025-03-21', 'C002', 240.00, '2025-03-20'),
('404 Desert Dr', 401, '2025-03-22', 'C003', 240.00, '2025-03-21'),
('505 Forest Ave', 501, '2025-03-23', 'C004', 390.00, '2025-03-22'),
('505 Forest Ave', 502, '2025-03-24', 'C005', 420.00, '2025-03-23'),
('100 Grove Rd', 101, '2025-03-25', 'C006', 150.00, '2025-03-24'),
('100 Grove Rd', 102, '2025-03-26', 'C007', 180.00, '2025-03-25'),
('100 Grove Rd', 103, '2025-03-27', 'C008', 210.00, '2025-03-26'),
('100 Grove Rd', 101, '2025-03-28', 'C009', 210.00, '2025-03-27'),
('100 Grove Rd', 102, '2025-03-29', 'C010', 240.00, '2025-03-28'),
('100 Grove Rd', 103, '2025-03-30', 'C011', 270.00, '2025-03-29'),
('100 Grove Rd', 101, '2025-03-31', 'C012', 270.00, '2025-03-30'),
('500 Yonge St', 501, '2025-04-01', 'C013', 150.00, '2025-03-31'),
('500 Yonge St', 502, '2025-04-02', 'C014', 180.00, '2025-04-01'),
('500 Yonge St', 503, '2025-04-03', 'C015', 210.00, '2025-04-02'),
('500 Yonge St', 504, '2025-04-04', 'C016', 240.00, '2025-04-03'),
('500 Yonge St', 505, '2025-04-05', 'C017', 270.00, '2025-04-04'),
('500 Yonge St', 506, '2025-04-06', 'C018', 300.00, '2025-04-05'),
('500 Yonge St', 507, '2025-04-07', 'C019', 330.00, '2025-04-06'),
('500 Yonge St', 508, '2025-04-08', 'C020', 360.00, '2025-04-07'),
('600 Bay St', 601, '2025-04-09', 'C021', 150.00, '2025-04-08'),
('600 Bay St', 602, '2025-04-10', 'C022', 180.00, '2025-04-09'),
('600 Bay St', 603, '2025-04-11', 'C023', 210.00, '2025-04-10'),
('600 Bay St', 604, '2025-04-12', 'C024', 240.00, '2025-04-11'),
('600 Bay St', 605, '2025-04-13', 'C025', 270.00, '2025-04-12'),
('600 Bay St', 606, '2025-04-14', 'C026', 300.00, '2025-04-13'),
('600 Bay St', 607, '2025-04-15', 'C027', 330.00, '2025-04-14'),
('600 Bay St', 608, '2025-04-16', 'C028', 360.00, '2025-04-15'),
('600 Bay St', 609, '2025-04-17', 'C029', 390.00, '2025-04-16'),
('600 Bay St', 610, '2025-04-18', 'C030', 420.00, '2025-04-17'),
('700 King St', 701, '2025-04-19', 'C031', 150.00, '2025-04-18'),
('700 King St', 702, '2025-04-20', 'C032', 180.00, '2025-04-19'),
('700 King St', 703, '2025-04-21', 'C033', 210.00, '2025-04-20'),
('700 King St', 704, '2025-04-22', 'C034', 240.00, '2025-04-21'),
('700 King St', 705, '2025-04-23', 'C035', 270.00, '2025-04-22'),
('700 King St', 706, '2025-04-24', 'C036', 300.00, '2025-04-23'),
('700 King St', 707, '2025-04-25', 'C001', 330.00, '2025-04-24'),
('700 King St', 708, '2025-04-26', 'C002', 360.00, '2025-04-25'),
('700 King St', 709, '2025-04-27', 'C003', 390.00, '2025-04-26'),
('700 King St', 710, '2025-04-28', 'C004', 420.00, '2025-04-27'),
('800 Queen St', 801, '2025-04-29', 'C005', 150.00, '2025-04-28'),
('800 Queen St', 802, '2025-04-30', 'C006', 180.00, '2025-04-29'),
('800 Queen St', 803, '2025-05-01', 'C007', 210.00, '2025-04-30'),
('800 Queen St', 804, '2025-05-02', 'C008', 240.00, '2025-05-01');
