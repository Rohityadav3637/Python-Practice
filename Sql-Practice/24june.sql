--First, let's create a basic database schema:

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE salary_changes (
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--1. Triggers:
--Triggers are database objects that automatically execute when a specified database event occurs.

--Example: Create a trigger that logs salary changes:


CREATE TRIGGER log_salary_change
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_changes (employee_id, old_salary, new_salary)
        VALUES (NEW.employee_id, OLD.salary, NEW.salary);
    END IF;
END;


--2. Views:
--Views are virtual tables based on the result of a SELECT query.

--Example: Create a view that shows employee information with their department:

CREATE VIEW employee_details AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department,
    e.salary
FROM 
    employees e;

--You can now query this view like a regular table:


SELECT * FROM employee_details WHERE department = 'Sales';

--3. Materialized Views:
--Materialized views are similar to regular views but store the result set physically.

--Example (using PostgreSQL syntax):


CREATE MATERIALIZED VIEW high_salary_employees AS
SELECT *
FROM employees
WHERE salary > 100000
WITH DATA;

