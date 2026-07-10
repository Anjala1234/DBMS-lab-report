use sms;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id, name, age, email, phone_number) VALUES
(1, 'Alice Smith', 20, 'alice@example.com', '555-0101'),
(2, 'Bob Johnson', 22, 'bob@example.com', '555-0102'),
(3, 'Charlie Brown', 19, 'charlie@example.com', '555-0103'),
(4, 'Diana Prince', 21, 'diana@example.com', '555-0104'),
(5, 'Evan Wright', 23, 'evan@example.com', '555-0105');

-- Insert Data into Courses
INSERT INTO courses (course_id, name, credit_hour) VALUES
(101, 'Introduction to Computer Science', 3),
(102, 'Data Structures', 4),
(103, 'Database Management Systems', 3),
(104, 'Web Development', 3),
(105, 'Artificial Intelligence', 4);

-- Insert Data into Enrollment
INSERT INTO enrollment (enrollment_id, course_id, student_id) VALUES
(1001, 101, 1),
(1002, 103, 1),
(1003, 102, 2),
(1004, 104, 2),
(1005, 101, 3),
(1006, 105, 4),
(1007, 103, 5),
(1008, 105, 5),
(1009, 102, 1);

-- 1
SELECT *FROM students;
SELECT *FROM  courses;
SELECT *FROM enrollment;
SELECT *
FROM students
WHERE age > 20;
SELECT name
FROM students
WHERE name LIKE 'A%';
SELECT name,email
FROM students;
SELECT *
FROM Courses
WHERE name LIKE '%Data%'
SELECT students;
SELECT *FROM students ORDER BY age DESC;
SELECT *FROM Students WHERE phone_number='555-0103';
ALTER TABLE Students
ADD address VARCHAR(255);
ALTER TABLE Students
ADD is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE Students
MODIFY COLUMN phone_number VARCHAR(50);
ALTER TABLE courses
RENAME COLUMN name TO course_name;

ALTER TABLE Students
DROP COLUMN age;
ALTER TABLE courses
ADD CONSTRAINT chk_credit_hour
CHECK (credit_hour >=1)

 UPDATE students
 SET phone_number='555-9999'
 WHERE student_id= 1;

 UPDATE students
 SET age= 23,
 email ='bob.j@newemail.com'
 WHERE student_id =2;
  UPDATE courses
  SET credit_hour = credit_hour + 1
  WHERE credit_hour = 3;
  UPDATE students
  SET email = LOWER(email);
  UPDATE courses
  SET credit_hour = 5
  WHERE course_id IN (
    SELECT course_id
    FROM (
        SELECT course_id
     FROM courses
    WHERE name = 'Data Structures'
  )AS temp
);
DELETE FROM Students
WHERE name = 'Evan Wright';
DELETE FROM courses
WHERE credit_hour < 3;
DELETE FROM enrollment
WHERE student_id = 3;
DELETE FROM Students
WHERE student_id = 3;
DELETE FROM enrollment;
DESCRIBE Students;
ALTER TABLE Students
DROP COLUMN age;
SELECT COUNT(*) AS total_students
FROM Students;
--Since age coloumn was deleted so new age coloumn should be added and avg should be cacluated
--if it already exists then no need to add the age column
ALTER TABLE Students
ADD COLUMN age INT;

SELECT * from students;
UPDATE Students SET age = 20 WHERE student_id = 1;
UPDATE Students SET age = 22 WHERE student_id = 2;
UPDATE Students SET age = 19 WHERE student_id = 3;
UPDATE Students SET age = 21 WHERE student_id = 4;
UPDATE Students SET age = 23 WHERE student_id = 5;
SELECT AVG(age) AS average_age
FROM Students;
SELECT MAX(credit_hour) AS maximum_credit_hour
FROM Courses;





