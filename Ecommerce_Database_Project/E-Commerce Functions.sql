USE EcommerceDB
GO

-- What Functions CAN do:
-- Must return a value (scalar or table)
-- Can be used inside SELECT, WHERE, JOIN, etc.

-- SCALAR FUNCTION - GET FULL NAME

CREATE FUNCTION dbo.GetFullName(@FirstName NVARCHAR(100), @LastName NVARCHAR(100))
RETURNS NVARCHAR(200)
AS
BEGIN 
	RETURN @FirstName + ' ' + @LastName;
END;
GO

SELECT dbo.GetFullName('John', 'Doe') AS FullName;

-- SCALAR FUNCTION - CALCULATE LINE TOTAL 

CREATE FUNCTION dbo.GetLineTotal(@qty INT, @price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN 
	RETURN @qty * @price;
END;
GO

-- TABLE-VALUED FUNCTION - ORDERS OF A CUSTOMER

CREATE FUNCTION dbo.GetOrderByCustomer(@CustomerId INT)
RETURNS TABLE
AS
RETURN (
	SELECT o.OrderId, o.OrderDate, o.Status
	FROM Orders o
	WHERE o.CustomerId=@CustomerId
);
GO