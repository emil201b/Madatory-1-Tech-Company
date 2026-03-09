CREATE DATABASE IF NOT EXISTS tech_company DEFAULT CHARACTER SET utf8;
USE tech_company;
DROP TABLE if exists employees;
DROP TABLE if exists departments;

CREATE TABLE departments (	
	department_number INTEGER,
	department_name VARCHAR(30),
	office_location VARCHAR(30),
	PRIMARY KEY (department_number)
); 

CREATE TABLE employees (	
	employee_number INTEGER,
	employee_name VARCHAR(30),
	job_title VARCHAR(30),
	manager_id INTEGER,
	hire_date DATE,
	salary DECIMAL(10,2),
	commission DECIMAL(10,2),
	department_number INTEGER,
	PRIMARY KEY (employee_number),
	FOREIGN KEY (department_number) REFERENCES departments(department_number)
);
 

INSERT INTO departments (department_number, department_name, office_location) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO departments (department_number, department_name, office_location) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO departments (department_number, department_name, office_location) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO departments (department_number, department_name, office_location) VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22',  1250, 500, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, NULL);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO employees (employee_number, employee_name, job_title, manager_id, hire_date, salary, commission, department_number) VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

COMMIT;

Single Table Assignments:

1. Find the employee number for employees named MARTIN.
mysql> SELECT employee_number
    -> FROM employees
    -> WHERE employee_name = 'MARTIN';
+-----------------+
| employee_number |
+-----------------+
|            7654 |
+-----------------+
1 row in set (0.01 sec)

2. Find the employee(s) with a salary greater than 1500.
mysql> SELECT *
    -> FROM employees
    -> WHERE salary > 1500;
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
| employee_number | employee_name | job_title | manager_id | hire_date  | salary  | commission | department_number |
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
|            7499 | ALLEN         | SALESMAN  |       7698 | 1981-02-20 | 1600.00 |     300.00 |                30 |
|            7566 | JONES         | MANAGER   |       7839 | 1981-04-02 | 2975.00 |       NULL |                20 |
|            7698 | BLAKE         | MANAGER   |       7839 | 1981-05-01 | 2850.00 |       NULL |                30 |
|            7782 | CLARK         | MANAGER   |       7839 | 1981-06-09 | 2450.00 |       NULL |                10 |
|            7788 | SCOTT         | ANALYST   |       7566 | 1987-04-19 | 3000.00 |       NULL |                20 |
|            7839 | KING          | PRESIDENT |       NULL | 1981-11-17 | 5000.00 |       NULL |              NULL |
|            7902 | FORD          | ANALYST   |       7566 | 1981-12-03 | 3000.00 |       NULL |                20 |
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
7 rows in set (0.00 sec)

3. List the names of salesmen that earn more than 1300.
mysql> SELECT employee_name
    -> FROM employees
    -> WHERE job_title = 'SALESMAN'
    -> AND salary >1300;
+---------------+
| employee_name |
+---------------+
| ALLEN         |
| TURNER        |
+---------------+
2 rows in set (0.00 sec)

4. List the names of employees that are not salesmen.
mysql> SELECT employee_name
    -> FROM employees
    -> WHERE job_title <> 'SALESMAN';
+---------------+
| employee_name |
+---------------+
| SMITH         |
| JONES         |
| BLAKE         |
| CLARK         |
| SCOTT         |
| KING          |
| ADAMS         |
| JAMES         |
| FORD          |
| MILLER        |
+---------------+
10 rows in set (0.00 sec)

5. List the names of all clerks together with their salary with a deduction of 10%.
mysql> SELECT employee_name,
    -> salary,
    -> salary * 0.9 AS salary_after_deduction
    -> FROM employees
    -> WHERE job_title = 'CLERK';
+---------------+---------+------------------------+
| employee_name | salary  | salary_after_deduction |
+---------------+---------+------------------------+
| SMITH         |  800.00 |                720.000 |
| ADAMS         | 1100.00 |                990.000 |
| JAMES         |  950.00 |                855.000 |
| MILLER        | 1300.00 |               1170.000 |
+---------------+---------+------------------------+
4 rows in set (0.01 sec)

6. Find the name of employees hired before May 1981.
mysql> SELECT employee_name
    -> FROM employees
    -> WHERE hire_date < '1981-05-01';
+---------------+
| employee_name |
+---------------+
| SMITH         |
| ALLEN         |
| WARD          |
| JONES         |
+---------------+
4 rows in set (0.01 sec)

