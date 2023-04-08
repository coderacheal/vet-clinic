/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals
WHERE date_part('year', date_of_birth) BETWEEN  2016 AND 2019;

SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name = 'Agumon' or name = 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- TRANSACTIONS Exercise 2
UPDATE animals
SET species = 'unspecified';

BEGIN TRANSACTION;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';

COMMIT;

BEGIN;
DELETE FROM
animals;
ROLLBACK;
select * from animals;


BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT del1;

UPDATE animals
SET weight_kg = weight_kg * (-1);

ROLLBACK TO del1;

UPDATE animals
SET weight_kg = weight_kg * (-1);

COMMIT;


-- Queries

-- How many animals are there?
SELECT count(*) FROM animals;

-- How many animals have never tried to escape?
SELECT count(*) FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT avg(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, count(*) FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?

SELECT min(weight_kg), max(weight_kg) FROM animals;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT species, avg(escape_attempts) FROM  animals
WHERE date_part('year', date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;