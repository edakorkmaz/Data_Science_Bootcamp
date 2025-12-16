CREATE TABLE "developers" (
    "id" SERIAL NOT NULL,
    "company_name" VARCHAR(255) NOT NULL,
    "country" VARCHAR(100) NOT NULL,
    "founded_year" INTEGER NOT NULL );

ALTER TABLE
    "developers" ADD PRIMARY KEY ("id");

CREATE TABLE "games" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL,
    "release_date" DATE NOT NULL,
    "rating" DECIMAL(3, 1) NOT NULL,
    "developer_id" INTEGER NOT NULL);

ALTER TABLE
    "games" ADD PRIMARY KEY ("id");

CREATE TABLE "genres" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(255) NOT NULL);

ALTER TABLE
    "genres" ADD PRIMARY KEY ("id");

CREATE TABLE "games_genres" (
    "id" SERIAL NOT NULL,
    "game_id" INTEGER NOT NULL,
    "genre_id" INTEGER NOT NULL);

ALTER TABLE
    "games_genres" ADD PRIMARY KEY ("id");

ALTER TABLE
    "games" ADD CONSTRAINT "games_developer_id_foreign"
    FOREIGN KEY ("developer_id") REFERENCES "developers" ("id");

ALTER TABLE
   "games_genres" ADD CONSTRAINT "games_genres_game_id_foreign"
    FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE
    "games_genres" ADD CONSTRAINT "games_genres_genre_id_foreign"
    FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda', 'USA', 1986),
('Valve', 'USA', 1996),
('Ubisoft', 'France', 1986);

INSERT INTO genres (name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'Açık dünya keşif odaklı oyunlar'),
('Horror', 'Korku temalı oyunlar'),
('FPS', 'First Person Shooter'),
('Sports', 'Spor temalı oyunlar');

INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 590.90, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 690.90, '2020-12-10', 7.8, 1),
('GTA V', 390.99, '2013-09-17', 9.6, 2),
('Red Dead Redemption 2', 575.99, '2018-10-26', 9.7, 2),
('Skyrim', 290.99, '2011-11-11', 9.4, 3),
('Doom Eternal', 395.90, '2020-03-20', 8.9, 3),
('Half-Life 2', 195.99, '2004-11-16', 9.8, 4),
('CS:GO', 550.00, '2012-08-21', 9.0, 4),
('Assassin’s Creed Valhalla', 495.00, '2020-11-10', 8.5, 5),
('Far Cry 5', 290.99, '2018-03-27', 8.3, 5);

--INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), 
(1, 2), 
(2, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 1),
(5, 2),
(6, 4),
(7, 4),
(8, 4),
(9, 1),
(9, 2),
(10, 4),
(10, 2);

--Tüm oyunların fiyatını %10 düşür
UPDATE games
SET price = price * 0.90;

SELECT * FROM games;

--Bir oyunun rating değerini güncelle
UPDATE games
SET rating = 9.0
WHERE id = 9;

--Bir oyunu tamamen silme
DELETE FROM games_genres
WHERE game_id = 2;

DELETE FROM games
WHERE id = 2;

SELECT * FROM games WHERE id = 2;

--Oyunun adı, Fiyatı ve Geliştirici Firmanın Adını yan yana getirinen sorgu
SELECT 
    g.title,
    g.price,
    d.company_name
FROM games g
JOIN developers d ON g.developer_id = d.id;

--RPG" türündeki oyunların adını ve puanını listeleyen sorgu
SELECT 
    g.title,
    g.rating
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres gr ON gg.genre_id = gr.id
WHERE gr.name = 'RPG';

--: Fiyatı 500 TL üzerinde olan oyunları pahalıdan ucuza doğru sıralayan sorgu
SELECT * FROM games
WHERE price > 500
ORDER BY price DESC;

--İçinde "War" kelimesi geçen oyunları listeleyen sorgu
SELECT * FROM games
WHERE title ILIKE '%War%';



	