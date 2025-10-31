-- Enable UUID generation extension (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE "User" (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_role ON "User"(role);


CREATE TABLE Property_Type (
    property_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);


CREATE TABLE Location (
    location_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state_province VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_location_city ON Location(city);
CREATE INDEX idx_location_country ON Location(country);
CREATE INDEX idx_location_geo ON Location(latitude, longitude);


CREATE TABLE Property (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_id UUID NOT NULL,
    location_id UUID NOT NULL,
    property_type_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    base_price_per_night DECIMAL(10,2) NOT NULL CHECK (base_price_per_night > 0),
    max_guests INTEGER NOT NULL CHECK (max_guests > 0),
    bedrooms INTEGER NOT NULL CHECK (bedrooms >= 0),
    bathrooms INTEGER NOT NULL CHECK (bathrooms > 0),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_property_host FOREIGN KEY (host_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_property_location FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_property_type FOREIGN KEY (property_type_id)
        REFERENCES Property_Type(property_type_id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location_id ON Property(location_id);
CREATE INDEX idx_property_type_id ON Property(property_type_id);
CREATE INDEX idx_property_active ON Property(is_active);


CREATE TABLE Booking_Status (
    status_code VARCHAR(10) PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    status_code VARCHAR(10) NOT NULL DEFAULT 'pending',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    number_of_guests INTEGER NOT NULL CHECK (number_of_guests > 0),
    base_total DECIMAL(10,2) NOT NULL,
    service_fee DECIMAL(10,2) NOT NULL DEFAULT 0,
    tax_amount DECIMAL(10,2) NOT NULL DEFAULT 0,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_status FOREIGN KEY (status_code)
        REFERENCES Booking_Status(status_code)
        ON DELETE RESTRICT,
    CONSTRAINT chk_booking_dates CHECK (start_date < end_date),
    CONSTRAINT chk_booking_total CHECK (total_price = base_total + service_fee + tax_amount)
);

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status_code);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);


CREATE TABLE Payment_Method (
    method_code VARCHAR(20) PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE Payment_Status (
    status_code VARCHAR(20) PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL,
    method_code VARCHAR(20) NOT NULL,
    status_code VARCHAR(20) NOT NULL DEFAULT 'pending',
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    currency VARCHAR(3) NOT NULL DEFAULT 'USD',
    transaction_id VARCHAR(255), -- External payment processor ID
    payment_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_payment_method FOREIGN KEY (method_code)
        REFERENCES Payment_Method(method_code)
        ON DELETE RESTRICT,
    CONSTRAINT fk_payment_status FOREIGN KEY (status_code)
        REFERENCES Payment_Status(status_code)
        ON DELETE RESTRICT
);

CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_status ON Payment(status_code);
CREATE INDEX idx_payment_transaction ON Payment(transaction_id);


CREATE TABLE Review (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    booking_id UUID NOT NULL, -- Ensures only guests with actual bookings can review
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(200),
    comment TEXT NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE, -- Marks if review is from actual booking
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_review_property FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_booking FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE,
    CONSTRAINT uq_review_booking UNIQUE (booking_id) -- One review per booking
);

CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);


CREATE TABLE Message (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
);

CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
CREATE INDEX idx_message_sent_at ON Message(sent_at);
