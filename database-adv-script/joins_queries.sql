INNER JOIN
SELECT 
  Booking.booking_id,
  Booking.start_date, 
  Booking.end_date,
  User.user_id,
  User.email
FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;

-- LEFT JOIN
SELECT
  Property.property_id,
  Property.name,
  Property.location,
  Review.review_id,
  Review.rating
FROM Property LEFT JOIN Review ON Property.property_id = Review.property_id
ORDER BY Property.property_id

-- FULL OUTER JOIN
SELECT 
  User.user_id,
  User.email,
  Booking.booking_id,
  Booking.start_date,
  Booking.end_date
FROM User LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

SELECT 
  Booking.booking_id,
  Booking.start_date, 
  Booking.end_date,
  User.user_id,
  User.email
FROM Booking RIGHT JOIN User ON Booking.user_id = User.user_id;