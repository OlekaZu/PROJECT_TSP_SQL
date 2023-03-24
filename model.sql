CREATE TABLE nodes (
    id BIGINT,
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost BIGINT
);

INSERT INTO nodes
VALUES (1, 'a', 'b', 10),
       (2, 'b', 'a', 10),
       (3, 'a', 'c', 15),
       (4, 'c', 'a', 15),
       (5, 'c', 'b', 35),
       (6, 'b', 'c', 35),
       (7, 'a', 'd', 20),
       (8, 'd', 'a', 20),
       (9, 'c', 'd', 30),
       (10, 'd', 'c', 30),
       (11, 'b', 'd', 25),
       (12, 'd', 'b', 25);
