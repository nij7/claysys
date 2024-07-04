USE Test;
SELECT * FROM Users;
CREATE TABLE Employees (EmployeeID INT IDENTITY(1,1) PRIMARY KEY,FirstName VARCHAR(20) NOT NULL,LastName VARCHAR(20) NOT NULL,
Salary INT NOT NULL,Department VARCHAR(20),Position VARCHAR(20));

INSERT INTO Employees VALUES 
('nik', 'j', 60000, 'software', 'software Engineer'),
('joel', 'saji', 75000, 'software', 'data analyst'),
('arjun', 'j', 90000, 'software', 'manager'),
('bonny', 'b', 85000, 'marketing', 'manager'),
('chirs', 'a', 65000, 'engineering', 'software Engineer');
SELECT * FROM Employees;
SELECT MAX(Salary) AS SECONDHIGHESTSALARY FROM Employees WHERE Salary <(SELECT MAX(Salary) FROM Employees);

SELECT Department, COUNT(*) AS NumberofEmployees FROM Employees GROUP BY Department;

CREATE TABLE Departments (DepartmentID INT PRIMARY KEY,Department VARCHAR(50) NOT NULL);

INSERT INTO Departments VALUES (1, 'software'),(2, 'marketing'),(3, 'engineering');
UPDATE Departments SET DepartmentID=3 WHERE Department = 'engineering';
SELECT * FROM Departments;

CREATE TABLE Employees(EmployeeID INT PRIMARY KEY,FirstName VARCHAR(50) NOT NULL,LastName VARCHAR(50) NOT NULL,DepartmentID INT,Position VARCHAR(50),
    Salary INT,CONSTRAINT FK_Department_Employees FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

INSERT INTO Employees VALUES 
(1, 'John', 'Doe', 1, 'software', 60000),
(2, 'Jane', 'Smith', 1, 'software engineer', 75000),
(3, 'Alice', 'Johnson', 2, 'marketing', 90000),
(4, 'Bob', 'Brown', 2, 'marketing', 85000),
(5, 'Charlie', 'Davis', 3, 'engineering', 65000),
(6, 'Emily', 'White', NULL, 'Intern', 30000);

DROP TABLE Employees;
DROP TABLE Departments;



