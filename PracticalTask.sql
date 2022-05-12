
CREATE TABLE 
	customer (
		customer_id serial PRIMARY KEY  NOT NULL,
		name VARCHAR(255) NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL,
		phone CHAR(13) NOT NULL,
		CONSTRAINT chk_phone CHECK (phone not like '%[^0-9]%'),
		age SMALLINT DEFAULT 99 CHECK (age>=18), 
		address VARCHAR(255),
		city VARCHAR(255),
		postal_code INT CHECK (postal_code>0),
		country VARCHAR(255),
		consent_status BOOLEAN NOT NULL,
		is_profile_active BOOLEAN NOT NULL,
		date_profile_created timestamp DEFAULT CURRENT_timestamp,
		date_profile_deactivated timestamp,
		reason_for_deactivation VARCHAR(255),
		notes TEXT);

 --Insert values in particular columns:
INSERT INTO 
	customer (customer_id, name, email, phone, age, address, city, postal_code, country, consent_status, is_profile_active) 		 			 
VALUES 
(1, 'Mark', 'mark@abv.bg', +359888444561, 25, 'Bulgaria', 'Sofia', 359, 'BG', true, true), 
(2, 'Alice', 'alice@jit.bg', +359878448561, 26, 'Greece', 'Athens', 478, 'Greece', false, true),
(3, 'Bob', 'bob@fsdg.bg', +359878447561, 46, 'Bulgaria', 'Sliven', 368, 'Bulgaria', true, false),
(4, 'Charlie', 'charlie@gmail.bg', +359678444561, 64, 'Bulgaria', 'Ruse', 258, 'Bulgaria', true, true);

--Insert only with mandatory fields:
INSERT INTO 
	customer (customer_id, name, email, phone, consent_status, is_profile_active) 	 	
VALUES 
(5, 'Mike', 'mike@abv.bg', +359888944561, true, true), 
(6, 'Nicol', 'nicol@gmail.com', +356578944561, true, true);

--Insert with all fields:
INSERT INTO 
	customer 
