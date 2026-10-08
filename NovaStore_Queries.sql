USE NovaStoreDB;
GO

--1. Temel Listeleme = Stok miktarı 20'den az olan ürünleri listeleyiniz.
SELECT 
    ProductName AS [Ürün Adı],
    Stock AS [Stok Miktarı]
FROM Products
WHERE Stock < 20
ORDER BY Stock DESC; --Stok miktarına göre azalan sırada listelemek için

--2. Müşteri Sipariş Bilgileri Raporu
SELECT 
    c.FullName AS [Müşteri Adı],
    c.City AS [Şehir],
    o.OrderDate AS [Sipariş Tarihi],
    o.TotalAmount AS [Toplam Tutar]
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC;

--3. Çoklu birleştirme (Ahmet Yılmazın aldığı ürünler)
SELECT
    c.FullName AS [Müşteri Adı],
    p.ProductName AS [Ürün Adı],
    p.Price AS [Fiyat],
    cat.CategoryName AS [Kategori Adı]
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE c.FullName = 'Ahmet Yılmaz';

--4. Kategori Başına Düşen Ürün Sayısı
SELECT
    cat.CategoryName AS [Kategori Adı],
    COUNT(p.ProductID) AS [Toplam Ürün Sayısı]
FROM Categories cat
LEFT JOIN Products p ON cat.CategoryID = p.CategoryID
GROUP BY cat.CategoryName
ORDER BY [Toplam Ürün Sayısı] DESC;

--5. Ciro Analizi
SELECT
    c.FullName AS [Müşteri Adı],
    c.City AS [Şehir],
    SUM(o.TotalAmount) AS [Toplam Ciro]
FROM Customers c  
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName, c.City
ORDER BY [Toplam Ciro] DESC;

--6. Zaman Anlizi (Siparişe göre üzerinden geçen gün sayısı)
SELECT 
    o.OrderID AS [Sipariş No],
    c.FullName AS [Müşteri Adı],
    o.OrderDate AS [Sipariş Tarihi],
    DATEDIFF(DAY, o.OrderDate, GETDATE()) AS [Geçen Gün Sayısı]
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY [Geçen Gün Sayısı] ASC;
