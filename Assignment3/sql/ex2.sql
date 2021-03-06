
CREATE SCHEMA `1200Blockbusters+` ;
USE `1200Blockbusters+`;

CREATE TABLE logincredentials (
  emailAddress VARCHAR(300) NOT NULL,
 CHECK (emailAddress LIKE '%_@__%.__%'),
  password VARCHAR(300) NULL,
  PRIMARY KEY (emailAddress));


 CREATE TABLE contract (
  contractStartDate DATE NOT NULL,
  contractEndDate DATE NULL,
  PRIMARY KEY (contractStartDate));
  
CREATE TABLE genre (
  genreType VARCHAR(300) NOT NULL,
  PRIMARY KEY (genreType));

CREATE UNIQUE INDEX genre_idx ON genre (genreType);

CREATE TABLE director (
  fName VARCHAR(300) NOT NULL,
  lName VARCHAR(300) NOT NULL,
  birthday DATE NOT NULL,
  firstFilm VARCHAR(300) NULL,
  PRIMARY KEY (fName, lName, birthday));

CREATE TABLE actor (
  fName VARCHAR(300) NOT NULL,
  lName VARCHAR(300) NOT NULL,
 birthday DATE NOT NULL,
 `language` VARCHAR(300) NULL,
 location VARCHAR(300) NULL,
 PRIMARY KEY (fName, lName, birthday));

    CREATE TABLE movie (
  title VARCHAR(300) NOT NULL,
  originatingCountry VARCHAR(300) NULL,
  contractStartDate DATE NULL,
  yearReleased INT NULL,
CHECK (yearReleased<=2021),
  maturityRating VARCHAR(300) NULL,
  duration VARCHAR(300) NULL,
  `language` VARCHAR(300) NULL,
  PRIMARY KEY (title),
    FOREIGN KEY (contractStartDate) REFERENCES contract (contractStartDate)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
  );
CREATE UNIQUE INDEX movie_idx ON movie (title);
 
CREATE TABLE user (
  fName VARCHAR(45) NOT NULL,
  lName VARCHAR(45) NOT NULL,
 paymentMethod VARCHAR(45) NULL,
 location VARCHAR(45) NULL,
 emailAddress VARCHAR(45) NOT NULL, 
  `language` VARCHAR(45) NULL,
	PRIMARY KEY (fName, lName, emailAddress), 
    FOREIGN KEY (emailAddress)
    REFERENCES  logincredentials (emailAddress)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
CREATE UNIQUE INDEX user_idx
ON user (fName, lName, emailAddress);

  CREATE TABLE review (
  title VARCHAR(300) NOT NULL,
  `date` VARCHAR(300) NOT NULL,
 emailAddress VARCHAR(300) NOT NULL,
  rating INT NULL,
 CHECK (rating <=5 AND rating > 0),
  PRIMARY KEY (title, `date`, emailAddress),
    FOREIGN KEY (title) REFERENCES Movie (title)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (emailAddress) REFERENCES User (emailAddress)
    ON DELETE NO ACTION
    ON UPDATE CASCADE

  );

CREATE TABLE appearance (
 fName VARCHAR(45) NOT NULL,
 lName VARCHAR(45) NOT NULL,
 birthday date NOT NULL,
 title VARCHAR(300) NOT NULL,
 roleName VARCHAR(300) NULL,
 PRIMARY KEY(fName,lName,birthday,title),
 FOREIGN KEY(fName,lName,birthday) REFERENCES Actor(fName, lName,birthday) 
 ON DELETE NO ACTION
 ON UPDATE CASCADE,
 FOREIGN KEY(title) REFERENCES Movie(title)
 ON DELETE NO ACTION
 ON UPDATE CASCADE	
);


 CREATE TABLE direction (
  fName VARCHAR(45) NOT NULL,
  lName VARCHAR(45) NOT NULL,
  birthday DATE NOT NULL,
  title VARCHAR(300) NOT NULL,
  productionCompany VARCHAR(300) NULL,
  PRIMARY KEY (fName, lName, birthday, title),
    FOREIGN KEY (fName, lName, birthday) REFERENCES director (fName, lName, birthday)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (title) REFERENCES movie (title)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
  );


 CREATE TABLE moviesGenre (
  title VARCHAR(300) NOT NULL,
  genreType VARCHAR(300) NOT NULL,
  PRIMARY KEY (title, genreType),
    FOREIGN KEY (title) REFERENCES movie (title)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    FOREIGN KEY (genreType) REFERENCES genre (genreType)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
  );


 CREATE TABLE movieAward (
 awardName VARCHAR(300) NOT NULL,
 dateReceived DATE NOT NULL,
 title VARCHAR(300) NOT NULL,
 PRIMARY KEY (awardName, dateReceived),
 FOREIGN KEY (title) REFERENCES movie (title)
 ON DELETE NO ACTION
 ON UPDATE CASCADE
);

 CREATE TABLE directorAward (
 awardName VARCHAR(200) NOT NULL,
 dateReceived DATE NOT NULL,
 fName VARCHAR(45) NOT NULL,
 lName VARCHAR(45) NOT NULL,
 birthday DATE NOT NULL,
 PRIMARY KEY (awardName, dateReceived),
 FOREIGN KEY (fName, lName, birthday) REFERENCES director (fName, lName, birthday)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

 CREATE TABLE actorAward (
 awardName VARCHAR(300) NOT NULL,
 dateReceived DATE NOT NULL,
 fName VARCHAR(300) NOT NULL,
 lName VARCHAR(300) NOT NULL,
 birthday DATE NOT NULL,
 PRIMARY KEY (awardName, dateReceived),
 FOREIGN KEY (fName,lName,birthday) REFERENCES actor (fName,lName,birthday)
 ON DELETE NO ACTION
 ON UPDATE CASCADE
);

