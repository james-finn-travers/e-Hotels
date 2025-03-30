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
('101 Beach Blvd', 2, 'Ottawa', 4, 1),
('202 Mountain Rd', 1, 'Kanata', 5, 1),
('1010 Park Rd', 6, 'Ottawa', 3, 1),
('1100 Main St', 9, 'Ottawa', 4, 1),
('1200 River Rd', 7, 'Toronto', 2, 1),
('1300 East Ave', 4, 'Toronto', 3, 1),
('1400 King Rd', 5, 'Ottawa', 1, 1),
('1500 Sunset Blvd', 8, 'Toronto', 4, 1),

-- HotelChainID = 2
('303 City St', 1, 'Ottawa', 3, 2),
('1200 King Rd', 5, 'Toronto', 3, 2),
('1300 East Ave', 4, 'Toronto', 2, 2),
('1400 River Rd', 6, 'Ottawa', 4, 2),
('1500 Queen St', 7, 'Toronto', 5, 2),
('1600 Bay Ave', 6, 'Hamilton', 3, 2),
('1700 Park Blvd', 5, 'Hamilton', 2, 2),
('1800 Main St', 4, 'Toronto', 1, 2),

-- HotelChainID = 3
('404 Desert Dr', 1, 'Kanata', 2, 3),
('1400 River Rd', 6, 'Ottawa', 4, 3),
('1500 Queen Blvd', 7, 'Toronto', 5, 3),
('1600 Forest Rd', 5, 'Ottawa', 2, 3),
('1700 Lakeview Blvd', 8, 'Ottawa', 3, 3),
('1800 Maple Ave', 5, 'Toronto', 4, 3),
('1900 King St', 9, 'Toronto', 2, 3),
('2000 Lakeshore Rd', 6, 'Hamilton', 3, 3),

-- HotelChainID = 4
('505 Forest Ave', 5, 'Ottawa', 4, 4),
('100 Grove Rd', 3, 'Kanata', 1, 4),
('1600 Bay Ave', 8, 'Hamilton', 2, 4),
('1700 Park Blvd', 5, 'Hamilton', 3, 4),
('1800 Birch Rd', 6, 'Toronto', 5, 4),
('1900 Maple St', 9, 'Ottawa', 4, 4),
('2000 Pine Ave', 7, 'Ottawa', 3, 4),
('2100 River Rd', 6, 'Toronto', 2, 4),

-- HotelChainID = 5
('500 Yonge St', 8, 'Ottawa', 1, 5),
('600 Bay St', 10, 'Toronto', 2, 5),
('700 King St', 10, 'Toronto', 3, 5),
('800 Queen St', 4, 'Toronto', 4, 5),
('900 Lakeshore Blvd', 7, 'Toronto', 5, 5),
('1010 Front St', 6, 'Toronto', 4, 5),
('1100 Maple Blvd', 9, 'Ottawa', 5, 5),
('1200 Woodward Ave', 12, 'Toronto', 5, 5);


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
('101 Beach Blvd', 101, 150.00, 2, 'Sea', true),
('101 Beach Blvd', 102, 120.00, 2, 'Sea', false),
('101 Beach Blvd', 103, 160.00, 3, 'Sea', true),
('101 Beach Blvd', 104, 180.00, 4, 'Sea', true),
('101 Beach Blvd', 105, 200.00, 5, 'Sea', false),

('202 Mountain Rd', 201, 200.00, 3, 'Mountain', true),
('202 Mountain Rd', 202, 220.00, 4, 'Mountain', true),
('202 Mountain Rd', 203, 240.00, 5, 'Mountain', false),
('202 Mountain Rd', 204, 180.00, 2, 'Mountain', false),
('202 Mountain Rd', 205, 150.00, 3, 'Mountain', true),

('1010 Park Rd', 301, 110.00, 1, 'None', true),
('1010 Park Rd', 302, 120.00, 2, 'None', false),
('1010 Park Rd', 303, 130.00, 3, 'None', true),
('1010 Park Rd', 304, 140.00, 4, 'None', false),
('1010 Park Rd', 305, 150.00, 5, 'None', true),

('1100 Main St', 401, 130.00, 2, 'None', false),
('1100 Main St', 402, 140.00, 3, 'None', true),
('1100 Main St', 403, 160.00, 4, 'None', true),
('1100 Main St', 404, 170.00, 5, 'None', false),
('1100 Main St', 405, 120.00, 1, 'None', true),

