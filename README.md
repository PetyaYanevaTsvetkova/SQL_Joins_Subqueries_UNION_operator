## Project's Title:
	SQL: Joins, Subqueries and the UNION operator

## Project Description:
	Theory:

	SQL table relations

	Foreign Key restraint

	Joins

	Inner Join

	Self join

	Left and Right Join

	Full join

	UNION operator

	Subqueries

	Practical tasks:

	Pre-requisites: customers, customers_addresses and products_inventory tables

	Create suppliers and suppliers_addresses tables (same as customers and customers_addresses tables, reuse script with different names)

	Create orders table with autoincremented PK and the following structure (all fields except date order completed are mandatory):

	Customer

	Is order completed

	Is order payed

	Date of order

	Date order completed

	Create relationships between all existing tables:

	1:1 relationship between customers and customers_addresses tables

	1:1 relationship between suppliers and suppliers_addresses tables

	1: many  relationship between customers and orders

	1: many relationship between suppliers and products_inventory

	many:many relationship between orders and products_inventory table with the ordered quantity

 	*Create views and save as scripts:*

	customers_contact_info: all customers contact information - phone, address and etc.

	customers_active_orders: customer id, name and phone with order id, status and date of ordering

	customers_pending_payments: customer id and name with list of pending orders that are not payed, order date and total sum expected to be payed.

	supplier_inventory: supplier id, name and phone with available products (qty > 0), quantity, price with and without VAT and the warehouse the item is located

	customer_ordered_items: customer id and name with ordered product and product type

	phones: a union of all suppliers and customers ids, names and phone numbers

	Create scripts returning:

	list of customers whos phone number is listed as phone number of another customer

	using left and right joins, find customers without orders and orders without active customers

	using full join, find customers without orders and orders without active customers

	Acceptance criteria:

	As a QA Automation trainee, I want to gain knowledge of 

	how to use joins and UNION operator to extract data from relational database

	how to write subqueries and correlated subqueries

## Table of Contents:
	Task.txt - description of the task;
	Theory.sql - theoretical examples;
	PracticalTask.sql - practical task;
	README.md file

## How to Install and Run the Project:
	Docker needed;
	PosgreSQL client needed
 
## How to Use the Project:
	You need to execute the scripts in PostgreSQL client environment

## Useful links:
	https://www.tutorialspoint.com/postgresql/postgresql_drop_database.htm
	https://www.w3resource.com/sql/joins/perform-a-self-join.php#:~:text=A%20self%20join%20is%20a,other%20row%20of%20the%20table.

## Add a License
	no needed


