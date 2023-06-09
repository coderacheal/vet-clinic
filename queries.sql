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

-- EXERCISE 4

-- Queries

-- Who was the last animal seen by William Tatcher?

SELECT animals.name, vets.name as vet_name, date_of_visit
FROM animals
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY 3 desc
LIMIT 1; 

-- How many different animals did Stephanie Mendez see?
SELECT count(distinct animals.name)
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name AS vet_name, species.name AS species
FROM vets
LEFT JOIN specializations ON specializations.vet_id = vets.id
LEFT JOIN species on species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name, vets.name as vet, visits.date_of_visit
FROM animals
JOIN visits ON animalS.id = visits.animals_id
JOIN vets ON vets.id  = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-01';

-- What animal has the most visits to vets?
SELECT animals.name, count(animals.name) AS no_of_visits
FROM animals
LEFT JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY 2 desc
LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT animals.name 
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY 1
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT animals.name AS pet, vets.name as vet, date_of_visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY 3 desc
LIMIT 1;

--  How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(*) FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animals_id = animals.id
JOIN specializations ON vets.id = specializations.vet_id
WHERE specializations.species_id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(visits.animals_id) AS total_visits
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animals_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY 2 DESC
LIMIT 1;