('1200 River Rd', 501, 100.00, 1, 'None', true),
('1200 River Rd', 502, 120.00, 2, 'None', false),
('1200 River Rd', 503, 140.00, 3, 'None', true),
('1200 River Rd', 504, 160.00, 4, 'None', true),
('1200 River Rd', 505, 180.00, 5, 'None', false),

('1300 East Ave', 601, 110.00, 2, 'None', true),
('1300 East Ave', 602, 120.00, 3, 'None', false),
('1300 East Ave', 603, 140.00, 4, 'None', true),
('1300 East Ave', 604, 150.00, 5, 'None', false),
('1300 East Ave', 605, 130.00, 1, 'None', true),

('1400 King Rd', 701, 80.00, 1, 'None', true),
('1400 King Rd', 702, 90.00, 2, 'None', false),
('1400 King Rd', 703, 110.00, 3, 'None', true),
('1400 King Rd', 704, 120.00, 4, 'None', false),
('1400 King Rd', 705, 130.00, 5, 'None', true),

('1500 Sunset Blvd', 801, 140.00, 2, 'None', true),
('1500 Sunset Blvd', 802, 160.00, 3, 'None', false),
('1500 Sunset Blvd', 803, 180.00, 4, 'None', true),
('1500 Sunset Blvd', 804, 200.00, 5, 'None', false),
('1500 Sunset Blvd', 805, 120.00, 1, 'None', true),

-- HotelChainID = 2
('303 City St', 301, 100.00, 1, 'None', false),
('303 City St', 302, 110.00, 2, 'None', true),
('303 City St', 303, 130.00, 3, 'None', true),
('303 City St', 304, 150.00, 4, 'None', false),
('303 City St', 305, 170.00, 5, 'None', true),

('1200 King Rd', 401, 160.00, 2, 'None', true),
('1200 King Rd', 402, 180.00, 3, 'None', false),
('1200 King Rd', 403, 200.00, 4, 'None', true),
('1200 King Rd', 404, 220.00, 5, 'None', false),
('1200 King Rd', 405, 140.00, 1, 'None', true),

('1300 East Ave', 501, 110.00, 1, 'None', true),
('1300 East Ave', 502, 130.00, 2, 'None', false),
('1300 East Ave', 503, 140.00, 3, 'None', true),
('1300 East Ave', 504, 160.00, 4, 'None', false),
('1300 East Ave', 505, 180.00, 5, 'None', true),

('1400 River Rd', 601, 130.00, 2, 'None', false),
('1400 River Rd', 602, 150.00, 3, 'None', true),
('1400 River Rd', 603, 160.00, 4, 'None', true),
('1400 River Rd', 604, 170.00, 5, 'None', false),
('1400 River Rd', 605, 110.00, 1, 'None', true),

('1500 Queen St', 701, 150.00, 2, 'None', true),
('1500 Queen St', 702, 170.00, 3, 'None', false),
('1500 Queen St', 703, 180.00, 4, 'None', true),
('1500 Queen St', 704, 200.00, 5, 'None', false),
('1500 Queen St', 705, 120.00, 1, 'None', true),

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

('1400 River Rd', 501, 130.00, 2, 'None', false),
('1400 River Rd', 502, 140.00, 3, 'None', true),
('1400 River Rd', 503, 150.00, 4, 'None', true),
('1400 River Rd', 504, 170.00, 5, 'None', false),
('1400 River Rd', 505, 110.00, 1, 'None', true),

('1500 Queen Blvd', 601, 100.00, 1, 'None', true),
('1500 Queen Blvd', 602, 120.00, 2, 'None', false),
('1500 Queen Blvd', 603, 140.00, 3, 'None', true),
('1500 Queen Blvd', 604, 160.00, 4, 'None', true),
('1500 Queen Blvd', 605, 180.00, 5, 'None', false),

('1600 Forest Rd', 701, 110.00, 2, 'None', true),
('1600 Forest Rd', 702, 130.00, 3, 'None', false),
('1600 Forest Rd', 703, 140.00, 4, 'None', true),
('1600 Forest Rd', 704, 150.00, 5, 'None', false),
('1600 Forest Rd', 705, 120.00, 1, 'None', true),

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

