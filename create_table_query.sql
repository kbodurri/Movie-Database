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
	genre_name	CHAR(30)	NOT NULL,
	genre_id	SERIAL,
PRIMARY KEY (genre_id) );

CREATE TABLE Movies ( 
	movie_id	SERIAL,
	title	CHAR(30)	NOT NULL,
	rating	REAL	NOT NULL,
	release_date	DATE	NOT NULL,
PRIMARY KEY (movie_id) );

CREATE TABLE film_people ( 
    role_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, person_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (person_id) REFERENCES People (person_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES Roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE film_genre ( 
    movie_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);