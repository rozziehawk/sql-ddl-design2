-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- from the terminal run:
-- psql < outer_space.sql

CREATE TABLE "planets" (
    "id" SERIAL   NULL,
    "name" TEXT   NOT NULL,
    "orbital_period_in_years" FLOAT   NOT NULL,
    "orbits_around" INTEGER   NOT NULL,
    "galaxy" INTEGER   NOT NULL
);

CREATE TABLE "stars" (
    "id" SERIAL   NOT NULL,
    "TEXT" name   NOT NULL
);

CREATE TABLE "galaxies" (
    "id" SERIAL   NOT NULL,
    "TEXT" name   NOT NULL
);

CREATE TABLE "moons" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "planet_id" INTEGER   NOT NULL
);

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_orbits_around" FOREIGN KEY("orbits_around")
REFERENCES "stars" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_galaxy" FOREIGN KEY("galaxy")
REFERENCES "galaxies" ("id");

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planet_id" FOREIGN KEY("planet_id")
REFERENCES "planets" ("id");

