**MongoDB collections structure** for **Sell Sync**.  

---

# **📂 Sell Sync Database Collections (MongoDB)**  

### **1️⃣ Businesses Collection** (Multi-Tenant Setup)  
Stores registered businesses using Sell Sync.  

```json
{
  "_id": ObjectId(),
  "business_name": "TechMart POS",
  "business_owner": ObjectId("ref_user_id"),
  "package_plan": "Premium",  // Free, Standard, Premium
  "created_at": ISODate(),
  "subscription_status": "active",  // active, expired, canceled
  "api_key": "abcd1234efgh5678",  // For API access
  "settings": {
    "currency": "USD",
    "timezone": "America/New_York",
    "tax_inclusive": true
  }
}
```

✅ **Each business operates in isolation with its own data.**  
✅ **API keys are unique for each business.**  

---

### **2️⃣ Stores Collection** (Multi-Location Support)  
Each business can have multiple store locations.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_name": "TechMart - Downtown",
  "location": "123 Main St, NY",
  "phone": "+1 123-456-7890",
  "operating_hours": {
    "open": "09:00 AM",
    "close": "10:00 PM"
  },
  "created_at": ISODate()
}
```

✅ **Businesses can manage multiple stores independently.**  

---

### **3️⃣ Users Collection** (Admin & Staff Management)  
Stores user accounts for each business.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "name": "John Doe",
  "email": "john.doe@example.com",
  "password_hash": "hashed_password",
  "role": "admin",  // admin, manager, cashier
  "permissions": [
    "manage_inventory",
    "process_sales",
    "view_reports"
  ],
  "created_at": ISODate()
}
```

✅ **Role-Based Access Control (RBAC) for staff permissions.**  

---

### **4️⃣ API Keys Collection** (For Business API Access)  
Manages API access for businesses.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "api_key": "xyz9876mnop5432",
  "status": "active",  // active, revoked
  "created_at": ISODate(),
  "last_used": ISODate()
}
```

✅ **Each business gets a unique API key to access their data.**  
✅ **API keys can be revoked if needed.**  

---

### **5️⃣ Products Collection** (Inventory Management)  
Stores all products for a business.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "product_name": "Apple iPhone 15",
  "sku": "IPH15-256GB",
  "barcode": "123456789012",
  "category": "Electronics",
  "price": 999.99,
  "stock": 25,
  "stock_threshold": 5,
  "supplier_id": ObjectId("ref_supplier_id"),
  "created_at": ISODate()
}
```

✅ **Tracks stock levels, categories, and suppliers.**  

---

### **6️⃣ Stock Movements Collection** (Stock Tracking)  
Records stock changes (sales, restocks, transfers).  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "product_id": ObjectId("ref_product_id"),
  "movement_type": "sale",  // sale, restock, adjustment
  "quantity": -2,  
  "handled_by": ObjectId("ref_user_id"),
  "created_at": ISODate()
}
```

✅ **Tracks real-time inventory movements.**  

---

### **7️⃣ Purchase Orders Collection** (Stock Replenishment)  
Handles automatic and manual stock orders.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "supplier_id": ObjectId("ref_supplier_id"),
  "items": [
    {
      "product_id": ObjectId("ref_product_id"),
      "quantity_ordered": 20,
      "unit_price": 950.00
    }
  ],
  "order_status": "pending",
  "expected_delivery": ISODate(),
  "created_at": ISODate()
}
```

✅ **Manages vendor purchases and deliveries.**  

---

### **8️⃣ Suppliers Collection** (Vendor Management)  
Stores supplier details.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "supplier_name": "Apple Inc.",
  "contact_person": "Supplier Manager",
  "email": "supplier@example.com",
  "phone": "+1 123 456 7890",
  "address": "1 Infinite Loop, Cupertino, CA",
  "created_at": ISODate()
}
```

✅ **Links products to suppliers.**  

---

### **9️⃣ Sales Transactions Collection** (POS Transactions)  
Records all sales.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "cashier_id": ObjectId("ref_user_id"),
  "items": [
    {
      "product_id": ObjectId("ref_product_id"),
      "quantity": 1,
      "unit_price": 999.99,
      "total_price": 999.99
    }
  ],
  "payment_method": "Credit Card",
  "total_amount": 999.99,
  "transaction_status": "completed",
  "created_at": ISODate()
}
```

✅ **Manages sales, payments, and receipts.**  

---

### **🔟 Customers Collection** (Loyalty & Purchase History)  
Tracks customer details.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "name": "Alice Johnson",
  "phone": "+1 987 654 3210",
  "email": "alice@example.com",
  "loyalty_points": 250,
  "purchase_history": [
    {
      "transaction_id": ObjectId("ref_transaction_id"),
      "date": ISODate(),
      "amount": 199.99
    }
  ],
  "created_at": ISODate()
}
```

✅ **Manages customer loyalty and purchase tracking.**  

---

### **1️⃣1️⃣ Payment Methods Collection** (Payment Processing)  
Stores available payment methods.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "method_name": "Credit Card",
  "provider": "Stripe",
  "created_at": ISODate()
}
```

✅ **Supports various payment methods.**  

---

### **1️⃣2️⃣ Notifications Collection** (Alerts & Updates)  
Manages system notifications.  

```json
{
  "_id": ObjectId(),
  "business_id": ObjectId("ref_business_id"),
  "store_id": ObjectId("ref_store_id"),
  "user_id": ObjectId("ref_user_id"),
  "message": "Low stock alert for iPhone 15",
  "status": "unread",
  "created_at": ISODate()
}
```

✅ **Tracks alerts, stock warnings, and reminders.**  

---

## **🚀 Summary: Full Collection List**
| **Collection**       | **Purpose** |
|----------------------|------------|
| **Businesses**      | Manages business registrations. |
| **Stores**         | Multi-location store management. |
| **Users**         | Staff accounts & permissions. |
| **API Keys**      | Business-specific API access. |
| **Products**     | Inventory tracking. |
| **Stock Movements** | Stock adjustments. |
| **Purchase Orders** | Automatic & manual stock replenishment. |
| **Suppliers**       | Vendor management. |
| **Sales Transactions** | POS sales processing. |
| **Customers** | Loyalty & customer profiles. |
| **Payment Methods** | Payment integration. |
| **Notifications** | Alerts & system updates. |

