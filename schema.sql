/* Database schema to keep the structure of entire database. */

CREATE TABLE animals( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(50), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg FLOAT(8)
);

ALTER TABLE animals ADD species varchar(100);

-- EXERCISE 3

CREATE TABLE owners (id SERIAL PRIMARY KEY, full_name VARCHAR(255), age INT);

CREATE TABLE species (id SERIAL PRIMARY KEY, name VARCHAR(255))

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species (id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners (id);

-- EXercise 4 

CREATE TABLE vets (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255), 
    age INT, 
    date_of_graduation DATE);

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY, 
    species_id INT, 
    vet_id INT,
    FOREIGN KEY (species_id)  REFERENCES species (id),  FOREIGN KEY (vet_id) REFERENCES vets (id));

CREATE TABLE visits (
    id SERIAL PRIMARY KEY, 
    animals_id INT,
    vet_id INT,
    date_of_visit DATE,
    FOREIGN KEY (animals_id) REFERENCES animals (id), FOREIGN KEY (vet_id) REFERENCES vets (id));

