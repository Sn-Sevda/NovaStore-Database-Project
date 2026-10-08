USE NovaStoreDB;
GO

--4. İleri Seviye Veri Tabanı Nesneleri

--a. View: Müşteri Sipariş Özeti
IF OBJECT_ID('vw_CustomerOrderSummary', 'V') IS NOT NULL
    DROP VIEW vw_CustomerOrderSummary;
GO

CREATE VIEW vw_CustomerOrderSummary AS
SELECT
    c.FullName AS [Müşteri Adı],
    o.OrderID AS [Sipariş No],
    o.OrderDate AS [Sipariş Tarihi],
    o.TotalAmount AS [Toplam Tutar]
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
GO


--b. View test etme ve çağırma 
SELECT * FROM vw_CustomerOrderSummary
ORDER BY [Sipariş Tarihi] DESC;
GO

--c. VeriTabanı Yedeği Alma (FULL DATABASE BACKUP)
BACKUP DATABASE NovaStoreDB
TO DISK = '/var/opt/mssql/data/NovaStoreDB_Backup.bak'
WITH FORMAT,
     MEDIANAME = 'SQLServerBackups',
     NAME = 'NovaStoreDB Full Backup';
GO