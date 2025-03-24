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

### 9. Taxation* (how will it be done)
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
  "amount": 99.99,
  "method": "credit_card",  // "credit_card", "cash", "mobile_wallet"
  "status": "completed",  // "completed", "pending", "refunded"
  "transaction_id": "txn12345abcde",
  "payment_provider": "Stripe",  // Optional: the payment provider (e.g., "Stripe", "PayPal")
  "currency": "USD",  // Optional: The currency of the transaction
  "payment_date": ISODate("2025-02-24T12:30:00Z"),  // Optional: Payment date
  "refund_amount": 0,  // Optional: The amount refunded (if applicable)
  "refund_date": ISODate("2025-02-25T12:30:00Z"),  // Optional: Refund date (if applicable)
  "payment_confirmation": true,  // Optional: True if payment was confirmed
  "payment_details": "Visa ending in 1234, 12/25",  // Optional: Any additional payment details
  "created_at": ISODate("2025-02-24T12:00:00Z")
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
  "status": "processed",  // "pending", "processed", "denied"
  "return_reason": "Damaged",  // Optional: "Damaged", "Incorrect Item", etc.
  "refund_method": "original_payment",  // "original_payment", "store_credit", "gift_card"
  "return_date": ISODate("2025-02-24T12:30:00Z"),  // Optional: Date of return request
  "return_items": [
    {
      "product_id": "LPT123",
      "quantity": 1,
      "return_amount": 50.00  // Optional: The amount refunded for this item
    }
  ],
  "processed_by": ObjectId,  // Optional: The staff or admin who processed the return
  "refund_approval_status": "approved",  // "approved", "pending", "denied"
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:30:00Z")
}
```

### 12. Additional Charges
Includes fees such as service charges.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "charge_name": "Service Fee",
  "charge_type": "fixed",  // "fixed" or "percentage"
  "amount": 5.00,  // If charge_type is "fixed", this is the amount. If "percentage", this is the percentage.
  "applicable_to": "all",  // "all", "items", "shipping", "tax", etc.
  "start_date": ISODate("2025-02-01T00:00:00Z"),  // Optional: Start date for this charge
  "end_date": ISODate("2025-02-28T23:59:59Z"),  // Optional: End date for this charge
  "exempt_from": ["VIP_customers", "promotional_items"],  // Optional: Who is exempt from this charge
  "charge_scope": "order",  // "order" or "item"
  "payment_method_restrictions": ["credit_card"],  // Optional: Applies only to specific payment methods
  "created_at": ISODate("2025-02-01T12:00:00Z"),
  "updated_at": ISODate("2025-02-01T12:30:00Z")
}
```

### 13. Loyalty Program Points
Tracks customer rewards.
```json
{
  "_id": ObjectId,
  "customer_id": ObjectId,
  "points": 100,  // Total points earned by the customer
  "points_type": "purchase",  // "purchase", "activity", "promotion", etc.
  "earned_date": ISODate("2025-02-01T00:00:00Z"),  // Date when points were earned
  "expiry_date": ISODate("2025-12-31T23:59:59Z"),  // Date when points will expire
  "redemption_history": [
    {
      "redeemed_amount": 50,  // Amount of points redeemed
      "redeemed_for": "discount",  // Redemption for discount, product, etc.
      "redeemed_date": ISODate("2025-03-01T12:00:00Z")
    }
  ],
  "status": "active",  // "active", "redeemed", "expired"
  "tier": "Gold",  // Optional: The tier or level in the loyalty program
  "created_at": ISODate("2025-02-01T12:00:00Z"),
  "updated_at": ISODate("2025-02-02T12:00:00Z")
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
  "date_of_birth": ISODate("1990-05-15T00:00:00Z"),  // Optional: Date of birth for age-related offers
  "address": {
    "street": "123 Main Street",
    "city": "Sample City",
    "state": "State Name",
    "postal_code": "12345",
    "country": "Country Name"
  },  // Optional: Customer address for shipping and billing
  "status": "active",  // Optional: "active", "inactive", "banned"
  "marketing_preferences": {
    "email": true,  // Whether the customer has opted in for email marketing
    "sms": false    // Whether the customer has opted in for SMS marketing
  },  // Optional: Marketing preferences
  "last_purchase_date": ISODate("2025-02-20T12:00:00Z"),  // Optional: Date of the last purchase made by the customer
  "total_spent": 500.00,  // Optional: Total amount spent by the customer
  "profile_picture": "https://example.com/profile_picture.jpg",  // Optional: Link to the customer's profile picture
  "created_at": ISODate("2025-01-15T12:00:00Z"),
  "updated_at": ISODate("2025-02-20T12:00:00Z")
}
```

