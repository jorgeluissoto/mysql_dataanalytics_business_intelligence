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
