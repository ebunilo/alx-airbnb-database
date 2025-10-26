INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-guest-001', 'Alice', 'Wonderland', 'alice@example.com', 'hashed_pw1', '251900000001', 'guest'),
('uuid-host-001', 'Bob', 'Builder', 'bob@example.com', 'hashed_pw2', '251900000002', 'host'),
('uuid-admin-001', 'Clara', 'Oswald', 'clara@example.com', 'hashed_pw3', '251900000003', 'admin'),
('uuid-guest-002', 'Diana', 'Prince', 'diana@example.com', 'hashed_pw4', '251900000004', 'guest'),
('uuid-host-002', 'Ethan', 'Hunt', 'ethan@example.com', 'hashed_pw5', '251900000005', 'host'),
('uuid-guest-003', 'Gwen', 'Stacy', 'gwen@example.com', 'hashed_pw6', '251900000006', 'guest');

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
('prop-001', 'uuid-host-001', 'Sunny Apartment', 'A bright and spacious apartment in the city center.', 'Addis Ababa', 75.00),
('prop-002', 'uuid-host-001', 'Cozy Cottage', 'Quiet and cozy cottage for a weekend getaway.', 'Bahir Dar', 50.00),
('prop-003', 'uuid-host-002', 'Mountain Retreat', 'Peaceful retreat in the Simien Mountains.', 'Gondar', 60.00),
('prop-004', 'uuid-host-002', 'Lake View Villa', 'Beautiful villa with lake view.', 'Hawassa', 90.00),
('prop-005', 'uuid-host-002', 'City Loft', 'Modern loft perfect for business trips.', 'Adama', 65.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('book-001', 'prop-001', 'uuid-guest-001', '2025-06-01', '2025-06-05', 300.00, 'confirmed'),
('book-002', 'prop-002', 'uuid-guest-001', '2025-07-10', '2025-07-12', 100.00, 'pending'),
('book-003', 'prop-003', 'uuid-guest-002', '2025-08-01', '2025-08-04', 180.00, 'confirmed'),
('book-004', 'prop-004', 'uuid-guest-002', '2025-08-10', '2025-08-12', 180.00, 'cancelled'),
('book-005', 'prop-005', 'uuid-guest-003', '2025-09-01', '2025-09-03', 130.00, 'confirmed');

INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-001', 'book-001', 300.00, 'credit_card'),
('pay-002', 'book-002', 100.00, 'paypal'),
('pay-003', 'book-003', 180.00, 'bank_transfer'),
('pay-004', 'book-004', 180.00, 'credit_card'),
('pay-005', 'book-005', 130.00, 'mobile_money');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('rev-001', 'prop-001', 'uuid-guest-001', 5, 'Amazing place! Very clean and central.'),
('rev-002', 'prop-002', 'uuid-guest-001', 4, 'Nice cottage but a bit far from town.'),
('rev-003', 'prop-003', 'uuid-guest-002', 5, 'A breathtaking place in nature! Highly recommend.'),
('rev-004', 'prop-004', 'uuid-guest-002', 3, 'Great view but some amenities were missing.'),
('rev-005', 'prop-005', 'uuid-guest-003', 4, 'Clean and modern. Would book again.');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('msg-001', 'uuid-guest-001', 'uuid-host-001', 'Hi, is the Sunny Apartment available for next weekend?'),
('msg-002', 'uuid-host-001', 'uuid-guest-001', 'Yes, it is available. Let me know if you have any questions.'),
('msg-003', 'uuid-guest-002', 'uuid-host-002', 'Hello, is the Mountain Retreat accessible by public transport?'),
('msg-004', 'uuid-host-002', 'uuid-guest-002', 'Hi Diana, yes there is a shuttle service available.'),
('msg-005', 'uuid-guest-003', 'uuid-host-002', 'Is there Wi-Fi in the City Loft?');
```
