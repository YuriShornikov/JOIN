CREATE TABLE IF NOT EXISTS musical_genres 
(
	musical_genre_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS musicians
(
	musician_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS musical_genres_musicias
(
	musical_genres_musicias_id SERIAL PRIMARY KEY,
	musician_id SERIAL NOT NULL references musicians(musician_id),
	musical_genre_id SERIAL NOT NULL references musical_genres(musical_genre_id)
);

CREATE TABLE IF NOT EXISTS albums
(
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	album_release INT NOT NULL 
);

CREATE TABLE IF NOT EXISTS musicians_albums
(
	musicians_albums_id SERIAL PRIMARY KEY,
	musician_id SERIAL NOT NULL references musicians(musician_id),
	album_id SERIAL NOT NULL references albums(album_id)
);

CREATE TABLE IF NOT EXISTS digests
(
	digests_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	digests_release INT NOT NULL 
);

CREATE TABLE IF NOT EXISTS tracks
(
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	time INT NOT NULL,
	album_id SERIAL NOT NULL references albums(album_id)
);

CREATE TABLE IF NOT EXISTS digests_tracks
(
	digests_tracks_id SERIAL PRIMARY KEY,
	digests_id SERIAL NOT NULL references digests(digests_id),
	track_id SERIAL NOT NULL references tracks(track_id)
);

INSERT INTO musicians(name)
VALUES('Михаил Горшенёв'), ('Виктор Цой'), ('Александр Васильев'), ('Алексей Горшенёв'), ('Маша Архипова'), ('Олег Степанов'), ('Тилль Линдеманн'), ('Алексей Юзленко');

SELECT * FROM musicians;

INSERT INTO musical_genres(name)
VALUES('Art pank'), ('Rock'), ('Folk metal'), ('Drum n bass'), ('Indastrisl metal');

SELECT * FROM musical_genres;

INSERT INTO albums(name, album_release)
VALUES('Театр демонов', 2010), ('Группа крови', 1988), ('Встречная полоса', 2018), ('Артист', 2016), ('Храм', 2018), ('Древнерусский рейв', 2021), ('Zeit', 2022), ('Жизнь и Смерть', 2020), ('Вымышленный альбом', 2023);

SELECT * from MUSICIANS_ALBUMS MA ;

SELECT * FROM albums;

INSERT into MUSICAL_GENRES_MUSICIAS(musician_id, musical_genre_id)
VALUES(1, 1), (1, 2), (2, 2), (3, 2), (4, 2), (5, 3), (6, 4), (7, 5), (8, 2);

INSERT into MUSICIANS_ALBUMS(musician_id, album_id)
VALUES(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (1, 9), (2, 9);

select * from MUSICIANS_ALBUMS MA 

SELECT * FROM MUSICAL_GENRES_MUSICIAS;

INSERT INTO tracks(name, time, album_id)
VALUES('Фокусник', 213, 1), ('Темный учитель', 276, 1), ('Группа крови', 286, 2), ('В наших глазах', 215, 2), ('Встречная полоса', 268, 3), ('На утро', 244, 3), 
('Артист', 232, 4), ('Шторм', 242, 4), ('Храм', 590, 5), ('Мантра (Интро)', 231, 5), ('Древнерусский рейв', 220, 6), ('На заре', 214, 6), ('Zeit', 322, 7), ('Giffig', 189, 7), ('Жизнь и Смерть', 254, 8), ('Душа', 189, 8);

SELECT * FROM tracks;

INSERT INTO digests(name, digests_release)
VALUES('Быль и Небыль. Том II', 2022), ('Последний герой', 1989), ('Лучшие песни 90х', 1993), ('Рок хиты', 2010), ('Лучшие фолк треки', 2019), ('Das Modell', 1997), ('Rock hits 150', 2021), ('Hold Your Colour', 2005);

select * from DIGESTS D ;

insert into DIGESTS_TRACKS(digests_id, track_id)
VALUES(1, 3), (1, 4), (2, 1), (2, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 9), (5, 10), (7, 1), (7, 3), (7, 5), (7, 6), (7, 7), (7, 8), (7, 15) ;

SELECT * from DIGESTS_TRACKS DT ;

--3.1
select mg.name, count(m.name) from MUSICAL_GENRES MG 
join MUSICAL_GENRES_MUSICIAS MGM on mg.MUSICAL_GENRE_ID = mgm.MUSICAL_GENRE_ID 
JOIN MUSICIANS M on mgm.MUSICIAN_ID = m.MUSICIAN_ID 
GROUP by mg.name 
order by count(m.name);

--3.2
SELECT a.name, count(t.name) from ALBUMS A 
join TRACKS T on a.ALBUM_ID = t.ALBUM_ID 
where a.ALBUM_RELEASE BETWEEN 2019 and 2020
GROUP by a.name 
ORDER by count(t.name);

--3.3
SELECT a.name, avg(t.time) from TRACKS T 
join ALBUMS A on a.ALBUM_ID = t.ALBUM_ID 
group by a.name 
ORDER by avg(t.time);

--3.4
SELECT m.name from MUSICIANS M 
join MUSICIANS_ALBUMS MA on m.MUSICIAN_ID = ma.MUSICIAN_ID 
join ALBUMS A on ma.ALBUM_ID = a.ALBUM_ID
WHERE a.ALBUM_RELEASE  != 2020
GROUP by m.name;

--3.5
SELECT d.name from DIGESTS D 
join DIGESTS_TRACKS DT on d.DIGESTS_ID = dt.DIGESTS_ID 
join TRACKS T on dt.TRACK_ID = t.TRACK_ID 
join ALBUMS A on t.ALBUM_ID = a.ALBUM_ID 
join MUSICIANS_ALBUMS MA on a.ALBUM_ID = ma.ALBUM_ID 
join MUSICIANS M on ma.MUSICIAN_ID = m.MUSICIAN_ID 
WHERE m.name ='Виктор Цой' and m.name ='Михаил Горшенёв'
GROUP by d.name ; -- не выводит инфу

--3.6
SELECT a.name from ALBUMS A 
join MUSICIANS_ALBUMS MA on a.ALBUM_ID = ma.ALBUM_ID 
join MUSICIANS M on ma.MUSICIAN_ID = m.MUSICIAN_ID 
JOIN MUSICAL_GENRES_MUSICIAS MGM on m.MUSICIAN_ID = mgm.MUSICIAN_ID 
JOIN MUSICAL_GENRES MG on mgm.MUSICAL_GENRE_ID = mg.MUSICAL_GENRE_ID 
GROUP by a.name
Having count(mgm.MUSICIAN_ID) >= 2;


--3.7
SELECT t.name as track from TRACKS T 
full outer join DIGESTS_TRACKS DT on t.TRACK_ID = dt.TRACK_ID 
full outer join DIGESTS D on dt.DIGESTS_ID = d.DIGESTS_ID 
where d.name is null 
GROUP by t.name;

--3.8
SELECT m.name from MUSICIANS M 
join MUSICIANS_ALBUMS MA on m.MUSICIAN_ID = ma.MUSICIAN_ID 
join ALBUMS A on ma.ALBUM_ID = a.ALBUM_ID 
join TRACKS T on a.ALBUM_ID = t.ALBUM_ID
WHERE t.time = (select min(time) from TRACKS)
group by m.name;

--3.9
--заполнение таблиц
INSERT into MUSICIANS(name)
VALUES('Бутусов');

INSERT into ALBUMS(name, album_release)
Values('не помню', 2015);

SELECT * from ALBUMS A ;

INSERT into MUSICIANS_ALBUMS(musician_id, album_id)
VALUES(9, 10);

insert into TRACKS(name, time, album_id)
values('10 минут', 200, 10);

SELECT * from TRACKS T 

--3.9 запрос
select a.name from ALBUMS A
join TRACKS T on a.ALBUM_ID = t.ALBUM_ID
group by a.name
having count(t.name) in (
	select min(count) from (
		select a.name, count(t.name) from ALBUMS A 
		join TRACKS T on a.ALBUM_ID = t.ALBUM_ID
		GROUP by a.name
		) as count
	);
