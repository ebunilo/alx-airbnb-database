## Database Schema – Airbnb-Style Booking Platform

### Users Table

| Column          | Type                           | Constraints               |
| --------------- | ------------------------------ | ------------------------- |
| `user_id`       | UUID                           | Primary Key, Unique       |
| `first_name`    | VARCHAR                        | Not Null                  |
| `last_name`     | VARCHAR                        | Not Null                  |
| `email`         | VARCHAR                        | Not Null, Unique, Indexed |
| `password_hash` | VARCHAR                        | Not Null                  |
| `phone_number`  | VARCHAR                        | Nullable                  |
| `role`          | ENUM(`guest`, `host`, `admin`) | Not Null                  |
| `created_at`    | TIMESTAMP                      | Default: `now()`          |

---

### Property Table

| Column          | Type      | Constraints                    |
| --------------- | --------- | ------------------------------ |
| `property_id`   | UUID      | Primary Key, Unique            |
| `host_id`       | UUID      | FK → User(`user_id`), Not Null |
| `name`          | VARCHAR   | Not Null                       |
| `description`   | TEXT      | Not Null                       |
| `location`      | VARCHAR   | Not Null                       |
| `pricepernight` | DECIMAL   | Not Null                       |
| `created_at`    | TIMESTAMP | Default: `now()`               |
| `updated_at`    | TIMESTAMP | Optional                       |

---

### Booking Table

| Column        | Type                                     | Constraints                  |
| ------------- | ---------------------------------------- | ---------------------------- |
| `booking_id`  | UUID                                     | Primary Key, Unique          |
| `property_id` | UUID                                     | FK → Property(`property_id`) |
| `user_id`     | UUID                                     | FK → User(`user_id`)         |
| `start_date`  | DATE                                     | Not Null                     |
| `end_date`    | DATE                                     | Not Null                     |
| `total_price` | DECIMAL                                  | Not Null                     |
| `status`      | ENUM(`pending`, `confirmed`, `canceled`) | Not Null                     |
| `created_at`  | TIMESTAMP                                | Default: `now()`             |

---

### Payment Table

| Column           | Type                                    | Constraints                |
| ---------------- | --------------------------------------- | -------------------------- |
| `payment_id`     | UUID                                    | Primary Key, Unique        |
| `booking_id`     | UUID                                    | FK → Booking(`booking_id`) |
| `amount`         | DECIMAL                                 | Not Null                   |
| `payment_date`   | TIMESTAMP                               | Default: `now()`           |
| `payment_method` | ENUM(`credit_card`, `paypal`, `stripe`) | Not Null                   |

---

### Review Table

| Column        | Type      | Constraints                  |
| ------------- | --------- | ---------------------------- |
| `review_id`   | UUID      | Primary Key, Unique          |
| `property_id` | UUID      | FK → Property(`property_id`) |
| `user_id`     | UUID      | FK → User(`user_id`)         |
| `rating`      | INTEGER   | 1–5 range enforced, Not Null |
| `comment`     | TEXT      | Not Null                     |
| `created_at`  | TIMESTAMP | Default: `now()`             |

---

### Message Table

| Column         | Type      | Constraints          |
| -------------- | --------- | -------------------- |
| `message_id`   | UUID      | Primary Key, Unique  |
| `sender_id`    | UUID      | FK → User(`user_id`) |
| `recipient_id` | UUID      | FK → User(`user_id`) |
| `message_body` | TEXT      | Not Null             |
| `sent_at`      | TIMESTAMP | Default: `now()`     |

---