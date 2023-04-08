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



-- Exercise 3

-- What animals belong to Melody Pond?

SELECT name, full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
 SELECT animals.name, species.name as type_of_species
 FROM animals
 JOIN species ON animals.species_id = species.id
 WHERE species.name = 'pokemon';
 
--  List all owners and their animals, remember to include those that don't own any animal.

SELECT name, full_name
FROM animals
RIGHT JOIN owners on animals.owner_id = owners.id;

-- How many animals are there per species?

SELECT species.name as species, count(*) as Number_of_Animals
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name, species.name, owners.full_name as owner
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell ' 
AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, owners.full_name as owner, escape_attempts
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester '
AND escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, count(animals.name)
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY 2 desc
LIMIT 1;
