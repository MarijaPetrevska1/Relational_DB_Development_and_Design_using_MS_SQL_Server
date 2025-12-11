USE EcommerceDB
GO

-- => STORED PROCEDURES
-- What Stored Procedures CAN do:
-- Can perform actions in the database
-- ✔ INSERT
-- ✔ UPDATE
-- ✔ DELETE
-- ✔ CREATE TABLE
-- ✔ Use transactions

-- CREATE ORDER (Insert)

CREATE PROCEDURE CreateOrder 
	@CustomerId INT
AS
BEGIN
	INSERT INTO Orders (CustomerId)
	VALUES (@CustomerId)

	SELECT SCOPE_IDENTITY() AS NewOrderId;
END;
GO

-- ADD PRODUCT TO AN ORDER

CREATE PROCEDURE AddOrderItem
    @OrderId INT,
    @ProductId INT,
    @Qty INT
AS
BEGIN
    DECLARE @Price DECIMAL(10,2);

    SELECT @Price = Price FROM Products WHERE ProductId = @ProductId;

    INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
    VALUES (@OrderId, @ProductId, @Qty, @Price);
END;
GO

-- => Triggers
-- Trigger е специјален вид stored procedure кој автоматски се извршува кога се случува некој настан во базата на податоци.

-- Настанот може да биде: INSERT, UPDATE или DELETE на одредена табела.

-- Primer:

CREATE TRIGGER trgAfterOrderInsert
ON Orders
AFTER INSERT
AS
BEGIN
    PRINT 'Нова нарачка е внесена!';
END;



