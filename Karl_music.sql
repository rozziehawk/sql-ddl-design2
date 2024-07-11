-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_title TEXT NOT NULL
);
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
 );
CREATE TABLE artists_songs
(
  artist_id INTEGER REFERENCES artists(id),
  song_id INTEGER REFERENCES songs(id)
);

CREATE TABLE albums_songs
(
  album_id INTEGER REFERENCES albums(id),
  song_id INTEGER REFERENCES songs(id)
);
CREATE TABLE producers_songs
(
  producer_id INTEGER REFERENCES producers(id),
  song_id INTEGER REFERENCES songs(id)
);
ALTER TABLE artists_songs ADD PRIMARY KEY (artist_id,song_id);
ALTER TABLE albums_songs ADD PRIMARY KEY (album_id, song_id);
ALTER TABLE producers_songs ADD PRIMARY KEY (producer_id, song_id);

INSERT INTO artists
    (name)
VALUES
    ('Hanson'),
    ('Queen'),
    ('Mariah Carey'),
    ('Boyz II Men'),
    ('Lady Gaga'),
    ('Bradley Cooper'),
    ('Nickelback'),
    ('Jy Z'),
    ('Alicia Keys'),
    ('Katy Perry'),
    ('Juicy J'),
    ('Maroon 5'),
    ('Christina Aguilera'),
    ('Avril Lavigne'),
    ('Destiny''s Child');

--INSERT INTO songs
--  (title, duration_in_seconds, release_date, artists, album, producers)
--VALUES
 -- ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
