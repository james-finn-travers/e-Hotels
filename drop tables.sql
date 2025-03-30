SET search_path='e-Hotel';

-- Drop triggers with CASCADE (will remove dependent triggers if any)
DROP TRIGGER IF EXISTS archive_renting ON Renting CASCADE;
DROP TRIGGER IF EXISTS archive_booking ON Booking CASCADE;
DROP TRIGGER IF EXISTS add_payment ON Payment CASCADE;
DROP TRIGGER IF EXISTS add_hotel ON Hotel CASCADE;
DROP TRIGGER IF EXISTS remove_hotel ON Hotel CASCADE;
DROP TRIGGER IF EXISTS add_room ON Room CASCADE;
DROP TRIGGER IF EXISTS remove_room ON Room CASCADE;
DROP TRIGGER IF EXISTS add_manager ON Room CASCADE;

-- Drop functions with CASCADE (will remove dependent triggers or functions)
DROP FUNCTION IF EXISTS archive_renting_function() CASCADE;
DROP FUNCTION IF EXISTS archive_booking_function() CASCADE;
DROP FUNCTION IF EXISTS add_payment_function() CASCADE;
DROP FUNCTION IF EXISTS add_hotel_function() CASCADE;
DROP FUNCTION IF EXISTS remove_hotel_function() CASCADE;
DROP FUNCTION IF EXISTS add_room_function() CASCADE;
DROP FUNCTION IF EXISTS remove_room_function() CASCADE;
DROP FUNCTION IF EXISTS add_manager_function() CASCADE;

-- Drop tables with CASCADE to remove dependent objects (e.g., foreign keys, triggers)
DROP TABLE IF EXISTS InstProblem CASCADE;
DROP TABLE IF EXISTS InstAmenity CASCADE;
DROP TABLE IF EXISTS Manages CASCADE;
DROP TABLE IF EXISTS Booking CASCADE;
DROP TABLE IF EXISTS Renting CASCADE;
DROP TABLE IF EXISTS Payment CASCADE;
DROP TABLE IF EXISTS Archive CASCADE;

-- Drop tables with CASCADE (these tables depend on other tables like Hotel and Room)
DROP TABLE IF EXISTS HotelPhone CASCADE;
DROP TABLE IF EXISTS HotelEmail CASCADE;
DROP TABLE IF EXISTS Room CASCADE;
DROP TABLE IF EXISTS Hotel CASCADE;

-- Drop Employee and Customer tables with CASCADE (as they are referenced by other tables)
DROP TABLE IF EXISTS Employee CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;

-- Drop tables with CASCADE (these tables have no dependencies or have been removed)
DROP TABLE IF EXISTS ChainPhone CASCADE;
DROP TABLE IF EXISTS ChainEmail CASCADE;
DROP TABLE IF EXISTS InstCentralOffice CASCADE;
DROP TABLE IF EXISTS HotelChain CASCADE;
