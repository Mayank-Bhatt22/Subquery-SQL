
-- 1. Find the employee(s) who earns the maximum salary.
select name from employee 
where salary = (select max(salary) from employee);

-- 2. List employees who earn more than the average salary of all employees.
SELECT Name, Salary FROM Employee 
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 3. Find the department name of the employee ‘Omkar Rao’.
select departmentName from department where departmentID = 
(select departmentID from employee where name = "Omkar Rao");

-- 4. Find the name of the manager with the highest number of subordinates.
SELECT ManagerID, COUNT(EmployeeID) AS SubordinateCount FROM Employee 
WHERE ManagerID IS NOT NULL GROUP BY ManagerID ORDER BY SubordinateCount DESC LIMIT 1;

SELECT E.Name AS ManagerName, COUNT(*) AS SubordinateCount FROM Employee M
JOIN Employee E ON M.ManagerID = E.EmployeeID GROUP BY E.Name ORDER BY SubordinateCount DESC LIMIT 1;

-- 5. Get employees who joined after the earliest join date in the 'IT' department.
SELECT * FROM Employee WHERE JoinDate > (SELECT MIN(JoinDate) FROM Employee
WHERE DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'IT'));

-- 6. List employees who work in the same department as ‘Bhavna Mehra’.
select name from employee where DepartmentID = 
(select DepartmentID from employee where Name = "Bhavna Mehra");

-- 7. Find employees who are not managers of anyone.
select name from employee where EmployeeID != ManagerID;  

-- 8. List departments that have no employees.
select d.departmentID,count(e.Employeeid)  from Employee E, department D 
WHERE E.DepartmentID=D.departmentID  GROUP BY DepartmentID; 

-- 9. Find employees who belong to departments located in ‘Delhi’ or ‘Mumbai’.
SELECT e.* FROM employee e JOIN department d ON e.departmentid = d.departmentid
WHERE d.location IN ('Delhi', 'Mumbai');

-- 10. List employees who have the same salary as someone else.
select * from employee e1 where exists (select salary from employee e2 
where e1.salary=e2.salary and e1.employeeID != e2.employeeID);

-- 11. Find employees whose salary is greater than the average salary of their department.
SELECT Name, Salary FROM Employee WHERE Salary > 
(SELECT AVG(Salary) FROM Employee);

-- 12. List employees who are the only one in their department.
SELECT e.employeeid, e.name, e.departmentid FROM employee e 
WHERE e.departmentid IN (SELECT departmentid FROM employee GROUP BY departmentid HAVING COUNT(*) = 1);

select * from employee;
insert into department values (6,"COOL GUY","DUCAT"); 
insert INTO EMPLOYEE VALUES (122,"Mayank Bhatt","6",Null,55000,"2025-08-01");

-- 13. Find departments where every employee earns more than 50,000.
SELECT D.DepartmentName FROM Department D JOIN Employee E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName HAVING MIN(E.Salary) > 50000;

-- 14. List employees who are managers and also report to another manager.
SELECT EmployeeID, Name, ManagerID FROM Employee WHERE EmployeeID IN 
( SELECT DISTINCT ManagerID FROM Employee WHERE ManagerID IS NOT NULL) AND ManagerID IS NOT NULL;

-- 15. Find the name of the most recently joined employee in each department.
SELECT departmentid, name, joindate FROM employee e1
WHERE joindate = (SELECT MAX(joindate) FROM employee e2  WHERE e1.departmentid = e2.departmentid) ORDER BY departmentid;

-- 16. Find department-wise total salary using a subquery in the FROM clause.
SELECT dept.departmentid, dept.total_salary FROM (
SELECT departmentid, SUM(salary) AS total_salary FROM employee GROUP BY departmentid) AS dept;

-- 17. Get the top 3 highest-paid employees using subquery.
select * from employee ORDER BY salary desc limit 3;

-- 18. Get the total salary of each department whose average salary is above 55,000.
SELECT departmentid, SUM(salary) AS total_salary FROM employee
GROUP BY departmentid HAVING AVG(salary) > 55000;

SELECT departmentid, SUM(salary) AS total_salary FROM employee WHERE departmentid IN 
(SELECT departmentid FROM employee GROUP BY departmentid HAVING AVG(salary) > 55000)
GROUP BY departmentid;

-- 19. List employees who belong to the top 2 departments with the most employees.
select departmentID,COUNT(EMPLOYEEID) as no_of_employee FROM EMPLOYEE GROUP BY DEPARTMENTID ORDER BY no_of_employee DESC LIMIT 2 ;  

-- 20. Display all employees along with the average salary of their department (using subquery in SELECT). 
select departmentid, avg(salary) as avg_salary from  employee group by departmentid;
