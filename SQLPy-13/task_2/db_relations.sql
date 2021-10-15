DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'music_app') THEN

      CREATE ROLE music_app LOGIN PASSWORD 'example';
   END IF;
END
$do$;

SELECT 'CREATE DATABASE music_db WITH owner music_app'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'music_db')\gexec


\c music_db


CREATE TABLE if NOT EXISTS Genre (
    genre_id serial PRIMARY KEY,
    genre VARCHAR (42) UNIQUE NOT NULL
);

CREATE TABLE if NOT EXISTS Authors (
    author_id serial PRIMARY KEY,
    author VARCHAR (42) UNIQUE NOT NULL,
    alias VARCHAR (42),
    genre_id INTEGER NOT NULL REFERENCES Genre(genre_id)
);

CREATE TABLE if NOT EXISTS Albums (
    album_id serial PRIMARY KEY,
    album VARCHAR (42) NOT NULL,
    author_id INTEGER NOT NULL REFERENCES Authors(author_id),
    album_year INTEGER CHECK (album_year > 1100 and album_year < 2100) NOT NULL
);

CREATE TABLE if NOT EXISTS Tracks (
    track_id serial PRIMARY KEY,
    track VARCHAR (42) NOT NULL,
    author_id INTEGER NOT NULL REFERENCES Authors(author_id),
    album_id INTEGER NOT NULL REFERENCES Albums(album_id),
    duration INTERVAL NOT NULL
);
