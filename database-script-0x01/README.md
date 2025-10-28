# Task: Define the Airbnb Database Schema

This task focuses on writing SQL queries to define the database schema for the Airbnb system.

## Objective

- Write `CREATE TABLE` SQL statements for all entities based on the provided specification.
- Include appropriate data types, constraints, primary and foreign keys.
- Add indexes to improve performance.

## Files

- `schema.sql`: Contains all SQL `CREATE TABLE` statements.
- `README.md`: This documentation file.

## Schema Overview

The schema includes the following tables:

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

Each table has been created with:

- Primary Keys (`PRIMARY KEY`)
- Foreign Keys (`FOREIGN KEY`)
- Constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `ENUM`)
- Indexes on commonly queried columns (e.g. `email`, `property_id`, `booking_id`)
