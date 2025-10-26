-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT
  u.user_id,
  u.email,
  COUNT(b.booking_id) as total_bookings
FROM User u JOIN Booking b ON  u.user_id = b.user_id
GROUP BY u.user_id, u.email


-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT
  u.user_id,
  u.email,
  COUNT(b.booking_id) as total_booking,
  RANK() OVER(ORDER BY COUNT(booking_id) DESC) as user_rank_booking,
  ROW_NUMBER() OVER(ORDER BY COUNT(booking_id)) as user_row_number
  FROM User u JOIN Booking b ON u.user_id = b.user_id
  GROUP BY u.user_id, u.email;