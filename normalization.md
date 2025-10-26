
# Airbnb Database Normalization to 3NF

## Objective

Ensure the Airbnb database schema adheres to **Third Normal Form (3NF)** by eliminating redundancy and ensuring all non-key attributes are fully functionally dependent on the primary key and nothing else.


## Step-by-Step Normalization Process

### **First Normal Form (1NF)**

1NF requires:

* Atomic values (no repeating groups or arrays).
* Unique rows.

**All tables use atomic attributes.** No multi-valued or repeating fields are present.


### **Second Normal Form (2NF)**

2NF requires:

* The table must be in 1NF.
* All non-key attributes must be fully functionally dependent on the entire primary key (not just part of it).

All tables have a single-column primary key (no composite keys), so they automatically satisfy 2NF.


### **Third Normal Form (3NF)**

3NF requires:

* The table must be in 2NF.
* No transitive dependencies (i.e., non-key attributes must depend only on the primary key, not on other non-key attributes).

### Normalization Review per Table

#### **1. User**

* **PK:** `user_id`
* All other fields are dependent only on `user_id`.
* No derived or calculated fields.
* **In 3NF**

#### **2. Property**

* **PK:** `property_id`
* `host_id` refers to `user_id` in User table. This is appropriate and not a transitive dependency.
* All other attributes (e.g., `name`, `pricepernight`, etc.) describe the property.
* **In 3NF**

#### **3. Booking**

* **PK:** `booking_id`
* All fields depend directly on `booking_id`.
* `user_id` and `property_id` are foreign keys; this is not a violation.
* No transitive dependencies (e.g., `total_price` is okay if it's not derived from `pricepernight × nights`; if derived, it should be removed).
* **In 3NF**, assuming `total_price` is explicitly stored and not derived.

#### **4. Payment**

* **PK:** `payment_id`
* Depends on `booking_id` only, which is fine.
* All fields directly related to a payment instance.
* **In 3NF**

#### **5. Review**

* **PK:** `review_id`
* `property_id` and `user_id` are required to link a review properly.
* All fields are directly related to a review.
* **In 3NF**

#### **6. Message**

* **PK:** `message_id`
* `sender_id`, `recipient_id`, and `message_body` depend on `message_id`.
* **In 3NF**


## Suggested Improvements (Optional Optimizations)

While the schema is already in 3NF, here are optional adjustments:

1. **Location Field in `Property`**

   * If `location` is a structured entity (e.g., city, state, country), it could be normalized into a `Location` table to reduce redundancy if reused across properties.
   * **Optional Table:**

     ```sql
     Location (
       location_id UUID PRIMARY KEY,
       city VARCHAR,
       state VARCHAR,
       country VARCHAR
     )
     ```

2. **Role ENUM in User**

   * Consider creating a separate `Roles` table if roles become dynamic.
   * **Optional Table:**

     ```sql
     Role (
       role_id SERIAL PRIMARY KEY,
       role_name VARCHAR UNIQUE
     )
     ```

3. **Payment Method ENUM**

   * Could be extracted to a `PaymentMethod` table for flexibility.
   * **Optional Table:**

     ```sql
     PaymentMethod (
       method_id SERIAL PRIMARY KEY,
       method_name VARCHAR UNIQUE
     )
     ```

---

