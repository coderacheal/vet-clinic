/* Populate database with sample data. */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES (1, 'Agumon', DATE '2020-02-03', 0, true, 10.23),
        (2, 'Gabumon', DATE '2018-11-15', 2, true, 8), 
        (3, 'Pikachu', DATE '2021-01-07', 1, FALSE, 15.04), 
        (4, 'Devimon', DATE '2017-05-12', 5, true, 11);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES (1, 'Agumon', DATE '2020-02-03', 0, true, 10.23),
        (2, 'Gabumon', DATE '2018-11-15', 2, true, 8), 
        (3, 'Pikachu', DATE '2021-01-07', 1, FALSE, 15.04), 
        (4, 'Devimon', DATE '2017-05-12', 5, true, 11),
        (5, 'Charmander', DATE '2020-02-08', 0, false, 11),
        (6, 'Plantmon', DATE '2021-11-15', 2, true, 5.7), 
        (7, 'Squirtle', DATE '1993-04-02', 3, FALSE, 12.13), 
        (8, 'Angemon', DATE '2005-06-12', 1, true, 45),
        (9, 'Boarmon', DATE '2005-06-07', 7, true, 20.4),
        (10, 'Blossom', DATE '1998-10-13', 3, true, 17),
        (11, 'Ditto', DATE '2022-05-14', 4, true, 22);



INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell ', 19),
('Bob ', 45),
('Melody Pond', 77),
('Dean Winchester ', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('pokemon'), ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';


UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Pikachu', 'Gabumon');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon','Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle','Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, DATE '2000-04-23'),
('Maisy Smith', 26, DATE '2019-01-17'),
('Stephanie Mendez', 64, DATE '1981-05-04'),
('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES 
(1, 1),
(3, 1),
(3, 2),
(4, 2);

INSERT INTO visits (animals_id, vet_id, date_of_visit) VALUES 
(1, 1, DATE '2020-05-24'),
(1, 3, DATE '2020-07-22'),
(2, 4, DATE '2021-02-02'),
(3, 2, DATE '2020-01-05'),
(3, 2, DATE '2020-03-08'),
(3, 2, DATE '2020-05-14'),
(4, 3, DATE '2021-05-04'),
(5, 4, DATE '2021-02-24'),
(6, 2, DATE '2019-12-21'),
(6, 1, DATE '2020-08-10'),
(6, 2, DATE '2021-04-07'),
(7, 3, DATE '2019-09-29'),
(8, 4, DATE '2020-10-03'),
(8, 4, DATE '2020-11-04'),
(9, 2, DATE '2019-01-24'),
(9, 2, DATE '2019-05-15'),
(9, 2, DATE '2020-02-27'),
(9, 2, DATE '2020-08-03'),
(10, 3, DATE '2020-05-24'),
(10, 1, DATE '2021-01-11');