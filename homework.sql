create database homework;
use homework;

//creating tables
CREATE TABLE COURSES (
    ID INTEGER NOT NULL AUTO_INCREMENT, PRIMARY KEY(ID),
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
	CREDIT INTEGER
);

CREATE TABLE FACULTY (
    ID INTEGER NOT NULL AUTO_INCREMENT, PRIMARY KEY(ID),
    NAME VARCHAR(255) NOT NULL
);

CREATE TABLE STUDENT (
    ID INTEGER NOT NULL AUTO_INCREMENT, PRIMARY KEY(ID),
    NAME VARCHAR(255) NOT NULL,
    SURNAME VARCHAR(255) NOT NULL,
	COURSES_ID INTEGER, FOREIGN KEY (COURSES_ID) REFERENCES COURSES(ID),
	FACULTY_ID INTEGER
);

//insterting values

INSERT INTO FACULTY VALUES(NULL, 'Math'),
(NULL, 'Arts'),
(NULL, 'Literature'),
(NULL, 'Physics');

INSERT INTO COURSES VALUES(NULL, 'Math', 'Learning functions', 10),
(NULL, 'Art', 'Drawing human face', 12),
(NULL, 'Literature', 'Writing essays', 7),
(NULL, 'Programming', 'Learning Java', 20),
(NULL, 'Physics', 'Learning quantum mechanics', 19);

INSERT INTO STUDENT VALUES(NULL, 'Kiril', 'Vasilev', 1, 3),
(NULL, 'Petar', 'Petrov', 2, 1),
(NULL, 'Petar', 'Stoqnov', 2, 1),
(NULL, 'Ivan', 'Ivanov', 1, 4);

//selects and deletes from student database with student first and last name as arguements
SELECT * FROM STUDENT;
DELETE FROM STUDENT WHERE NAME='Kiril' AND SURNAME='Vasilev';

//shows table with students and courses they take part in as a join
SELECT c.NAME, c.SURNAME, a.NAME FROM STUDENT AS c JOIN COURSES AS a ON a.ID=c.COURSES_ID;

//delete all students that take part in a faculty, when you delete it
DELETE FACULTY , STUDENT FROM FACULTY INNER JOIN STUDENT WHERE STUDENT.FACULTY_ID=FACULTY.ID AND FACULTY.ID=3;
