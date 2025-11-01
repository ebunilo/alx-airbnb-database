-- =====================================================
-- POPULATE NORMALIZED DATABASE WITH SAMPLE DATA
-- =====================================================

-- Enable UUID generation extension (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- 1. CLEAN EXISTING DATA (Optional - for fresh start)
-- =====================================================
TRUNCATE TABLE Message, Review, Payment, Booking, Property, Location, 
Property_Type, Payment_Status, Payment_Method, Booking_Status, "User" 
CASCADE;

-- =====================================================
-- 2. INSERT REFERENCE DATA
-- =====================================================

-- Insert booking statuses
INSERT INTO Booking_Status (status_code, status_name, description) VALUES
('pending', 'Pending', 'Booking is awaiting confirmation'),
('confirmed', 'Confirmed', 'Booking has been confirmed'),
('canceled', 'Canceled', 'Booking has been canceled'),
('completed', 'Completed', 'Booking has been completed');

-- Insert payment methods
INSERT INTO Payment_Method (method_code, method_name, description) VALUES
('credit_card', 'Credit Card', 'Payment via credit card'),
('paypal', 'PayPal', 'Payment via PayPal'),
('stripe', 'Stripe', 'Payment via Stripe'),
('bank_transfer', 'Bank Transfer', 'Payment via bank transfer');

-- Insert payment statuses
INSERT INTO Payment_Status (status_code, status_name, description) VALUES
('pending', 'Pending', 'Payment is pending'),
('processing', 'Processing', 'Payment is being processed'),
('completed', 'Completed', 'Payment has been completed'),
('failed', 'Failed', 'Payment has failed'),
('refunded', 'Refunded', 'Payment has been refunded');

-- Insert property types with auto-generated UUIDs
INSERT INTO Property_Type (property_type_id, type_name, description) VALUES
(uuid_generate_v4(), 'Apartment', 'Self-contained housing unit in a building'),
(uuid_generate_v4(), 'House', 'Standalone residential building'),
(uuid_generate_v4(), 'Villa', 'Luxury vacation home'),
(uuid_generate_v4(), 'Condo', 'Individually owned unit in a complex'),
(uuid_generate_v4(), 'Studio', 'Single-room apartment'),
(uuid_generate_v4(), 'Cabin', 'Wooden house in natural surroundings'),
(uuid_generate_v4(), 'Loft', 'Open-concept apartment');

-- =====================================================
-- 3. INSERT USERS (with explicit UUIDs for relationships)
-- =====================================================
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Admins
(uuid_generate_v4(), 'John', 'Admin', 'john.admin@example.com', 'hashed_password_1', '+1-555-0101', 'admin', '2023-01-15 09:00:00'),

-- Hosts
(uuid_generate_v4(), 'Sarah', 'Johnson', 'sarah.johnson@example.com', 'hashed_password_2', '+1-555-0102', 'host', '2023-02-10 10:30:00'),
(uuid_generate_v4(), 'Mike', 'Chen', 'mike.chen@example.com', 'hashed_password_3', '+1-555-0103', 'host', '2023-02-12 14:15:00'),
(uuid_generate_v4(), 'Emily', 'Davis', 'emily.davis@example.com', 'hashed_password_4', '+1-555-0104', 'host', '2023-03-01 11:20:00'),
(uuid_generate_v4(), 'David', 'Wilson', 'david.wilson@example.com', 'hashed_password_5', '+1-555-0105', 'host', '2023-03-05 16:45:00'),

-- Guests
(uuid_generate_v4(), 'Lisa', 'Brown', 'lisa.brown@example.com', 'hashed_password_6', '+1-555-0106', 'guest', '2023-03-10 08:00:00'),
(uuid_generate_v4(), 'James', 'Miller', 'james.miller@example.com', 'hashed_password_7', '+1-555-0107', 'guest', '2023-03-12 12:30:00'),
(uuid_generate_v4(), 'Maria', 'Garcia', 'maria.garcia@example.com', 'hashed_password_8', '+1-555-0108', 'guest', '2023-03-15 15:20:00'),
(uuid_generate_v4(), 'Robert', 'Taylor', 'robert.taylor@example.com', 'hashed_password_9', '+1-555-0109', 'guest', '2023-03-18 09:45:00'),
(uuid_generate_v4(), 'Jennifer', 'Lee', 'jennifer.lee@example.com', 'hashed_password_10', '+1-555-0110', 'guest', '2023-03-20 17:10:00');

-- =====================================================
-- 4. STORE GENERATED USER IDs FOR RELATIONSHIPS
-- =====================================================
DO $$ 
DECLARE
    admin_id UUID;
    sarah_id UUID;
    mike_id UUID;
    emily_id UUID;
    david_id UUID;
    lisa_id UUID;
    james_id UUID;
    maria_id UUID;
    robert_id UUID;
    jennifer_id UUID;
BEGIN
    -- Get user IDs for relationships
    SELECT user_id INTO admin_id FROM "User" WHERE email = 'john.admin@example.com';
    SELECT user_id INTO sarah_id FROM "User" WHERE email = 'sarah.johnson@example.com';
    SELECT user_id INTO mike_id FROM "User" WHERE email = 'mike.chen@example.com';
    SELECT user_id INTO emily_id FROM "User" WHERE email = 'emily.davis@example.com';
    SELECT user_id INTO david_id FROM "User" WHERE email = 'david.wilson@example.com';
    SELECT user_id INTO lisa_id FROM "User" WHERE email = 'lisa.brown@example.com';
    SELECT user_id INTO james_id FROM "User" WHERE email = 'james.miller@example.com';
    SELECT user_id INTO maria_id FROM "User" WHERE email = 'maria.garcia@example.com';
    SELECT user_id INTO robert_id FROM "User" WHERE email = 'robert.taylor@example.com';
    SELECT user_id INTO jennifer_id FROM "User" WHERE email = 'jennifer.lee@example.com';

    -- =====================================================
    -- 5. INSERT LOCATIONS
    -- =====================================================
    INSERT INTO Location (location_id, address_line1, address_line2, city, state_province, postal_code, country, latitude, longitude, created_at) VALUES
    -- New York Locations
    (uuid_generate_v4(), '123 Manhattan Ave', 'Apt 4B', 'New York', 'NY', '10001', 'USA', 40.712776, -74.005974, '2023-02-10 10:30:00'),
    (uuid_generate_v4(), '456 Brooklyn St', NULL, 'New York', 'NY', '11201', 'USA', 40.678178, -73.944158, '2023-02-12 14:15:00'),
    (uuid_generate_v4(), '789 Queens Blvd', 'Floor 2', 'New York', 'NY', '11354', 'USA', 40.728224, -73.794852, '2023-03-01 11:20:00'),

    -- California Locations
    (uuid_generate_v4(), '101 Beachfront Dr', NULL, 'Los Angeles', 'CA', '90291', 'USA', 34.052235, -118.243683, '2023-03-05 16:45:00'),
    (uuid_generate_v4(), '234 Hollywood Hills', 'Villa 12', 'Los Angeles', 'CA', '90068', 'USA', 34.134117, -118.321495, '2023-03-10 08:00:00'),
    (uuid_generate_v4(), '567 Mountain View', NULL, 'San Francisco', 'CA', '94102', 'USA', 37.774929, -122.419416, '2023-03-12 12:30:00'),

    -- Other Locations
    (uuid_generate_v4(), '890 Lakefront Cottages', 'Cabin 5', 'Lake Tahoe', 'CA', '96150', 'USA', 39.096849, -120.032349, '2023-03-15 15:20:00'),
    (uuid_generate_v4(), '321 Downtown Loft', NULL, 'Chicago', 'IL', '60601', 'USA', 41.878113, -87.629799, '2023-03-18 09:45:00'),
    (uuid_generate_v4(), '654 Seaside Villa', NULL, 'Miami', 'FL', '33139', 'USA', 25.761681, -80.191788, '2023-03-20 17:10:00');

    -- =====================================================
    -- 6. GET PROPERTY TYPE IDs FOR RELATIONSHIPS
    -- =====================================================
    DECLARE
        apartment_type_id UUID;
        house_type_id UUID;
        villa_type_id UUID;
        condo_type_id UUID;
        studio_type_id UUID;
        cabin_type_id UUID;
        loft_type_id UUID;
    BEGIN
        SELECT property_type_id INTO apartment_type_id FROM Property_Type WHERE type_name = 'Apartment';
        SELECT property_type_id INTO house_type_id FROM Property_Type WHERE type_name = 'House';
        SELECT property_type_id INTO villa_type_id FROM Property_Type WHERE type_name = 'Villa';
        SELECT property_type_id INTO condo_type_id FROM Property_Type WHERE type_name = 'Condo';
        SELECT property_type_id INTO studio_type_id FROM Property_Type WHERE type_name = 'Studio';
        SELECT property_type_id INTO cabin_type_id FROM Property_Type WHERE type_name = 'Cabin';
        SELECT property_type_id INTO loft_type_id FROM Property_Type WHERE type_name = 'Loft';

        -- =====================================================
        -- 7. GET LOCATION IDs FOR RELATIONSHIPS
        -- =====================================================
        DECLARE
            manhattan_loc_id UUID;
            brooklyn_loc_id UUID;
            queens_loc_id UUID;
            la_beach_loc_id UUID;
            hollywood_loc_id UUID;
            sf_loc_id UUID;
            tahoe_loc_id UUID;
            chicago_loc_id UUID;
            miami_loc_id UUID;
        BEGIN
            SELECT location_id INTO manhattan_loc_id FROM Location WHERE address_line1 = '123 Manhattan Ave';
            SELECT location_id INTO brooklyn_loc_id FROM Location WHERE address_line1 = '456 Brooklyn St';
            SELECT location_id INTO queens_loc_id FROM Location WHERE address_line1 = '789 Queens Blvd';
            SELECT location_id INTO la_beach_loc_id FROM Location WHERE address_line1 = '101 Beachfront Dr';
            SELECT location_id INTO hollywood_loc_id FROM Location WHERE address_line1 = '234 Hollywood Hills';
            SELECT location_id INTO sf_loc_id FROM Location WHERE address_line1 = '567 Mountain View';
            SELECT location_id INTO tahoe_loc_id FROM Location WHERE address_line1 = '890 Lakefront Cottages';
            SELECT location_id INTO chicago_loc_id FROM Location WHERE address_line1 = '321 Downtown Loft';
            SELECT location_id INTO miami_loc_id FROM Location WHERE address_line1 = '654 Seaside Villa';

            -- =====================================================
            -- 8. INSERT PROPERTIES
            -- =====================================================
            INSERT INTO Property (property_id, host_id, location_id, property_type_id, name, description, base_price_per_night, max_guests, bedrooms, bathrooms, is_active, created_at, updated_at) VALUES
            -- Sarah Johnson's Properties
            (uuid_generate_v4(), sarah_id, manhattan_loc_id, apartment_type_id, 'Cozy Manhattan Apartment', 'Beautiful apartment in the heart of Manhattan with stunning city views and modern amenities.', 150.00, 4, 2, 1, true, '2023-02-15 09:00:00', '2023-02-15 09:00:00'),
            (uuid_generate_v4(), sarah_id, brooklyn_loc_id, house_type_id, 'Charming Brooklyn House', 'Spacious family home in trendy Brooklyn neighborhood with garden and modern kitchen.', 200.00, 6, 3, 2, true, '2023-02-20 14:30:00', '2023-02-20 14:30:00'),

            -- Mike Chen's Properties
            (uuid_generate_v4(), mike_id, queens_loc_id, condo_type_id, 'Modern Queens Condo', 'Luxury condo with panoramic views, gym access, and concierge service.', 180.00, 4, 2, 2, true, '2023-03-05 11:00:00', '2023-03-05 11:00:00'),
            (uuid_generate_v4(), mike_id, la_beach_loc_id, villa_type_id, 'Beachfront Villa', 'Stunning beachfront property with private pool and direct beach access.', 450.00, 8, 4, 3, true, '2023-03-10 16:45:00', '2023-03-10 16:45:00'),

            -- Emily Davis's Properties
            (uuid_generate_v4(), emily_id, hollywood_loc_id, house_type_id, 'Hollywood Hills Retreat', 'Private home with panoramic city views, pool, and outdoor entertainment area.', 350.00, 6, 3, 2, true, '2023-03-12 10:20:00', '2023-03-12 10:20:00'),
            (uuid_generate_v4(), emily_id, sf_loc_id, apartment_type_id, 'San Francisco Downtown Loft', 'Industrial-style loft in downtown SF with exposed brick and high ceilings.', 220.00, 3, 1, 1, true, '2023-03-18 13:15:00', '2023-03-18 13:15:00'),

            -- David Wilson's Properties
            (uuid_generate_v4(), david_id, tahoe_loc_id, cabin_type_id, 'Lake Tahoe Cabin', 'Rustic cabin with modern amenities, fireplace, and lake access.', 175.00, 5, 2, 1, true, '2023-03-20 09:30:00', '2023-03-20 09:30:00'),
            (uuid_generate_v4(), david_id, chicago_loc_id, loft_type_id, 'Chicago Downtown Loft', 'Spacious loft in the heart of Chicago with skyline views.', 190.00, 4, 1, 1, true, '2023-03-25 15:40:00', '2023-03-25 15:40:00'),
            (uuid_generate_v4(), david_id, miami_loc_id, villa_type_id, 'Miami Beach Villa', 'Luxury villa with private pool, tropical garden, and beachfront location.', 500.00, 10, 5, 4, true, '2023-04-01 12:00:00', '2023-04-01 12:00:00');

            -- =====================================================
            -- 9. GET PROPERTY IDs FOR RELATIONSHIPS
            -- =====================================================
            DECLARE
                manhattan_apt_id UUID;
                brooklyn_house_id UUID;
                queens_condo_id UUID;
                beach_villa_id UUID;
                hollywood_house_id UUID;
                sf_loft_id UUID;
                tahoe_cabin_id UUID;
                chicago_loft_id UUID;
                miami_villa_id UUID;
            BEGIN
                SELECT property_id INTO manhattan_apt_id FROM Property WHERE name = 'Cozy Manhattan Apartment';
                SELECT property_id INTO brooklyn_house_id FROM Property WHERE name = 'Charming Brooklyn House';
                SELECT property_id INTO queens_condo_id FROM Property WHERE name = 'Modern Queens Condo';
                SELECT property_id INTO beach_villa_id FROM Property WHERE name = 'Beachfront Villa';
                SELECT property_id INTO hollywood_house_id FROM Property WHERE name = 'Hollywood Hills Retreat';
                SELECT property_id INTO sf_loft_id FROM Property WHERE name = 'San Francisco Downtown Loft';
                SELECT property_id INTO tahoe_cabin_id FROM Property WHERE name = 'Lake Tahoe Cabin';
                SELECT property_id INTO chicago_loft_id FROM Property WHERE name = 'Chicago Downtown Loft';
                SELECT property_id INTO miami_villa_id FROM Property WHERE name = 'Miami Beach Villa';

                -- =====================================================
                -- 10. INSERT BOOKINGS
                -- =====================================================
                INSERT INTO Booking (booking_id, property_id, user_id, status_code, start_date, end_date, number_of_guests, base_total, service_fee, tax_amount, total_price, created_at, updated_at) VALUES
                -- Lisa Brown's Bookings
                (uuid_generate_v4(), manhattan_apt_id, lisa_id, 'completed', '2023-04-01', '2023-04-05', 2, 600.00, 60.00, 54.00, 714.00, '2023-03-15 14:20:00', '2023-04-05 11:00:00'),
                (uuid_generate_v4(), beach_villa_id, lisa_id, 'confirmed', '2023-06-10', '2023-06-17', 4, 3150.00, 315.00, 283.50, 3748.50, '2023-05-01 09:15:00', '2023-05-01 09:15:00'),

                -- James Miller's Bookings
                (uuid_generate_v4(), hollywood_house_id, james_id, 'completed', '2023-04-15', '2023-04-20', 3, 1750.00, 175.00, 157.50, 2082.50, '2023-03-20 16:30:00', '2023-04-20 10:00:00'),
                (uuid_generate_v4(), tahoe_cabin_id, james_id, 'pending', '2023-07-01', '2023-07-07', 4, 1050.00, 105.00, 94.50, 1249.50, '2023-06-15 11:45:00', '2023-06-15 11:45:00'),

                -- Maria Garcia's Bookings
                (uuid_generate_v4(), queens_condo_id, maria_id, 'completed', '2023-05-05', '2023-05-08', 2, 540.00, 54.00, 48.60, 642.60, '2023-04-10 13:20:00', '2023-05-08 12:00:00'),
                (uuid_generate_v4(), brooklyn_house_id, maria_id, 'confirmed', '2023-08-12', '2023-08-19', 5, 1400.00, 140.00, 126.00, 1666.00, '2023-07-01 10:30:00', '2023-07-01 10:30:00'),

                -- Robert Taylor's Bookings
                (uuid_generate_v4(), sf_loft_id, robert_id, 'completed', '2023-05-20', '2023-05-25', 2, 1100.00, 110.00, 99.00, 1309.00, '2023-04-25 15:40:00', '2023-05-25 09:00:00'),
                (uuid_generate_v4(), chicago_loft_id, robert_id, 'canceled', '2023-06-15', '2023-06-18', 3, 570.00, 57.00, 51.30, 678.30, '2023-05-20 14:15:00', '2023-05-25 16:20:00'),
                (uuid_generate_v4(), queens_condo_id, robert_id, 'completed', '2023-07-06', '2023-07-10', 2, 540.00, 54.00, 48.60, 642.60, '2023-07-01 13:20:00', '2023-07-08 12:00:00'),


                -- Jennifer Lee's Bookings
                (uuid_generate_v4(), miami_villa_id, jennifer_id, 'confirmed', '2023-09-01', '2023-09-10', 8, 4500.00, 450.00, 405.00, 5355.00, '2023-07-10 12:00:00', '2023-07-10 12:00:00');

                -- =====================================================
                -- 11. GET BOOKING IDs FOR RELATIONSHIPS
                -- =====================================================
                DECLARE
                    lisa_manhattan_booking_id UUID;
                    lisa_villa_booking_id UUID;
                    james_hollywood_booking_id UUID;
                    james_tahoe_booking_id UUID;
                    maria_queens_booking_id UUID;
                    maria_brooklyn_booking_id UUID;
                    robert_sf_booking_id UUID;
                    robert_chicago_booking_id UUID;
                    jennifer_miami_booking_id UUID;
                BEGIN
                    SELECT booking_id INTO lisa_manhattan_booking_id FROM Booking WHERE property_id = manhattan_apt_id AND user_id = lisa_id;
                    SELECT booking_id INTO lisa_villa_booking_id FROM Booking WHERE property_id = beach_villa_id AND user_id = lisa_id;
                    SELECT booking_id INTO james_hollywood_booking_id FROM Booking WHERE property_id = hollywood_house_id AND user_id = james_id;
                    SELECT booking_id INTO james_tahoe_booking_id FROM Booking WHERE property_id = tahoe_cabin_id AND user_id = james_id;
                    SELECT booking_id INTO maria_queens_booking_id FROM Booking WHERE property_id = queens_condo_id AND user_id = maria_id;
                    SELECT booking_id INTO maria_brooklyn_booking_id FROM Booking WHERE property_id = brooklyn_house_id AND user_id = maria_id;
                    SELECT booking_id INTO robert_sf_booking_id FROM Booking WHERE property_id = sf_loft_id AND user_id = robert_id;
                    SELECT booking_id INTO robert_chicago_booking_id FROM Booking WHERE property_id = chicago_loft_id AND user_id = robert_id;
                    SELECT booking_id INTO jennifer_miami_booking_id FROM Booking WHERE property_id = miami_villa_id AND user_id = jennifer_id;

                    -- =====================================================
                    -- 12. INSERT PAYMENTS
                    -- =====================================================
                    INSERT INTO Payment (payment_id, booking_id, method_code, status_code, amount, currency, transaction_id, payment_date, created_at, updated_at) VALUES
                    -- Lisa Brown's Payments
                    (uuid_generate_v4(), lisa_manhattan_booking_id, 'credit_card', 'completed', 714.00, 'USD', 'txn_001_LB_Manhattan', '2023-03-15 14:25:00', '2023-03-15 14:25:00', '2023-03-15 14:25:00'),
                    (uuid_generate_v4(), lisa_villa_booking_id, 'paypal', 'completed', 3748.50, 'USD', 'txn_002_LB_Villa', '2023-05-01 09:20:00', '2023-05-01 09:20:00', '2023-05-01 09:20:00'),

                    -- James Miller's Payments
                    (uuid_generate_v4(), james_hollywood_booking_id, 'stripe', 'completed', 2082.50, 'USD', 'txn_003_JM_Hollywood', '2023-03-20 16:35:00', '2023-03-20 16:35:00', '2023-03-20 16:35:00'),
                    (uuid_generate_v4(), james_tahoe_booking_id, 'credit_card', 'pending', 1249.50, 'USD', NULL, NULL, '2023-06-15 11:50:00', '2023-06-15 11:50:00'),

                    -- Maria Garcia's Payments
                    (uuid_generate_v4(), maria_queens_booking_id, 'credit_card', 'completed', 642.60, 'USD', 'txn_004_MG_Condo', '2023-04-10 13:25:00', '2023-04-10 13:25:00', '2023-04-10 13:25:00'),
                    (uuid_generate_v4(), maria_brooklyn_booking_id, 'bank_transfer', 'processing', 1666.00, 'USD', 'txn_005_MG_Brooklyn', '2023-07-01 10:35:00', '2023-07-01 10:35:00', '2023-07-01 10:35:00'),

                    -- Robert Taylor's Payments
                    (uuid_generate_v4(), robert_sf_booking_id, 'stripe', 'completed', 1309.00, 'USD', 'txn_006_RT_SF_Loft', '2023-04-25 15:45:00', '2023-04-25 15:45:00', '2023-04-25 15:45:00'),
                    (uuid_generate_v4(), robert_chicago_booking_id, 'credit_card', 'refunded', 678.30, 'USD', 'txn_007_RT_Chicago', '2023-05-20 14:20:00', '2023-05-20 14:20:00', '2023-05-25 16:25:00'),

                    -- Jennifer Lee's Payments
                    (uuid_generate_v4(), jennifer_miami_booking_id, 'credit_card', 'completed', 5355.00, 'USD', 'txn_008_JL_Miami', '2023-07-10 12:05:00', '2023-07-10 12:05:00', '2023-07-10 12:05:00');

                    -- =====================================================
                    -- 13. INSERT REVIEWS
                    -- =====================================================
                    INSERT INTO Review (review_id, property_id, user_id, booking_id, rating, title, comment, is_verified, created_at, updated_at) VALUES
                    -- Reviews for Manhattan Apartment
                    (uuid_generate_v4(), manhattan_apt_id, lisa_id, lisa_manhattan_booking_id, 5, 'Perfect City Getaway!', 'Amazing apartment with stunning views. The location was perfect and the host was very responsive. Would definitely stay again!', true, '2023-04-06 10:00:00', '2023-04-06 10:00:00'),

                    -- Reviews for Hollywood Hills Retreat
                    (uuid_generate_v4(), hollywood_house_id, james_id, james_hollywood_booking_id, 4, 'Beautiful Views', 'The house had incredible views of the city. The pool was fantastic. Only minor issue was the parking, but overall great stay.', true, '2023-04-21 14:30:00', '2023-04-21 14:30:00'),

                    -- Reviews for Queens Condo
                    (uuid_generate_v4(), queens_condo_id, maria_id, maria_queens_booking_id, 5, 'Modern and Clean', 'Very modern condo with all the amenities we needed. Great location near public transportation. Host was very helpful!', true, '2023-05-09 09:15:00', '2023-05-09 09:15:00'),

                    -- Reviews for San Francisco Loft
                    (uuid_generate_v4(), sf_loft_id, robert_id, robert_sf_booking_id, 4, 'Great Downtown Location', 'Loved the industrial style of the loft. Perfect location for exploring SF. The space was smaller than expected but comfortable.', true, '2023-05-26 16:45:00', '2023-05-26 16:45:00');

                    -- =====================================================
                    -- 14. INSERT MESSAGES
                    -- =====================================================
                    INSERT INTO Message (message_id, sender_id, recipient_id, message_body, is_read, sent_at) VALUES
                    -- Messages between Lisa Brown and Sarah Johnson
                    (uuid_generate_v4(), lisa_id, sarah_id, 'Hi Sarah, I''m interested in your Manhattan apartment. Is it available for April 1-5?', true, '2023-03-10 09:30:00'),
                    (uuid_generate_v4(), sarah_id, lisa_id, 'Hi Lisa! Yes, those dates are available. The apartment would be perfect for your stay.', true, '2023-03-10 10:15:00'),

                    -- Messages between James Miller and Emily Davis
                    (uuid_generate_v4(), james_id, emily_id, 'Hello Emily, is there parking available at your Hollywood Hills property?', true, '2023-03-18 14:20:00'),
                    (uuid_generate_v4(), emily_id, james_id, 'Hi James! Yes, there is one dedicated parking spot included with the rental.', true, '2023-03-18 15:05:00'),

                    -- Messages between Maria Garcia and Mike Chen
                    (uuid_generate_v4(), maria_id, mike_id, 'Hi Mike, what''s the check-in process for your Queens condo?', true, '2023-04-05 11:30:00'),
                    (uuid_generate_v4(), mike_id, maria_id, 'Hello Maria! I use a smart lock system. I''ll send you the code 24 hours before check-in.', true, '2023-04-05 12:15:00'),

                    -- Messages between Robert Taylor and David Wilson
                    (uuid_generate_v4(), robert_id, david_id, 'Hi David, is your Lake Tahoe cabin pet-friendly?', false, '2023-06-12 16:40:00');

                END;
            END;
        END;
    END;
END $$;

-- =====================================================
-- 15. VERIFICATION QUERIES
-- =====================================================

-- Display sample data counts
SELECT 
    (SELECT COUNT(*) FROM "User") as total_users,
    (SELECT COUNT(*) FROM Property) as total_properties,
    (SELECT COUNT(*) FROM Booking) as total_bookings,
    (SELECT COUNT(*) FROM Payment) as total_payments,
    (SELECT COUNT(*) FROM Review) as total_reviews,
    (SELECT COUNT(*) FROM Message) as total_messages;

-- Display users by role
SELECT role, COUNT(*) as count 
FROM "User" 
GROUP BY role 
ORDER BY count DESC;

-- Display bookings by status
SELECT status_code, COUNT(*) as count 
FROM Booking 
GROUP BY status_code 
ORDER BY count DESC;

-- Display average property ratings
SELECT p.name, ROUND(AVG(r.rating), 2) as avg_rating, COUNT(r.review_id) as review_count
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
ORDER BY avg_rating DESC NULLS LAST;

-- Display revenue by property
SELECT p.name, SUM(b.total_price) as total_revenue, COUNT(b.booking_id) as booking_count
FROM Property p
JOIN Booking b ON p.property_id = b.property_id
WHERE b.status_code IN ('completed', 'confirmed')
GROUP BY p.property_id, p.name
ORDER BY total_revenue DESC;