### 15. Store-Specific Discounts or Offers
Manages custom promotions per store.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "discount_name": "Weekend Sale",
  "discount_type": "percentage",  // "percentage", "fixed", "buy_x_get_y"
  "discount_value": 15,  // Percentage or fixed value based on discount_type
  "valid_from": ISODate("2025-02-24T00:00:00Z"),  // Start date of the promotion
  "valid_to": ISODate("2025-02-26T23:59:59Z"),  // End date of the promotion
  "applies_to": "all",  // "all", "products", "categories", etc.
  "usage_limit": 100,  // Optional: How many times this promotion can be used (total or per customer)
  "minimum_purchase": 50.00,  // Optional: Minimum amount required to apply the discount
  "customer_exclusions": ["vip_customers"],  // Optional: Customer segments excluded from the offer
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:30:00Z")
}
```

### 16. Invoice/Receipt Information
Tracks invoice details.
```json
{
  "_id": ObjectId,
  "invoice_number": "INV-20250224-001",  // Unique invoice/receipt identifier
  "order_id": ObjectId,
  "customer_id": ObjectId,
  "items": [
    {
      "product_id": ObjectId,
      "product_name": "Laptop",
      "quantity": 2,
      "price": 599.99,
      "total": 1199.98,
      "tax_rate": 10,  // Tax rate applied to this item
      "tax_amount": 119.998,  // Tax amount for this item
      "discount": 50.00  // Discount applied to this item, if any
    }
  ],
  "total_amount": 1200.00,  // Total after applying discounts, taxes, etc.
  "payment_status": "paid",  // "paid", "unpaid", "partially_paid", "refunded"
  "payment_method": "credit_card",  // "credit_card", "cash", "mobile_wallet", etc.
  "billing_address": {
    "street": "123 Main Street",
    "city": "Sample City",
    "state": "State Name",
    "postal_code": "12345",
    "country": "Country Name"
  },
  "shipping_address": {
    "street": "123 Main Street",
    "city": "Sample City",
    "state": "State Name",
    "postal_code": "12345",
    "country": "Country Name"
  },
  "due_date": ISODate("2025-03-01T00:00:00Z"),  // Optional: Due date for payment
  "status": "paid",  // "paid", "unpaid", "partially_paid", "refunded"
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:30:00Z")
}
```

### 17. Promotional Gift Offers
Handles free gift promotions.
```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "gift_item": "Mug",
  "gift_type": "free_with_minimum_purchase",  // "free_with_minimum_purchase" or "buy_x_get_y"
  "min_purchase": 50.00,  // Minimum purchase required for the promotion
  "eligibility": "all",  // "all", "vip_customers", "specific_products"
  "valid_from": ISODate("2025-02-24T00:00:00Z"),  // Start date of the promotion
  "valid_to": ISODate("2025-02-28T23:59:59Z"),  // End date of the promotion
  "usage_limit": 500,  // Optional: Number of times the offer can be used
  "gift_quantity_available": 200,  // Quantity of gifts available for the promotion
  "gift_value": 5.00,  // Value of the gift (e.g., value of the mug)
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:30:00Z")
}
```

### 18. API Keys
Manages external API access.
```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "api_key": "randomly_generated_string",
  "status": "active",  // "active", "inactive", "revoked"
  "purpose": "third_party_integration",  // "internal", "third_party_integration", etc.
  "expiration_date": ISODate("2025-12-31T23:59:59Z"),  // Optional: Expiration date for the API key
  "permissions": [
    "read", "write", "admin"  // Optional: Defines the level of access granted
  ],
  "request_count": 1234,  // Optional: Tracks the number of API calls made
  "created_at": ISODate("2025-02-24T12:00:00Z"),
  "updated_at": ISODate("2025-02-24T12:30:00Z")
}
```

### 19. Employees / Staff Management
Collection to manage employees working in different stores
```
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "store_id": ObjectId,
  "user_id": ObjectId,
  "role": "cashier",
  "permissions": ["process_sales", "view_reports"],
  "salary": 2000.00,
  "currency": "USD",
  "payment_type": "monthly",
  "commission_rate": 0.05,
  "overtime_rate": 1.5,
  "employment_type": "full_time",
  "hire_date": ISODate,
  "termination_date": null,
  "status": "active",
  "working_hours": {
    "start": "09:00",
    "end": "17:00"
  },
  "shift_pattern": "morning",
  "tax_id": "123456789",
  "national_id": "A12345678",
  "contact_info": {
    "email": "user@example.com",
    "phone": "+1234567890"
  },
  "emergency_contact": {
    "name": "John Doe",
    "phone": "+9876543210",
    "relation": "spouse"
  },
  "last_login": ISODate,
  "attendance_record": [
    {
      "date": ISODate,
      "status": "present"
    }
  ],
  "performance_score": 4.5,
  "biometric_data": {
    "fingerprint": "hash",
    "face_scan": "hash"
  },
  "created_at": ISODate,
  "updated_at": ISODate
}
```

### 20. Enhanced Sales/Transaction Collection

```json
{
  "_id": ObjectId,
  "business_id": ObjectId,
  "store_id": ObjectId,
  "register_id": ObjectId, // If using multiple registers
  "cashier_id": ObjectId, // Employee handling the sale
  "customer_id": ObjectId, // Optional, if a registered customer
  "customer_type": "guest", // "guest", "registered", "wholesale"
  "order_type": "in_store", // "in_store", "online", "delivery", "pickup", "table_service"
  "items": [
    {
      "product_id": ObjectId,
      "product_name": "Smartphone X",
      "sku": "SPX-001", // Stock Keeping Unit for better tracking
      "barcode": "1234567890123",
      "quantity": 2,
      "unit_price": 799.99,
      "subtotal": 1599.98,
      "tax": 79.99,
      "discount": {
        "type": "fixed", // "fixed" or "percentage"
        "value": 10.00
      },
      "total_after_discount": 1589.98,
      "total_tax": 79.99,
      "final_total": 1669.97
    }
  ],
  "subtotal": 1599.98,
  "total_discount": 10.00,
  "total_tax": 79.99,
  "total_amount": 1669.97,
  "payment": {
    "method": "credit_card", // "cash", "credit_card", "debit_card", "mobile_payment", "split"
    "amount_paid": 1669.97,
    "change_due": 0.00,
    "split_payment": [
      {
        "method": "cash",
        "amount": 1000.00
      },
      {
        "method": "credit_card",
        "amount": 669.97
      }
    ],
    "transaction_id": "TXN1234567890", // For payment gateway reference
    "payment_status": "paid" // "paid", "partially_paid", "pending", "failed", "refunded"
  },
  "loyalty": {
    "points_earned": 10,
    "points_redeemed": 5
  },
  "transaction_status": "completed", // "pending", "cancelled", "refunded"
  "invoice_number": "INV-20250324-001",
  "receipt_url": "https://example.com/receipts/INV-20250324-001.pdf",
  "applied_taxes": [
    {
      "tax_name": "VAT",
      "rate": 5.0,
      "amount": 79.99
    }
  ],
  "applied_discounts": [
    {
      "discount_code": "SPRINGSALE",
      "type": "percentage",
      "value": 5.0,
      "amount": 10.00
    }
  ],
  "created_at": ISODate,
  "updated_at": ISODate,
  "refund_details": {
    "is_refunded": false,
    "refund_amount": 0.00,
    "refund_reason": null
  },
  "delivery": {
    "delivery_method": "pickup", // "delivery", "pickup", "curbside"
    "delivery_status": "ready_for_pickup", // "pending", "shipped", "delivered"
    "estimated_delivery_time": ISODate,
    "delivery_address": {
      "street": "123 Main St",
      "city": "New York",
      "state": "NY",
      "zip_code": "10001",
      "country": "USA"
    }
  }
}
```
---
This structure ensures that each business operates independently with its own data and services. Let me know if further refinements are needed! 🚀
