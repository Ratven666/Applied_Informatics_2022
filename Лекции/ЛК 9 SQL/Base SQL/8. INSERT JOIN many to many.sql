INSERT INTO scans (name)
VALUES ("Scan_1"),
	   ("Scan_2");

INSERT INTO points (X, Y, Z, r, g, b)
VALUES 
   (-11.866, 27.100, 5.798, 145, 133, 161),
   (-12.327, 26.834, 5.734, 141, 125, 151),
   (-12.448, 26.765, 5.727, 147, 131, 158),
   (-12.566, 26.716, 5.704, 145, 125, 153),
   (-12.695, 26.650, 5.706, 140, 129, 153),
   (-12.820, 26.618, 5.697, 137, 125, 153),
   (-12.944, 26.572, 5.683, 142, 137, 163),
   (-13.073, 26.528, 5.666, 154, 141, 168),
   (-13.335, 26.464, 5.656, 164, 146, 176),
   (-13.462, 26.439, 5.648, 152, 143, 168),
   (-13.599, 26.423, 5.647, 150, 149, 181),
   (-13.868, 26.394, 5.632, 156, 148, 176),
   (-14.480, 26.390, 5.615, 143, 139, 166),
   (-13.236, 26.501, 3.081, 152, 136, 158),
   (-13.131, 26.515, 3.152, 157, 140, 171),
   (-13.946, 26.365, 4.285, 154, 143, 168),
   (-13.036, 26.546, 3.233, 171, 151, 184),
   (-13.816, 26.384, 4.362, 159, 150, 181),
   (-12.938, 26.574, 3.320, 157, 143, 168),
   (-12.835, 26.622, 3.405, 153, 141, 166),
   (-13.624, 26.414, 4.526, 163, 154, 184),
   (-14.475, 26.378, 5.688, 155, 141, 168),
   (-12.737, 26.645, 3.485, 146, 138, 161),
   (-13.511, 26.421, 4.600, 166, 157, 189),
   (-12.639, 26.687, 3.570, 167, 152, 179),
   (-13.406, 26.448, 4.687, 169, 154, 184),
   (-12.561, 26.733, 3.657, 150, 141, 166),
   (-13.213, 26.494, 4.874, 160, 149, 174),
   (-13.101, 26.525, 4.935, 141, 129, 156),
   (-13.001, 26.561, 5.003, 144, 118, 145);
   
SELECT id FROM points p ORDER BY id DESC LIMIT 30;

INSERT INTO scans_points (point_id) 
SELECT id FROM points p ORDER BY id DESC LIMIT 30;

SELECT id FROM scans s WHERE s.name = "Scan_1";

UPDATE scans_points SET scan_id = (SELECT id FROM scans s WHERE s.name = "Scan_1") 
WHERE point_id IN (SELECT id FROM points p ORDER BY id DESC LIMIT 30);

INSERT INTO scans_points (point_id) 
SELECT id FROM points p WHERE p.Z > 5;

UPDATE scans_points SET scan_id = (SELECT id FROM scans s WHERE s.name = "Scan_2") 
WHERE scan_id IS NULL;

SELECT * FROM points p JOIN scans_points sp ON p.id = sp.point_id;

SELECT * FROM points p JOIN scans_points sp ON p.id = sp.point_id JOIN scans s ON scan_id = s.id;

SELECT X, Y, Z, r, g, b, name FROM points p JOIN scans_points sp ON p.id = sp.point_id JOIN scans s ON scan_id = s.id;

SELECT X, Y, Z, r, g, b, name FROM points p JOIN scans_points sp ON p.id = sp.point_id JOIN scans s ON scan_id = s.id WHERE name = "Scan_2";