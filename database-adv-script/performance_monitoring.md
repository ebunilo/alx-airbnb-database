### `performance_monitoring.md`

````markdown
# Performance Monitoring Report

## Objective
Monitor and optimize query performance using `EXPLAIN ANALYZE`.

---

## Optimized Queries

### 1. Booking by Date

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
````

* **Issue**: Full scan on large table.
* **Fix**: Applied `RANGE` partitioning on `start_date`.
* **Result**: Faster execution, only relevant partition scanned.

---

### 2. Property by Host

```sql
SELECT * FROM Property WHERE host_id = 'uuid';
```

* **Fix**: Added index on `host_id`.
* **Result**: Switched to index scan, faster lookup.

---

### 3. User by Email

```sql
SELECT * FROM "User" WHERE email = 'test@example.com';
```

* **Fix**: Index on `email` already exists.
* **Result**: Fast index-based search.


| Query            | Fix             | Result |
| ---------------- | --------------- | ------ |
| Booking by date  | Partitioning    | Fast   |
| Property by host | Index           | Faster |
| User by email    | Already indexed | Fast   |
