/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals WHERE name LIKE '%mo                    n';
SELECT * FROM animals WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animals_species;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO animals_species;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
BEGIN;
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';
COMMIT;


SELECT animals.name AS animal_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals  WHERE owners.species= 'Pokemon'
JOIN owners ON animals.species_id = species
WHERE owners.full_name = 'Melody Pond';

SELECT *
FROM animals
WHERE species_id = (SELECT id FROM species WHERE name = 'Pokemon');
SELECT o.full_name AS owner_name, a.name AS animal_name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;
SELECT o.full_name AS owner_name, a.name AS animal_name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
WHERE a.id IS NULL;


SELECT s.name AS species_name, COUNT(*) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name AS digimon_name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT *
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester';

SELECT *
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(*) AS animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT a.name AS animal_name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) AS num_animals_seen
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

SELECT v.name AS vet_name, COALESCE(s.name, 'None') AS specialty_name
FROM vets v
LEFT JOIN specializations sp ON v.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;

SELECT a.name AS animal_name, v.visit_date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
    AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name AS animal_name, COUNT(v.animal_id) AS num_visits
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY num_visits DESC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date, vt.name AS vet_name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.id IS NULL;

SELECT s.name AS specialty_name, COUNT(*) AS num_visits
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
JOIN specializations sp ON vt.id = sp.vet_id
JOIN species s ON sp.species_id = s.id
WHERE vt.name = 'Maisy Smith'
GROUP BY s.id
ORDER BY num_visits DESC
LIMIT 1;

-----------------------------------------------------------------------

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

CREATE INDEX index_animal_id ON visits (animal_id);
ANALYZE visits;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

CREATE INDEX index_vet_id ON visits (vet_id);
ANALYZE visits;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

CREATE INDEX index_email ON owners (email);
 ANALYZE owners;
 EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';