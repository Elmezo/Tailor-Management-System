# Tailor-Management-System
A system for managing custom-made clothing orders.

---

# 👔 Tailor Management System

A simple business management system designed for **tailoring shops** to manage customers, measurements, orders, and payments efficiently.

This system helps tailors organize their work, track garment orders, store customer measurements, and manage partial payments.

---

# 📌 Features

### 👤 Customer Management

* Add and manage customer information
* Store contact details (phone, address)
* View customer order history

### 📏 Measurement Management

* Store detailed body measurements
* Reuse saved measurements for future orders

Examples of measurements:

* Shoulder
* Chest
* Waist
* Sleeve Length
* Garment Length

---

### 🧵 Order Management

* Create new tailoring orders
* Select garment type (Kaftan, Suit, Shirt, etc.)
* Track order status

Order status examples:

* Pending
* In Progress
* Ready
* Delivered

---

### 💰 Payment Tracking

* Support **partial payments**
* Record deposit and remaining balance
* Track payment history

---

### 📊 Reports

Generate useful reports such as:

* Daily orders
* Pending orders
* Delivered orders
* Customer order history

---

# 🛠 Tech Stack

Backend

* Java / Spring Boot

Frontend

* React.js *(optional)*

Database

* MySQL / MariaDB

Tools

* REST API
* Postman for API testing

---

# 🗄 Database Structure

### Customers

| Field   | Type    |
| ------- | ------- |
| id      | INT     |
| name    | VARCHAR |
| phone   | VARCHAR |
| address | VARCHAR |

---

### Measurements

| Field       | Type  |
| ----------- | ----- |
| id          | INT   |
| customer_id | INT   |
| shoulder    | FLOAT |
| chest       | FLOAT |
| waist       | FLOAT |
| sleeve      | FLOAT |
| length      | FLOAT |

---

### Orders

| Field         | Type    |
| ------------- | ------- |
| id            | INT     |
| customer_id   | INT     |
| garment_type  | VARCHAR |
| order_date    | DATE    |
| delivery_date | DATE    |
| price         | DECIMAL |
| status        | VARCHAR |

---

### Payments

| Field        | Type    |
| ------------ | ------- |
| id           | INT     |
| order_id     | INT     |
| amount       | DECIMAL |
| payment_date | DATE    |

---

# 📷 Screenshots

*(Add screenshots here)*

Example:

```
/screenshots/customer-form.png
/screenshots/order-form.png
/screenshots/invoice.png
```

---

# 🚀 API Examples

Create Customer

```
POST /api/customers
```

Example Request:

```
{
  "name": "Ahmed Ali",
  "phone": "01000000000",
  "address": "Cairo"
}
```

---

Create Order

```
POST /api/orders
```

Example Request:

```
{
  "customer_id": 1,
  "garment_type": "Kaftan",
  "price": 800,
  "delivery_date": "2026-04-01"
}
```

---

# 📈 Future Improvements

* Invoice generation (PDF)
* SMS notification for order completion
* Customer measurement history
* Dashboard for shop performance
* Mobile app for tailors

---

# 🎯 Project Purpose

This project was built as a **real-world business management system** to demonstrate:

* Backend API development
* Database design
* Business workflow implementation
* Order and payment management

---

# 👨‍💻 Author

Developed by
**Abdulrahman Alaaeldeen**

GitHub:
[https://github.com/Elmezo](https://github.com/Elmezo)

---
* أو **API design كامل**
  علشان يبقى مشروع **يقف قدام أي HR بسهولة**.
