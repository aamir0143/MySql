create database BRP_BATCH;
show databases;
use BRP_BATCH;
create database AAMIR;
drop database aamir;
CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
);
show tables;
desc employee_table; 
ALTER TABLE employee_table  
ADD salary int(30) NOT NULL;
ALTER TABLE employee_table  
ADD gender varchar(6) NOT NULL  
AFTER name,  
ADD address varchar(100) NOT NULL  
AFTER salary ;  
insert into employee_table values (1,"Aamir","Male","Software Engineer",25,50000,"Shampura");
select * from employee_table;
insert into employee_table (name,gender,occupation,age,salary,address) values ("Geeta","Female","Test Engineer",26,45000,"IndraNagar");
ALTER TABLE employee_table 
MODIFY firstname varchar(150) unique; 
ALTER TABLE employee_table
ADD firstname varchar(75);
ALTER TABLE employee_table
drop firstname;
ALTER TABLE employee_table  
rename COLUMN salary to sal;
desc employee_table;
ALTER TABLE employee_table  
RENAME TO emp_table;
show tables;
desc emp_table;
select * from emp_table;
select name,sal from emp_table