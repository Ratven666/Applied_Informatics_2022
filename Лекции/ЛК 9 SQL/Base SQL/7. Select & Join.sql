
SELECT COUNT(id), MIN(X), MAX(X), MIN(Y), MAX(Y), MIN(Z), MAX(Z) FROM points WHERE scan_id = 1;

SELECT COUNT(id), MIN(X), MAX(X), MIN(Y), MAX(Y), MIN(Z), MAX(Z) FROM points WHERE scan_id = 2;

SELECT id FROM scans WHERE name = "Scan_2";


SELECT COUNT(id), MIN(X), MAX(X), MIN(Y), MAX(Y), MIN(Z), MAX(Z) 
FROM points 
WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2");

UPDATE scans 
SET LEN = (SELECT COUNT(id) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2"))
WHERE name = "Scan_2";

UPDATE scans 
SET LEN = (SELECT COUNT(id) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    X_min  = (SELECT MIN(X) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    X_max  = (SELECT MAX(X) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    Y_min  = (SELECT MIN(Y) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    Y_max  = (SELECT MAX(Y) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    Z_min  = (SELECT MIN(Z) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2")),
    Z_max  = (SELECT MAX(Z) FROM points WHERE scan_id = (SELECT id FROM scans WHERE name = "Scan_2"))
WHERE name = "Scan_2";

SELECT * FROM points p JOIN scans s ON p.scan_id = s.id;

SELECT * FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2";

SELECT * FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2" ORDER BY Z LIMIT 5;

INSERT INTO scans (name)
VALUES ("Scan_3");

SELECT * FROM scans s WHERE s.name = 'Scan_3';

SELECT X, Y, Z, 3 
FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2" ORDER BY Z LIMIT 5;

SELECT X, Y, Z, 3 AS scan_id 
FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2" ORDER BY Z LIMIT 5;

SELECT X, Y, Z, (SELECT id FROM scans s WHERE s.name = 'Scan_3') AS scan_id 
FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2" ORDER BY Z LIMIT 5;

INSERT INTO points (X, Y, Z, scan_id) 
SELECT X, Y, Z, (SELECT id FROM scans s WHERE s.name = 'Scan_3') AS scan_id 
FROM points p JOIN scans s ON p.scan_id = s.id WHERE s.name = "Scan_2" ORDER BY Z LIMIT 5;


SELECT COUNT(id), MIN(X), MAX(X), MIN(Y), MAX(Y), MIN(Z), MAX(Z) FROM points WHERE scan_id = 3;

SELECT * FROM points p WHERE scan_id = (SELECT id FROM scans s WHERE s.name = "Scan_3");