('1600 Bay Ave', 701, 110.00, 2, 'None', true),
('1600 Bay Ave', 702, 120.00, 3, 'None', false),
('1600 Bay Ave', 703, 140.00, 4, 'None', true),
('1600 Bay Ave', 704, 150.00, 5, 'None', false),
('1600 Bay Ave', 705, 130.00, 1, 'None', true),

('1700 Park Blvd', 801, 140.00, 2, 'None', false),
('1700 Park Blvd', 802, 160.00, 3, 'None', true),
('1700 Park Blvd', 803, 180.00, 4, 'None', false),
('1700 Park Blvd', 804, 200.00, 5, 'None', true),
('1700 Park Blvd', 805, 120.00, 1, 'None', true),

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

('900 Lakeshore Blvd', 901, 100.00, 2, 'None', true),
('900 Lakeshore Blvd', 902, 120.00, 3, 'None', false),
('900 Lakeshore Blvd', 903, 140.00, 4, 'None', true),
('900 Lakeshore Blvd', 904, 160.00, 5, 'None', false),
('900 Lakeshore Blvd', 905, 110.00, 2, 'None', true),

('1010 Front St', 1001, 80.00, 1, 'None', true),
('1010 Front St', 1002, 100.00, 2, 'None', false),
('1010 Front St', 1003, 120.00, 3, 'None', true),
('1010 Front St', 1004, 140.00, 4, 'None', false),
('1010 Front St', 1005, 100.00, 2, 'None', false),

('1100 Maple Blvd', 1101, 110.00, 2, 'None', true),
('1100 Maple Blvd', 1102, 130.00, 3, 'None', false),
('1100 Maple Blvd', 1103, 150.00, 4, 'None', true),
('1100 Maple Blvd', 1104, 170.00, 5, 'None', false),
('1100 Maple Blvd', 1105, 120.00, 3, 'None', true),

('1200 Woodward Ave', 1201, 90.00, 1, 'None', true),
('1200 Woodward Ave', 1202, 110.00, 2, 'None', false),
('1200 Woodward Ave', 1203, 130.00, 3, 'None', true),
('1200 Woodward Ave', 1204, 150.00, 4, 'None', false),
('1200 Woodward Ave', 1205, 140.00, 4, 'None', false);

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
(901234567, 'Joe', 'I', 'Yellow', '100 Grove Rd', 'Maintenance', '100 Grove Rd'),
(912345678, 'Janet', 'J', 'Purple', '100 Grove Rd', 'Security', '100 Grove Rd'),
(923456789, 'James', 'K', 'Orange', '100 Grove Rd', 'Manager', '100 Grove Rd'),
(934567890, 'Jill', 'L', 'Pink', '100 Grove Rd', 'Receptionist', '100 Grove Rd'),
(945678901, 'Jim', 'M', 'Brown', '100 Grove Rd', 'Housekeeping', '100 Grove Rd'),
(956789012, 'Jenny', 'N', 'Green', '100 Grove Rd', 'Maintenance', '100 Grove Rd'),
(967890123, 'Jack', 'O', 'Black', '100 Grove Rd', 'Security', '100 Grove Rd'),
(978901234, 'Jenny', 'P', 'Green', '500 Yonge St', 'Manager', '500 Yonge St'),
(989012345, 'Jerry', 'Q', 'Blue', '500 Yonge St', 'Receptionist', '500 Yonge St'),
(990123456, 'Judy', 'R', 'Red', '500 Yonge St', 'Housekeeping', '500 Yonge St'),
(901234567, 'Joe', 'S', 'Yellow', '500 Yonge St', 'Maintenance', '500 Yonge St'),
(912345678, 'Janet', 'T', 'Purple', '500 Yonge St', 'Security', '500 Yonge St'),
(923456789, 'James', 'U', 'Orange', '500 Yonge St', 'Manager', '500 Yonge St'),
(934567890, 'Jill', 'V', 'Pink', '500 Yonge St', 'Receptionist', '500 Yonge St'),
(945678901, 'Jim', 'W', 'Brown', '500 Yonge St', 'Housekeeping', '500 Yonge St'),
(956789012, 'Jenny', 'X', 'Green', '500 Yonge St', 'Maintenance', '500 Yonge St'),
(967890123, 'Jack', 'Y', 'Black', '500 Yonge St', 'Security', '500 Yonge St');

