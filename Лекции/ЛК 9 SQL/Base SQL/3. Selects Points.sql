SELECT * FROM points;

SELECT X, Y, Z FROM points;

SELECT id, X, Y, Z FROM points;

SELECT id, X, Y, Z FROM points ORDER BY Z;

SELECT id, X, Y, Z FROM points ORDER BY Z LIMIT 10;

SELECT id, X, Y, Z FROM points ORDER BY Z DESC;

SELECT * FROM points ORDER BY Z DESC LIMIT 1;

SELECT * FROM points WHERE id > 10;

SELECT * FROM points WHERE id > 10 AND  id <= 20;

SELECT COUNT(id) AS point_count FROM points;

SELECT MIN(X), MIN(Y), MIN(Z), MAX(X), MAX(Y), MAX(Z) FROM points;

SELECT AVG(X), AVG(Y), AVG(Z), AVG(r), AVG(g), AVG(b) FROM points;

SELECT SUM(X), SUM(Y), SUM(Z), SUM(r), SUM(g), SUM(b) FROM points;

SELECT COUNT(id) AS point_count FROM points WHERE id > 10;

