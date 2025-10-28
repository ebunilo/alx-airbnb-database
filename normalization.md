# Database Normalization Steps to 3NF

## Overview

This document explains the normalization steps taken to bring the Airbnb database schema to Third Normal Form (3NF).

## Normalization Principles Applied

### First Normal Form (1NF)

**Goal**: Eliminate repeating groups and ensure atomicity

**Changes Made**:

- All tables have primary keys
- All columns contain atomic values
- No repeating groups (created separate tables for multi-valued attributes)

### Second Normal Form (2NF)

**Goal**: Remove partial dependencies

**Issues Fixed**:

1. **Property Table**:
   - Location field contained multiple address components
   - Created separate `Address` table to store address information
   - Moved property type to separate `PropertyType` table

2. **Booking Table**:
   - `total_price` was a calculated field dependent on both property price and duration
   - Removed `total_price` as it can be calculated when needed

### Third Normal Form (3NF)

**Goal**: Remove transitive dependencies

**Issues Fixed**:

1. **Property Attributes**:
   - Property characteristics (type, location) were stored directly
   - Created reference tables (`PropertyType`, `Address`) to eliminate transitive dependencies

2. **Payment Status**:
   - Added proper status tracking in `Payment` table instead of inferring from booking

## Specific Normalization Changes

### 1. Address Normalization

**Before**: Single `location` field in Property table
**After**: Separate `Address` table with structured address components

```sql
-- Old
location VARCHAR(255) NOT NULL

-- New
CREATE TABLE Address (
    address_id UUID PRIMARY KEY,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100) NOT NULL
);
