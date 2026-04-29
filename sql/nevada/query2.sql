-- Purpose: Get railway line features in Clark County, Nevada

SELECT
    r.osm_id,
    r.name,
    r.fclass,
    r.geom,
    c.name AS county_name
FROM railways AS r
JOIN adminareas_a AS c
    ON ST_Intersects(r.geom, c.geom)
WHERE c.name = 'Clark County'
ORDER BY r.name;