-- Purpose: Count restaurants within 500m of major roads by county

WITH major_roads AS (
    SELECT geom
    FROM roads
    WHERE fclass IN ('motorway', 'trunk', 'primary', 'secondary')
),

restaurants_near_roads AS (
    SELECT
        p.osm_id,
        p.name,
        p.geom
    FROM pois AS p
    JOIN major_roads AS r
        ON ST_DWithin(p.geom::geography, r.geom::geography, 500)
    WHERE p.fclass = 'restaurant'
)

SELECT
    c.name AS county_name,
    COUNT(DISTINCT rnr.osm_id) AS restaurant_count
FROM restaurants_near_roads AS rnr
JOIN adminareas_a AS c
    ON ST_Within(rnr.geom, c.geom)
GROUP BY c.name
ORDER BY restaurant_count DESC;
