-- 1. Find the employee(s) who earns the maximum salary.
select name from employee where salary = (select max(salary) from employee);

-- 2. List employees who earn more than the average salary of all employees.
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 3. Find the department name of the employee ‘Omkar Rao’.
select departmentName from department where departmentID = (select departmentID from employee where name = "Omkar Rao");

--  Subquery with IN, NOT IN, and EXISTS
-- 6. List employees who work in the same department as ‘Bhavna Mehra’.
select name from employee where DepartmentID = (select DepartmentID from employee where Name = "Bhavna Mehra");

-- 7. Find employees who are not managers of anyone.
select name from employee where EmployeeID != ManagerID;  

-- 8. List departments that have no employees.
select d.departmentID,count(e.Employeeid)  from Employee E, department D WHERE E.DepartmentID=D.departmentID  GROUP BY DepartmentID; 

-- 9. Find employees who belong to departments located in ‘Delhi’ or ‘Mumbai’.
select * from employee where departmentID in (select d.DepartmentID from department as d where location = "Delhi" or "Mumbai");

-- 10. List employees who have the same salary as someone else.
select * from employee e1 where exists (select salary from employee e2 where e1.salary=e2.salary and e1.employeeID != e2.employeeID);

-- 11. Find employees whose salary is greater than the average salary of their department.
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 12. List employees who are the only one in their department.
(select d.departmentID,count(e.Employeeid)  from Employee E, department D WHERE E.DepartmentID=D.departmentID  GROUP BY DepartmentID); 

-- 13. Find departments where every employee earns more than 50,000.
select D.departmentName from department as d where d.departmentID = (select e.DepartmentID from employee as e where salary>50000);
