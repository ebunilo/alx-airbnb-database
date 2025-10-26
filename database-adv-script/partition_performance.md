# Partitioning Performance Report

## Objective
Partition the `Booking` table by `start_date` to improve query performance on large datasets.

## Implementation
- The `Booking` table was partitioned by range on `start_date` into yearly partitions for 2023, 2024, and 2025.
- Foreign keys and indexes were added to each partition individually.
- Inserts automatically route to the appropriate partition based on `start_date`.

## Performance Test
- A test query fetching bookings for the year 2024 was executed with `EXPLAIN ANALYZE`.
- Query execution time showed a significant reduction compared to querying the non-partitioned table, due to partition pruning.
- Only the relevant partition (Booking_2024) was scanned, reducing the data scanned and improving speed.

## Observations
- Partitioning by `start_date` is effective for time-based queries common in booking systems.
- Maintenance tasks (e.g., archiving old data) become easier by detaching or dropping old partitions.
- Overall, partitioning enhanced query efficiency and scalability.

