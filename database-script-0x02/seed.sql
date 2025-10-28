-- =====================================================
-- INSERT SAMPLE DATA
-- =====================================================

-- Insert Users (guests, hosts, and admin)
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Hosts
('a1b2c3d4-1234-5678-9abc-123456789001', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2b$10$examplehash1', '+1-555-0101', 'host', '2023-01-15 10:00:00'),
('a1b2c3d4-1234-5678-9abc-123456789002', 'Mike', 'Chen', 'mike.chen@email.com', '$2b$10$examplehash2', '+1-555-0102', 'host', '2023-02-20 11:30:00'),
('a1b2c3d4-1234-5678-9abc-123456789003', 'Emily', 'Rodriguez', 'emily.rodriguez@email.com', '$2b$10$examplehash3', '+1-555-0103', 'host', '2023-03-10 09:15:00'),

-- Guests
('a1b2c3d4-1234-5678-9abc-123456789004', 'David', 'Wilson', 'david.wilson@email.com', '$2b$10$examplehash4', '+1-555-0104', 'guest', '2023-04-05 14:20:00'),
('a1b2c3d4-1234-5678-9abc-123456789005', 'Lisa', 'Thompson', 'lisa.thompson@email.com', '$2b$10$examplehash5', '+1-555-0105', 'guest', '2023-04-12 16:45:00'),
('a1b2c3d4-1234-5678-9abc-123456789006', 'James', 'Brown', 'james.brown@email.com', '$2b$10$examplehash6', '+1-555-0106', 'guest', '2023-05-01 08:30:00'),
('a1b2c3d4-1234-5678-9abc-123456789007', 'Maria', 'Garcia', 'maria.garcia@email.com', '$2b$10$examplehash7', '+1-555-0107', 'guest', '2023-05-15 12:00:00'),

-- Admin
('a1b2c3d4-1234-5678-9abc-123456789008', 'Admin', 'User', 'admin@vacationrentals.com', '$2b$10$adminhash123', '+1-555-0000', 'admin', '2023-01-01 00:00:00');

-- Insert Property Types
INSERT INTO PropertyType (type_id, type_name, description) VALUES
('b1b2c3d4-1234-5678-9abc-123456789011', 'Apartment', 'Self-contained housing unit in a building'),
('b1b2c3d4-1234-5678-9abc-123456789012', 'House', 'Standalone residential building'),
('b1b2c3d4-1234-5678-9abc-123456789013', 'Villa', 'Luxury vacation home with amenities'),
('b1b2c3d4-1234-5678-9abc-123456789014', 'Cabin', 'Wooden house in natural surroundings'),
('b1b2c3d4-1234-5678-9abc-123456789015', 'Beach House', 'Property located directly on the beach');

-- Insert Addresses
INSERT INTO Address (address_id, street_address, city, state_province, postal_code, country, latitude, longitude) VALUES
-- For Sarah's properties
('c1b2c3d4-1234-5678-9abc-123456789021', '123 Ocean View Drive', 'Miami Beach', 'FL', '33139', 'USA', 25.7617, -80.1918),
('c1b2c3d4-1234-5678-9abc-123456789022', '456 Mountain Trail', 'Aspen', 'CO', '81611', 'USA', 39.1911, -106.8175),

-- For Mike's properties
('c1b2c3d4-1234-5678-9abc-123456789023', '789 Downtown Street', 'New York', 'NY', '10001', 'USA', 40.7128, -74.0060),
('c1b2c3d4-1234-5678-9abc-123456789024', '321 Lakeside Road', 'Lake Tahoe', 'CA', '96150', 'USA', 39.0968, -120.0324),

-- For Emily's properties
('c1b2c3d4-1234-5678-9abc-123456789025', '654 Desert Oasis Lane', 'Scottsdale', 'AZ', '85251', 'USA', 33.4942, -111.9261),
('c1b2c3d4-1234-5678-9abc-123456789026', '987 Forest Retreat', 'Portland', 'OR', '97205', 'USA', 45.5231, -122.6765);

-- Insert Amenities
INSERT INTO Amenity (amenity_id, amenity_name, category) VALUES
('d1b2c3d4-1234-5678-9abc-123456789031', 'WiFi', 'Internet'),
('d1b2c3d4-1234-5678-9abc-123456789032', 'Air Conditioning', 'Comfort'),
('d1b2c3d4-1234-5678-9abc-123456789033', 'Heating', 'Comfort'),
('d1b2c3d4-1234-5678-9abc-123456789034', 'Kitchen', 'Facilities'),
('d1b2c3d4-1234-5678-9abc-123456789035', 'Swimming Pool', 'Recreation'),
('d1b2c3d4-1234-5678-9abc-123456789036', 'Hot Tub', 'Recreation'),
('d1b2c3d4-1234-5678-9abc-123456789037', 'Free Parking', 'Parking'),
('d1b2c3d4-1234-5678-9abc-123456789038', 'Beach Access', 'Location'),
('d1b2c3d4-1234-5678-9abc-123456789039', 'Mountain View', 'Location'),
('d1b2c3d4-1234-5678-9abc-123456789040', 'Pet Friendly', 'Policies'),
('d1b2c3d4-1234-5678-9abc-123456789041', 'Washer/Dryer', 'Laundry'),
('d1b2c3d4-1234-5678-9abc-123456789042', 'Fireplace', 'Comfort');

-- Insert Properties
INSERT INTO Property (property_id, host_id, address_id, type_id, name, description, price_per_night, max_guests, bedrooms, bathrooms, created_at, updated_at) VALUES
-- Sarah's properties
('e1b2c3d4-1234-5678-9abc-123456789051', 'a1b2c3d4-1234-5678-9abc-123456789001', 'c1b2c3d4-1234-5678-9abc-123456789021', 'b1b2c3d4-1234-5678-9abc-123456789015', 
 'Beachfront Paradise', 'Stunning beachfront apartment with panoramic ocean views and direct beach access. Perfect for romantic getaways or family vacations.', 
 250.00, 6, 3, 2, '2023-02-01 09:00:00', '2023-06-15 14:30:00'),

('e1b2c3d4-1234-5678-9abc-123456789052', 'a1b2c3d4-1234-5678-9abc-123456789001', 'c1b2c3d4-1234-5678-9abc-123456789022', 'b1b2c3d4-1234-5678-9abc-123456789014', 
 'Cozy Mountain Cabin', 'Rustic cabin nestled in the mountains with breathtaking views. Perfect for skiing in winter and hiking in summer.', 
 180.00, 4, 2, 1, '2023-02-15 10:30:00', '2023-07-20 11:15:00'),

-- Mike's properties
('e1b2c3d4-1234-5678-9abc-123456789053', 'a1b2c3d4-1234-5678-9abc-123456789002', 'c1b2c3d4-1234-5678-9abc-123456789023', 'b1b2c3d4-1234-5678-9abc-123456789011', 
 'Modern Downtown Loft', 'Stylish loft in the heart of Manhattan. Walking distance to major attractions, restaurants, and shopping districts.', 
 350.00, 2, 1, 1, '2023-03-01 08:45:00', '2023-08-10 16:20:00'),

('e1b2c3d4-1234-5678-9abc-123456789054', 'a1b2c3d4-1234-5678-9abc-123456789002', 'c1b2c3d4-1234-5678-9abc-123456789024', 'b1b2c3d4-1234-5678-9abc-123456789013', 
 'Luxury Lakefront Villa', 'Exclusive villa with private beach on Lake Tahoe. Features hot tub, gourmet kitchen, and stunning lake views.', 
 500.00, 8, 4, 3, '2023-03-10 14:20:00', '2023-09-05 09:45:00'),

-- Emily's properties
('e1b2c3d4-1234-5678-9abc-123456789055', 'a1b2c3d4-1234-5678-9abc-123456789003', 'c1b2c3d4-1234-5678-9abc-123456789025', 'b1b2c3d4-1234-5678-9abc-123456789012', 
 'Desret Oasis Retreat', 'Spacious desert home with private pool and mountain views. Perfect for relaxing and enjoying the Arizona sun.', 
 220.00, 6, 3, 2, '2023-03-20 11:10:00', '2023-10-12 13:25:00'),

('e1b2c3d4-1234-5678-9abc-123456789056', 'a1b2c3d4-1234-5678-9abc-123456789003', 'c1b2c3d4-1234-5678-9abc-123456789026', 'b1b2c3d4-1234-5678-9abc-123456789012', 
 'Forest Haven Cottage', 'Charming cottage surrounded by ancient forests. Peaceful retreat with modern amenities and nature at your doorstep.', 
 160.00, 4, 2, 1, '2023-04-05 15:40:00', '2023-11-18 10:30:00');

-- Insert Property Amenities (Many-to-Many relationships)
INSERT INTO PropertyAmenity (property_id, amenity_id) VALUES
-- Beachfront Paradise amenities
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789032'), -- AC
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789035'), -- Pool
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789038'), -- Beach Access
('e1b2c3d4-1234-5678-9abc-123456789051', 'd1b2c3d4-1234-5678-9abc-123456789041'), -- Washer/Dryer

-- Cozy Mountain Cabin amenities
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789033'), -- Heating
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789036'), -- Hot Tub
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789039'), -- Mountain View
('e1b2c3d4-1234-5678-9abc-123456789052', 'd1b2c3d4-1234-5678-9abc-123456789042'), -- Fireplace

-- Modern Downtown Loft amenities
('e1b2c3d4-1234-5678-9abc-123456789053', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789053', 'd1b2c3d4-1234-5678-9abc-123456789032'), -- AC
('e1b2c3d4-1234-5678-9abc-123456789053', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen

-- Luxury Lakefront Villa amenities
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789032'), -- AC
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789035'), -- Pool
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789036'), -- Hot Tub
('e1b2c3d4-1234-5678-9abc-123456789054', 'd1b2c3d4-1234-5678-9abc-123456789041'), -- Washer/Dryer

-- Desert Oasis Retreat amenities
('e1b2c3d4-1234-5678-9abc-123456789055', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789055', 'd1b2c3d4-1234-5678-9abc-123456789032'), -- AC
('e1b2c3d4-1234-5678-9abc-123456789055', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen
('e1b2c3d4-1234-5678-9abc-123456789055', 'd1b2c3d4-1234-5678-9abc-123456789035'), -- Pool
('e1b2c3d4-1234-5678-9abc-123456789055', 'd1b2c3d4-1234-5678-9abc-123456789039'), -- Mountain View

-- Forest Haven Cottage amenities
('e1b2c3d4-1234-5678-9abc-123456789056', 'd1b2c3d4-1234-5678-9abc-123456789031'), -- WiFi
('e1b2c3d4-1234-5678-9abc-123456789056', 'd1b2c3d4-1234-5678-9abc-123456789033'), -- Heating
('e1b2c3d4-1234-5678-9abc-123456789056', 'd1b2c3d4-1234-5678-9abc-123456789034'), -- Kitchen
('e1b2c3d4-1234-5678-9abc-123456789056', 'd1b2c3d4-1234-5678-9abc-123456789039'), -- Mountain View
('e1b2c3d4-1234-5678-9abc-123456789056', 'd1b2c3d4-1234-5678-9abc-123456789042'); -- Fireplace

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
-- Completed bookings with reviews
('f1b2c3d4-1234-5678-9abc-123456789061', 'e1b2c3d4-1234-5678-9abc-123456789051', 'a1b2c3d4-1234-5678-9abc-123456789004', '2023-06-01', '2023-06-07', 'completed', '2023-05-15 14:30:00'),
('f1b2c3d4-1234-5678-9abc-123456789062', 'e1b2c3d4-1234-5678-9abc-123456789053', 'a1b2c3d4-1234-5678-9abc-123456789005', '2023-07-10', '2023-07-15', 'completed', '2023-06-20 09:15:00'),
('f1b2c3d4-1234-5678-9abc-123456789063', 'e1b2c3d4-1234-5678-9abc-123456789055', 'a1b2c3d4-1234-5678-9abc-123456789006', '2023-08-05', '2023-08-12', 'completed', '2023-07-10 16:45:00'),

-- Upcoming confirmed bookings
('f1b2c3d4-1234-5678-9abc-123456789064', 'e1b2c3d4-1234-5678-9abc-123456789052', 'a1b2c3d4-1234-5678-9abc-123456789007', '2023-12-20', '2023-12-27', 'confirmed', '2023-11-01 11:20:00'),
('f1b2c3d4-1234-5678-9abc-123456789065', 'e1b2c3d4-1234-5678-9abc-123456789054', 'a1b2c3d4-1234-5678-9abc-123456789004', '2024-01-15', '2024-01-22', 'confirmed', '2023-11-15 13:40:00'),

-- Pending bookings
('f1b2c3d4-1234-5678-9abc-123456789066', 'e1b2c3d4-1234-5678-9abc-123456789056', 'a1b2c3d4-1234-5678-9abc-123456789005', '2024-02-10', '2024-02-14', 'pending', '2023-11-20 10:10:00'),

-- Canceled booking
('f1b2c3d4-1234-5678-9abc-123456789067', 'e1b2c3d4-1234-5678-9abc-123456789051', 'a1b2c3d4-1234-5678-9abc-123456789006', '2023-09-01', '2023-09-05', 'canceled', '2023-08-15 15:30:00');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method, status, transaction_id) VALUES
-- Completed payments
('g1b2c3d4-1234-5678-9abc-123456789071', 'f1b2c3d4-1234-5678-9abc-123456789061', 1500.00, '2023-05-16 10:30:00', 'credit_card', 'completed', 'txn_7a8b9c0d123456'),
('g1b2c3d4-1234-5678-9abc-123456789072', 'f1b2c3d4-1234-5678-9abc-123456789062', 1750.00, '2023-06-21 14:15:00', 'paypal', 'completed', 'txn_7a8b9c0d123457'),
('g1b2c3d4-1234-5678-9abc-123456789073', 'f1b2c3d4-1234-5678-9abc-123456789063', 1540.00, '2023-07-11 09:45:00', 'stripe', 'completed', 'txn_7a8b9c0d123458'),

-- Pending payment
('g1b2c3d4-1234-5678-9abc-123456789074', 'f1b2c3d4-1234-5678-9abc-123456789066', 640.00, '2023-11-21 11:30:00', 'credit_card', 'pending', 'txn_7a8b9c0d123459'),

-- Refunded payment (for canceled booking)
('g1b2c3d4-1234-5678-9abc-123456789075', 'f1b2c3d4-1234-5678-9abc-123456789067', 1000.00, '2023-08-16 08:20:00', 'credit_card', 'refunded', 'txn_7a8b9c0d123460');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, booking_id, rating, comment, created_at) VALUES
-- Reviews for completed bookings
('h1b2c3d4-1234-5678-9abc-123456789081', 'e1b2c3d4-1234-5678-9abc-123456789051', 'a1b2c3d4-1234-5678-9abc-123456789004', 'f1b2c3d4-1234-5678-9abc-123456789061', 5, 
 'Absolutely stunning property! The beach access was incredible and the views were even better than the photos. Sarah was a wonderful host.', '2023-06-08 12:00:00'),

('h1b2c3d4-1234-5678-9abc-123456789082', 'e1b2c3d4-1234-5678-9abc-123456789053', 'a1b2c3d4-1234-5678-9abc-123456789005', 'f1b2c3d4-1234-5678-9abc-123456789062', 4, 
 'Great location and very stylish apartment. Perfect for our NYC getaway. The only minor issue was street noise at night.', '2023-07-16 14:30:00'),

('h1b2c3d4-1234-5678-9abc-123456789083', 'e1b2c3d4-1234-5678-9abc-123456789055', 'a1b2c3d4-1234-5678-9abc-123456789006', 'f1b2c3d4-1234-5678-9abc-123456789063', 5, 
 'Paradise in the desert! The pool was amazing and the house had everything we needed. Emily was very responsive and helpful.', '2023-08-13 10:15:00');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
-- Guest to Host messages
('i1b2c3d4-1234-5678-9abc-123456789091', 'a1b2c3d4-1234-5678-9abc-123456789004', 'a1b2c3d4-1234-5678-9abc-123456789001', 
 'Hi Sarah, I''m interested in your beachfront property. Is the pool heated year-round?', '2023-05-10 09:30:00'),

('i1b2c3d4-1234-5678-9abc-123456789092', 'a1b2c3d4-1234-5678-9abc-123456789001', 'a1b2c3d4-1234-5678-9abc-123456789004', 
 'Hello David! Yes, the pool is heated and maintained at 82°F throughout the year. Let me know if you have any other questions!', '2023-05-10 10:15:00'),

-- Host to Guest messages
('i1b2c3d4-1234-5678-9abc-123456789093', 'a1b2c3d4-1234-5678-9abc-123456789002', 'a1b2c3d4-1234-5678-9abc-123456789005', 
 'Hi Lisa, just wanted to confirm your check-in time for next week. Do you need any local restaurant recommendations?', '2023-07-05 16:20:00'),

('i1b2c3d4-1234-5678-9abc-123456789094', 'a1b2c3d4-1234-5678-9abc-123456789005', 'a1b2c3d4-1234-5678-9abc-123456789002', 
 'Hi Mike! We should arrive around 3 PM. Restaurant recommendations would be wonderful, thank you!', '2023-07-05 17:05:00'),

-- Guest to Guest messages
('i1b2c3d4-1234-5678-9abc-123456789095', 'a1b2c3d4-1234-5678-9abc-123456789006', 'a1b2c3d4-1234-5678-9abc-123456789007', 
 'Hey Maria, we stayed at Emily''s desert property last month - you''ll love it! The pool is amazing.', '2023-09-01 11:40:00');