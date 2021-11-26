USE `1200blockbusters+`; 

-- // Based on their first name, if an actor has acted in at least one movie, then they will be set as a popular actor
UPDATE actor
SET isPopularActor = 'yes'
WHERE (actor.fName IN (SELECT ap.fName FROM appearance ap GROUP BY ap.fName HAVING COUNT(ap.title) >= 1));

-- //DELETE
DELETE FROM appearance WHERE roleName=”BARBIE”;


-- // Update roleName in appearance from Anna to Annie  to a new name

UPDATE appearance
SET 
	roleName = 'Annie'
WHERE
	roleName = 'Anna';
