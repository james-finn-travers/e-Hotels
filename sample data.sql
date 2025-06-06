SET search_path='e-Hotel';


INSERT INTO HotelChain (NumHotels) VALUES (0), (0), (0), (0), (0);


INSERT INTO InstCentralOffice (HotelChainID, Address) VALUES
(1, '123 Main St'),
(1, '190 Yonge St'),
(2, '456 Oak Ave'),
(2, '979 Ave Ave'),
(3, '789 Pine Rd'),
(3, '886 Tree St'),
(4, '101 Elm Blvd'),
(4, '100 Laurier St'),
(5, '202 Maple St'),
(5, '50 Yonge Blvd');

INSERT INTO ChainPhone (HotelChainID, PhoneNum) VALUES
(1, 91234567890),
(1, 89876543210),
(2, 71122334455),
(3, 65566778899),
(4, 79988776655),
(5, 84433221100);

INSERT INTO ChainEmail (HotelChainID, EmailAddr) VALUES
(1, 'contact@chain.com'),
(2, 'info@chain.com'),
(3, 'support@chain.com'),
(4,'buy@property.com'),
(5,'thechain@hotmail.com');

INSERT INTO Hotel (HotelAddr, NumRooms, City, StarRating, HotelChainID) VALUES
-- HotelChainID = 1
('101 Beach Blvd', 0, 'Ottawa', 4, 1),
('202 Mountain Rd', 0, 'Kanata', 5, 1),
('1010 Park Rd', 0, 'Ottawa', 3, 1),
('1100 Main St', 0, 'Ottawa', 4, 1),
('1200 River Rd', 0, 'Toronto', 2, 1),
('1300 East Ave', 0, 'Toronto', 3, 1),
('1400 King Rd', 0, 'Ottawa', 1, 1),
('1500 Sunset Blvd', 0, 'Toronto', 4, 1),

-- HotelChainID = 2
('303 City St', 0, 'Ottawa', 3, 2),
('1200 King Rd', 0, 'Toronto', 3, 2),
('1500 East Ave', 0, 'Toronto', 2, 2),
('1400 River Rd', 0, 'Ottawa', 4, 2),
('1500 Queen St', 0, 'Toronto', 5, 2),
('1600 Bay Ave', 0, 'Hamilton', 3, 2),
('1700 Park Blvd', 0, 'Hamilton', 2, 2),
('1800 Main St', 0, 'Toronto', 1, 2),

-- HotelChainID = 3
('404 Desert Dr', 0, 'Kanata', 2, 3),
('1401 River Rd', 0, 'Ottawa', 4, 3),
('1500 Queen Blvd', 0, 'Toronto', 5, 3),
('1600 Forest Rd', 0, 'Ottawa', 2, 3),
('1700 Lakeview Blvd', 0, 'Ottawa', 3, 3),
('1800 Maple Ave', 0, 'Toronto', 4, 3),
('1900 King St', 0, 'Toronto', 2, 3),
('2000 Lakeshore Rd', 0, 'Hamilton', 3, 3),

-- HotelChainID = 4
('505 Forest Ave', 0, 'Ottawa', 4, 4),
('100 Grove Rd', 0, 'Kanata', 1, 4),
('1601 Bay Ave', 0, 'Hamilton', 2, 4),
('1701 Park Blvd', 0, 'Hamilton', 3, 4),
('1800 Birch Rd', 0, 'Toronto', 5, 4),
('1900 Maple St', 0, 'Ottawa', 4, 4),
('2000 Pine Ave', 0, 'Ottawa', 3, 4),
('2100 River Rd', 0, 'Toronto', 2, 4),

