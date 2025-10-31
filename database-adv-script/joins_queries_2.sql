-- =====================================================
-- Using an INNER JOIN to retrieve all bookings and the 
-- respective users who made those bookings
-- Changed User to "User" to avoid reserved keyword conflict
-- =====================================================
SELECT
	Booking.booking_id,
	Booking.start_date,
	Booking.end_date,
	Booking.status_code,
	"User".first_name, 
	"User".last_name
FROM Booking
INNER JOIN "User" ON Booking.user_id = "User".user_id


-- =====================================================
-- Using LEFT JOIN to retrieve all properties and their 
-- reviews, including properties that have no reviews
-- =====================================================
SELECT 
	Property.property_id,
	Property.name,
	Review.rating,
	Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id


-- =====================================================
-- using a FULL OUTER JOIN to retrieve all users and all bookings, 
-- even if the user has no booking or a booking is not linked to a user.
-- =====================================================
SELECT
	u.first_name,
	u.last_name,
	b.booking_id,
	b.start_date,
	b.end_date,
	b.status_code
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id