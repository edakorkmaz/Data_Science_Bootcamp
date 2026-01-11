-- 1. Bölümler Tablosu
CREATE TABLE bolumler (
    bolum_id SERIAL PRIMARY KEY,
    bolum_adi VARCHAR(100) NOT NULL
);

-- 2. Öğrenciler Tablosu
CREATE TABLE ogrenciler (
    ogrenci_id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    bolum_id INT NOT NULL,
    kayit_tarihi DATE NOT NULL,
    cinsiyet CHAR(1) CHECK (cinsiyet IN ('E', 'K')),
    gno DECIMAL(3,2),

    CONSTRAINT fk_ogrenci_bolum
        FOREIGN KEY (bolum_id)
        REFERENCES bolumler(bolum_id)
        ON DELETE RESTRICT
);

-- 3. Dersler Tablosu
CREATE TABLE dersler (
    ders_id SERIAL PRIMARY KEY,
    ders_adi VARCHAR(100) NOT NULL,
    kredi INT CHECK (kredi > 0),
    bolum_id INT NOT NULL,
    donem VARCHAR(10),

    CONSTRAINT fk_ders_bolum
        FOREIGN KEY (bolum_id)
        REFERENCES bolumler(bolum_id)
        ON DELETE RESTRICT
);

-- 4. Akademisyenler Tablosu
CREATE TABLE akademisyenler (
    ogretmen_id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    unvan VARCHAR(50),
    bolum_id INT NOT NULL,
    ofis_no VARCHAR(20),

    CONSTRAINT fk_akademisyen_bolum
        FOREIGN KEY (bolum_id)
        REFERENCES bolumler(bolum_id)
        ON DELETE RESTRICT
);