-- HotelChainID = 5
('500 Yonge St', 0, 'Ottawa', 1, 5),
('600 Bay St', 0, 'Toronto', 2, 5),
('700 King St', 0, 'Toronto', 3, 5),
('800 Queen St', 0, 'Toronto', 4, 5),
('900 Lakeshore Blvd', 0, 'Toronto', 5, 5),
('1010 Front St', 0, 'Toronto', 4, 5),
('1100 Maple Blvd', 0, 'Ottawa', 5, 5),
('1200 Woodward Ave', 0, 'Toronto', 5, 5);


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
-- HotelChainID = 1
('101 Beach Blvd', 101, 150.00, 1, 'Sea', true),
('101 Beach Blvd', 102, 120.00, 2, 'Sea', false),
('101 Beach Blvd', 103, 160.00, 3, 'Sea', true),
('101 Beach Blvd', 104, 180.00, 4, 'Sea', true),
('101 Beach Blvd', 105, 200.00, 5, 'Sea', false),

('202 Mountain Rd', 201, 200.00, 1, 'Mountain', true),
('202 Mountain Rd', 202, 220.00, 2, 'Mountain', true),
('202 Mountain Rd', 203, 240.00, 3, 'Mountain', false),
('202 Mountain Rd', 204, 180.00, 4, 'Mountain', false),
('202 Mountain Rd', 205, 150.00, 5, 'Mountain', true),

('1010 Park Rd', 301, 110.00, 1, 'None', true),
('1010 Park Rd', 302, 120.00, 2, 'None', false),
('1010 Park Rd', 303, 130.00, 3, 'None', true),
('1010 Park Rd', 304, 140.00, 4, 'None', false),
('1010 Park Rd', 305, 150.00, 5, 'None', true),

('1100 Main St', 401, 130.00, 1, 'None', false),
('1100 Main St', 402, 140.00, 2, 'None', true),
('1100 Main St', 403, 160.00, 3, 'None', true),
('1100 Main St', 404, 170.00, 4, 'None', false),
('1100 Main St', 405, 120.00, 5, 'None', true),

('1200 River Rd', 501, 100.00, 1, 'None', true),
('1200 River Rd', 502, 120.00, 2, 'None', false),
('1200 River Rd', 503, 140.00, 3, 'None', true),
('1200 River Rd', 504, 160.00, 4, 'None', true),
('1200 River Rd', 505, 180.00, 5, 'None', false),

('1300 East Ave', 601, 110.00, 1, 'None', true),
('1300 East Ave', 602, 120.00, 2, 'None', false),
('1300 East Ave', 603, 140.00, 3, 'None', true),
('1300 East Ave', 604, 150.00, 4, 'None', false),
('1300 East Ave', 605, 130.00, 5, 'None', true),

('1400 King Rd', 701, 80.00, 1, 'None', true),
('1400 King Rd', 702, 90.00, 2, 'None', false),
('1400 King Rd', 703, 110.00, 3, 'None', true),
('1400 King Rd', 704, 120.00, 4, 'None', false),
('1400 King Rd', 705, 130.00, 5, 'None', true),

('1500 Sunset Blvd', 801, 140.00, 1, 'None', true),
('1500 Sunset Blvd', 802, 160.00, 2, 'None', false),
('1500 Sunset Blvd', 803, 180.00, 3, 'None', true),
('1500 Sunset Blvd', 804, 200.00, 4, 'None', false),
('1500 Sunset Blvd', 805, 120.00, 5, 'None', true),

-- HotelChainID = 2
('303 City St', 301, 100.00, 1, 'None', false),
('303 City St', 302, 110.00, 2, 'None', true),
('303 City St', 303, 130.00, 3, 'None', true),
('303 City St', 304, 150.00, 4, 'None', false),
('303 City St', 305, 170.00, 5, 'None', true),

('1200 King Rd', 401, 160.00, 1, 'None', true),
('1200 King Rd', 402, 180.00, 2, 'None', false),
('1200 King Rd', 403, 200.00, 3, 'None', true),
('1200 King Rd', 404, 220.00, 4, 'None', false),
('1200 King Rd', 405, 140.00, 5, 'None', true),

('1500 East Ave', 501, 110.00, 1, 'None', true),
('1500 East Ave', 502, 130.00, 2, 'None', false),
('1500 East Ave', 503, 140.00, 3, 'None', true),
('1500 East Ave', 504, 160.00, 4, 'None', false),
('1500 East Ave', 505, 180.00, 5, 'None', true),

