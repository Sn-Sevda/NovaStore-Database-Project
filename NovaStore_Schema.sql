--1. Veri Tabanı Oluşturma ve Tablo Tasarımı (DDL)

--a. Veri Tabanı Oluşturma 
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'NovaStoreDB')
BEGIN
    CREATE DATABASE NovaStoreDB;
END
GO --Kontrol Noktası

USE NovaStoreDB;
GO

--b. Tablo Gereksinimleri (Önce bağımsız ana tablolar, sonra yabancı anahtarlı tablolar)
IF OBJECT_ID('Categories', 'U') IS NOT NULL DROP TABLE Categories;
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY, --otomatik artma
    CategoryName NVARCHAR(50) NOT NULL        --boş geçmemek için
);
GO

--c. Ürünler Tablosu
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY, --otomatik artırma
    ProductName NVARCHAR(100) NOT NULL,      --boş geçmemek için    
    Price DECIMAL(10, 2) NOT NULL CONSTRAINT CHK_Product_Price CHECK (Price >= 0), --fiyat negatif olmaması için    
    Stock INT NOT NULL CONSTRAINT DF_Porduct_Stock DEFAULT 0 CONSTRAINT CHK_Product_Stock CHECK (Stock >= 0), --stok negatif olmaması için
    CategoryID INT NOT NULL,                  --yabancı anahtar
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

--d. Müşteriler Tablosu
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY, --otomatik artma
    FullName NVARCHAR(100) NOT NULL,          --müşteri adı boş geçmemek için
    City NVARCHAR(50) NOT NULL,               --şehir boş geçmemek için
    Email NVARCHAR(100) NOT NULL CONSTRAINT UQ_Customers_Email UNIQUE --email boş geçmemek için, ve benzersiz olmalı
);
GO

--e. Siparişler Tablosu
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY, --otomatik artma
    CustomerID INT NOT NULL,                --yabancı anahtar
    OrderDate DATETIME NOT NULL CONSTRAINT DF_Orders_OrderDate DEFAULT GETDATE(), --sipariş tarihi boş geçmemek
    TotalAmount DECIMAL(10, 2) NOT NULL CONSTRAINT CHK_Orders_TotalAmount CHECK (TotalAmount >= 0), --toplam tutar negatif olmaması için
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

--f. Sipariş Detayları
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
CREATE TABLE OrderDetails (
    DetailID INT IDENTITY(1,1) PRIMARY KEY, --otomatik artma
    OrderID INT NOT NULL,                    --yabancı anahtar
    ProductID INT NOT NULL,                  --yabancı anahtar
    Quantity INT NOT NULL CONSTRAINT CHK_OrderDetails_Quantity CHECK (Quantity > 0),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO