# Sell Sync - Database Collections

MongoDB collection structure for the Sell Sync system, a multi-tenant POS system designed to allow businesses to register, manage their stores, and process sales independently.

---

## Collections Structure

### 1. Users
Stores user-related data, including business owners and staff members.
```json
{
  "_id": ObjectId,
  "first_name": "Alice",
  "last_name": "Super",
  "email": "superadmin@example.com",
  "password_hash": "hashed_password",
  "role": "superadmin",  // Superadmin role for the main admin
  "business_id": null,  // Superadmin typically wouldn't be tied to a business
  "phone": "+1234567890",
  "address": "Admin Office, HQ City",
  "status": "active",
  "permissions": ["manage_all_businesses", "view_all_users", "system_settings", "edit_all_profiles"],  // Superadmin has all permissions
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 2. Businesses
Each registered business gets an independent environment.
```json
{
  "_id": ObjectId,
  "business_name": "Tech Solutions Ltd.",
  "owner_id": ObjectId,
  "subscription_plan": "Premium Plan",
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "api_key": "abc123def456ghi789jkl012mno345pqr678stu",
  "settings": {
    "currency": "USD",
    "timezone": "America/New_York",
    "tax_inclusive": true
  }
}
```

### 3. Packages
Defines the different subscription packages available for businesses.
```json
{
  "_id": ObjectId,
  "package_name": "Standard Plan",
  "description": "The standard plan offers essential features like inventory management, sales reports, and loyalty programs.",
  "price": 49.99,
  "currency": "USD",  // optional field if you want to specify currency
  "features": ["Inventory Management", "Sales Reports", "Loyalty Program"],
  "duration": "monthly",  // could be "monthly", "yearly", etc.
  "trial_period": "30 days",  // optional field if you offer a trial period
  "discount_percentage": 10,  // optional field if there is a discount
  "status": "active",  // can be "active", "inactive", etc.
  "max_users": 5,  // optional field if applicable
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 4. Stores
Each business can have multiple store locations.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "store_name": "Downtown Branch",
  "address": "123 Main Street, Downtown City",
  "city": "Downtown City",  // Optional: Break the address into city, state, and postal code for better searchability
  "state": "State Name",    // Optional: State
  "postal_code": "12345",   // Optional: Postal Code for more precise location
  "phone": "+1234567890",
  "email": "store@business.com",  // Optional: Email for customer communication
  "website_url": "https://businessstore.com",  // Optional: Website if the store has one
  "operating_hours": {  // Optional: Store hours for each day of the week
    "monday": "9:00 AM - 6:00 PM",
    "tuesday": "9:00 AM - 6:00 PM",
    "wednesday": "9:00 AM - 6:00 PM",
    "thursday": "9:00 AM - 6:00 PM",
    "friday": "9:00 AM - 6:00 PM",
    "saturday": "10:00 AM - 4:00 PM",
    "sunday": "Closed"
  },
  "store_manager": {
    "name": "Jane Doe",  // Optional: Manager or contact person for the store
    "phone": "+1234567890"
  },
  "status": "active",  // Optional: Status of the store (active, closed, etc.)
  "latitude": 37.7749,  // Optional: Latitude for geolocation
  "longitude": -122.4194,  // Optional: Longitude for geolocation
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 5. Inventory
Manages product stock across stores.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "product_name": "Laptop",
  "sku": "LPT123",
  "quantity": 50,
  "price": 799.99,
  "tax_rate": 10,
  "product_description": "14-inch laptop with 16GB RAM and 512GB SSD.",
  "category": "Electronics",
  "supplier_id": ObjectId,  // Reference to a supplier collection
  "received_quantity": 100,  // Total quantity received from the supplier
  "sold_quantity": 50,  // Total quantity sold
  "low_stock_threshold": 10,  // Threshold to trigger restock alerts
  "reorder_level": 30,  // When stock reaches this level, reorder
  "discounted_price": 749.99,  // If there is a special sale price
  "cost_price": 500.00,  // The cost of the product
  "expiry_date": ISODate("2025-12-31T00:00:00Z"),  // If applicable
  "barcode": "123456789012",  // Optional barcode field
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:00:00Z")
}
```

### 6. `supplier`
```json
{
  "_id": ObjectId,
  "supplier_name": "Tech Supplies Inc.",
  "contact_person": "Jane Smith",
  "email": "jane.smith@techsupplies.com",
  "phone": "+1234567890",
  "address": "456 Supplier St, Tech City",
  "website": "https://techsupplies.com",
  "payment_terms": "Net 30",  // Payment terms like "Net 30", "Cash on delivery", etc.
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:00:00Z")
}
```

### 7. `discounts`
Stores store-specific discounts or promotional offers.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "store_id": ObjectId,
  "discount_name": "Winter Sale",
  "discount_type": "percentage",
  "value": 15.00,
  "start_date": ISODate("2025-02-01T00:00:00Z"),
  "end_date": ISODate("2025-02-28T23:59:59Z"),
  "applies_to": "all",  // "all", "products", "category-specific"
  "discount_code": "WINTER15",  // Optional: Code for applying the discount
  "min_purchase_amount": 50.00,  // Optional: Minimum purchase amount to use the discount
  "usage_limit": 100,  // Optional: How many times the discount can be used
  "eligible_customers": ["new_customers", "vip"],  // Optional: Who is eligible for the discount
  "stackable": false,  // Optional: Can this discount be combined with other discounts?
  "excluded_products": ["LPT123", "PHN456"],  // Optional: List of product SKUs excluded from discount
  "created_at": ISODate("2025-02-01T12:00:00Z")
}
```