('1400 River Rd', 601, 130.00, 1, 'None', false),
('1400 River Rd', 602, 150.00, 2, 'None', true),
('1400 River Rd', 603, 160.00, 3, 'None', true),
('1400 River Rd', 604, 170.00, 4, 'None', false),
('1400 River Rd', 605, 110.00, 5, 'None', true),

('1500 Queen St', 701, 150.00, 1, 'None', true),
('1500 Queen St', 702, 170.00, 2, 'None', false),
('1500 Queen St', 703, 180.00, 3, 'None', true),
('1500 Queen St', 704, 200.00, 4, 'None', false),
('1500 Queen St', 705, 120.00, 5, 'None', true),

('1600 Bay Ave', 801, 100.00, 1, 'None', true),
('1600 Bay Ave', 802, 120.00, 2, 'None', false),
('1600 Bay Ave', 803, 140.00, 3, 'None', true),
('1600 Bay Ave', 804, 160.00, 4, 'None', false),
('1600 Bay Ave', 805, 180.00, 5, 'None', true),

('1700 Park Blvd', 501, 100.00, 1, 'None', true),
('1700 Park Blvd', 502, 120.00, 2, 'None', false),
('1700 Park Blvd', 503, 140.00, 3, 'None', true),
('1700 Park Blvd', 504, 160.00, 4, 'None', false),
('1700 Park Blvd', 505, 180.00, 5, 'None', true),

('1800 Main St', 401, 90.00, 1, 'None', true),
('1800 Main St', 402, 110.00, 2, 'None', false),
('1800 Main St', 403, 130.00, 3, 'None', true),
('1800 Main St', 404, 150.00, 4, 'None', false),
('1800 Main St', 405, 170.00, 5, 'None', true),

-- HotelChainID = 3
('404 Desert Dr', 401, 80.00, 1, 'None', true),
('404 Desert Dr', 402, 100.00, 2, 'None', false),
('404 Desert Dr', 403, 120.00, 3, 'None', true),
('404 Desert Dr', 404, 140.00, 4, 'None', false),
('404 Desert Dr', 405, 160.00, 5, 'None', true),

('1401 River Rd', 501, 130.00, 1, 'None', false),
('1401 River Rd', 502, 140.00, 2, 'None', true),
('1401 River Rd', 503, 150.00, 3, 'None', true),
('1401 River Rd', 504, 170.00, 4, 'None', false),
('1401 River Rd', 505, 110.00, 5, 'None', true),

('1500 Queen Blvd', 601, 100.00, 1, 'None', true),
('1500 Queen Blvd', 602, 120.00, 2, 'None', false),
('1500 Queen Blvd', 603, 140.00, 3, 'None', true),
('1500 Queen Blvd', 604, 160.00, 4, 'None', true),
('1500 Queen Blvd', 605, 180.00, 5, 'None', false),

('1600 Forest Rd', 701, 110.00, 1, 'None', true),
('1600 Forest Rd', 702, 130.00, 2, 'None', false),
('1600 Forest Rd', 703, 140.00, 3, 'None', true),
('1600 Forest Rd', 704, 150.00, 4, 'None', false),
('1600 Forest Rd', 705, 120.00, 5, 'None', true),

('1700 Lakeview Blvd', 801, 140.00, 2, 'None', false),
('1700 Lakeview Blvd', 802, 160.00, 3, 'None', true),
('1700 Lakeview Blvd', 803, 180.00, 4, 'None', false),
('1700 Lakeview Blvd', 804, 200.00, 5, 'None', true),
('1700 Lakeview Blvd', 805, 100.00, 1, 'None', true),

('1800 Maple Ave', 901, 120.00, 1, 'None', true),
('1800 Maple Ave', 902, 130.00, 2, 'None', false),
('1800 Maple Ave', 903, 140.00, 3, 'None', true),
('1800 Maple Ave', 904, 160.00, 4, 'None', false),
('1800 Maple Ave', 905, 170.00, 5, 'None', true),

