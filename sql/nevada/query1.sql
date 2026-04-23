-- Purpose: Find restaurants in Clark County, Nevada
SELECT
    p.osm_id,
    p.name,
    p.fclass,
    p.geom,
    c.name AS county_name
FROM pois AS p
JOIN adminareas_a AS c
    ON ST_Within(p.geom, c.geom)
WHERE p.fclass = 'restaurant'
  AND c.name = 'Clark County'
ORDER BY p.name;
