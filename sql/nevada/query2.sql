-- Purpose: Calculate total park area by county in Nevada

SELECT
    c.name AS county_name,
    ROUND(
        (SUM(ST_Area(ST_Intersection(l.geom, c.geom)::geography)) / 1000000.0)::numeric,
        2
    ) AS park_area_sq_km
FROM landuse_a AS l
JOIN adminareas_a AS c
    ON ST_Intersects(l.geom, c.geom)
WHERE l.fclass = 'park'
GROUP BY c.name
ORDER BY park_area_sq_km DESC;