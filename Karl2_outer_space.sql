-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\C outer_space;

CREATE TABLE "planets" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "orbital_period_in_years" FLOAT   NOT NULL,
    "orbits_around" INTEGER   NOT NULL,
    "galaxy" INTEGER   NOT NULL
);

CREATE TABLE "stars" (
    "id" SERIAL   NOT NULL,
    "name" TEXT    NOT NULL
);

CREATE TABLE "galaxies" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL
);

CREATE TABLE "moons" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "planet_id" INTEGER   NOT NULL
);

ALTER TABLE stars ADD CONSTRAINT star_id_unique_constraint UNIQUE (id);
ALTER TABLE moons ADD CONSTRAINT moon_id_unique_constraint UNIQUE (id);
ALTER TABLE galaxies ADD CONSTRAINT galaxy_id_unique_constraint UNIQUE (id);
ALTER TABLE planets ADD CONSTRAINT planet_id_unique_constraint UNIQUE (id);

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_orbits_around" FOREIGN KEY("orbits_around")
REFERENCES "stars" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_galaxy" FOREIGN KEY("galaxy")
REFERENCES "galaxies" ("id");

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planet_id" FOREIGN KEY("planet_id")
REFERENCES "planets" ("id");

INSERT INTO stars
    (name)
VALUES
    ('The Sun'),
    ('Proxima Centauri'),
    ('Gliese 876');

INSERT INTO galaxies
    (name)
VALUES
    ('Milky Way');


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, (select stars.id from stars where name='The Sun'), (select galaxies.id from galaxis where name='Milky Way')),
  ('Mars', 1.88, (select stars.id from stars where name='The Sun'), (select galaxies.id from galaxis where name='Milky Way'), '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, (select stars.id from stars where name='The Sun'), (select galaxies.id from galaxis where name='Milky Way'), '{}'),
  ('Neptune', 164.8, (select stars.id from stars where name='The Sun'), (select galaxies.id from galaxis where name='Milky Way'), '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, (select stars.id from stars where name='Proxima Centauri'), (select galaxies.id from galaxis where name='Milky Way'), '{}'),
  ('Gliese 876 b', 0.23, (select stars.id from stars where name='Gliese 876'), (select galaxies.id from galaxis where name='Milky Way'), '{}');

  INSERT INTO moons
    (name, planet_id)
VALUES
    ('The Moon', (select id from planets where planets.name= 'Earth')),
    ('Phobos', (select id from planets where planets.name= 'Mars')),
    ('Deimos', (select id from planets where planets.name= 'Mars')),
    ('Naiad', (select id from planets where planets.name= 'Neptune')),
    ('Thalassa', (select id from planets where planets.name= 'Neptune')),
    ('Despina', (select id from planets where planets.name= 'Neptune')),
    ('Galatea', (select id from planets where planets.name= 'Neptune')),
    ('Larissa', (select id from planets where planets.name= 'Neptune')),
    ('S/2004 N 1', (select id from planets where planets.name= 'Neptune')),
    ('Proteus', (select id from planets where planets.name= 'Neptune')),
    ('Triton', (select id from planets where planets.name= 'Neptune')),
    ('Nereid', (select id from planets where planets.name= 'Neptune')),
    ('Halimede', (select id from planets where planets.name= 'Neptune')),
    ('Sao', (select id from planets where planets.name= 'Neptune')),
    ('Laomedia', (select id from planets where planets.name= 'Neptune')),
    ('Psmathe', (select id from planets where planets.name= 'Neptune')),
    ('Neso', (select id from planets where planets.name= 'Neptune'));

