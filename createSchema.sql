DROP DATABASE IF EXISTS Users;
CREATE DATABASE Users;

USE Users;
CREATE TABLE User (
	userID INT(11) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(14) NOT NULL,
    pw VARCHAR(14) NOT NULL
);

INSERT INTO User (username, pw)
	VALUES	('JeffMiller', 'PHD'),
			('201Stud', 'sleep');
            
CREATE TABLE Project (
    projectID INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ptitle VARCHAR(50),
    userID INT(11) NOT NULL,
    code VARCHAR(6) NOT NULL,
    FOREIGN KEY (userID)
        REFERENCES User (userID)
);
INSERT INTO Project (ptitle, userID, code)
	VALUES	('201 Final Project',1,'QF721K'), ('201 Assignments', 2, 'DJ94H9');


CREATE TABLE UserProject (
	projectID INT(11) NOT NULL,
    userID INT(11) NOT NULL, -- project creation requires 1 user
	upID INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	 FOREIGN KEY fk1(projectID) REFERENCES Project(projectID),
    FOREIGN KEY fk2(userID) REFERENCES User(userID)
);
INSERT INTO UserProject(projectID, userID)
	VALUES (1, 1), (2, 2); 
INSERT INTO UserProject(projectID, userID)
	VALUES ( 2,1);



CREATE TABLE Task (
	projectID INT(11) NOT NULL,
	FOREIGN KEY fk3(projectID) REFERENCES Project(projectID),
    title VARCHAR(50) NOT NULL,
    taskID INT(11) PRIMARY KEY AUTO_INCREMENT,
    completed bool,
    userID INT(11),
    FOREIGN KEY fk4(userID) REFERENCES User(userID)
);

INSERT INTO Task (title, completed, userID, projectID)
	VALUES	('Deliverable1', false, 1,1), ('HW4', false, 2, 2),('Deliverable2', false, 1,1),('Deliverable3', false, 1,1),('Project2d1', false, 1,2),('Deliverable3', false, 1,2);
