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