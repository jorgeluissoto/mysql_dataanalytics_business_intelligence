-- COUNT
-- applicable to both numeric and non-numeric 
SELECT 
    COUNT(salary)
FROM
    salaries;

-- COUNT DISTINCT
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries; 

/* How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question. */
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

-- SUM
/* What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997? */
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- MIN and MAX 
/* 1. Which is the lowest employee number in the database?

2. Which is the highest employee number in the database? */
SELECT 
    MIN(emp_no), MAX(emp_no)
FROM
    employees;

-- AVG 
/* What is the average annual salary paid to employees who started after the 1st of January 1997? */
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- ROUND
/*  Round the average amount of money spent on salaries for all contracts that started after 
the 1st of January 1997 to a precision of cents. */
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- IFNULL and COALESCE
/* they do not make any changes to the data set. They merely create an output where certain 
data values appear in place of NULL values */

/* Select the department number and name from the ‘departments_dup’ table and add a third column where 
you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.*/

-- JOINS
DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup

(

    dept_no,

    dept_name

)SELECT

                *

FROM

                departments;

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT *
FROM departments_dup;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002';
    
-- INNER JOINS
/* Extract a list containing information about all managers’ employee number, first and last name, 
department number, and hire date.*/

SELECT 
    dm.emp_no, first_name, last_name, dept_no, hire_date
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no;
