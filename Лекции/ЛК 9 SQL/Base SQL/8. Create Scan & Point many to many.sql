DROP TABLE points;
DROP TABLE scans;

CREATE TABLE IF NOT EXISTS scans (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	LEN INTEGER,
	X_min REAL,
	X_max REAL,
	Y_min REAL,
	Y_max REAL,
	Z_min REAL,
	Z_max REAL
);

CREATE TABLE IF NOT EXISTS points (
	id INTEGER PRIMARY KEY,
	X REAL NOT NULL,
	Y REAL NOT NULL,
	Z REAL NOT NULL,
	r INTEGER,
    g INTEGER,
	b INTEGER
);

DROP TABLE scans_points;

CREATE TABLE IF NOT EXISTS scans_points (
	point_id INTEGER,
	scan_id INTEGER,
	PRIMARY KEY (point_id, scan_id)
	FOREIGN KEY(point_id) REFERENCES points(id),
    FOREIGN KEY(scan_id) REFERENCES scans(id)
);
