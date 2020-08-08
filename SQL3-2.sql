-- DDL Statements

CREATE TABLE courses(
	CourseId INT PRIMARY KEY,
	CourseName TEXT NOT NULL,
	EmployeeId INT,
	CoursePrice NUMERIC,
	FOREIGN KEY(EmployeeId) 
		REFERENCES employees(EmployeeId)
	);

	
INSERT INTO courses (CourseId, CourseName, EmployeeId, CoursePrice)
VALUES 	(1, "Self_Dev", 2, 90),
		(2, "MS_Office", 3, 105),
		(3, "MS_Office", 5, 119),
		(4, "Adv_Math", 1, 120.5),
		(5, "Art", 1, 150),
		(6, "Comp_Fund", 4, 55.5),
		(7, "Art", 2, 150),
		(8, "MS_Office", 7, 66),
		(9, "Yoga", 3, 44),
		(10, "SQL", 7, 25.25);

		
DELETE FROM courses
WHERE CourseId = (SELECT MAX(CourseId) FROM courses);


ALTER TABLE courses
ADD StartDate NOT NULL DEFAULT '2020-12-12';


ALTER TABLE courses
DROP COLUMN CoursePrice;


DROP TABLE courses;