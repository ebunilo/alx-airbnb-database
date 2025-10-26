CREATE TABLE "User" (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255),
  role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_id ON "User"(user_id);

CREATE TABLE Property (
  property_id UUID PRIMARY KEY,
  host_id UUID NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_property_id ON Property(property_id);

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);


CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);


CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);


CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);


