-- Purpose: Find road features (lines) in Clark County, Nevada

SELECT
    l.osm_id,
    l.name,
    l.fclass,
    l.geom,
    c.name AS county_name
FROM lines AS l
JOIN adminareas_a AS c
    ON ST_Intersects(l.geom, c.geom)
WHERE c.name = 'Clark County'
  AND l.fclass IN ('primary', 'secondary', 'tertiary', 'residential')
ORDER BY l.name;