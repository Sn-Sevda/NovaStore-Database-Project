--2. Örnek Veri Ekleme  (DML)

USE NovaStoreDB;
GO

--a. Kategoriler (6 adet: 5 dolu + 1 boş test kategorisi)
INSERT INTO Categories (CategoryName) VALUES
('Elektronik'),
('Giyim'),
('Kitap'),
('Kozmetik'),
('Ev & Yaşam'),
('Spor & Outdoor'); --boş test kategorisi
GO

--b. Ürünler (12 adet)
INSERT INTO Products (ProductName, Price, Stock, CategoryID) VALUES 
('Akıllı Telefon X', 25000.00, 15, 1),      -- Stok < 20 (Sorgu 1 için)
('Kablosuz Kulaklık Pro', 1800.00, 8, 1),    -- Stok < 20
('Dizüstü Bilgisayar 15"', 32000.00, 25, 1),
('Oversize Pamuklu T-Shirt', 350.00, 50, 2),
('Slim Fit Kot Pantolon', 750.00, 12, 2),    -- Stok < 20
('Kışlık Yün Kazak', 900.00, 30, 2),
('SQL Öğreniyorum Kitabı', 120.00, 45, 3),
('Bilim Kurgu Romanı', 85.00, 18, 3),        -- Stok < 20
('Nemlendirici Yüz Kremi', 240.00, 60, 4),
('Güneş Koruyucu Losyon', 320.00, 5, 4),     -- Stok < 20
('Porselen Kahve Fincan Seti', 450.00, 22, 5),
('Bambu Kesme Tahtası', 150.00, 10, 5);      -- Stok < 20
GO

--c. Müşteriler (6 adet)
INSERT INTO Customers (FullName, City, Email) VALUES 
('Ahmet Yılmaz', 'İstanbul', 'ahmet.yilmaz@email.com'), -- Sorgularda özellikle analiz edilecek
('Ayşe Kaya', 'Ankara', 'ayse.kaya@email.com'),
('Mehmet Demir', 'İzmir', 'mehmet.demir@email.com'),
('Zeynep Çelik', 'Bursa', 'zeynep.celik@email.com'),
('Caner Öz', 'Trabzon', 'caner.oz@email.com'),
('Elif Şahin', 'Antalya', 'elif.sahin@email.com');
GO

--d. Siparişler (9 adet)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES 
(1, DATEADD(DAY, -15, GETDATE()), 26800.00), -- Ahmet Yılmaz
(2, DATEADD(DAY, -12, GETDATE()), 1250.00),  -- Ayşe Kaya
(1, DATEADD(DAY, -10, GETDATE()), 120.00),   -- Ahmet Yılmaz (2. siparişi)
(3, DATEADD(DAY, -8, GETDATE()), 32000.00),  -- Mehmet Demir
(4, DATEADD(DAY, -5, GETDATE()), 560.00),    -- Zeynep Çelik
(5, DATEADD(DAY, -4, GETDATE()), 1800.00),   -- Caner Öz
(2, DATEADD(DAY, -3, GETDATE()), 150.00),    -- Ayşe Kaya (2. siparişi)
(6, DATEADD(DAY, -1, GETDATE()), 900.00),    -- Elif Şahin
(1, GETDATE(), 470.00);                      -- Ahmet Yılmaz (3. siparişi)
GO

--e. Sipariş Detayları 
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES 
-- Sipariş 1 (Ahmet Yılmaz: Telefon + Kulaklık)
(1, 1, 1),
(1, 2, 1),

-- Sipariş 2 (Ayşe Kaya: T-Shirt + Kazak)
(2, 4, 1),
(2, 6, 1),

-- Sipariş 3 (Ahmet Yılmaz: SQL Kitabı)
(3, 7, 1),

-- Sipariş 4 (Mehmet Demir: Laptop)
(4, 3, 1),

-- Sipariş 5 (Zeynep Çelik: Güneş Losyonu + Nemlendirici)
(5, 10, 1),
(5, 9, 1),

-- Sipariş 6 (Caner Öz: Kulaklık)
(6, 2, 1),

-- Sipariş 7 (Ayşe Kaya: Bambu Kesme Tahtası)
(7, 12, 1),

-- Sipariş 8 (Elif Şahin: Yün Kazak)
(8, 6, 1),

-- Sipariş 9 (Ahmet Yılmaz: Roman + T-Shirt)
(9, 8, 1),
(9, 4, 1);
GO