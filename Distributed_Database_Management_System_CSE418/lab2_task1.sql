--======================== Database Lab 2 Question ========================
--1. Design a Schema consisting of at least 4 relations, Implement it and perform and entry
--2. Write 5 queries based on your database design
--=========================================================================


--==================== Database BUBT Management System ====================

-- Step 1: (create databse)
	CREATE DATABASE bubt_management

-- Step 2: (create students databse)	
	CREATE TABLE Students (
	    student_id INT PRIMARY KEY,
	    first_name VARCHAR(50),
	    last_name VARCHAR(50),
	    email VARCHAR(100),
	    date_of_birth DATE,
	    enrollment_date DATE
	);

-- Step 3: (create professors databse)
	CREATE TABLE Professors (
	    professor_id INT PRIMARY KEY,
	    first_name VARCHAR(50),
	    last_name VARCHAR(50),
	    email VARCHAR(100),
	    department VARCHAR(50)
	);
	
-- Step 4: (create courses databse)
	CREATE TABLE Courses (
	    course_id INT PRIMARY KEY,
	    course_name VARCHAR(100),
	    credits INT,
	    semester VARCHAR(20),
	    professor_id INT,
	    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
	);
	
-- Step 4: (create courses databse)
	CREATE TABLE Enrollments (
	    enrollment_id INT PRIMARY KEY,
	    student_id INT,
	    course_id INT,
	    grade CHAR(2),
	    FOREIGN KEY (student_id) REFERENCES Students(student_id),
	    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
	);
--=========================================================================


--============================== Insert Data ==============================
-- 1. Insert into Students
	INSERT INTO Students (student_id, first_name, last_name, email, date_of_birth, 		enrollment_date) VALUES
	(1, 'John', 'Doe', 'john.doe@example.com', '2001-05-15', '2020-08-25'),
	(2, 'Jane', 'Smith', 'jane.smith@example.com', '2000-03-22', '2019-09-12'),
	(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2002-11-30', '2021-01-17'),
	(4, 'Bob', 'Brown', 'bob.brown@example.com', '2001-07-04', '2020-02-14'),
	(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '2000-09-08', '2018-09-10');



-- 2. Insert into Professors
	INSERT INTO Professors (professor_id, first_name, last_name, email, department) VALUES
	(1, 'Dr. William', 'Taylor', 'william.taylor@bubt.edu', 'Computer Science'),
	(2, 'Dr. Emily', 'Adams', 'emily.adams@bubt.edu', 'Mathematics'),
	(3, 'Dr. Sarah', 'White', 'sarah.white@bubt.edu', 'Physics'),
	(4, 'Dr. Michael', 'Clark', 'michael.clark@bubt.edu', 'Chemistry'),
	(5, 'Dr. Robert', 'Lee', 'robert.lee@bubt.edu', 'Biology');



-- 3. Insert into Courses
	INSERT INTO Courses (course_id, course_name, credits, semester, professor_id) VALUES
	(101, 'Introduction to Programming', 3, 'Fall 2025', 1),
	(102, 'Calculus I', 4, 'Spring 2025', 2),
	(103, 'Physics Fundamentals', 3, 'Fall 2025', 3),
	(104, 'Organic Chemistry', 3, 'Spring 2025', 4),
	(105, 'Cell Biology', 3, 'Fall 2025', 5);



-- 4. Insert into Enrollments
	INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade) VALUES
	(1, 1, 101, 'A'),
	(2, 2, 102, 'B'),
	(3, 3, 103, 'A'),
	(4, 4, 104, 'C'),
	(5, 5, 105, 'B');

--=========================================================================

--================================= Query =================================
-- 1. Get all students with their enrollment dates
	SELECT student_id, first_name, last_name, enrollment_date
	FROM Students;


-- 2.Get all courses taught by a specific professor
	SELECT course_id, course_name, credits, semester
	FROM Courses
	WHERE professor_id = 1;


-- 3. Get the list of students enrolled in a specific course
	SELECT s.student_id, s.first_name, s.last_name, e.grade
	FROM Students s
	JOIN Enrollments e ON s.student_id = e.student_id
	WHERE e.course_id = 101;


-- 4. Get all professors in the 'Computer Science' department
	SELECT professor_id, first_name, last_name, email
	FROM Professors
	WHERE department = 'Computer Science';


-- 5. Get all students with their grades and the courses they are enrolled in
	SELECT s.first_name, s.last_name, c.course_name, e.grade
	FROM Students s
	JOIN Enrollments e ON s.student_id = e.student_id
	JOIN Courses c ON e.course_id = c.course_id;

--=========================================================================