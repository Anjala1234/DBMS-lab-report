USE info;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    mobile_number VARCHAR(20),
    department_name VARCHAR(100)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100),
    credit_hour INT
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    students_id INT,
    course_id INT,
    semester VARCHAR(20)
);
SELECT * FROM students;
SELECT *FROM courses;
SELECT *FROM enrollments;
INSERT INTO students
(students_id, name, age, email, mobile_number, department_name)
VALUES
(1,'Ram',21,'ram@gmail.com','9800000001','Computer Engineering'),
(2,'Arjun',22,'arjun@gmail.com','9800000002','Computer Engineering'),
(3,'Hari',19,'hari@gmail.com','9800000003','Civil Engineering'),
(4,'Sita',20,'sita@gmail.com','9800000004','Electrical Engineering'),
(5,'Gita',23,'gita@gmail.com','9800000005','Computer Engineering'),
(6,'Balram',18,'balram@gmail.com','9800000006','Civil Engineering');
INSERT INTO courses
(course_id, name, credit_hour)
VALUES
(1,'Database Management System',3),
(2,'Data Structures',4),
(3,'Operating System',3),
(4,'Java',3);
INSERT INTO enrollments
(enrollment_id, students_id, course_id, semester)
VALUES
(1,1,1,'Spring 2026'),
(2,1,2,'Spring 2026'),
(3,2,1,'Spring 2026'),
(4,2,3,'Spring 2026'),
(5,3,1,'Spring 2026'),
(6,4,4,'Spring 2026'),
(7,5,2,'Spring 2026');
SELECT name, department_name
FROM students;
SELECT * FROM courses;
SELECT *
FROM students
WHERE age > 20;
SELECT *
FROM students
WHERE department_name = 'Computer Engineering';
SELECT *
FROM students
ORDER BY age;
SELECT COUNT(*)
FROM students;
SELECT AVG(age)
FROM students;
SELECT *
FROM students
WHERE age = (SELECT MAX(age) FROM student);
UPDATE students
SET department_name = 'Civil Engineering'
WHERE students_id = 1;
DELETE FROM students
WHERE students_id = 1;
SELECT students.name, courses.name
FROM students
JOIN enrollments
ON students.students_id = enrollments.students_id
JOIN courses
ON courses.course_id = enrollments.course_id;
SELECT courses.name, COUNT(enrollments.student_id)
FROM courses
JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.name;
SELECT students.name
FROM students
JOIN enrollments
ON students.students_id = enrollments.students_id
JOIN courses
ON courses.course_id = enrollments.course_id
WHERE courses.name = 'Database Management System';
SELECT students.*
FROM students
LEFT JOIN enrollments
ON students.students_id = enrollments.students_id
WHERE enrollments.students_id IS NULL;
SELECT COUNT(*)
FROM enrollments;
SELECT courses.name, COUNT(enrollments.students_id)
FROM courses
JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.name
ORDER BY COUNT(enrollments.students_id) DESC
LIMIT 1;
SELECT name
FROM students
WHERE name LIKE 'A%';
CREATE VIEW students_course_view AS
SELECT students.name, courses.name AS course_name
FROM students
JOIN enrollments
ON students.students_id = enrollments.students_id
JOIN courses
ON courses.course_id = enrollments.course_id;
SELECT * FROM students_course_view;
