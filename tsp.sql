WITH RECURSIVE findway AS (
    SELECT 1 AS i, point2 as prev_point,
           CONCAT(point1, ',', point2, ',') AS tour,
           cost AS total_cost, ARRAY[point1, point2]::TEXT[] AS way
    FROM nodes
    WHERE point1 = 'a'
    UNION
    SELECT i+1 AS i, n.point1,
           CONCAT(tour, n.point1, ','),
           (total_cost + (SELECT cost FROM nodes WHERE point1 = prev_point
                                                   AND point2 = n.point1)),
           way || ARRAY[n.point1]
    FROM findway JOIN nodes n
    ON n.point1 != ALL(way::TEXT[])
    WHERE i < 4
), last_step AS (
    SELECT DISTINCT (total_cost + (SELECT cost FROM nodes
                          WHERE point1 = prev_point
                            AND point2 = 'a')) as total_cost,
           CONCAT('{', tour, point1, '}') AS tour
    FROM findway JOIN nodes
        ON i=3 AND point1 = 'a'
)
SELECT total_cost, tour
FROM last_step
WHERE total_cost = (SELECT MIN(total_cost) FROM last_step)
UNION
SELECT total_cost, tour
FROM last_step
WHERE total_cost = (SELECT MAX(total_cost) FROM last_step)
ORDER BY 1, 2;
