# Task: Seed the Airbnb Database with Sample Data

This task involves populating the previously defined Airbnb database schema with realistic sample data.

## Objective

- Write SQL `INSERT` statements to add mock data for all key entities:

1. **User**
2. **Address**
3. **PropertyType**
4. **Property**
5. **Booking**
6. **Payment**
7. **Review**
8. **Message**
9. **Amenity**
10. **PropertyAmenity**

## Files

- `seed.sql`: Contains all SQL `INSERT` statements to seed the database.
- `README.md`: This documentation file.

## Sample Data Summary

The sample data creates a realistic vacation rental platform with:

### Users

- 3 Hosts: Sarah, Mike, Emily (each with 2 properties)

- 4 Guests: David, Lisa, James, Maria

- 1 Admin: System administrator

### Properties

- 6 diverse properties across different locations (beach, mountain, city, lake, desert, forest)

- Various property types (apartment, house, villa, cabin, beach house)

- Realistic pricing ($160-$500 per night)

- Comprehensive amenity assignments

### Bookings

- 7 bookings with different statuses:

- 3 completed bookings with reviews

- 2 confirmed upcoming bookings

- 1 pending booking

- 1 canceled booking

### Financial Transactions

- 5 payments with different statuses (completed, pending, refunded)

- Multiple payment methods (credit card, PayPal, Stripe)

### Reviews & Communication

- 3 detailed reviews from actual guests

- 5 sample messages showing host-guest and guest-guest communication

## Data Relationships

- All foreign key relationships are properly maintained

- Booking durations and pricing are realistic

- Timestamps follow logical sequences

- Geographic diversity in property locations

This dataset provides a solid foundation for testing queries, demonstrating application functionality, and ensuring all database relationships work correctly.
