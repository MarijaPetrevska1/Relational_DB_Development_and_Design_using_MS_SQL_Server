-- E-Commerce Database Project

-- Create database
CREATE DATABASE EcommerceDB;
GO

-- Use the database
USE EcommerceDB;
GO
-- Customers

CREATE TABLE Customers (
	CustomerId INT IDENTITY(1,1) PRIMARY KEY CLUSTERED, 
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Email NVARCHAR(150) NOT NULL UNIQUE,
	Phone NVARCHAR(30),
	CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    Name NVARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock INT CHECK (Stock >= 0),
    CategoryId INT NOT NULL,
    IsActive BIT DEFAULT 1,

    CONSTRAINT FK_Product_Category
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(CategoryId)
);

CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    CustomerId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pending',

    CONSTRAINT FK_Order_Customer
        FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId)
);

CREATE TABLE OrderItems (
    OrderItemId INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) CHECK (UnitPrice > 0),

    CONSTRAINT FK_OrderItem_Order
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId),

    CONSTRAINT FK_OrderItem_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
);