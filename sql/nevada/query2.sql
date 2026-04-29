-- Purpose: Get line features (roads) in Clark County

SELECT
    c.osm_id,
    c.name,
    c.fclass,
    c.geom
FROM clark AS c
WHERE c.fclass IN ('primary', 'secondary', 'tertiary', 'residential')
ORDER BY c.name;