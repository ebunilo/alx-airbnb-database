DROP INDEX IF EXISTS idx_user_id;
DROP INDEX IF EXISTS idx_booking_id;

-- FULL OUTER JOIN
EXPLAIN ANALYZE SELECT 
  User.user_id,
  User.email,
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date
FROM User LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

EXPLAIN ANALYZE SELECT 
  Booking.booking_id,
  Booking.start_date, 
  Booking.end_date,
  User.user_id,
  User.email
FROM Booking RIGHT JOIN User ON Booking.user_id = User.user_id;


CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_booking_id ON Booking(booking_id);


-- FULL OUTER JOIN
EXPLAIN ANALYZE SELECT 
  User.user_id,
  User.email,
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date
FROM User LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

EXPLAIN ANALYZE SELECT 
  Booking.booking_id,
  Booking.start_date, 
  Booking.end_date,
  User.user_id,
  User.email
FROM Booking RIGHT JOIN User ON Booking.user_id = User.user_id;


