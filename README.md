# DMart Billing and Inventory Management System

## Project Overview

DMart Billing and Inventory Management System is a web-based retail management application developed using Spring MVC, PostgreSQL, Bootstrap, AJAX, and Maven.

The system helps cashiers manage products, customers, billing operations, payments, and billing history while maintaining inventory records efficiently.

---

## Features

### Cashier Login

* Secure cashier authentication
* AJAX-based login validation
* Redirect to dashboard after successful login

### Dashboard

* Total Products
* Total Customers
* Total Bills
* Today's Sales
* Revenue Summary
* Recently Sold Products

### Product Management

* Add Product
* View Products
* Search Product by Product ID
* Update Product
* Delete Product

### Customer Management

* Search Customer
* View Customers
* Update Customer Details
* Customer Purchase History

### Billing Module

* Search Customer using Mobile Number
* Register Customer if not found
* Search Product by Product ID
* Add Product to Cart
* Update Product Quantity
* Remove Product from Cart
* Calculate GST
* Generate Bill

### Payment Module

* Cash Payment
* QR Payment

### Receipt Generation

* Generate Receipt
* Print Receipt

### Billing History

* Search Bills
* View Previous Bills
* Print Previous Bills

---

## Technology Stack

### Frontend

* HTML5
* Bootstrap 5
* JavaScript
* jQuery
* AJAX

### Backend

* Spring MVC
* Spring REST Controller
* Spring JDBC (JdbcTemplate)

### Database

* PostgreSQL

### Server

* Apache Tomcat 11

### Build Tool

* Maven

---

## System Architecture

```text
HTML + Bootstrap + jQuery
            |
            V
        AJAX Calls
            |
            V
Spring MVC REST Controller
            |
            V
      Service Layer
            |
            V
         DAO Layer
      (JdbcTemplate)
            |
            V
       PostgreSQL
```

---

## Project Structure

```text
DmartWebApp
│
├── src/main/java
│   ├── com.configuration
│   ├── com.controller
│   ├── com.service
│   ├── com.repository
│   └── com.model
│
├── src/main/webapp
│   ├── index.jsp
│   ├── views
│   └── WEB-INF
│
├── Database
│   └── DmartDB.sql
│
├── pom.xml
│
└── README.md
```

---

## Database Tables

### cashier

```sql
username
password
```

### customers

```sql
customer_id
customer_name
mobile_number
```

### products

```sql
product_id
product_name
category
quantity
price
gst
```

### bills

```sql
bill_id
customer_id
bill_date
total_amount
payment_type
```

### bill_items

```sql
bill_item_id
bill_id
product_id
quantity
price
gst
```

---

## Installation

### Clone Repository

```bash
git clone <repository-url>
```

### Import Project

1. Open Eclipse
2. Import Existing Maven Project
3. Select Project Directory
4. Update Maven Dependencies

### Configure Database

1. Install PostgreSQL
2. Create Database:

```sql
CREATE DATABASE DmartDB;
```

3. Execute:

```text
Database/DmartDB.sql
```

### Configure Database Connection

Update AppConfig.java:

```java
ds.setUrl("jdbc:postgresql://localhost:5432/DmartDB");
ds.setUsername("postgres");
ds.setPassword("your_password");
```

### Run Application

1. Configure Apache Tomcat 11
2. Deploy Project
3. Start Server

Open:

```text
http://localhost:8080/DmartWebApp
```

---

## Future Enhancements

* Sales Reports
* Revenue Reports
* Product-wise Sales Analysis
* PDF Receipt Generation
* Email Receipt
* Inventory Alerts
* Multi-Cashier Support
* Barcode Scanner Integration

---

## License

This project is developed for learning and educational purposes.
