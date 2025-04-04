# Collection Structure
---

### 📁 `users`
Stores all platform users (admins, managers, staff, etc.)

```json
{
  "_id": ObjectId,
  "name": String,
  "email": String,
  "phone": String,
  "role": "admin" | "manager" | "staff",
  "username": String,
  "password_hash": String,
  "store_id": ObjectId,     // Link to the store they belong to
  "status": "active" | "inactive",
  "last_login": Date,
  "permissions": [String],  // Optional granular access
  "created_at": Date,
  "updated_at": Date
}
```

---

### 📁 `stores`
Each store represents a physical or digital POS unit.

```json
{
  "_id": ObjectId,
  "name": String,
  "location": {
    "address": String,
    "city": String,
    "state": String,
    "zip": String,
    "country": String
  },
  "contact_person": String,
  "contact_phone": String,
  "store_type": "retail" | "digital",
  "status": "active" | "suspended",
  "created_at": Date,
  "updated_at": Date
}
```

---

### 📁 `lotteries`
List of lottery games offered.

```json
{
  "_id": ObjectId,
  "name": String,
  "code": String,
  "draw_time": String,
  "prize_structure": [
    {
      "prize_level": String,
      "amount": Number
    }
  ],
  "ticket_price": Number,
  "status": "active" | "inactive",
  "created_by": ObjectId, // user
  "created_at": Date,
  "updated_at": Date
}
```

---

### 📁 `tickets`
Individual tickets sold or generated.

```json
{
  "_id": ObjectId,
  "ticket_number": String,
  "lottery_id": ObjectId,
  "store_id": ObjectId,
  "user_id": ObjectId, // Cashier
  "purchase_datetime": Date,
  "status": "sold" | "cancelled" | "won",
  "winning_amount": Number,
  "draw_date": Date,
  "payment_method": "cash" | "card" | "wallet",
  "device_info": {
    "device_id": String,
    "pos_version": String
  },
  "customer_info": {
    "name": String,
    "phone": String,
    "email": String
  },
  "created_at": Date,
  "updated_at": Date
}
```

---

### 📁 `inventory`
Tracks available tickets per store per lottery.

```json
{
  "_id": ObjectId,
  "store_id": ObjectId,
  "lottery_id": ObjectId,
  "batch_number": String,
  "total_stock": Number,
  "remaining_stock": Number,
  "reorder_threshold": Number,
  "restock_flag": Boolean,
  "last_restocked": Date,
  "created_at": Date
}
```

---

### 📁 `sales`
Logs every transaction (linked to a ticket).

```json
{
  "_id": ObjectId,
  "ticket_id": ObjectId,
  "store_id": ObjectId,
  "user_id": ObjectId,
  "lottery_id": ObjectId,
  "price": Number,
  "payment_method": "cash" | "card" | "wallet",
  "tax": Number,
  "total_amount": Number,
  "sale_time": Date,
  "transaction_id": String,
  "created_at": Date
}
```

---

### 📁 `reports`
Auto-generated or manual reports.

```json
{
  "_id": ObjectId,
  "report_type": "sales" | "inventory" | "performance",
  "store_id": ObjectId,
  "generated_by": ObjectId,
  "period": {
    "start_date": Date,
    "end_date": Date
  },
  "status": "completed" | "failed" | "scheduled",
  "report_url": String,
  "created_at": Date
}
```

---

### 📁 `notifications`
Push/email notifications.

```json
{
  "_id": ObjectId,
  "user_id": ObjectId,
  "title": String,
  "message": String,
  "type": "inventory_alert" | "sales_summary" | "compliance" | "marketing",
  "is_read": Boolean,
  "created_at": Date
}
```

---

### 📁 `audit_logs`
Tracks critical user/system actions (for compliance).

```json
{
  "_id": ObjectId,
  "user_id": ObjectId,
  "action": String,
  "entity_type": String,
  "entity_id": ObjectId,
  "description": String,
  "ip_address": String,
  "device_info": String,
  "timestamp": Date
}
```

---

### ✅ Optional Future Collections

- `marketing_campaigns`: For promos, banners, offers.
- `winning_claims`: For tracking winner claims & payout.
- `wallets`: For digital credit system.
- `draw_results`: To log winning numbers per draw.
- `pos_devices`: If you want to track and control POS hardware remotely.

---