-- 5. Notlar Tablosu
CREATE TABLE notlar (
    kayit_id SERIAL PRIMARY KEY,
    ogrenci_id INT NOT NULL,
    ders_id INT NOT NULL,
    vize INT CHECK (vize BETWEEN 0 AND 100),
    final INT CHECK (final BETWEEN 0 AND 100),
    harf_notu CHAR(2),

    CONSTRAINT fk_not_ogrenci
        FOREIGN KEY (ogrenci_id)
        REFERENCES ogrenciler(ogrenci_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_not_ders
        FOREIGN KEY (ders_id)
        REFERENCES dersler(ders_id)
        ON DELETE CASCADE
);

INSERT INTO bolumler (bolum_adi) VALUES
('Bilgisayar Mühendisliği'),
('Yazılım Mühendisliği'),
('Elektrik Elektronik Mühendisliği'),
('Makine Mühendisliği'),
('Endüstri Mühendisliği'),
('İnşaat Mühendisliği'),
('Mekatronik Mühendisliği'),
('Biyomedikal Mühendisliği'),
('Kimya Mühendisliği'),
('Harita Mühendisliği'),
('Matematik'),
('İstatistik'),
('Fizik'),
('Kimya'),
('Biyoloji'),
('İşletme'),
('İktisat'),
('Uluslararası İlişkiler'),
('Kamu Yönetimi'),
('Maliye'),
('Hukuk'),
('Psikoloji'),
('Sosyoloji'),
('Felsefe'),
('Tarih'),
('Coğrafya'),
('Türk Dili ve Edebiyatı'),
('İngiliz Dili ve Edebiyatı'),
('Fransız Dili ve Edebiyatı'),
('Alman Dili ve Edebiyatı'),
('Mimarlık'),
('Şehir ve Bölge Planlama'),
('İç Mimarlık'),
('Grafik Tasarım'),
('Görsel İletişim Tasarımı'),
('Radyo Televizyon Sinema'),
('Gazetecilik'),
('Halkla İlişkiler'),
('Reklamcılık'),
('Hemşirelik'),
('Tıp'),
('Diş Hekimliği'),
('Eczacılık'),
('Beslenme ve Diyetetik'),
('Fizyoterapi'),
('Spor Bilimleri'),
('Çocuk Gelişimi'),
('Okul Öncesi Öğretmenliği'),
('Sınıf Öğretmenliği');

INSERT INTO ogrenciler (ad, soyad, bolum_id, kayit_tarihi, cinsiyet, gno) VALUES
('Ali','Yılmaz',1,'2021-09-15','E',3.10),
('Ayşe','Demir',2,'2021-09-15','K',3.45),
('Mehmet','Kaya',3,'2020-09-14','E',2.85),
('Zeynep','Çelik',4,'2022-09-16','K',3.70),
('Ahmet','Şahin',5,'2020-09-14','E',2.95),
('Elif','Aydın',6,'2021-09-15','K',3.20),
('Mert','Koç',7,'2022-09-16','E',2.60),
('Selin','Arslan',8,'2021-09-15','K',3.80),
('Can','Öztürk',9,'2020-09-14','E',2.40),
('Buse','Yıldız',10,'2022-09-16','K',3.55),

('Emre','Polat',11,'2021-09-15','E',3.00),
('Eda','Korkmaz',1,'2020-09-14','K',3.90),
('Burak','Güneş',2,'2022-09-16','E',2.75),
('Sude','Aksoy',3,'2021-09-15','K',3.25),
('Kerem','Bozkurt',4,'2020-09-14','E',2.50),
('İrem','Taş',5,'2022-09-16','K',3.65),
('Okan','Erdoğan',6,'2021-09-15','E',2.90),
('Naz','Kara',7,'2020-09-14','K',3.40),
('Furkan','Yalçın',8,'2022-09-16','E',2.20),
('Derya','Özdemir',9,'2021-09-15','K',3.75),

('Onur','Kaplan',10,'2020-09-14','E',2.80),
('Merve','Çınar',11,'2022-09-16','K',3.60),
('Hakan','Aslan',12,'2021-09-15','E',2.95),
('Pelin','Sezer',13,'2020-09-14','K',3.30),
('Umut','Kılıç',14,'2022-09-16','E',2.70),
('Gizem','Doğan',15,'2021-09-15','K',3.85),
('Serkan','Yavuz',16,'2020-09-14','E',2.55),
('Nisa','Eren',17,'2022-09-16','K',3.50),
('Batuhan','Karaca',18,'2021-09-15','E',2.65),
('Aslı','Bulut',19,'2020-09-14','K',3.15),

('Cem','Köse',20,'2022-09-16','E',2.45),
('Tuğçe','Acar',21,'2021-09-15','K',3.70),
('Tolga','Keskin',22,'2020-09-14','E',2.90),
('Zehra','Önal',23,'2022-09-16','K',3.55),
('Yiğit','Mutlu',24,'2021-09-15','E',2.60),
('Sena','Işık',25,'2020-09-14','K',3.80),
('Kaan','Bayram',26,'2022-09-16','E',2.75),
('Cansu','Demirtaş',27,'2021-09-15','K',3.35),
('Arda','Özer',28,'2020-09-14','E',2.85),
('Melisa','Gül',29,'2022-09-16','K',3.65);

INSERT INTO dersler (ders_adi, kredi, bolum_id, donem) VALUES
('Programlamaya Giriş',4,1,'Güz'),
('Veri Yapıları',4,1,'Bahar'),
('Nesne Tabanlı Programlama',4,2,'Güz'),
('Veritabanı Sistemleri',3,2,'Bahar'),
('Devre Analizi',4,3,'Güz'),
('Sayısal Elektronik',3,3,'Bahar'),
('Makine Elemanları',4,4,'Güz'),
('Isı Transferi',3,4,'Bahar'),
('Yöneylem Araştırması',3,5,'Güz'),
('Üretim Planlama',3,5,'Bahar'),

('Betonarme',4,6,'Güz'),
('Zemin Mekaniği',3,6,'Bahar'),
('Robotik',4,7,'Güz'),
('Kontrol Sistemleri',3,7,'Bahar'),
('Biyomalzemeler',3,8,'Güz'),
('Tıbbi Görüntüleme',4,8,'Bahar'),
('Organik Kimya',4,9,'Güz'),
('Reaksiyon Kinetiği',3,9,'Bahar'),
('Harita Bilgisi',3,10,'Güz'),
('Jeodezi',4,10,'Bahar'),

('Lineer Cebir',4,11,'Güz'),
('Olasılık',3,11,'Bahar'),
('Genel Fizik',4,12,'Güz'),
('Modern Fizik',3,12,'Bahar'),
('Analitik Kimya',4,13,'Güz'),
('Biyokimya',3,14,'Bahar'),
('İşletmeye Giriş',3,15,'Güz'),
('Mikro İktisat',3,16,'Bahar'),
('Uluslararası Politika',3,17,'Güz'),
('Kamu Hukuku',4,18,'Bahar'),

('Genel Muhasebe',3,19,'Güz'),
('Vergi Hukuku',4,20,'Bahar'),
('Ceza Hukuku',4,21,'Güz'),
('Klinik Psikoloji',3,22,'Bahar'),
('Sosyal Teori',3,23,'Güz'),
('Mantık',2,24,'Bahar'),
('Osmanlı Tarihi',3,25,'Güz'),
('Beşeri Coğrafya',3,26,'Bahar'),
('Edebiyat Kuramları',3,27,'Güz'),
('İleri İngilizce',4,28,'Bahar');

INSERT INTO akademisyenler (ad, soyad, unvan, bolum_id, ofis_no) VALUES
('Ahmet','Yıldırım','Prof. Dr.',1,'A101'),
('Ayşe','Kurt','Doç. Dr.',2,'A102'),
('Mehmet','Demir','Dr. Öğr. Üyesi',3,'A103'),
('Fatma','Çetin','Prof. Dr.',4,'A104'),
('Ali','Şen','Doç. Dr.',5,'A105'),
('Zeynep','Akın','Dr. Öğr. Üyesi',6,'A106'),
('Hakan','Güler','Prof. Dr.',7,'A107'),
('Elif','Sönmez','Doç. Dr.',8,'A108'),
('Murat','Koşar','Dr. Öğr. Üyesi',9,'A109'),
('Derya','Önal','Prof. Dr.',10,'A110'),

('Kemal','Acar','Doç. Dr.',11,'B201'),
('Nermin','Bulut','Dr. Öğr. Üyesi',12,'B202'),
('Serhat','Işık','Prof. Dr.',13,'B203'),
('Sibel','Gök','Doç. Dr.',14,'B204'),
('Volkan','Aslan','Dr. Öğr. Üyesi',15,'B205'),
('Gül','Ergin','Prof. Dr.',16,'B206'),
('Burcu','Taş','Doç. Dr.',17,'B207'),
('Tolga','Yılmaz','Dr. Öğr. Üyesi',18,'B208'),
('Cem','Kara','Prof. Dr.',19,'B209'),
('Pelin','Demirtaş','Doç. Dr.',20,'B210'),

('Emrah','Ekinci','Dr. Öğr. Üyesi',21,'C301'),
('Ebru','Arı','Prof. Dr.',22,'C302'),
('Oğuz','Korkut','Doç. Dr.',23,'C303'),
('Merve','Bay','Dr. Öğr. Üyesi',24,'C304'),
('Hasan','Yavuz','Prof. Dr.',25,'C305'),
('Seda','Kaplan','Doç. Dr.',26,'C306'),
('Uğur','Sevim','Dr. Öğr. Üyesi',27,'C307'),
('Nil','Özkan','Prof. Dr.',28,'C308'),
('Barış','Mutlu','Doç. Dr.',29,'C309'),
('Aslı','Köse','Dr. Öğr. Üyesi',30,'C310');

INSERT INTO notlar (ogrenci_id, ders_id, vize, final, harf_notu) VALUES
(1,1,70,80,'BB'),
(2,2,85,90,'AA'),
(3,3,60,65,'CC'),
(4,4,75,85,'BB'),
(5,5,50,60,'DD'),
(6,6,80,90,'AA'),
(7,7,65,70,'CC'),
(8,8,90,95,'AA'),
(9,9,55,65,'CC'),
(10,10,78,82,'FF'),

(11,11,72,76,'BB'),
(12,12,88,92,'AA'),
(13,13,60,70,'CC'),
(14,14,82,88,'DD'),
(15,15,50,55,'CC'),
(16,16,90,94,'AA'),
(17,17,65,68,'DD'),
(18,18,85,87,'DD'),
(19,19,58,63,'CC'),
(20,20,75,80,'BB'),

(21,21,70,78,'BB'),
(22,22,88,91,'AA'),
(23,23,62,67,'DD'),
(24,24,80,85,'AA'),
(25,25,55,60,'CC'),
(26,26,90,93,'AA'),
(27,27,68,72,'BB'),
(28,28,85,88,'BB'),
(29,29,60,65,'FF'),
(30,30,78,82,'BB'),

(31,1,72,76,'BB'),
(32,2,88,90,'AA'),
(33,3,65,70,'DD'),
(34,4,80,85,'FF'),
(35,5,55,60,'CC'),
(36,6,92,95,'AA'),
(37,7,68,72,'BB'),
(38,8,85,90,'AA'),
(39,9,60,65,'FF'),
(40,10,78,80,'BB');


