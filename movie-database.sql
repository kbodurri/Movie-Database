CREATE TABLE People ( 
	birth_date	DATE	NOT NULL,
	last_name	CHAR(30)	NOT NULL,
	name	CHAR(30)	NOT NULL,
	person_id	INTEGER	NOT NULL,
PRIMARY KEY (person_id) );

CREATE TABLE Roles ( 
	role_id	INTEGER	NOT NULL,
	role_name	CHAR(30)	NOT NULL,
PRIMARY KEY (role_id) );

CREATE TABLE genre ( 
	genre_id	INTEGER	NOT NULL,
	genre_name	INTEGER	NOT NULL,
PRIMARY KEY (genre_id) );

CREATE TABLE Movies ( 
	movie_id	INTEGER	NOT NULL,
	title	CHAR(30)	NOT NULL,
	rating	REAL	NOT NULL,
	release_date	DATE	NOT NULL,
PRIMARY KEY (movie_id) );

CREATE TABLE film_people ( 
	role_id	INTEGER	NOT NULL,
	person_id	INTEGER	NOT NULL,
	movie_id	INTEGER	NOT NULL,
	FK1_movie_id	INTEGER	NOT NULL,
	FK2_person_id	INTEGER	NOT NULL,
	FK3_role_id	INTEGER	NOT NULL,
PRIMARY KEY (FK1_movie_id, FK2_person_id, FK3_role_id),
UNIQUE (role_id),
UNIQUE (person_id),
UNIQUE (movie_id) );

CREATE TABLE film_genre ( 
	movie_id	INTEGER	NOT NULL,
	genre_id	INTEGER	NOT NULL,
	FK1_movie_id	INTEGER	NOT NULL,
	FK2_genre_id	INTEGER	NOT NULL,
PRIMARY KEY (FK1_movie_id, FK2_genre_id),
UNIQUE (movie_id),
UNIQUE (genre_id) );

ALTER TABLE film_people ADD FOREIGN KEY (FK1_movie_id) REFERENCES Movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE film_people ADD FOREIGN KEY (FK2_person_id) REFERENCES People (person_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE film_people ADD FOREIGN KEY (FK3_role_id) REFERENCES Roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE film_genre ADD FOREIGN KEY (FK1_movie_id) REFERENCES Movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE film_genre ADD FOREIGN KEY (FK2_genre_id) REFERENCES genre (genre_id) ON DELETE CASCADE ON UPDATE CASCADE;

