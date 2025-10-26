

## Task - 0: Join Queries

### INNER JOIN – Bookings with Users

Write a query to retrieve all bookings along with the users who made those bookings.

---

### LEFT JOIN – Properties with Reviews

Write a query to retrieve all properties and their associated reviews. Include properties that have no reviews.

---

### FULL OUTER JOIN – All Users and All Bookings

Write a query to retrieve all users and all bookings, including users with no bookings and bookings not linked to a user. (Simulated using `UNION` in MySQL.)

---

## Task - 1: Subquery Practice

### Non-Correlated Subquery

Write a query to find all properties where the average review rating is greater than 4.0.

---

### Correlated Subquery

Write a query to find all users who have made more than 3 bookings using a subquery that references the outer query.

## Task - 2: Apply Aggregations and Window Functions
### Aggregate Function
Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

### Window Function
Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
