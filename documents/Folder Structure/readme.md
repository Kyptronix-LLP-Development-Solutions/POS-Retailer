**Clean Architecture** folder structure for building the **Sell Sync** backend using **FastAPI**. 
---

## **📂 Clean Architecture Folder Structure (FastAPI)**
```
sell_sync_backend/
│── app/
│   ├── api/                    # API Endpoints (FastAPI Routes)
│   │   ├── v1/
│   │   │   ├── routers/         # Route definitions
│   │   │   │   ├── auth.py
│   │   │   │   ├── businesses.py
│   │   │   │   ├── stores.py
│   │   │   │   ├── users.py
│   │   │   │   ├── products.py
│   │   │   │   ├── sales.py
│   │   │   │   ├── inventory.py
│   │   │   │   ├── customers.py
│   │   │   │   ├── payments.py
│   │   │   │   ├── reports.py
│   │   │   │   ├── notifications.py
│   │   │   ├── dependencies.py  # Dependency Injection
│   │   │   ├── __init__.py
│   │   ├── __init__.py
│   │
│   ├── core/                    # Core Configuration & Security
│   │   ├── config.py            # App Configuration
│   │   ├── security.py          # JWT, Authentication
│   │   ├── database.py          # MongoDB Connection
│   │   ├── __init__.py
│   │
│   ├── models/                   # Data Models (Pydantic)
│   │   ├── business.py
│   │   ├── store.py
│   │   ├── user.py
│   │   ├── product.py
│   │   ├── sale.py
│   │   ├── inventory.py
│   │   ├── customer.py
│   │   ├── payment.py
│   │   ├── report.py
│   │   ├── notification.py
│   │   ├── api_key.py
│   │   ├── __init__.py
│   │
│   ├── repositories/             # Database Interactions (MongoDB Queries)
│   │   ├── business_repo.py
│   │   ├── store_repo.py
│   │   ├── user_repo.py
│   │   ├── product_repo.py
│   │   ├── sale_repo.py
│   │   ├── inventory_repo.py
│   │   ├── customer_repo.py
│   │   ├── payment_repo.py
│   │   ├── report_repo.py
│   │   ├── notification_repo.py
│   │   ├── api_key_repo.py
│   │   ├── __init__.py
│   │
│   ├── services/                 # Business Logic (Use Cases)
│   │   ├── business_service.py
│   │   ├── store_service.py
│   │   ├── user_service.py
│   │   ├── product_service.py
│   │   ├── sale_service.py
│   │   ├── inventory_service.py
│   │   ├── customer_service.py
│   │   ├── payment_service.py
│   │   ├── report_service.py
│   │   ├── notification_service.py
│   │   ├── api_key_service.py
│   │   ├── __init__.py
│   │
│   ├── utils/                     # Utility Functions (Common Helpers)
│   │   ├── hashing.py             # Password Hashing
│   │   ├── email_sender.py        # Send Emails
│   │   ├── logging.py             # Logging Setup
│   │   ├── __init__.py
│   │
│   ├── tests/                     # Unit & Integration Tests
│   │   ├── test_auth.py
│   │   ├── test_business.py
│   │   ├── test_store.py
│   │   ├── test_user.py
│   │   ├── test_product.py
│   │   ├── test_sale.py
│   │   ├── test_inventory.py
│   │   ├── test_customer.py
│   │   ├── test_payment.py
│   │   ├── test_report.py
│   │   ├── test_notification.py
│   │   ├── __init__.py
│
│── .env                          # Environment Variables
│── requirements.txt              # Python Dependencies
│── main.py                       # FastAPI App Entry Point
│── README.md                     # Project Documentation
│── Dockerfile                     # Docker Configuration
│── docker-compose.yml             # Container Orchestration
│── .gitignore                     # Git Ignore Rules
│── prestart.sh                    # Startup Script
│── alembic/                       # Migrations (If needed for SQL databases)
```
