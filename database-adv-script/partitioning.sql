-- Step 1: Drop the table if it exists
DROP TABLE IF EXISTS Booking;

-- Step 2: Create a partitioned Booking table
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';