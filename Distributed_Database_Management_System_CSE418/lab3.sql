=============================================University Db==============================================
-- task 1: (create nam)
	CREATE TABLE students(
	    stuID INT PRIMARY KEY,
	    nam VARCHAR(50),
	    dept VARCHAR(50)
	);
	
-- task 2: (insert info)
	INSERT INTO students (stuID, nam, dept) VALUES
	(1, 'rahim', 'cse'),
	(2, 'tanjin', 'bba'),
	(3, 'karim', 'eee'),
	(4, 'tajrin', 'cse'),
	(5, 'jerin', 'cse');
	
-- task 3: (fragmantation student 1)
	CREATE TABLE student1 AS
	SELECT *
	FROM students
	WHERE dept = 'cse'
	
-- task 4: (fragmantation student 2)
	CREATE TABLE student2 AS
	SELECT *
	FROM students
	WHERE dept != 'cse'
	
-- task 5 set primary key in student 1 table
	ALTER TABLE student1
	ADD PRIMARY KEY(stuID)
	
-- task 6 set primary key in student 2 table
	ALTER TABLE student2
	ADD PRIMARY KEY(stuID)
	
-- task 7 union student 1 & student 2 table
	CREATE TABLE studentUnio AS
	SELECT * FROM student1
	UNION
	SELECT * FROM student2
=====================================================================================================

===========================================  vertical fragmantation  =======================================
-- vertical table (student vf1)
	CREATE TABLE studentVF1 AS
	SELECT stuID, nam
	FROM students;

	ALTER TABLE studentVF1
	ADD PRIMARY KEY (stuID);
	
-- vertical table (student vf2)
	CREATE TABLE studentVF2 AS
		SELECT stuID, dept
		FROM students;

		ALTER TABLE studentVF2
		ADD PRIMARY KEY (stuID);
		
-- join table
CREATE TABLE studentJoin AS
SELECT studentVF1.stuID, nam, dept
FROM studentVF1
INNER JOIN studentVF2 ON studentVF1.stuID = studentVF2.stuID
=====================================================================================================