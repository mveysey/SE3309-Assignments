USE `1200blockbusters+`; 

-- // 1
CREATE VIEW GenreFiction
AS SELECT *
FROM moviesgenre
WHERE genreType LIKE '%Fiction%';

-- // 2
CREATE VIEW JacobList
AS SELECT *
FROM actor
WHERE fName = 'Jacob';

-- // 3
CREATE VIEW Diversity
AS SELECT u.location, COUNT(*)
FROM user u
GROUP BY u.location;