use info;
create table student(
    id int PRIMARY key,
    name varchar(255) NOT NULL,
    age int,
    email varchar(255) NOT NULL UNIQUE
);
SELECT*FROM student;
INSERT INTO student
VALUES
(3,'Ram',12,'hari12@gmail.com'),
(2,'Sita',15,'sita@gamil.com'),
(4,'Shyam',16,'shyam@gmail.com');
