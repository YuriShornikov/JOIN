INSERT INTO musicians(name)
VALUES('Михаил Горшенёв'), ('Виктор Цой'), ('Александр Васильев'), ('Алексей Горшенёв'), ('Маша Архипова'), ('Олег Степанов'), ('Тилль Линдеманн'), ('Алексей Юзленко'), ('Бутусов');

SELECT * FROM musicians;

INSERT INTO musical_genres(name)
VALUES('Art pank'), ('Rock'), ('Folk metal'), ('Drum n bass'), ('Indastrisl metal');

SELECT * FROM musical_genres;

INSERT INTO albums(name, album_release)
VALUES('Театр демонов', 2010), ('Группа крови', 1988), ('Встречная полоса', 2018), ('Артист', 2016), ('Храм', 2018), ('Древнерусский рейв', 2021), ('Zeit', 2022), ('Жизнь и Смерть', 2020), ('Вымышленный альбом', 2023), ('не помню', 2015);

SELECT * FROM albums;

INSERT INTO musical_genres_musicias(musician_id, musical_genre_id)
VALUES(1, 1), (1, 2), (2, 2), (3, 2), (4, 2), (5, 3), (6, 4), (7, 5), (8, 2);

SELECT * FROM musical_genres_musicias mgm;

INSERT INTO musicians_albums(musician_id, album_id)
VALUES(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (1, 9), (2, 9), (9, 10);

SELECT * FROM musicians_albums ma;

INSERT INTO tracks(name, time, album_id)
VALUES('Фокусник', 213, 1), ('Темный учитель', 276, 1), ('Группа крови', 286, 2), ('В наших глазах', 215, 2), ('Встречная полоса', 268, 3), ('На утро', 244, 3), 
('Артист', 232, 4), ('Шторм', 242, 4), ('Храм', 590, 5), ('Мантра (Интро)', 231, 5), ('Древнерусский рейв', 220, 6), ('На заре', 214, 6), ('Zeit', 322, 7), 
('Giffig', 189, 7), ('Жизнь и Смерть', 254, 8), ('Душа', 189, 8), ('10 минут', 200, 10);

SELECT * FROM tracks;

INSERT INTO digests(name, digests_release)
VALUES('Быль и Небыль. Том II', 2022), ('Последний герой', 1989), ('Лучшие песни 90х', 1993), ('Рок хиты', 2010), ('Лучшие фолк треки', 2019), ('Das Modell', 1997), ('Rock hits 150', 2021), ('Hold Your Colour', 2005);

SELECT * FROM digests d;

INSERT INTO digests_tracks(digests_id, track_id)
VALUES(1, 3), (1, 4), (2, 1), (2, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 9), (5, 10), (7, 1), (7, 3), (7, 5), (7, 6), (7, 7), (7, 8), (7, 15) ;

SELECT * FROM digests_tracks dt;