('1900 King St', 1001, 100.00, 1, 'None', false),
('1900 King St', 1002, 120.00, 2, 'None', true),
('1900 King St', 1003, 140.00, 3, 'None', false),
('1900 King St', 1004, 160.00, 4, 'None', true),
('1900 King St', 1005, 180.00, 5, 'None', false),

('2000 Lakeshore Rd', 1101, 100.00, 1, 'None', true),
('2000 Lakeshore Rd', 1102, 120.00, 2, 'None', false),
('2000 Lakeshore Rd', 1103, 140.00, 3, 'None', true),
('2000 Lakeshore Rd', 1104, 160.00, 4, 'None', false),
('2000 Lakeshore Rd', 1105, 180.00, 5, 'None', true),

-- HotelChainID = 4
('505 Forest Ave', 501, 130.00, 2, 'None', false),
('505 Forest Ave', 502, 140.00, 3, 'None', true),
('505 Forest Ave', 503, 160.00, 4, 'None', true),
('505 Forest Ave', 504, 180.00, 5, 'None', false),
('505 Forest Ave', 505, 150.00, 1, 'None', true),

('100 Grove Rd', 601, 70.00, 1, 'None', true),
('100 Grove Rd', 602, 90.00, 2, 'None', false),
('100 Grove Rd', 603, 110.00, 3, 'None', true),
('100 Grove Rd', 604, 120.00, 4, 'None', false),
('100 Grove Rd', 605, 130.00, 5, 'None', true),

('1601 Bay Ave', 701, 110.00, 2, 'None', true),
('1601 Bay Ave', 702, 120.00, 3, 'None', false),
('1601 Bay Ave', 703, 140.00, 4, 'None', true),
('1601 Bay Ave', 704, 150.00, 5, 'None', false),
('1601 Bay Ave', 705, 130.00, 1, 'None', true),

('1701 Park Blvd', 801, 140.00, 2, 'None', false),
('1701 Park Blvd', 802, 160.00, 3, 'None', true),
('1701 Park Blvd', 803, 180.00, 4, 'None', false),
('1701 Park Blvd', 804, 200.00, 5, 'None', true),
('1701 Park Blvd', 805, 120.00, 1, 'None', true),

('1800 Birch Rd', 901, 150.00, 2, 'None', true),
('1800 Birch Rd', 902, 170.00, 3, 'None', false),
('1800 Birch Rd', 903, 190.00, 4, 'None', true),
('1800 Birch Rd', 904, 200.00, 5, 'None', false),
('1800 Birch Rd', 905, 130.00, 1, 'None', true),

('1900 Maple St', 1001, 160.00, 2, 'None', false),
('1900 Maple St', 1002, 180.00, 3, 'None', true),
('1900 Maple St', 1003, 200.00, 4, 'None', false),
('1900 Maple St', 1004, 220.00, 5, 'None', true),
('1900 Maple St', 1005, 130.00, 1, 'None', true),

('2000 Pine Ave', 1101, 130.00, 2, 'None', true),
('2000 Pine Ave', 1102, 150.00, 3, 'None', false),
('2000 Pine Ave', 1103, 170.00, 4, 'None', true),
('2000 Pine Ave', 1104, 180.00, 5, 'None', false),
('2000 Pine Ave', 1105, 110.00, 1, 'None', true),

('2100 River Rd', 1201, 100.00, 1, 'None', true),
('2100 River Rd', 1202, 120.00, 2, 'None', false),
('2100 River Rd', 1203, 140.00, 3, 'None', true),
('2100 River Rd', 1204, 160.00, 4, 'None', false),
('2100 River Rd', 1205, 180.00, 5, 'None', true),

-- HotelChainID = 5
('500 Yonge St', 501, 50.00, 1, 'None', false),
('500 Yonge St', 502, 60.00, 2, 'None', true),
('500 Yonge St', 503, 70.00, 3, 'None', false),
('500 Yonge St', 504, 80.00, 4, 'None', true),
('500 Yonge St', 505, 90.00, 5, 'None', false),

