# Task 1: Database Setup and Schema Design

## Objective
This task focuses on learning how to create databases, define tables, establish relationships, and design ER diagrams for an e-commerce domain.

## Domain
**E-commerce**

## Database Schema
The database consists of the following tables:

- **Customer** – Stores customer details.
- **Category** – Stores product categories.
- **Product** – Stores product details and links to categories.
- **Order** – Stores customer orders.
- **OrderItem** – Stores individual items in an order.
- **Payment** – Stores payment details for orders.

## Sample Data
Sample rows have been inserted in each table to test the schema and relationships.

## Tools Used
- **MySQL Workbench** – For database design and SQL execution.
- **MySQL Server** – For database management.

## Usage Instructions
1. Open **MySQL Workbench**.
2. Execute the SQL script `schema.sql` to create the database and tables.
3. Refer to `ER_diagram.png` to view the relationships between tables.
