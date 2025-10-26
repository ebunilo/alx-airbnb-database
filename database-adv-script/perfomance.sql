--WHERE AND
--Intial query
SELECT
u.user_id,
u.first_name,
u.last_name,
b.booking_id,
b.start_date,
b.end_date,
b.status,
b.total_price,
p.property_id,
p.name,
pay.payment_id,
pay.amount,
pay.payment_date

FROM Booking b
JOIN "User" u ON u.user_id = b.user_id
JOIN Property p ON p.property_id = b.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id

--Analyze the query
EXPLAIN ANALYZE
SELECT
u.user_id,
u.first_name,
u.last_name,
b.booking_id,
b.start_date,
b.end_date,
b.status,
b.total_price,
p.property_id,
p.name,
pay.payment_id,
pay.amount,
pay.payment_date

FROM Booking b
JOIN "User" u ON u.user_id = b.user_id
JOIN Property p ON p.property_id = b.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id

--Optimizing  
CREATE INDEX IF NOT EXISTS idx_booking_user ON Booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property ON Booking(property_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking ON Payment(booking_id);

--Refactoring
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed'; -- 