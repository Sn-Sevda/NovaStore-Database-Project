# 🛒 NovaStore - E-Ticaret Veri Tabanı Yönetim Sistemi

Bu çalışma; ilişkisel veri tabanı tasarımı (DDL), veri manipülasyonu (DML), iş zekası & veri analitiği sorgulamaları (DQL) ve ileri düzey veri tabanı nesnelerini (View & Backup) kapsayan uçtan uca bir Microsoft SQL Server (MSSQL) projesidir.

---

## 📁 Proje Dosya Yapısı ve Ekran Görüntüleri

### 1. Bölüm: Veritabanı ve Tablo Mimarisi (DDL)
* **Dosya:** `NovaStore_Schema.sql`
* `NovaStoreDB` veritabanı ile ilişkisel 5 temel tablo oluşturulmuştur: `Categories`, `Products`, `Customers`, `Orders`, `OrderDetails`.

![Tablo Yapısı](screenshots/table.png)

---

### 2. Bölüm: Örnek Veri Girişi (DML)
* **Dosya:** `NovaStore_Data.sql`
* Test ve analiz senaryolarına uygun ilişkisel veri seti eklenmiştir (6 Kategori, 12 Ürün, 6 Müşteri, 9 Sipariş ve Sipariş Detayları).

---

### 3. Bölüm: İş Zekası ve Analiz Sorguları (DQL)
* **Dosya:** `NovaStore_Queries.sql`

* **Soru 1: Kritik Stok Analizi (WHERE & ORDER BY)**
![1. Sorgu](screenshots/1.sorgu.png)

* **Soru 2: Müşteri Sipariş Bilgileri Raporu (INNER JOIN)**
![2. Sorgu](screenshots/2.sorgu.png)

* **Soru 3: Müşteri Sepet Detay Raporu (5 Tablolu Zincirleme JOIN)**
![3. Sorgu](screenshots/3.sorgu.png)

* **Soru 4: Kategori Bazlı Ürün Dağılımı (LEFT JOIN & COUNT)**
![4. Sorgu](screenshots/4.sorgu.png)

* **Soru 5: Müşteri Ciro Analizi (GROUP BY & SUM)**
![5. Sorgu](screenshots/5.sorgu.png)

* **Soru 6: Zaman Analizi (DATEDIFF & GETDATE)**
![6. Sorgu](screenshots/6.sorgu.png)

---

### 4. Bölüm: İleri Düzey Nesneler ve Güvenlik
* **Dosya:** `NovaStore_Advanced.sql`

* **Sanal Tablo (View) Testi:** `vw_CustomerOrderSummary`
![View Test](screenshots/view_test.png)

* **Tam Veritabanı Yedeği (Backup):**
![Backup](screenshots/backup.png)

---

## 🛠️ Kullanılan Teknolojiler
* **RDBMS:** Microsoft SQL Server 2022
* **Geliştirme Ortamı:** Visual Studio Code (MSSQL Eklentisi)
* **Konteyner Mimarisi:** Docker Desktop (macOS Apple Silicon)
* **Sürüm Kontrolü:** Git & GitHub

---

## 👤 Geliştirici
* **Adı Soyadı:** [Sevda Elif SAYIN]
