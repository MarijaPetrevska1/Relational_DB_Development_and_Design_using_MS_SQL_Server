# 🛒 E-Commerce Database Project

This repository contains the **E-Commerce SQL Database** created for practice purposes.  
It demonstrates **database design, relational modeling, and complex SQL queries** for an online store scenario.

---

## 📌 Database Overview

The project simulates a simple **online store** with the following main entities:

### **1️⃣ Customers**
- Stores customer information (name, email, phone, registration date)  
- `CustomerId` as the primary key

### **2️⃣ Categories**
- Product categories (e.g., Electronics, Clothing)  
- `CategoryId` as the primary key

### **3️⃣ Products**
- Product details (name, price, stock, category, active status)  
- Linked to **Categories** via `CategoryId`  
- Enforces **data integrity** using `CHECK` constraints

### **4️⃣ Orders**
- Customer orders  
- Tracks `OrderDate` and `Status`  
- Linked to **Customers** via `CustomerId`

### **5️⃣ OrderItems**
- Products included in each order  
- Tracks `Quantity` and `UnitPrice`  
- Linked to **Orders** and **Products**

---

## ⚡ Features & SQL Concepts

- **Database Creation**: `CREATE DATABASE`, `CREATE TABLE`  
- **Constraints**: `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`, `DEFAULT`  
- **Joins**: `INNER JOIN`, `LEFT JOIN` for querying related tables  
- **Functions & Stored Procedures**: reusable SQL code for calculations and operations  
- **Triggers** (optional): automated actions based on events  
- **Backup & Restore**: techniques to secure and restore the database  