INSERT INTO Manages (SINOrSSN, HotelAddr) VALUES
(123456789, '101 Beach Blvd'),
(234567890, '202 Mountain Rd'),
(345678901, '303 City St'),
(456789012, '404 Desert Dr'),
(567890123, '505 Forest Ave'),
(678901234, '100 Grove Rd'),
(967890123, '500 Yonge St');

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
('101 Beach Blvd', 101, '2026-03-20', 'C001', '2026-03-22', 2),
('303 City St', 301, '2026-03-21', 'C002', '2026-03-24', 3),
('404 Desert Dr', 401, '2026-03-22', 'C003', '2026-03-25', 3),
('505 Forest Ave', 501, '2026-03-23', 'C004', '2026-03-26', 3),
('505 Forest Ave', 502, '2026-03-24', 'C005', '2026-03-27', 3),
('100 Grove Rd', 101, '2026-03-25', 'C006', '2026-03-28', 3),
('100 Grove Rd', 102, '2026-03-26', 'C007', '2026-03-29', 3),
('100 Grove Rd', 103, '2026-03-27', 'C008', '2026-03-30', 3),
('100 Grove Rd', 101, '2026-03-28', 'C009', '2026-03-31', 3),
('100 Grove Rd', 102, '2026-03-29', 'C010', '2026-04-01', 3),
('100 Grove Rd', 103, '2026-03-30', 'C011', '2026-04-02', 3),
('100 Grove Rd', 101, '2026-03-31', 'C012', '2026-04-03', 3),
('500 Yonge St', 501, '2026-04-01', 'C013', '2026-04-04', 3),
('500 Yonge St', 502, '2026-04-02', 'C014', '2026-04-05', 3),
('500 Yonge St', 503, '2026-04-03', 'C015', '2026-04-06', 3),
('500 Yonge St', 504, '2026-04-04', 'C016', '2026-04-07', 3),
('500 Yonge St', 505, '2026-04-05', 'C017', '2026-04-08', 3),
('500 Yonge St', 506, '2026-04-06', 'C018', '2026-04-09', 3),
('500 Yonge St', 507, '2026-04-07', 'C019', '2026-04-10', 3),
('500 Yonge St', 508, '2026-04-08', 'C020', '2026-04-11', 3),
('600 Bay St', 601, '2026-04-09', 'C021', '2026-04-12', 3),
('600 Bay St', 602, '2026-04-10', 'C022', '2026-04-13', 3),
('600 Bay St', 603, '2026-04-11', 'C023', '2026-04-14', 3),
('600 Bay St', 604, '2026-04-12', 'C024', '2026-04-15', 3),
('600 Bay St', 605, '2026-04-13', 'C025', '2026-04-16', 3),
('600 Bay St', 606, '2026-04-14', 'C026', '2026-04-17', 3),
('600 Bay St', 607, '2026-04-15', 'C027', '2026-04-18', 3),
('600 Bay St', 608, '2026-04-16', 'C028', '2026-04-19', 3),
('600 Bay St', 609, '2026-04-17', 'C029', '2026-04-20', 3),
('600 Bay St', 610, '2026-04-18', 'C030', '2026-04-21', 3),
('700 King St', 701, '2026-04-19', 'C031', '2026-04-22', 3),
('700 King St', 702, '2026-04-20', 'C032', '2026-04-23', 3),
('700 King St', 703, '2026-04-21', 'C033', '2026-04-24', 3),
('700 King St', 704, '2026-04-22', 'C034', '2026-04-25', 3),
('700 King St', 705, '2026-04-23', 'C035', '2026-04-26', 3),
('700 King St', 706, '2026-04-24', 'C036', '2026-04-27', 3),
('700 King St', 707, '2026-04-25', 'C001', '2026-04-28', 3),
('700 King St', 708, '2026-04-26', 'C002', '2026-04-29', 3),
('700 King St', 709, '2026-04-27', 'C003', '2026-04-30', 3),
('700 King St', 710, '2026-04-28', 'C004', '2026-05-01', 3),
('800 Queen St', 801, '2026-04-29', 'C005', '2026-05-02', 3),
('800 Queen St', 802, '2026-04-30', 'C006', '2026-05-03', 3),
('800 Queen St', 803, '2026-05-01', 'C007', '2026-05-04', 3),
('800 Queen St', 804, '2026-05-02', 'C008', '2026-05-05', 3);

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
