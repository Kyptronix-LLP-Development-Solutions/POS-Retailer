---

### **1. Firestore Database Structure**

#### **Root Collections**
We'll have three major collections to organize the data: `customers`, `sellers`, and `admin`. Under each collection, we can store relevant sub-collections and documents.

---

### **1.1. Customer Data Structure**

#### **`customers` Collection**
- **Document ID (UID)**: Unique ID for each customer (Firebase Auth UID or custom ID).
  - **personal_details**:
    - `first_name`: String
    - `last_name`: String
    - `email`: String
    - `phone_number`: String
    - `profile_picture`: URL (optional)
  - **addresses**: Array of objects (can have multiple addresses)
    - `address_line_1`: String
    - `address_line_2`: String (optional)
    - `city`: String
    - `state`: String
    - `zip_code`: String
    - `country`: String
    - `is_default`: Boolean (whether it’s the default address)
  - **loyalty_points**:
    - `points_balance`: Number (points accumulated by the customer)
    - `reward_history`: Array of objects
      - `reward_id`: String (reference to the reward redeemed)
      - `points_used`: Number
      - `date_redeemed`: Timestamp
  - **payment_methods**:
    - `payment_method_id`: String (reference to stored payment method)
    - `card_type`: String (e.g., Visa, MasterCard)
    - `card_number`: String (encrypted)
    - `expiry_date`: String
  - **order_history**: Array of order references (each order ID is a reference to the `orders` collection)
  - **notifications_preferences**:
    - `order_updates`: Boolean
    - `promotions`: Boolean
    - `sales_alerts`: Boolean
    - `new_arrivals`: Boolean
  - **cart**: Array of product references (products added to the cart)
    - `product_id`: String (product reference)
    - `quantity`: Number
    - `added_at`: Timestamp

#### **`orders` Collection (for Customer Orders)**
- **Document ID**: Unique order ID.
  - `customer_id`: Reference to the customer document
  - `order_items`: Array of order item objects
    - `product_id`: String (reference to the product)
    - `quantity`: Number
    - `price`: Number
    - `discount`: Number (if applicable)
  - `total_price`: Number
  - `shipping_address`: Reference to the `customers/{customer_id}/addresses/{address_id}`
  - `order_status`: String (e.g., 'Processing', 'Shipped', 'Delivered')
  - `payment_method`: String (e.g., 'Credit Card', 'Wallet')
  - `payment_status`: String (e.g., 'Paid', 'Pending')
  - `order_date`: Timestamp
  - `delivery_date`: Timestamp (expected)
  - `tracking_number`: String (if available)
  - `is_paid`: Boolean
  - `loyalty_points_used`: Number (points used in the order)
  - `order_notes`: String (optional, customer comments)

---

### **1.2. Seller Data Structure**

#### **`sellers` Collection**
- **Document ID (UID)**: Unique ID for each seller (Firebase Auth UID or custom ID).
  - **business_details**:
    - `store_name`: String
    - `store_logo`: URL (optional)
    - `email`: String
    - `phone_number`: String
    - `business_address`: String
    - `tax_id`: String (optional)
  - **product_listings**: Array of product references (IDs of products they are selling)
  - **inventory**: Array of objects for each product
    - `product_id`: Reference to a product
    - `stock_quantity`: Number
    - `reorder_level`: Number (alert threshold)
    - `price`: Number
  - **sales_insights**:
    - `total_sales`: Number (total sales revenue)
    - `best_selling_product`: Reference to the product
    - `monthly_sales`: Array of numbers (sales per month)
    - `orders_processed`: Number (orders completed by the seller)
  - **order_history**: Array of references to the `orders` collection (for the seller's processed orders)
  - **notifications_preferences**:
    - `order_updates`: Boolean
    - `customer_messages`: Boolean

#### **`products` Collection (for Seller's Products)**
- **Document ID**: Unique product ID.
  - `product_name`: String
  - `category`: String
  - `price`: Number
  - `description`: String
  - `images`: Array of URLs
  - `available_stock`: Number
  - `discount`: Number (optional)
  - `tags`: Array of strings (e.g., "Electronics", "New Arrival")
  - `created_at`: Timestamp
  - `updated_at`: Timestamp

#### **`orders` Collection (for Seller Orders)**
- **Document ID**: Unique order ID.
  - `seller_id`: Reference to the seller document
  - `order_items`: Array of order item objects (products sold)
    - `product_id`: String (reference to the product)
    - `quantity`: Number
    - `price`: Number
  - `order_status`: String (e.g., 'Processing', 'Shipped', 'Delivered')
  - `total_price`: Number
  - `customer_id`: Reference to the customer document
  - `shipping_address`: Reference to the `customers/{customer_id}/addresses/{address_id}`
  - `payment_method`: String (e.g., 'Credit Card', 'Wallet')
  - `order_date`: Timestamp
  - `delivery_date`: Timestamp
  - `tracking_number`: String (if available)
  - `is_paid`: Boolean
  - `refund_status`: String (e.g., 'Pending', 'Approved', 'Denied')

---

### **1.3. Admin Data Structure**

#### **`admin` Collection**
- **Document ID (UID)**: Unique admin user ID (Firebase Auth UID).
  - **personal_details**:
    - `name`: String
    - `email`: String
    - `role`: String (e.g., 'Super Admin', 'Manager')
    - `profile_picture`: URL (optional)
  - **permissions**: Array of strings (e.g., ['manage_users', 'view_sales', 'approve_products'])
  - **last_login**: Timestamp
  - **notifications_preferences**:
    - `system_alerts`: Boolean
    - `new_orders`: Boolean
    - `product_approvals`: Boolean

#### **`logs` Collection (Admin Logs)**
- **Document ID**: Unique log ID.
  - `admin_id`: Reference to the admin document
  - `action`: String (e.g., 'Product Approval', 'User Management')
  - `timestamp`: Timestamp
  - `description`: String (a description of the action)
  - `affected_document_id`: String (ID of the affected document, like `products/{product_id}`)

#### **`products_approval` Collection**
- **Document ID**: Unique product ID.
  - `product_id`: Reference to a product
  - `approval_status`: String (e.g., 'Pending', 'Approved', 'Rejected')
  - `reviewed_by`: Reference to the admin who reviewed it
  - `approval_date`: Timestamp
  - `rejection_reason`: String (optional)

---

### **2. Firebase Storage**

For images, product photos, and profile pictures, Firebase Storage will be used.

#### **Storage Structure**
- **`/profiles/{user_id}/profile_picture.jpg`**: Customer or Seller profile images.
- **`/products/{product_id}/image1.jpg`, `/image2.jpg`, ...**: Product images.
- **`/banners/{banner_id}/banner_image.jpg`**: Promotional banners or app banners.

---

### **3. Firebase Authentication**
Firebase Authentication will handle customer, seller, and admin user sign-ins. Each user will be identified by their unique Firebase UID, which will be used across the database to link their data.

- **Users Collection**:
  - `uid`: String (Firebase Auth UID)
  - `role`: String (e.g., "customer", "seller", "admin")
  - `email`: String
  - `phone_number`: String (optional)

---

### **Summary**
- **Customers**: Store profile details, order history, payment methods, and cart data.
- **Sellers**: Manage product listings, inventory, orders, and sales insights.
- **Admins**: Oversee user management, product approval, order tracking, and system alerts.
- **Database Design**: Firebase Firestore's NoSQL structure is flexible, enabling easy querying and real-time syncing.
