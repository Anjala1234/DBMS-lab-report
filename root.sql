select user();
CREATE USER 'Ram'@'localhost' IDENTIFIED BY 'Ram@123';

GRANT SELECT ON college_database.students TO 'Ram'@'localhost';
GRANT INSERT ON college_database.students TO 'Ram'@'localhost';

REVOKE INSERT ON college_database.students FROM 'Ram'@'localhost';