VALUES 
(7, 'Mark', 'maddssrk@av.bg', +3598444561, 30, 'Bulgaria, Sofia, Gorublqne', 
 'Sofia', 359, 'Bulgaria', true, true, DEFAULT,DEFAULT, NULL,
 'Note: Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
 Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
 when an unknown printer took a galley of type and scrambled it to make a type
 specimen book. It has survived not only five centuries, but also the leap into
 electronic typesetting, remaining essentially unchanged. It was popularised in 
 the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
 and more recently with desktop publishing software like Aldus PageMaker 
 including versions of Lorem Ipsum'), 
 
 (8, 'Majjrk', 'madfjtyjssrk@abv.bg', +3592244561, 45, 'Bulgaria, Sofia, Mladost', 
 'Sofia', 359, 'Bulgaria', true, true, DEFAULT,DEFAULT, NULL,
 'Note: Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
 Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
 when an unknown printer took a galley of type and scrambled it to make a type
 specimen book. It has survived not only five centuries, but also the leap into
 electronic typesetting, remaining essentially unchanged. It was popularised in 
 the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
 and more recently with desktop publishing software like Aldus PageMaker 
 including versions of Lorem Ipsum');
 
 INSERT INTO 
	customer (customer_id, name, email, phone, age, city, postal_code, country, consent_status, is_profile_active) 		 			 
VALUES 
(9, 'Irk', 'mrk@abv.bg', +359888444561, 25,  'Sofia', 359, 'BG', true, true), 
(10, 'Ace', '5alice@jit.bg', +359888444561, 26,  'Athens', 478, 'Greece', false, true),
(11, 'Cjob', 'dbob@fsdg.bg', +359888444561, 46,  'Sliven', 368, 'Bulgaria', true, false),
(12, 'Caie', 'c2harlie@gmail.bg', +359888444561, 64, 'Ruse', 258, 'Bulgaria', true, true);
 
 
 -------------------------------------------


 --1:1 relationship between customers and customers_addresses tables:
CREATE TABLE 
	customer_address (
		address_id SERIAL PRIMARY KEY NOT NULL,
		customer_id INT NOT NULL,
		address VARCHAR(255),
		city VARCHAR(255) NOT NULL, 
		province VARCHAR(255),
		state_UK VARCHAR(255),
		postal_code INT CHECK (postal_code > 0),
		country VARCHAR(255) NOT NULL,
		CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
		);


--INSERT some of the fields:
INSERT INTO 
	customer_address (customer_id, address, city, state_UK, postal_code, country) 	 	
VALUES 
	(3, '200 Westminster Bridge Road, London, SE1 7UT, United Kingdom', 'London', 'UK', 5211, 'United Kingdom'),
	(1, 'St Katharines Way, London, E1W 1LD, United Kingdom', 'London', 'UK', 5211, 'United Kingdom'),
	(5, '11 Blackfriars Street, Manchester, M3 5AL, United Kingdom', 'Manchester', 'UK', 8911, 'United Kingdom'),
	(6, '1 Morrison Link, Edinburgh, EH3 8DN, United Kingdom', 'Edinburgh', 'UK', 1211, 'United Kingdom'),
	(2, '3-5 Portland Street, Manchester, M1 6DP, United Kingdom', 'Manchester', 'UK', 5295, 'United Kingdom'),
	(4, 'Great Colmore Street, Birmingham, B15 2AP, United Kingdom', 'Birmingham', 'UK', 3737, 'United Kingdom');
	
	
---------------------------------------------------------------


CREATE TABLE 
	supplier (
		supplier_id serial PRIMARY KEY NOT NULL,
		name VARCHAR(255) NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL,
		phone CHAR(13) UNIQUE NOT NULL,
		CONSTRAINT chk_phone CHECK (phone not like '%[^0-9]%'),
		age SMALLINT DEFAULT 99 CHECK (age>=18), 
		address VARCHAR(255),
		city VARCHAR(255),
		postal_code INT CHECK (postal_code>0),
		country VARCHAR(255),
		consent_status BOOLEAN NOT NULL,
		is_profile_active BOOLEAN NOT NULL,
		date_profile_created timestamp DEFAULT CURRENT_timestamp,
		date_profile_deactivated timestamp,
		reason_for_deactivation VARCHAR(255),
		notes TEXT
		);

 --Insert values in columns:
INSERT INTO 
	supplier (supplier_id, name, email, phone, age, address, city, postal_code, country, consent_status, is_profile_active) 		 			 
VALUES 
	(1, 'Mile', 'ml@abv.bg', +359888444561, 25, 'Bulgaria', 'Sofia', 359, 'BG', true, true), 
	(2, 'Adeline', 'ad@jit.bg', +359878448561, 26, 'Greece', 'Athens', 478, 'Greece', false, true),
	(3, 'Bo', 'bob@fsdg.bg', +359878447561, 46, 'Bulgaria', 'Sliven', 368, 'Bulgaria', true, false),
	(4, 'Vasil', 'va@gmail.bg', +359678444561, 64, 'Bulgaria', 'Ruse', 258, 'Bulgaria', true, true);


--Insert only with mandatory fields:
INSERT INTO 
	supplier (supplier_id, name, email, phone, consent_status, is_profile_active) 	 	
VALUES 
	(5, 'Vivian', 'vive@abv.bg', +359888944561, true, true), 
	(6, 'Nicolina', 'nicl@gmail.com', +356578944561, true, true);

--Insert with all fields:
INSERT INTO 
	supplier 
VALUES 
	(7, 'Mak', 'madsrk@av.bg', +3598444561, 30, 'Bulgaria, Sofia, Gorublqne', 
 'Sofia', 359, 'Bulgaria', true, true, DEFAULT,DEFAULT, NULL,
 'Note: Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
 Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
 when an unknown printer took a galley of type and scrambled it to make a type
 specimen book. It has survived not only five centuries, but also the leap into
 electronic typesetting, remaining essentially unchanged. It was popularised in 
 the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
 and more recently with desktop publishing software like Aldus PageMaker 
 including versions of Lorem Ipsum');

 
 -----------------------------------------

--1:1 relationship between suppliers and suppliers_addresses tables
CREATE TABLE 
	supplier_address (
		address_id SERIAL PRIMARY KEY NOT NULL,
		supplier_id INT NOT NULL,
		address VARCHAR(255),
		city VARCHAR(255) NOT NULL, 
		province VARCHAR(255),
		state_UK VARCHAR(255),
		postal_code INT CHECK (postal_code > 0),
		country VARCHAR(255) NOT NULL,
		CONSTRAINT fk_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
		);
		
		
--INSERT mandatory fields:
INSERT INTO 
	supplier_address (supplier_id, city, country) 	 	
VALUES 
	(5, 'Ruse', 'Bulgaria'),
	(4, 'Haskovo','Bulgaria'),
	(2, 'Momchilgrad','Bulgaria'),
	(3, 'Svilengrad', 'Bulgaria');

--INSERT some of the fields:
INSERT INTO 
	supplier_address (supplier_id, address, city, province, postal_code, country) 	 	
VALUES 
	(1, '4-10 Kir Blago Todev Street, Bansko 2770, Bulgaria', 'Bansko', 'Bansko',3127, 'Bulgaria'),
	(7, '1, Gourko Str., 1000 Sofia, Bulgaria', 'Sofia', 'Sofia',3237, 'Bulgaria'),
	(6, 'Kosherinata Str, Green Life Sky & Spa Resort, 1 Floor, Bansko 2770, Bulgaria',
	'Bansko', 'Bansko',5478, 'Bulgaria');
	
----------------------------------------


--1: many  relationship between customers and orders	
CREATE TABLE 
	orders (
		order_id SERIAL PRIMARY KEY,
		customer_id INT NOT NULL,
		is_order_completed BOOLEAN NOT NULL,
		is_order_payed BOOLEAN NOT NULL,
		date_of_order timestamp DEFAULT CURRENT_timestamp NOT NULL,
		date_order_completed timestamp,
		CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
		);
		
		
INSERT INTO 
	orders 	 	
VALUES 
 	(1, 1, false, false),
 	(2, 3, false, true),
 	(3, 2, true, true),
 	(4, 5, true, true),
 	(5, 2, false, false),
 	(6, 4, true, true),
 	(7, 1, true, false);
		
----------------------------------------------		


--1: many relationship between suppliers and products_inventory
CREATE TABLE 
	product_inventory (
		product_id SERIAL PRIMARY KEY,
		supplier_id INT NOT NULL,
		product_name VARCHAR(255) NOT NULL,
		available_quantity INT NOT NULL,
		product_type VARCHAR(255) NOT NULL,
		price_without_VAT MONEY NOT NULL,
		price_with_VAT MONEY NOT NULL,
		is_product_in_stock BOOLEAN NOT NULL,
		warehouse VARCHAR(255) NOT NULL,		
		CONSTRAINT fk_supplier_id FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id)
		);


INSERT INTO 
 	product_inventory 	 	
 VALUES 
	(1, 1, 'bread', 50, 'food', 1.5,  1.8, true, 'Sofia'),
	(2, 4, 'chocolate', 150, 'food', 2,  2.12, true, 'Sliven'),
	(3, 5,  'milk', 37, 'food', 2.2,  2.64, true, 'Karlovo'),
	(4, 6, 'fish', 12, 'food', 5.2,  6.24, true, 'Burgas'),
	(5, 1, 'fish', 0, 'food', 5.2,  6.24, false, 'Varna'),
	(6,2,'cheese', 84, 'food', 9.8,  11.76, true, 'Burgas'),
	(7, 5, 'cheese', 0, 'food', 9.8,  11.76, false, 'Velingrad'),
	(8, 4,  'whater', 135, 'drink', 1,  1.25, true, 'Devin'),
	(9, 6, 'whater', 150, 'drink', 1.2,  1.44, true, 'Velingrad'),
	(10, 3, 'Marble Land', 49, 'wine', 27,  32.40, true, 'Ivailovgrad'),
	(11, 3, 'Vino Reserve Ivaylovgrad', 49, 'wine', 18,  21.60, true, 'Ivailovgrad'),
	(12, 3, 'Merlot Grand Reserve', 62, 'wine', 15,  18, true, 'Ivailovgrad'),
	(13, 3, 'Villa Armira Merlot', 59, 'wine', 7,  8.40, true, 'Ivailovgrad'),
	(14, 2, 'Roses Yamantievs', 0, 'wine', 12,  14.40, false, 'Sofia'),
	(15, 3,'Roses Yamantievs', 89, 'wine', 12,  14.40, true, 'Ivailovgrad'),
	(16, 5, 'fresh orange', 3, 'drink', 5.2,  6.24, true, 'Sofia'),
	(17, 4, 'apple', 67, 'fruit', 2.3,  2.76, true, 'Karlovo'),
	(18, 1, 'strawberries', 0, 'fruit', 5.2,  6.24, false, 'Sofia'),
	(19, 3, 'strawberries', 65, 'fruit', 5.2,  6.24, true, 'Ivailovgrad'),
	(20, 7, 'banana', 0, 'fruit', 5.2,  6.24, false, 'Vidin');
	
---------------------------------------------
	
--many:many relationship between orders and products_inventory table with the ordered quantity	

CREATE TABLE 
	orders_products (
		order_id INT REFERENCES orders (order_id) ON UPDATE CASCADE ON DELETE CASCADE,
		product_id INT REFERENCES product_inventory (product_id) ON UPDATE CASCADE,
		ordered_quantity INT NOT NULL,
		CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id)
		);	
		
INSERT INTO 
	orders_products	 	
VALUES 
 	(1, 9, 10),
 	(2, 7, 2),
 	(3, 2, 1),
 	(4, 5, 150),
 	(5, 6, 35),
 	(6, 4, 56),
	(7, 5, 78);

----------------------------------------------------------------------------------------------

---VIEWS:
--customers_contact_info: all customers contact information - phone, address and etc.

DROP VIEW customers_contact_info;

CREATE VIEW 
	customers_contact_info as
SELECT 
	name, phone, a.address
FROM
	customer c
FULL OUTER JOIN 
	customer_address a
ON
	c.customer_id = a.customer_id;	

		
--customers_active_orders: customer id, name and phone with order id, status and date of ordering
DROP VIEW customers_active_orders;

CREATE VIEW 
	customers_active_orders as
SELECT 
	customer.customer_id, name, phone, order_id, is_order_completed, date_of_order
FROM
	customer
FULL OUTER JOIN 
	orders
ON
	customer.customer_id = orders.customer_id
WHERE
	is_order_completed = false;
	
	
--customers_pending_payments: customer id and name with 
--list of pending orders that are not payed, 
--order date and total sum expected to be payed.

DROP VIEW customers_pending_payments;
	
CREATE VIEW 
	customers_pending_payments as
SELECT 
	customer_id, 
	name, 
	ARRAY_AGG (AL.order_id) as orders_list, 
	is_order_payed, 
	date_of_order, 
	sum(total_sum)
FROM 
		(SELECT DISTINCT
			c.customer_id, 
			c.name, 
			o.order_id, 
			o.is_order_payed, 
			o.date_of_order, 
			product_inventory.price_with_vat * o_p.ordered_quantity as total_sum
		FROM 
		
		  	customer as c
		INNER JOIN 
			orders as o
		ON 
			c.customer_id = o.customer_id
		LEFT JOIN
			orders_products as o_p
		ON 
			o.order_id = o_p.order_id
		LEFT JOIN 
			product_inventory
		ON
			o_p.product_id = product_inventory.product_id
		 
		WHERE 
			o.is_order_payed = false) as AL	
GROUP BY 
	customer_id,
	name,
	is_order_payed, 
	date_of_order;
	

--supplier_inventory: supplier id, name and phone with available products (qty > 0),
--quantity, price with and without VAT and the warehouse the item is located
CREATE VIEW 
	supplier_inventory as
SELECT 
	supplier.supplier_id, name, phone, available_quantity, 
	price_without_VAT, price_with_VAT, warehouse
FROM
	supplier
FULL OUTER JOIN
	product_inventory as products
ON 
	supplier.supplier_id = products.supplier_id
WHERE 
	available_quantity > 0
ORDER BY 
	supplier_id;
	
---------------------------
	
CREATE VIEW 
	supplier_inventory as
SELECT 
	supplier.supplier_id, name, phone, available_quantity, 
	price_without_VAT, price_with_VAT, supplier.city as warehouse_location
FROM
	supplier
FULL OUTER JOIN
	product_inventory as products
ON 
	supplier.supplier_id = products.supplier_id
WHERE 
	available_quantity > 0
ORDER BY 
	supplier_id;
	

--customer_ordered_items: customer id and name with ordered product and product type
CREATE VIEW 
	customer_ordered_items as
SELECT 
	customer_id, name, product_name, product_type
FROM
		(SELECT 
			c_orders.customer_id, c_orders.name, o_p.order_id, o_p.product_id 
		FROM 
				(SELECT 
					c.customer_id, c.name, o.order_id
				FROM 
					customer c
				RIGHT OUTER JOIN 
					orders o
				ON
					c.customer_id=o.customer_id
				ORDER BY
					customer_id) as c_orders
		LEFT OUTER JOIN 
				orders_products as o_p
		ON 	
			c_orders.order_id = o_p.order_id) as order_products_ids
LEFT OUTER JOIN
			product_inventory
ON 
	order_products_ids.product_id = product_inventory.product_id
ORDER BY
	customer_id;
	
	
--phones: a union of all suppliers and customers ids, names and phone numbers
CREATE VIEW 
	phones as
	SELECT 
		customer_id, name, phone
	FROM
		customer
	
UNION

	SELECT 
		supplier_id, name, phone
	FROM
		supplier;
		
--Create scripts returning:	
--list of customers whos phone number is listed as phone number of another customer

SELECT 
	ARRAY_AGG(customer_id) as customer_ids_same_phones,
	ARRAY_AGG(name) as customer_names_same_phones,
	phone
FROM 
	customer c
WHERE 
	phone IS NOT NULL
GROUP BY
	phone;

--using left and right joins, 
--find customers without orders and orders without active customers:

--find customers without orders:
SELECT 
	c.customer_id, name
FROM
	customer c
LEFT OUTER JOIN 
	orders o
ON
	c.customer_id = o.customer_id
WHERE 
	order_id IS NULL
ORDER BY c.customer_id;
	

--orders without active customers:
SELECT 
	o.order_id, c.is_profile_active
FROM
	customer c
RIGHT OUTER JOIN 
	orders o
ON
	c.customer_id = o.customer_id
WHERE 
	c.is_profile_active = false;
	
	
--using full join, 
--find customers without orders and orders without active customers

--customers without orders
SELECT 
	c.customer_id, name, o.order_id
FROM
	customer c
FULL OUTER JOIN 
	orders o
ON
	c.customer_id = o.customer_id
ORDER BY c.customer_id;
	
	
--orders without active customers
SELECT 
	o.order_id, c.is_profile_active
FROM
	orders o
FULL OUTER JOIN 
	customer c
ON
	c.customer_id = o.customer_id
WHERE 
	c.is_profile_active = false;