### 8. `coupons`
Stores discount codes.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "coupon_code": "WINTER2025",
  "discount_type": "percentage",  // "percentage" or "fixed"
  "value": 20.00,  // Discount amount (e.g., 20% or $20)
  "valid_from": ISODate("2025-02-01T00:00:00Z"),
  "valid_to": ISODate("2025-02-28T23:59:59Z"),
  "usage_limit": 500,  // Total usage limit for the coupon
  "usage_per_customer": 1,  // Max usage per customer
  "min_purchase_amount": 50.00,  // Minimum purchase to use the coupon
  "eligible_customers": ["new_customers", "VIP"],  // Who can use the coupon
  "status": "active",  // "active", "expired", "disabled"
  "applicable_products": ["LPT123", "PHN456"],  // Optional: Specific products or categories
  "stackable": false,  // Whether this coupon can be combined with other discounts
  "created_at": ISODate("2025-01-15T12:00:00Z")
}
```

### 9. Taxation
Handles tax rules for transactions.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "tax_name": "VAT",
  "rate": 5,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 10. Payment Methods
Stores the available payment methods.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "store_id": ObjectId,
  "sale_id": ObjectId,
  "amount": "decimal",
  "method": "credit_card/cash/mobile_wallet",
  "status": "completed/pending/refunded",
  "transaction_id": "string",
  "created_at": "datetime"
}
```

### 11. Returns and Refunds
Handles customer returns.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "order_id": ObjectId,
  "refund_amount": 50.00,
  "status": "processed",
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 12. Additional Charges
Includes fees such as service charges.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "charge_name": "Service Fee",
  "amount": 5.00,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 13. Loyalty Program Points
Tracks customer rewards.
```json
{
  "_id": ObjectId,
  "customer_id": ObjectId,
  "points": 100,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 14. Customers
Manages customer details.
```json
{
  "_id": ObjectId,
  "first_name": "Alice",
  "last_name": "Smith",
  "email": "alice@example.com",
  "phone": "+1234567890",
  "loyalty_points": 150,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 15. Store-Specific Discounts or Offers
Manages custom promotions per store.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "discount_name": "Weekend Sale",
  "discount_value": 15,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 16. Invoice/Receipt Information
Tracks invoice details.
```json
{
  "_id": ObjectId,
  "order_id": ObjectId,
  "customer_id": ObjectId,
  "total_amount": 120.00,
  "payment_status": "paid",
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 17. Promotional Gift Offers
Handles free gift promotions.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "gift_item": "Mug",
  "min_purchase": 50.00,
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 18. API Keys
Manages external API access.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "api_key": "randomly_generated_string",
  "created_at": ISODate,
  "updated_at": ISODate
}
```

---
This structure ensures that each business operates independently with its own data and services. Let me know if further refinements are needed! 🚀
