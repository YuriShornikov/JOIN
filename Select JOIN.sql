--3.1
SELECT mg.name, count(m.name) FROM musical_genres mg 
JOIN musical_genres_musicias mgm ON mg.musical_genre_id = mgm.musical_genre_id 
JOIN musicians m ON mgm.musician_id = m.musician_id 
GROUP BY mg.name 
ORDER BY count(m.name);

--3.2
SELECT a.name, count(t.name) FROM ALBUMS A 
JOIN tracks t ON a.album_id = t.album_id 
WHERE a.album_release BETWEEN 2019 AND 2020
GROUP BY a.name 
ORDER BY count(t.name);

--3.3
SELECT a.name, avg(t.time) FROM tracks t 
JOIN albums a ON a.album_id = t.album_id 
GROUP BY a.name 
ORDER BY avg(t.time);

--3.4
SELECT DISTINCT m.name FROM musicians m 
JOIN musicians_albums ma ON m.musician_id = ma.musician_id 
JOIN albums a ON ma.album_id = a.album_id
WHERE m.name != (
	SELECT m.name FROM MUSICIANS M 
	join MUSICIANS_ALBUMS MA ON m.MUSICIAN_ID = ma.MUSICIAN_ID 
	join ALBUMS A ON ma.ALBUM_ID = a.ALBUM_ID
	WHERE a.ALBUM_RELEASE = 2020
	)
ORDER BY m.name;


--3.5
SELECT d.name FROM digests d 
JOIN digests_tracks dt ON d.digests_id = dt.digests_id 
JOIN tracks t ON dt.track_id = t.track_id 
JOIN albums a ON t.album_id = a.album_id 
JOIN musicians_albums ma ON a.album_id = ma.album_id 
JOIN musicians m ON ma.musician_id = m.musician_id 
WHERE m.name ='Виктор Цой' OR m.name ='Михаил Горшенёв'
ORDER BY d.name ;

--3.6
SELECT a.name FROM albums a 
JOIN musicians_albums ma ON a.album_id = ma.album_id 
JOIN musicians m ON ma.musician_id = m.musician_id 
JOIN musical_genres_musicias mgm ON m.musician_id = mgm.musician_id 
JOIN musical_genres mg ON mgm.musical_genre_id = mg.musical_genre_id 
GROUP BY a.name
HAVING count(mgm.musician_id) >= 2;


--3.7
SELECT t.name AS track FROM tracks t 
FULL OUTER JOIN digests_tracks dt ON t.track_id = dt.track_id 
FULL OUTER JOIN digests d ON dt.digests_id = d.digests_id 
WHERE d.name IS NULL 


--3.8
SELECT m.name FROM musicians m 
JOIN musicians_albums ma ON m.musician_id = ma.musician_id 
JOIN albums a ON ma.album_id = a.album_id 
JOIN tracks t ON a.album_id = t.album_id
WHERE t.time = (select min(time) FROM tracks)


--3.9 
SELECT a.name FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.name
HAVING count(t.name) IN (
	SELECT a.name, count(t.name) FROM albums a 
	JOIN tracks t ON a.album_id = t.album_id
	GROUP BY a.name
	ORDER BY count(t.name)
	LIMIT 1
	);

