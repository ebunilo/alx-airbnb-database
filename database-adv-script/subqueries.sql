-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
-- WHERE
SELECT
  p.property_id,
  p.name,
  p.created_at,
  p.updated_at
FROM Property p 
JOIN (
  SELECT
    property_id,
    AVG(rating) as avg_rating 
  FROM Review
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
) as r_avg ON p.property_id = r_avg.property_id;

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT
  u.user_id,
  u.email,
  COUNT(b.booking_id) as total_booking
FROM User u JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.email
HAVING COUNT(b.booking_id) > 3;