7. List employees sorted by salary in descending order (i.e. highest salary first).
mysql> SELECT *
    -> FROM employees
    -> ORDER BY salary DESC;
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
| employee_number | employee_name | job_title | manager_id | hire_date  | salary  | commission | department_number |
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
|            7839 | KING          | PRESIDENT |       NULL | 1981-11-17 | 5000.00 |       NULL |              NULL |
|            7788 | SCOTT         | ANALYST   |       7566 | 1987-04-19 | 3000.00 |       NULL |                20 |
|            7902 | FORD          | ANALYST   |       7566 | 1981-12-03 | 3000.00 |       NULL |                20 |
|            7566 | JONES         | MANAGER   |       7839 | 1981-04-02 | 2975.00 |       NULL |                20 |
|            7698 | BLAKE         | MANAGER   |       7839 | 1981-05-01 | 2850.00 |       NULL |                30 |
|            7782 | CLARK         | MANAGER   |       7839 | 1981-06-09 | 2450.00 |       NULL |                10 |
|            7499 | ALLEN         | SALESMAN  |       7698 | 1981-02-20 | 1600.00 |     300.00 |                30 |
|            7844 | TURNER        | SALESMAN  |       7698 | 1981-09-08 | 1500.00 |       0.00 |                30 |
|            7934 | MILLER        | CLERK     |       7782 | 1982-01-23 | 1300.00 |       NULL |                10 |
|            7521 | WARD          | SALESMAN  |       7698 | 1981-02-22 | 1250.00 |     500.00 |                30 |
|            7654 | MARTIN        | SALESMAN  |       7698 | 1981-09-28 | 1250.00 |    1400.00 |                30 |
|            7876 | ADAMS         | CLERK     |       7788 | 1987-05-23 | 1100.00 |       NULL |                20 |
|            7900 | JAMES         | CLERK     |       7698 | 1981-12-03 |  950.00 |       NULL |                30 |
|            7369 | SMITH         | CLERK     |       7902 | 1980-12-17 |  800.00 |       NULL |                20 |
+-----------------+---------------+-----------+------------+------------+---------+------------+-------------------+
14 rows in set (0.00 sec)

8. List departments sorted by location.
mysql> SELECT *
    -> FROM departments
    -> ORDER BY office_location;
+-------------------+-----------------+-----------------+
| department_number | department_name | office_location |
+-------------------+-----------------+-----------------+
|                40 | OPERATIONS      | BOSTON          |
|                30 | SALES           | CHICAGO         |
|                20 | RESEARCH        | DALLAS          |
|                10 | ACCOUNTING      | NEW YORK        |
+-------------------+-----------------+-----------------+
4 rows in set (0.01 sec)

9. Find name of the department located in New York.
mysql> SELECT department_name
    -> FROM departments
    -> WHERE office_location = 'NEW YORK';
+-----------------+
| department_name |
+-----------------+
| ACCOUNTING      |
+-----------------+
1 row in set (0.00 sec)

10. You have proven your worth at the company. Your colleague comes to you trying to remember what's-his-name. It starts with a J and ends with S. Can you help her?
mysql> SELECT employee_name
    -> FROM employees
    -> WHERE employee_name LIKE 'J%S';
+---------------+
| employee_name |
+---------------+
| JONES         |
| JAMES         |
+---------------+
2 rows in set (0.00 sec)

11. Maybe that wasn't helpful. "Oh yeah, I remember now!" they say and tell you that he is a manager.
mysql> SELECT employee_name
    -> FROM employees
    -> WHERE employee_name LIKE 'J%S'
    -> AND job_title = 'MANAGER';
+---------------+
| employee_name |
+---------------+
| JONES         |
+---------------+
1 row in set (0.00 sec)

Aggregate functions:

1. List the number of employees.
mysql> SELECT COUNT(*) AS number_of_employees
    -> FROM employees;
+---------------------+
| number_of_employees |
+---------------------+
|                  14 |
+---------------------+
1 row in set (0.02 sec)

2. List the sum of all salaries (excluding commission which are bonuses added to the base salaries).
mysql> SELECT SUM(salary) AS total_salary
    -> FROM employees;
+--------------+
| total_salary |
+--------------+
|     29025.00 |
+--------------+
1 row in set (0.00 sec)

3. List the average salary for employees in department 20.
mysql> SELECT AVG(salary) AS average_salary
    -> FROM employees
    -> WHERE department_number = 20;
+----------------+
| average_salary |
+----------------+
|    2175.000000 |
+----------------+
1 row in set (0.00 sec)

4. List the unique job titles in the company.
mysql> SELECT DISTINCT job_title
    -> FROM employees;
+-----------+
| job_title |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.01 sec)

5. List total sum of salary and commission for all employees.
mysql> SELECT SUM(salary + commission) AS total_money_earned
    -> FROM employees;
+--------------------+
| total_money_earned |
+--------------------+
|            7800.00 |
+--------------------+
1 row in set (0.00 sec)

mysql>
