CREATE DATABASE STUDENT_DATABASE_PROJECT;
USE STUDENT_DATABASE_PROJECT;
CREATE TABLE STUDENTS (
	STUDENT_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    ADDRESS VARCHAR(50),
    CITY VARCHAR(50),
    STATE CHAR(2),
    ZIP_CODE CHAR(5)
    );
SHOW TABLES;
CREATE TABLE DEPARTMENT (
	DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL UNIQUE
    );
CREATE TABLE INSTRUCTOR (
	INSTRUCTOR_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL UNIQUE,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID) 
    );
CREATE TABLE COURSE (
	COURSE_ID INT PRIMARY KEY,
    COURSE_NUM VARCHAR(10) NOT NULL,
    COURSE_NAME VARCHAR(100) NOT NULL,
    DESCRIPTION TEXT,
    CREDIT_HOURS INT NOT NULL,
    INSTRUCTOR_ID INT,
    DEPT_ID INT,
    FOREIGN KEY (INSTRUCTOR_ID) REFERENCES INSTRUCTOR(INSTRUCTOR_ID),
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
    );
    USE STUDENT_DATABASE_PROJECT;
CREATE TABLE ENROLLMENT (
	ENROLLMENT_ID INT PRIMARY KEY,
    ENROLLMENT_DATE DATE NOT NULL,
    SEMESTER VARCHAR(15) NOT NULL,
    GRADE VARCHAR(2),
    STUDENT_ID INT,
    COURSE_ID INT,
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID)
    );
ALTER TABLE STUDENTS DROP COLUMN ADDRESS;
ALTER TABLE STUDENTS DROP COLUMN CITY;
ALTER TABLE STUDENTS DROP COLUMN STATE;
ALTER TABLE STUDENTS DROP COLUMN ZIP_CODE;
SELECT *
	FROM STUDENTS;
INSERT INTO STUDENTS VALUES 
(1001, 'Maya', 'Johnson', '1995-03-15'),
(1002, 'Ethan', 'Carter', '1994-11-22'),
(1003, 'Sophia', 'Nyguyen', '1996-07-09'),
(1004, 'Noah', 'Martinez', '1995-01-30'),
(1005, 'Ava', 'Thompson', '1994-09-18');
SELECT *
	FROM STUDENTS;
ALTER TABLE DEPARTMENT DROP COLUMN LAST_NAME;
ALTER TABLE DEPARTMENT DROP COLUMN EMAIL;
ALTER TABLE DEPARTMENT MODIFY DEPT_NAME VARCHAR(100);
INSERT INTO DEPARTMENT VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Biology'),
(104, 'Business Administration'),
(105, 'Engineering'),
(106, 'Psychology'),
(107, 'English'),
(108, 'Chemistry');
SELECT *
	FROM DEPARTMENT;
INSERT INTO INSTRUCTOR VALUES
(491, 'Sara', 'Mitchell', 's.mitchell@email.com', 101),
(138, 'Lilly', 'Campbell', 'l.campbell@email.com', 102),
(864, 'David', 'Anderson', 'd.anderson@email.com', 103),
(142, 'Michael', 'Thompson', 'm.thompson@email.com', 104),
(890, 'Jennifer', 'Williams', 'j.williams@email.com', 101),
(545, 'Angela', 'Brown', 'a.brown@email.com', 105),
(439, 'Kevin', 'Wilson', 'k.wilson@email.com', 106),
(719, 'Freddie', 'Ross', 'f.ross@email.com', 107);
SELECT *
	FROM INSTRUCTOR;
INSERT INTO COURSE VALUES
(301, 'CS101', 'Intro to Programming', 'Programming fundamentals', '3', 491, 101),
(302, 'MATH201', 'Calculus 1', 'Introduction to calculus concepts', '4', 138, 101),
(303, 'BIO110', 'Biology Basics', 'Fundamentals of biological science', '4', 864, 101),
(304, 'BUS120', 'Business Management', 'Principles of business operations', '3', 142, 101),
(305, 'CS220', 'Database Systems', 'Relational databases and SQL concepts', '3', 890, 101),
(306, 'CHEM101', 'General Chemistry', 'Basic chemistry principles', '4', 545, 101),
(307, 'PSY101', 'Psychology Fundamentals', 'Introduction to human behavior', '3', 439, 101),
(308, 'ENG101', 'English Composition', 'College writing and communication', '3', 719, 101);
SELECT *
	FROM COURSE;
INSERT INTO ENROLLMENT VALUES
(01, '2013-08-20', 'Fall', 'A', 1001, 301),
(02, '2013-08-20', 'Fall', 'B+', 1002, 302),
(03, '2014-01-13', 'Spring', 'A-', 1003, 303),
(04, '2013-09-03', 'Fall', 'B', 1004, 304),
(05, '2012-08-27', 'Fall', 'A', 1005, 305),
(06, '2014-01-13', 'Spring', 'B+', 1001, 302),
(07, '2014-08-25', 'Fall', 'A-', 1002, 301),
(08, '2015-01-12', 'Spring', 'B', 1003, 306);
SELECT *
	FROM ENROLLMENT;
