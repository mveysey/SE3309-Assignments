USE `1200blockbusters+`; 

-- // results of a specific genre
SELECT genreType FROM genre WHERE genreType = 'Action';


-- // Top 5 rated movies in comedy genre
SELECT movie.title, (SELECT SUM(review.rating)/COUNT(*)
FROM review WHERE review.title = movie.title) AS raters
FROM movie, genre WHERE genre.genreType = `Comedy`
ORDER BY raters DESC LIMIT 5;

-- // Top canadian movies directed by BLANK (review, director, movies)
SELECT m.title
FROM movie m, direction d
WHERE m.originatingCountry LIKE '%United States%' AND m.title = d.title AND d.fName = 'Alan' AND d.lName = 'Alda';

-- // Award winning movies by Romance (Genre, movies, award)
SELECT DISTINCT m.title, ma.awardName
FROM movie m, genre g, movieAward ma
WHERE EXISTS (SELECT title, awardName FROM movieAward) AND g.genreType = 'Romance'; 

-- // Top 10 movies being watched in United States (user[location], movies, reviews)
SELECT movie.title, user.location, (SELECT SUM(review.rating)/COUNT(*) 
FROM review 
WHERE review.title = movie.title) AS raters 
FROM movie, user WHERE user.location = 'United States' ORDER BY raters DESC LIMIT 10;

SELECT fName, lName, COUNT(title) as movieCount
FROM appearance
GROUP BY fName, lName, birthday
HAVING COUNT(title) > 1
ORDER BY fName, lName;

-- // Comedy movies leaving soon (movies, genre)
SELECT movie.title FROM moviesgenre, movie, contract WHERE genreType='Comedy'AND moviesgenre.title=movie.title
AND movie.contractStartDate=contract.contractStartDate
AND contract.contractEndDate>=2022-01-01; 





