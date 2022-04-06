CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES ('Green');

INSERT INTO bands (name)
VALUES ('Red'), ('Blue'), ('Orange');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (name, release_year, band_id)
VALUES ('Apple', 1602, 1),
	('Tomato', 1384, 1),
	('Berry', 1005, 2),
    ('Berry', 1933, 3), 
    ('Pear', NULL, 3);
    
SELECT * FROM albums;

SELECT name FROM albums;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET release_year = 1234
WHERE id = 1;

SELECT * FROM albums
WHERE release_year < 1400;

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 3;

SELECT * FROM albums
WHERE release_year = 1384 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 1200 AND 1800;

SELECT * FROM albums
WHERE release_year is NULL;

DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;


SELECT AVG(release_year) FROM albums;


SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Blue'
GROUP BY b.id
HAVING num_albums = 1;


