SELECT 
    Booking.booking_id, 
    Booking.start_date, 
    Booking.end_date, 
    User.first_name, 
    User.last_name
FROM Booking
INNER JOIN User 
ON Booking.user_id = User.user_id