('600 Bay St', 601, 50.00, 1, 'None', true),
('600 Bay St', 602, 60.00, 2, 'None', false),
('600 Bay St', 603, 70.00, 3, 'None', true),
('600 Bay St', 604, 80.00, 4, 'None', false),
('600 Bay St', 605, 90.00, 5, 'None', true),

('700 King St', 701, 50.00, 1, 'None', false),
('700 King St', 702, 60.00, 2, 'None', true),
('700 King St', 703, 70.00, 3, 'None', false),
('700 King St', 704, 80.00, 4, 'None', true),
('700 King St', 705, 90.00, 5, 'None', false),

('800 Queen St', 801, 50.00, 1, 'None', false),
('800 Queen St', 802, 60.00, 2, 'None', true),
('800 Queen St', 803, 70.00, 3, 'None', false),
('800 Queen St', 804, 80.00, 4, 'None', true),
('800 Queen St', 805, 90.00, 5, 'None', false),

('900 Lakeshore Blvd', 901, 100.00, 1, 'None', true),
('900 Lakeshore Blvd', 902, 120.00, 3, 'None', false),
('900 Lakeshore Blvd', 903, 140.00, 4, 'None', true),
('900 Lakeshore Blvd', 904, 160.00, 5, 'None', false),
('900 Lakeshore Blvd', 905, 110.00, 2, 'None', true),

('1010 Front St', 1001, 80.00, 1, 'None', true),
('1010 Front St', 1002, 100.00, 2, 'None', false),
('1010 Front St', 1003, 120.00, 3, 'None', true),
('1010 Front St', 1004, 140.00, 4, 'None', false),
('1010 Front St', 1005, 100.00, 5, 'None', false),

('1100 Maple Blvd', 1101, 110.00, 1, 'None', true),
('1100 Maple Blvd', 1102, 130.00, 2, 'None', false),
('1100 Maple Blvd', 1103, 150.00, 3, 'None', true),
('1100 Maple Blvd', 1104, 170.00, 4, 'None', false),
('1100 Maple Blvd', 1105, 120.00, 5, 'None', true),

('1200 Woodward Ave', 1201, 90.00, 1, 'None', true),
('1200 Woodward Ave', 1202, 110.00, 2, 'None', false),
('1200 Woodward Ave', 1203, 130.00, 3, 'None', true),
('1200 Woodward Ave', 1204, 150.00, 4, 'None', false),
('1200 Woodward Ave', 1205, 140.00, 5, 'None', false);

INSERT INTO InstProblem (HotelAddr, RoomNum, Type) VALUES
('101 Beach Blvd', 101, 'AC Broken');

INSERT INTO InstAmenity (HotelAddr, RoomNum, Type) VALUES
('101 Beach Blvd', 101, 'Wi-Fi');

