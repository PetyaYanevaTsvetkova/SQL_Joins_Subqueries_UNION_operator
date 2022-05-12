--Theory:

--FOREIGN KEY on the existing table:
ALTER TABLE child_table 
ADD CONSTRAINT constraint_name 
FOREIGN KEY (fk_columns) 
REFERENCES parent_table (parent_key_columns);

ALTER TABLE child_table
DROP CONSTRAINT constraint_fkey;

ALTER TABLE child_table
ADD CONSTRAINT constraint_fk
FOREIGN KEY (fk_columns)
REFERENCES parent_table(parent_key_columns)
ON DELETE CASCADE;


--SQL table relations:
--Foreign Key constraint
--One-to-One and One-to-Many:
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  name TEXT
)

CREATE TABLE article (
  id SERIAL PRIMARY KEY,
  author_id INT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id)
) 

--one-to-one:
--One employee could have only one valid identity card in our system. 
--One identity card could belong to only one employee. 

--one-to-many:
--For one city, we could have many different customers located in it.


--many-to-many
--one shampoo has many ingredients; 
--one ingredient can be found in many shampoos

--In practical use cases, each article can have multiple tags
--and each tag can be mapped to multiple articles:

CREATE TABLE article (
  id SERIAL PRIMARY KEY,
  title TEXT
)

CREATE TABLE tag (
  id SERIAL PRIMARY KEY,
  tag_value TEXT
)

CREATE TABLE article_tag (
  article_id INT
  tag_id INT
  PRIMARY KEY (article_id, tag_id)
  CONSTRAINT fk_article FOREIGN KEY(article_id) REFERENCES article(id)
  CONSTRAINT fk_tag FOREIGN KEY(tag_id) REFERENCES tag(id)
)


CREATE TABLE product (
  product_id serial PRIMARY KEY  -- implicit primary key constraint
, product    text NOT NULL
, price      numeric NOT NULL DEFAULT 0
);

CREATE TABLE bill (
  bill_id  serial PRIMARY KEY
, bill     text NOT NULL
, billdate date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE bill_product (
  bill_id    int REFERENCES bill (bill_id) ON UPDATE CASCADE ON DELETE CASCADE
, product_id int REFERENCES product (product_id) ON UPDATE CASCADE
, amount     numeric NOT NULL DEFAULT 1
, CONSTRAINT bill_product_pkey PRIMARY KEY (bill_id, product_id)  -- explicit pk
);


--JOINS:
--SELF JOIN
SELECT a.column_name, b.column_name... 
FROM table1 a, table1 b 
WHERE a.common_filed = b.common_field;

CREATE TABLE employee(emp_id varchar(5) NOT NULL,
emp_name varchar(20) NULL,
dt_of_join date NULL,
emp_supv varchar(5) NULL,
CONSTRAINT emp_id PRIMARY KEY(emp_id) ,
CONSTRAINT emp_supv FOREIGN KEY(emp_supv) 
REFERENCES employee(emp_id));

SELECT a.emp_id AS "Emp_ID",a.emp_name AS "Employee Name",
b.emp_id AS "Supervisor ID",b.emp_name AS "Supervisor Name"
FROM employee a, employee b
WHERE a.emp_supv = b.emp_id;


--INNER JOIN:
SELECT 
	table1.column1, table2.column2...
FROM 
	table1
INNER JOIN 
	table2 
ON 
	table1.common_filed = table2.common_field;

SELECT 
	EMP_ID, NAME, DEPT 
FROM 
	COMPANY 
INNER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID;


--LEFT OUTER JOIN:
SELECT ... FROM table1 LEFT OUTER JOIN table2 ON conditional_expression ...

SELECT 
	EMP_ID, NAME, DEPT 
FROM 
	COMPANY 
LEFT OUTER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID;


--RIGHT OUTER JOIN:
SELECT 
	... 
FROM 
	table1 
RIGHT OUTER JOIN 
	table2 
ON 
	conditional_expression ...
	

SELECT 
	EMP_ID, NAME, DEPT 
FROM 
	COMPANY 
RIGHT OUTER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID;


--FULL OUTER JOIN:
SELECT 
	... 
FROM 
	table1 
FULL OUTER JOIN 
	table2 
ON 
	conditional_expression ...


SELECT 
	EMP_ID, NAME, DEPT 
FROM 	
	COMPANY 
FULL OUTER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID;


--UNION
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]

UNION

SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]



SELECT 
	EMP_ID, NAME, DEPT 
FROM 
	COMPANY 
INNER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID

   UNION   
   
SELECT 
	EMP_ID, NAME, DEPT 
FROM 
	COMPANY 
LEFT OUTER JOIN 
	DEPARTMENT
ON 
	COMPANY.ID = DEPARTMENT.EMP_ID;
	
	
--Subqueries
--SELECT:
SELECT 
	*
FROM COMPANY
   WHERE ID IN (SELECT ID
      FROM COMPANY
      WHERE SALARY > 45000) ;
	  
--INSERT:
INSERT INTO COMPANY_BKP
   SELECT * FROM COMPANY
   WHERE ID IN (SELECT ID
      FROM COMPANY) ;
	  
--UPDATE:
UPDATE COMPANY
   SET SALARY = SALARY * 0.50
   WHERE AGE IN (SELECT AGE FROM COMPANY_BKP
      WHERE AGE >= 27 );  
	  
--DELETE:
DELETE FROM COMPANY
   WHERE AGE IN (SELECT AGE FROM COMPANY_BKP
      WHERE AGE > 27 );

	  
  
