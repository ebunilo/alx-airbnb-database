# Implement Indexes to Improve Query Performance

Indexes are crucial for optimizing query performance, especially in large databases with frequent read operations.

## Query Strings

```sql
SELECT
	Booking.booking_id,
	Booking.start_date,
	Booking.end_date,
	Booking.status_code,
	"User".first_name, 
	"User".last_name
FROM Booking
INNER JOIN "User" ON Booking.user_id = "User".user_id
```

## Results Without Indexes

```"Hash Join  (cost=11.12..26.07 rows=390 width=498) (actual time=0.035..0.039 rows=10 loops=1)"
"  Hash Cond: (booking.user_id = ""User"".user_id)"
"  ->  Seq Scan on booking  (cost=0.00..13.90 rows=390 width=78) (actual time=0.018..0.019 rows=10 loops=1)"
"  ->  Hash  (cost=10.50..10.50 rows=50 width=452) (actual time=0.012..0.012 rows=10 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"        ->  Seq Scan on ""User""  (cost=0.00..10.50 rows=50 width=452) (actual time=0.006..0.008 rows=10 loops=1)"
"Planning Time: 0.340 ms"
"Execution Time: 0.063 ms"
```

## Results With Indexes

```"Hash Join  (cost=1.23..2.36 rows=10 width=498) (actual time=0.086..0.090 rows=10 loops=1)"
"  Hash Cond: (booking.user_id = ""User"".user_id)"
"  ->  Seq Scan on booking  (cost=0.00..1.10 rows=10 width=78) (actual time=0.007..0.008 rows=10 loops=1)"
"  ->  Hash  (cost=1.10..1.10 rows=10 width=452) (actual time=0.027..0.027 rows=10 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"        ->  Seq Scan on ""User""  (cost=0.00..1.10 rows=10 width=452) (actual time=0.005..0.007 rows=10 loops=1)"
"Planning Time: 2.857 ms"
"Execution Time: 0.171 ms"
```

## Results with COVERING INDEXES

```"Hash Join  (cost=1.23..2.36 rows=10 width=498) (actual time=0.060..0.066 rows=10 loops=1)"
"  Hash Cond: (booking.user_id = ""User"".user_id)"
"  ->  Seq Scan on booking  (cost=0.00..1.10 rows=10 width=78) (actual time=0.007..0.008 rows=10 loops=1)"
"  ->  Hash  (cost=1.10..1.10 rows=10 width=452) (actual time=0.023..0.024 rows=10 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"        ->  Seq Scan on ""User""  (cost=0.00..1.10 rows=10 width=452) (actual time=0.007..0.009 rows=10 loops=1)"
"Planning Time: 0.742 ms"
"Execution Time: 0.109 ms"
```

## Result Analysis

### Before Indexing

Execution Time: 0.063 ms
Planning Time: 0.340 ms
Total: ~0.403 ms

### After Normal Indexing

Execution Time: 0.171 ms (+171%)
Planning Time: 2.857 ms (+740%)
Total: ~3.028 ms

### After Cover Indexing

Execution Time: 0.109 ms (+73%)
Planning Time: 0.742 ms (+118%)
Total: ~0.851 ms

## Why Performance Decreased with Indexing

### 1. Small Dataset Size

We only have 10 rows in each table
For tiny datasets, sequential scans are often faster than index lookups
The overhead of index traversal outweighs the benefits

### 2. PostgreSQL Query Planner Wisdom

PostgreSQL ignored the indexes and still used sequential scans
The planner determined that reading all 10 rows sequentially is cheaper than using indexes
This is evident because we still see Seq Scan in all execution plans

### 3. Index Maintenance Overhead

Indexes consume storage and require maintenance during INSERT/UPDATE/DELETE operations
The query planner spends more time evaluating whether to use indexes

### 4. Planning Time Increase

With indexes present, the planner has more access paths to consider
This increases planning time significantly

## Conclusion
In this specific case with a very small dataset, adding indexes did not improve performance and actually degraded it. For larger datasets, indexes typically provide significant performance benefits for read-heavy operations. Always analyze query plans and test performance with realistic data sizes before and after indexing.
