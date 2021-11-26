USE `1200blockbusters+`; 

-- first insert statement
INSERT INTO `actor` (`fName`, `lName`, `birthday`, `language`, `location`)
VALUES ('Andrea', 'Lynne', '1997-09-21', 'English', 'Canada');

-- second insert statement
INSERT INTO `director`
VALUES ('Stella', 'Lee', '2001-09-21', 'Dune 2');

-- third insert statement
CREATE TABLE MovieRatings (
  title VARCHAR(300) NOT NULL,
  ratingCount INT NOT NULL,
  PRIMARY KEY(title)
);

INSERT INTO MovieRatings
	SELECT r.title, COUNT(*)
	FROM review r, movie m
	WHERE r.rating = 5 AND r.title = m.title
	GROUP BY r.title, rating;
    
-- fourth insert statement
CREATE TABLE AwardWinningActor (
 awardName VARCHAR(200) NOT NULL,
 fName VARCHAR(45) NOT NULL,
 lName VARCHAR(45) NOT NULL,
 birthday DATE NOT NULL,
 PRIMARY KEY (awardName, fName, lName, birthday)
);

INSERT INTO AwardWinningActor
SELECT  aa.awardName, a.fName, a.lName, a.birthday
	FROM actoraward aa, actor a
	WHERE aa.awardName = 'Actor In A Television Series - Musical Or Comedy'
	AND aa.fName = a.fName AND aa.lName = a.lName
AND aa.birthday = a.birthday
GROUP BY aa.awardName, a.fName, a.lName, a.birthday;