INSERT INTO Employee (SINOrSSN, FirstName, MiddleName, LastName, Address, Role, HotelAddr) VALUES
(123456789, 'John', 'A', 'Doe', '111 Beach Ln', 'Manager', '101 Beach Blvd'),
(234567890, 'Jane', 'B', 'Smith', '222 Mountain View', 'Receptionist', '202 Mountain Rd'),
(345678901, 'Jim', 'C', 'Brown', '333 City Center', 'Housekeeping', '303 City St'),
(456789012, 'Jill', 'D', 'White', '444 Desert Oasis', 'Maintenance', '404 Desert Dr'),
(567890123, 'Jack', 'E', 'Black', '555 Forest Trail', 'Security', '505 Forest Ave'),
(678901234, 'Jenny', 'F', 'Green', '600 Grove Park', 'Manager', '100 Grove Rd'),
(789012345, 'Jerry', 'G', 'Blue', '601 Grove Park', 'Receptionist', '100 Grove Rd'),
(890123456, 'Judy', 'H', 'Red', '602 Grove Park', 'Housekeeping', '100 Grove Rd'),
(901234568, 'Joe', 'I', 'Yellow', '603 Grove Park', 'Maintenance', '100 Grove Rd'),
(912345679, 'Janet', 'J', 'Purple', '604 Grove Park', 'Security', '100 Grove Rd'),
(923456780, 'James', 'K', 'Orange', '700 Park Blvd', 'Manager', '500 Yonge St'),
(934567881, 'Jill', 'L', 'Pink', '701 Park Blvd', 'Receptionist', '500 Yonge St'),
(945678982, 'Jim', 'M', 'Brown', '702 Park Blvd', 'Housekeeping', '500 Yonge St'),
(956789083, 'Jenny', 'N', 'Green', '703 Park Blvd', 'Maintenance', '500 Yonge St'),
(967890184, 'Jack', 'O', 'Black', '704 Park Blvd', 'Security', '500 Yonge St'),
(978901285, 'Alice', 'P', 'White', '805 River Rd', 'Manager', '500 Yonge St'),
(989012386, 'Bob', 'Q', 'Gray', '806 River Rd', 'Receptionist', '500 Yonge St'),
(990123487, 'Clara', 'R', 'Blue', '807 River Rd', 'Housekeeping', '500 Yonge St'),
(901234588, 'David', 'S', 'Brown', '808 River Rd', 'Maintenance', '500 Yonge St'),
(912345689, 'Emma', 'T', 'Smith', '809 River Rd', 'Security', '500 Yonge St'),
(923456790, 'Liam', 'U', 'Johnson', '900 East Ave', 'Manager', '1010 Park Rd'),
(934567891, 'Noah', 'V', 'Williams', '901 East Ave', 'Receptionist', '1010 Park Rd'),
(945678992, 'Olivia', 'W', 'Davis', '902 East Ave', 'Housekeeping', '1010 Park Rd'),
(956789093, 'Sophia', 'X', 'Miller', '903 East Ave', 'Maintenance', '1010 Park Rd'),
(967890194, 'Mason', 'Y', 'Wilson', '904 East Ave', 'Security', '1010 Park Rd'),
(978901295, 'Isabella', 'Z', 'Taylor', '1000 Park Ave', 'Manager', '1200 River Rd'),
(989012396, 'Lucas', 'AA', 'Anderson', '1001 Park Ave', 'Receptionist', '1200 River Rd'),
(990123497, 'Mia', 'BB', 'Thomas', '1002 Park Ave', 'Housekeeping', '1200 River Rd'),
(901234598, 'Ethan', 'CC', 'Harris', '1003 Park Ave', 'Maintenance', '1200 River Rd'),
(912345699, 'Ava', 'DD', 'Martin', '1004 Park Ave', 'Security', '1200 River Rd'),
(923456799, 'Elijah', 'EE', 'Thompson', '1100 King Rd', 'Manager', '1300 East Ave'),
(934567899, 'Charlotte', 'FF', 'Garcia', '1101 King Rd', 'Receptionist', '1300 East Ave'),
(945678999, 'William', 'GG', 'Martinez', '1102 King Rd', 'Housekeeping', '1300 East Ave'),
(956789099, 'Amelia', 'HH', 'Robinson', '1103 King Rd', 'Maintenance', '1300 East Ave'),
(967890199, 'Benjamin', 'II', 'Clark', '1104 King Rd', 'Security', '1300 East Ave'),
(110000000, 'Alex', 'II', 'Ovechkin', '1105 King Rd', 'Security', '1400 King Rd'),
(120000000, 'Arnold', 'E', 'Smith', '1106 King Rd', 'Security', '1500 Sunset Blvd'),
(100000000, 'Terrence', 'U', 'Mary', '123 Fourth St', 'Manager', '303 City St'),
(100000001, 'Nicole', 'J', 'Nicole', '123 Fourth St', 'Manager', '1200 King Rd'),
(100000002, 'Louis', 'V', 'Byron', '123 Fourth St', 'Manager', '1500 East Ave'),
(100000003, 'Stephen', 'Y', 'Wilma', '123 Fourth St', 'Manager', '1400 River Rd'),
(100000004, 'Ernest', 'W', 'Lily', '123 Fourth St', 'Manager', '1500 Queen St'),
(100000005, 'Avis', 'U', 'Ashley', '123 Fourth St', 'Manager', '1600 Bay Ave'),
(100000006, 'Stewie', 'R', 'Ahvaanish', '123 Fourth St', 'Manager', '1700 Park Blvd'),
(100000007, 'Louis', 'S', 'James', '123 Fourth St', 'Manager', '1800 Main St'),
(100000008, 'Michael', 'P', 'Amanda', '123 Fourth St', 'Manager', '404 Desert Dr'),
(100000009, 'Rafael', 'N', 'Alphonse', '123 Fourth St', 'Manager', '1401 River Rd'),
(100000010, 'Shirley', 'T', 'Laurie', '123 Fourth St', 'Manager', '1500 Queen Blvd'),
(100000011, 'Marie', 'K', 'Marie', '123 Fourth St', 'Manager', '1600 Forest Rd'),
(100000012, 'Elton', 'L', 'Terrence', '123 Fourth St', 'Manager', '1700 Lakeview Blvd'),
(100000013, 'Ernest', 'M', 'Megan', '123 Fourth St', 'Manager', '1800 Maple Ave'),
(100000014, 'James', 'K', 'Romeo', '123 Fourth St', 'Manager', '1900 King St'),
(100000015, 'Jeremy', 'D', 'Chris', '123 Fourth St', 'Manager', '2000 Lakeshore Rd'),
(100000016, 'Naomi', 'G', 'Imogine', '123 Fourth St', 'Manager', '505 Forest Ave'),
(100000017, 'Lily', 'Z', 'Rafael', '123 Fourth St', 'Manager', '100 Grove Rd'),
(100000018, 'Gonzalo', 'Q', 'Mary', '123 Fourth St', 'Manager', '1601 Bay Ave'),
(100000019, 'Valentino', 'J', 'Aline', '123 Fourth St', 'Manager', '1701 Park Blvd'),
(100000020, 'Christine', 'J', 'Eddy', '123 Fourth St', 'Manager', '1800 Birch Rd'),
(100000021, 'Alphonse', 'N', 'Lionel', '123 Fourth St', 'Manager', '1900 Maple St'),
(100000022, 'Shirley', 'M', 'Byron', '123 Fourth St', 'Manager', '2000 Pine Ave'),
(100000023, 'Louis', 'O', 'Imogine', '123 Fourth St', 'Manager', '2100 River Rd'),
(100000024, 'Quentin', 'M', 'Ricky', '123 Fourth St', 'Manager', '500 Yonge St'),
(100000025, 'Matthew', 'D', 'Amanda', '123 Fourth St', 'Manager', '600 Bay St'),
(100000026, 'Quentin', 'S', 'Kevin', '123 Fourth St', 'Manager', '700 King St'),
(100000027, 'Neva', 'C', 'June', '123 Fourth St', 'Manager', '800 Queen St'),
(100000028, 'Gina', 'C', 'Mary', '123 Fourth St', 'Manager', '900 Lakeshore Blvd'),
(100000029, 'Rafael', 'X', 'June', '123 Fourth St', 'Manager', '1010 Front St'),
(100000030, 'Rosario', 'O', 'Michael', '123 Fourth St', 'Manager', '1100 Maple Blvd'),
(100000031, 'Louis', 'Y', 'Marina', '123 Fourth St', 'Manager', '1200 Woodward Ave');


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
('101 Beach Blvd', 101, '2026-03-20', 'C001', '2026-03-22', 2);
INSERT INTO Renting (HotelAddr, RoomNum, CheckInDate, CustomerID, CheckOutDate, Duration, Balance, EmployeeSINOrSSN) VALUES
('101 Beach Blvd', 101, '2025-03-20', 'C001', '2025-03-22', 2, 300.00, 123456789);

INSERT INTO Payment (HotelAddr, RoomNum, CheckInDate, CustomerID, PaymentAmount, PaymentDate) VALUES
('101 Beach Blvd', 101, '2025-03-20', 'C001', 300.00, '2025-03-19');
