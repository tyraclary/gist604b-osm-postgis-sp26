-- Purpose: Get land use polygon features in Clark County, Nevada

SELECT
    l.osm_id,
    l.name,
    l.fclass,
    l.geom,
    c.name AS county_name
FROM landuse_a AS l
JOIN adminareas_a AS c
    ON ST_Intersects(l.geom, c.geom)
WHERE c.name = 'Clark County'
ORDER BY l.fclass, l.name;
