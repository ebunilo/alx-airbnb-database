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
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

Each table has been created with:
- Primary Keys (`PRIMARY KEY`)
- Foreign Keys (`FOREIGN KEY`)
- Constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `ENUM`)
- Indexes on commonly queried columns (e.g. `email`, `property_id`, `booking_id`)

