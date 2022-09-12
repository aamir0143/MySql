create database CQA_105;
use cqa_105;
CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
);
show tables;
desc employee_table; 
desc aamir;
drop table aamir;
ALTER TABLE employee_table
add salary int not null;
desc employee_table;
ALTER TABLE employee_table
add email varchar(75) not null,
add mobile int unique;
ALTER TABLE employee_table  
MODIFY email varchar(50);  
ALTER TABLE employee_table  
DROP COLUMN email; 
ALTER TABLE employee_table  
CHANGE COLUMN mobile phone   
int not null;  
ALTER TABLE employee_table  
rename column phone to mobile; 
ALTER TABLE employee_table  
RENAME TO emp_table;  
desc emp_table;
RENAME table emp_table TO employee_table; 
desc employee_table;