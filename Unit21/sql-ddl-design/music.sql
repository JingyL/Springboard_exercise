-- from the terminal run:
-- psql < music.sql

-- DROP DATABASE IF EXISTS music;

-- CREATE DATABASE music;

-- \c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');


--------------------------------------

-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs,
  artists TEXT[] NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs,
  album TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs,
  producers TEXT[] NOT NULL
);

-- titleID, title, duration_in_seconds,release_date, artistid, alblumsid, producersid


INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('MMMBop', 238, '04-15-1997'),
  ('Bohemian Rhapsody', 355, '10-31-1975'),
  ('One Sweet Day', 282, '11-14-1995'),
  ('Shallow', 216, '09-27-2018'),
  ('How You Remind Me', 223, '08-21-2001'),
  ('New York State of Mind', 276, '10-20-2009'),
  ('Dark Horse', 215, '12-17-2013'),
  ('Moves Like Jagger', 201, '06-21-2011'),
  ('Complicated', 244, '05-14-2002'),
  ('Say My Name', 240, '11-07-1999');




--artistid, name

INSERT INTO artists
  (songs_id, artists)
VALUES
  (1, '{"Hanson"}'),
  (2, '{"Queen"}'),
  (3, '{"Mariah Cary"}'),
  (3, '{"Boyz II Men"}'),
  (4, '{"Lady Gaga"}'), 
  (4, '{"Bradley Cooper"}'),
  (5, '{"Nickelback"}'),
  (6, '{"Jay Z"}'), 
  (6,'{"Alicia Keys"}'),
  (7, '{"Katy Perry"}'),
  (7,'{"Juicy J"}'),
  (8, '{"Maroon 5"}'),
  (8, '{"Christina Aguilera"}'),
  (9, '{"Avril Lavigne"}'),
  (10, '{"Destiny''s Child"}');


-- alblumsid, name
INSERT INTO albums
  (songs_id, album)
VALUES
  (1, 'Middle of Nowhere'),
  (2, 'A Night at the Opera'),
  (3, 'Daydream'),
  (4, 'A Star Is Born'),
  (5, 'Silver Side Up'),
  (6, 'The Blueprint 3'),
  (7, 'Prism'),
  (8, 'Hands All Over'),
  (9, 'Let Go'),
  (10, 'The Writing''s on the Wall');

-- producersid, names
INSERT INTO producers
  (songs_id, producers)
VALUES
  (1, '{"Dust Brothers", "Stephen Lironi"}'),
  (2, '{"Roy Thomas Baker"}'),
  (3, '{"Walter Afanasieff"}'),
  (4, '{"Benjamin Rice"}'),
  (5, '{"Rick Parashar"}'),
  (6, '{"Al Shux"}'),
  (7, '{"Max Martin", "Cirkut"}'),
  (8, '{"Shellback", "Benny Blanco"}'),
  (9, '{"The Matrix"}'),
  (10, '{"Darkchild"}');