CREATE TABLE People ( 
	birth_date	DATE	NOT NULL,
	last_name	CHAR(30)	NOT NULL,
	name	CHAR(30)	NOT NULL,
	person_id	SERIAL,
PRIMARY KEY (person_id) );

CREATE TABLE Roles ( 
	role_id	SERIAL,
	role_name	CHAR(30)	NOT NULL,
PRIMARY KEY (role_id) );

CREATE TABLE genre ( 
	genre_name	VARCHAR(30)	NOT NULL,
	genre_id	SERIAL,
PRIMARY KEY (genre_id) );

CREATE TABLE Movies ( 
	movie_id	SERIAL,
	title	CHAR(30)	NOT NULL,
	rating	REAL	NOT NULL,
	release_date	DATE	NOT NULL,
PRIMARY KEY (movie_id) );

CREATE TABLE film_people ( 
	FK1_movie_id	INTEGER	NOT NULL,
	FK2_person_id	INTEGER	NOT NULL,
	FK3_role_id	INTEGER	NOT NULL,
        PRIMARY KEY (FK1_movie_id, FK2_person_id, FK3_role_id),
        FOREIGN KEY (FK1_movie_id) REFERENCES Movies(movie_id),
        FOREIGN KEY (FK2_person_id) REFERENCES People(person_id),
        FOREIGN KEY (FK3_role_id) REFERENCES Roles(role_id)
        ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE film_genre ( 
	FK1_movie_id	INTEGER	NOT NULL,
	FK2_genre_id	INTEGER	NOT NULL,
        PRIMARY KEY (FK1_movie_id, FK2_genre_id),
        FOREIGN KEY (FK1_movie_id) REFERENCES Movies(movie_id),
        FOREIGN KEY (FK2_genre_id) REFERENCES genre(genre_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);