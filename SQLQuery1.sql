USE Test;
CREATE TABLE TestUsers(UserID INT IDENTITY(1,1) PRIMARY KEY,FirstName VARCHAR(20) NOT NULL,LastName VARCHAR(20) NOT NULL,
DateOfBirth DATE NOT NULL,Age INT NOT NULL,Gender VARCHAR(10) NOT NULL,PhoneNo NVARCHAR(10) NOT NULL,
EmailAddress NVARCHAR(50) NOT NULL,Address NVARCHAR(100) NOT NULL,State VARCHAR(30) NOT NULL,City VARCHAR(30) NOT NULL,
Username NVARCHAR(30) UNIQUE NOT NULL,Password NVARCHAR(20));

--create

CREATE PROCEDURE 
CreateTestUsers 
@FirstName VARCHAR(20),@LastName VARCHAR(20),@DateOfBirth DATE,@Age INT,@Gender VARCHAR(10),@PhoneNo NVARCHAR(10),@EmailAddress NVARCHAR(50),@Address NVARCHAR(100),@State VARCHAR(30),@City VARCHAR(30),@Username NVARCHAR(30),@Password NVARCHAR(20) 
AS BEGIN 
INSERT INTO TestUsers (FirstName,LastName,DateOfBirth,Age,Gender,PhoneNo,EmailAddress,Address,State,City,Username,Password)
VALUES(@FirstName,@LastName,@DateOfBirth,@Age,@Gender,@PhoneNo,@EmailAddress,@Address,@State,@City,@Username,@Password);
END

--read

CREATE PROCEDURE ReadTestUser @UserID INT
AS BEGIN
SELECT * FROM TestUsers WHERE UserID=@UserID;
END

--update

CREATE PROCEDURE
UpdateTestUsers 
@UserID INT,
@FirstName VARCHAR(20),@LastName VARCHAR(20),@DateOfBirth DATE,@Age INT,@Gender VARCHAR(10),@PhoneNo NVARCHAR(10),@EmailAddress NVARCHAR(50),@Address NVARCHAR(100),@State VARCHAR(30),@City VARCHAR(30),@Username NVARCHAR(30),@Password NVARCHAR(20) 
AS BEGIN 
UPDATE TestUsers SET FirstName=@FirstName,LastName=@LastName,DateOfBirth=@DateOfBirth,Age=@Age,Gender=@Gender,
PhoneNo=@PhoneNo,EmailAddress=@EmailAddress,Address=@Address,State=@State,City=@City,Username=@Username,Password=@Password
WHERE UserID=@UserID;
END

--Delete

CREATE PROCEDURE DeletetestUser
@UserID INT
AS BEGIN
DELETE FROM TestUsers WHERE UserID=@UserID;
END