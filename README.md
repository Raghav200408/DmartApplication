# Dmart Billing & Inventory Management System

A modern **Billing & Inventory Management System** developed using **Java, Spring MVC, JSP, PostgreSQL, Bootstrap, AJAX, and jQuery**. This application helps retail stores efficiently manage products, customers, inventory, billing, invoices, and sales with an intuitive web interface.

---

##  Project Overview

Managing retail stores manually can lead to billing errors, stock mismatches, and poor customer management. This project automates the complete retail billing process by providing a centralized platform for product management, customer management, billing, inventory tracking, and invoice generation.

---

##  Features

###  Authentication

* Secure Cashier Login
* Session Management
* Logout Functionality

---

###  Customer Management

* Search Customer by Mobile Number
* Register New Customer
* Automatic Customer Selection for Billing
* Customer Purchase History

---

###  Product Management

* Add New Product
* Update Existing Product
* Delete Product
* Search Product by Product ID
* Upload Product Images
* Low Stock Indicator
* Product Availability Status
* Expiry Date Management
* Bootstrap Success/Error Alerts
* Delete Confirmation Modal

---

###  Cart Management

* Add Products to Cart
* Update Product Quantity
* Remove Products from Cart
* Automatic Cart Total Calculation

---

###  Billing Module

* Generate Customer Bill
* Automatic GST (5%) Calculation
* Grand Total Calculation
* Cash Payment
* UPI Payment
* Automatic Bill Generation
* Automatic Stock Deduction After Billing
* Clear Cart After Successful Billing

---

###  Invoice Module

* Professional Invoice Layout
* Customer Details
* Purchased Product List
* Subtotal
* GST Amount
* Grand Total
* Payment Type
* Invoice Date & Time

---

###  View Bills

* View Complete Billing History
* Search Bills by Bill ID
* View Invoice
* Amount Displayed Including GST

---

###  Inventory Management

* Automatic Stock Reduction
* Low Stock Warning
* Expiry Date Tracking
* Product Availability Status

---

##  Project Architecture

```text
                 Presentation Layer
        (JSP • HTML • CSS • Bootstrap • jQuery)

                         │
                         ▼

                  Spring MVC Controllers

                         │
                         ▼

                    Service Layer

                         │
                         ▼

               Repository (Spring JDBC)

                         │
                         ▼

                    PostgreSQL Database
```

---

#  Technology Stack

## Backend

* Java 21
* Spring Framework (Spring MVC)
* Spring JDBC
* Maven

## Frontend

* JSP
* HTML5
* CSS3
* Bootstrap 5
* JavaScript
* jQuery
* AJAX

## Database

* PostgreSQL

## Server

* Apache Tomcat 11

## IDE

* Eclipse IDE

---

# 📂 Project Structure

```text
DmartWebApp
│
├── src
│   ├── controller
│   ├── service
│   ├── repository
│   ├── model
│   └── configuration
│
├── src/main/resources
│
├── src/main/webapp
│   ├── views
│   ├── css
│   ├── js
│   └── WEB-INF
│
├── Database
│   └── DMART_DATABASE.sql
│
├── pom.xml
│
└── README.md
```

---

#  Database Design

## Tables

* Cashier
* Customers
* Product
* Cart
* Bills
* Bill Items

## Relationships

```text
Customers
   │
   ├──────────────► Cart ◄────────────── Product
   │
   ▼
 Bills
   │
   ▼
Bill Items
   ▲
   │
Product
```

---

#  Application Flow

```text
Cashier Login
       │
       ▼
Dashboard
       │
       ▼
Search Customer
       │
       ├── Existing Customer
       │
       └── Register New Customer
       │
       ▼
Search Products
       │
       ▼
Add Products to Cart
       │
       ▼
Generate Bill
       │
       ▼
Invoice Generation
       │
       ▼
Update Inventory
       │
       ▼
View Bills
```

---


---

#  Installation

## Clone Repository

```bash
git clone https://github.com/charanvamshi91/DmartWebApp.git
```

---

## Import Project

* Eclipse IDE
* Existing Maven Project

---

## Configure Database

Create PostgreSQL Database

```text
Dmart_Database
```

Execute

```text
Database/DMART_DATABASE.sql
```

---

## Configure Database Connection

Update

```java
AppConfig.java
```

with your PostgreSQL credentials.

---

## Run Project

* Apache Tomcat 11
* Open

```text
http://localhost:8080/DmartWebApp
```

---

#  Key Features

* Responsive Bootstrap UI
* MVC Architecture
* Layered Design
* Spring JDBC
* PostgreSQL Integration
* AJAX CRUD Operations
* Product Image Upload
* Dynamic Search
* Session Management
* Bootstrap Alerts
* Delete Confirmation Modal
* Automatic GST Calculation
* Invoice Generation
* Inventory Tracking
* Sales History
* PDF Invoice Download

---

# Future Enhancements

* Enhanced Dashboard Analytics
* Monthly Sales Report
* Barcode Scanner Integration
* Email Invoice
* Product Categories
* Admin Dashboard
* Role Based Authentication
* Enhanced Sales Charts
* Export Reports (Excel/PDF)

---

## ⭐ If you found this project helpful, don't forget to give it a Star on GitHub!
