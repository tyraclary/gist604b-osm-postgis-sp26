-- Purpose: Count restaurants within 500m of major roads by county

WITH major_roads AS (
    SELECT geom
    FROM roads
    WHERE fclass IN ('motorway', 'trunk', 'primary', 'secondary')
),

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
