//-- Aggregate Functions-----------------------------------------------------
use cqa_105_data;
CREATE TABLE employee(  
	name varchar(45) NOT NULL,    
	occupation varchar(35) NOT NULL,    
	working_date date,  
	working_hours varchar(10)  
);  
INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11); 
select * from employee;

//-- 1.Count() Function---------------------
SELECT COUNT(working_date) FROM employee;

//-- 2.Sum() Function-----------------------
 SELECT SUM(working_hours) AS "Total working hours" FROM employee; 
 
 //-- 3.AVG() Function---------------------
 SELECT AVG(working_hours) AS "Average working hours" FROM employee;    
 
 //-- 4.MIN() Function----------------------
  SELECT MIN(working_hours) AS Minimum_working_hours FROM employee;    

//-- 5.MAX() Function----------------------
  SELECT MAX(working_hours) AS Minimum_working_hours FROM employee;
  
//-- 6.FIRST() Function---------------------
 SELECT name FROM employee LIMIT 1;    
 
 //-- 7.LAST() Function-----------------------
 SELECT working_hours FROM employee ORDER BY name DESC LIMIT 1;
 
 
 
 //-- *******MySQL Subquery*********
CREATE TABLE employee_data( 
	emp_id int not null,
	emp_name varchar(45) NOT NULL,    
	emp_age int NOT NULL,    
	city varchar(35) not null,  
	income varchar(10)   
);  
	INSERT INTO employee_data VALUES    
	(101,'Robin',32, 'NewYork',200000 ),  
	(102,'Warner',32, 'California', 300000 ),  
	(103,'Peter', 40,'Arizona',1000000 ),  
	(104,'Marco', 35,'Florida', 5000000),  
	(105,'Brayden',32, 'Georgia',250000 ),  
	(106,'Antonio',45, 'Alaska', 450000),
	(107,'Adam',35, 'NewYork',5000000 ),  
	(108,'Macculam',40, 'California', 350000 ),  
	(109,'Brayan', 32,'Arizona',400000 ),  
	(110,'Stephan', 40,'Florida', 600000),  
	(111,'Alexander',45, 'Georgia',70000 );  
	select * from employee_data;
	 SELECT emp_name, city, income FROM employee_data   
	   WHERE emp_id IN (SELECT emp_id FROM employee_data); 
   
 //-- 1.Subquery with Comparison Operator-----------------------------------------------
	 SELECT * FROM employee_data   
	   WHERE emp_id IN (SELECT emp_id FROM employee_data   
			 WHERE income > 350000); 
         
	 SELECT emp_name, city, income FROM employee_data   
		WHERE income = (SELECT MIN(income) FROM employee_data); 
 //-- 2.Subquery with IN or NOT-IN Operator----------------------------------------------- 
		CREATE TABLE Student1(
			Id INTEGER, 
			Name TEXT NOT NULL, 
			Email TEXT NOT NULL, 
			City VARCHAR(35));
		select * from Student1;    
		INSERT INTO Student1 VALUES
			(1, 'Peter', 'peter@gmail.com', 'Texas'), 
			(2, 'Suzi', 'suzi@gmail.com', 'California'),
			(3, 'Joseph', 'joseph@gmail.com', 'Alaska'),
			(4, 'Andrew', 'andrew@gmail.com', 'Los Angeles'),
			(5, 'Brayan', 'brayan@gmail.com', 'New York');
        CREATE TABLE Student2
			(Id INTEGER, Email TEXT NOT NULL, Name TEXT NOT NULL, City VARCHAR(35));  
		INSERT INTO Student2 VALUES
			(1, 'stephen@gmail.com', 'stephen', 'texas'), 
			(2, 'joseph@gmail.com', 'joseph', 'los angeles'), 
			(3, 'peter@gmail.com', 'peter', 'california'), 
			(4, 'david@gmail.com', 'david', 'new york'), 
			(5, 'maddy@gmail.com', 'maddy', 'los angeles'); 
		select * from Student2;  
		SELECT Name, City FROM student1
			WHERE City NOT IN   
				(SELECT City FROM student2 WHERE City='Los Angeles');  
//-- 3.Correlated Subqueries--------------------------------------------------------------
		SELECT emp_name, city, income  
			FROM employee_data emp WHERE income > (   
		SELECT AVG(income) FROM employee_data WHERE city = emp.city);
        
        
        /--  ^^^^^^^^^^^^^^^^^^^^^^^^^^MySQL JOINS^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//-- 1.MySQL Inner JOIN (Simple Join)-----------------------------------------
		select * from person2;
        select * from student1;
		SELECT person2.name, person2.city, student1.Email 
			FROM person2   
			INNER JOIN student1  
			ON person2.id = student1.id; 
            
//-- 2.MySQL Left Outer Join--------------------------------------------------
		SELECT person2.name, person2.city, student1.Email 
			FROM person2   
			LEFT JOIN student1  
			ON person2.id = student1.id; 
            
//-- 3.MySQL Right Outer Join--------------------------------------------------
		SELECT person2.name, person2.city, student1.Email 
			FROM person2   
			RIGHT JOIN student1  
			ON person2.id = student1.id; 
//--  4.MySQL Inner Join--------------------------------
		Create table student4 (
				 studentid integer,
				 stud_fname varchar (45),
                 stud_lname varchar (45),
                 city varchar (50)
				 );
		INSERT INTO Student4 VALUES
			(1, 'devin', 'putin', 'france'), 
			(2, 'michael', 'clark', 'australiya'), 
			(3, 'ethon', 'miller', 'england'), 
			(4, 'mark', 'strauss', 'america');
		select * from Student4;  

		Create table technologies (
			studentid integer,
			techid integer,
			inst_name varchar(45),
			technology varchar(45));
            alter table technologies 
            rename column studentid to id;
		insert into technologies values ( 1, 1, 'java training inst', 'java'),
			(2, 2, 'chroma campus', 'angular'),
			(3, 3, 'cepta infotech', 'big data'),
			(4, 4, 'aptron', 'ios');
		select * from technologies;
        SELECT student4.stud_fname, student4.stud_lname, student4.city, technologies.technology    
		FROM student4   
		INNER JOIN technologies    
		ON student4.studentid = technologies.techid; 
        //-- (i)MySQL Inner Join with Group By Clause
			SELECT student4.stud_fname, student4.stud_lname, student4.city, technologies.technology   
				FROM student4  
				INNER JOIN technologies    
				ON student4.studentid = technologies.techid GROUP BY inst_name;
         //-- (ii)MySQL Inner Join with USING clause    
			SELECT studentid, inst_name, city, technology    
			FROM student4   
			INNER JOIN technologies    
			USING (studentid); 
         //-- (iii) Inner Join with WHERE Clause
			    SELECT techid, inst_name, city, technology    
					FROM student4  
					INNER JOIN technologies    
					USING (studentid) WHERE technology = "Java";  	
         //-- (iv) MySQL Inner Join Multiple Tables
				Create table contact (
					college_id integer,
					cellphone varchar(20),
					homephone varchar(20));
                insert into contact values
					(1, 23232323,545455455),
                    (2, 23456788,456789033),
                    (3, 89765432,789065433),
                    (4, 67253545,987654332);
                select * from contact;    
				SELECT studentid, inst_name, city, technology, cellphone  
					FROM student4   
					INNER JOIN technologies USING (studentid)  
					INNER JOIN contact ORDER BY studentid;	
                    
 /-- 4.MySQL LEFT JOIN ------------------------------------------------  
		create table customer1(
			customer_id int,
            cust_name varchar(25),
            occupation varchar(30),
            income varchar(50),
            qualification varchar(25)
        );
        insert into customer1 values
			(1,'John Miller', 'Developer',20000,'Btech'),
            (2,'Mark Robert', 'Engineer',40000,'Btech'),
            (3,'Reyan Watson', 'Scientist',60000,'Msc'),
            (4,'Shane Trump', 'Businessman',10000,'MBA'),
            (5,'Adam Obama', 'Manager',80000,'MBA'),
            (6,'Rincky Ponting', 'Cricketer',200000,'Btech');
		select * from customer1;
        create table Order1 (
			order_id int,
			date date,
			customer_id int,
			price int
			);
		insert into Order1 values 
		(1001, '2020-03-20', 2, 3000);
		insert into Order1 values
		(1002, '2020-02-15', 4, 2500),
		(1003, '2020-01-31', 5, 5000),
		(1004, '2020-03-10', 2, 1500),
		(1005, '2020-02-20', 1, 4500);
		select * from Order1;    
        SELECT customer1.customer_id, cust_name, price, date  
			FROM customer1  
			LEFT JOIN order1 ON customer1.customer_id = order1.customer_id;
		//-- MySQL LEFT JOIN with USING Clause
			SELECT customer_id, cust_name, occupation, price, date  
				FROM customer1  
				LEFT JOIN order1 USING(customer_id);
        //-- MySQL LEFT JOIN with Group By Clause
            SELECT customer1.customer_id, cust_name, qualification, price, date  
				FROM customer1  
				LEFT JOIN order1 ON customer1.customer_id = order1.customer_id  
				GROUP BY price;
         //-- LEFT JOIN with WHERE Clause
             SELECT customer_id, cust_name, occupation, price, date  
				FROM customer1  
				LEFT JOIN order1   
				USING(customer_id) WHERE price>2500;
         //-- MySQL LEFT JOIN Multiple Tables
             SELECT customer1.customer_id, cust_name, order_id, price, cellphone  
				FROM customer1  
				LEFT JOIN contact ON customer_id = college_id  
				LEFT JOIN order1 ON customer1.customer_id = order1.customer_id ORDER BY income; 
          //-- Use of LEFT JOIN clause to get unmatched records
              SELECT customer_id, cust_name, cellphone, homephone  
					FROM customer1 
					LEFT JOIN contact ON customer_id = college_id  
					WHERE cellphone IS NULL ; 
          //-- Difference between WHERE and ON clause in MySQL LEFT JOIN
              SELECT cust_name, occupation, order_id, price, date  
					FROM customer1  
					LEFT JOIN order1   
					USING(customer_id) WHERE price=2500; 

/-- 5.MySQL RIGHT JOIN -------------------------------------------------------------------
		SELECT customer1.customer_id, cust_name, price, date  
			FROM customer1  
			RIGHT JOIN order1 ON customer1.customer_id = order1.customer_id  
			ORDER BY  customer_id;
            
        //-- RIGHT JOIN with WHERE Clause
        SELECT * FROM customer1  
				RIGHT JOIN order1 USING(customer_id)  
				WHERE price>2500 AND price<5000; 
        //-- MySQL RIGHT JOIN Multiple Tables
            SELECT customer1.customer_id, cust_name, order_id, price, cellphone  
				FROM customer1  
				RIGHT JOIN contact ON customer_id = college_id  
				RIGHT JOIN order1 ON customer1.customer_id = order1.customer_id ORDER BY order_id;
         //-- Use of RIGHT JOIN clause to get unmatched records
             SELECT customer_id, cust_name, cellphone, homephone  
				FROM customer1  
				RIGHT JOIN contact ON customer_id = college_id  
				WHERE cellphone IS NULL  
				ORDER BY cellphone;
                
/-- 6.MySQL CROSS JOIN ----------------------------------------------------------------------------
             SELECT *  
				FROM customer1  
				CROSS JOIN contact; 
          //-- Ambiguous Columns problem in MySQL CROSS JOIN
			SELECT customer_id, cust_name, income, order_id, price  
				FROM customer1  
				CROSS JOIN order1;  
			SELECT customer1.customer_id, customer1.cust_name, customer1.income, order1.order_id, order1.price  
				FROM customer1  
				CROSS JOIN order1;  
           //-- CROSS JOIN with WHERE Clause 
           SELECT customer1.customer_id, customer1.cust_name, customer1.income, order1.order_id, order1.price  
				FROM customer1  
				CROSS JOIN order1  
				USING(customer_id) WHERE price>1500 AND price<5000;
          //-- MySQL CROSS JOIN Multiple Tables
              SELECT * FROM customer1  
				LEFT JOIN(order1 CROSS JOIN contact)  
				ON customer1.customer_id=college_id  
				ORDER BY income;  
                
/-- 7. MySQL SELF JOIN----------------------------------------------------------------------
             Create table student5 (
				 student_id int,
				 name varchar (45),
				 course_id int,
				 duration int
				 );
			insert into student5 value
            (1,'Adam',1,3),
            (2,'Peter',2,4),
            (1,'Adam',2,4),
            (3,'Brian',3,2),
            (2,'Shane',3,5);
            select * from student5;
            SELECT  s1.student_id, s1.name  
				FROM student5 AS s1, student5 s2  
				WHERE s1.student_id=s2.student_id  
				AND s1.course_id<>s2.course_id;
            //-- SELF JOIN using INNER JOIN clause
                SELECT  s1.student_id, s1.name  
					FROM student5 s1  
					INNER JOIN student5 s2  
					ON s1.student_id=s2.student_id  
					AND s1.course_id<>s2.course_id  
					GROUP BY student_id; 

/-- 8.MySQL DELETE JOIN----------------------------------------------------------------------
			DELETE student5, contact FROM student5  
				INNER JOIN contact ON student5.student_id=contact.college_id   
				WHERE student5.student_id = 4; 
			SELECT * FROM student5;  
			SELECT * FROM contact;
            
            //-- DELETE JOIN with LEFT JOIN
            DELETE customer1 FROM customer1  
				LEFT JOIN contact ON customer1.customer_id = contact.college_id   
				WHERE cellphone IS NULL;
                
/-- 8.MySQL UPDATE JOIN ------------------------------------------------------------------------
			CREATE TABLE Performance (  
				performance INT(11) NOT NULL,  
				percentage FLOAT NOT NULL,  
				PRIMARY KEY (performance)  
				);  
		INSERT INTO Performance (performance, percentage)  
				VALUES(101,0),  
					  (102,0.01),  
					  (103,0.03),  
					  (104,0.05),  
					  (105,0.08); 
        select * from performance;              
		 CREATE TABLE Employee_update_join (  
			id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,  
			name VARCHAR(255) NOT NULL,  
			performance INT(11) DEFAULT NULL,  
			salary FLOAT DEFAULT NULL,  
			CONSTRAINT fk_performance FOREIGN KEY (performance) REFERENCES Performance (performance)  
		);  
        INSERT INTO Employee_update_join (name, performance, salary)        
			VALUES('Mary', 101, 55000),  
				  ('John', 103, 65000),  
				  ('Suzi', 104, 85000),  
				  ('Gracia', 105, 110000),  
				  ('Nancy Johnson', 103, 95000),  
				  ('Joseph', 102, 45000),  
				  ('Donald', 103, 50000); 
         select * from Employee_update_join;  
         //-- UPDATE JOIN with INNER JOIN Example
         UPDATE Employee_update_join e  
			INNER JOIN Performance p   
			ON e.performance = p.performance  
			SET salary = salary + salary * percentage; 
         //--  UPDATE JOIN with LEFT JOIN Example
             INSERT INTO Employee_update_join (name, performance, salary)  
				VALUES('William', NULL, 73000),  
					  ('Rayan', NULL, 92000);  
			UPDATE Employee_update_join e  
				LEFT JOIN Performance p   
				ON e.performance = p.performance   
				SET salary = salary + salary * 0.025  
				WHERE p.percentage IS NULL;	
                
 /-- 9.MySQL EquiJoin----------------------------------------------------------- 
		create table customer3 (
			id int,
            customer_name varchar(40),
            account varchar(20),
            email varchar(40)
            );
            insert into customer3 values
            (1,'stephen',1030,'stephen@gmail.com'),
            (2,'Jenifer',1030,'jenifer@gmail.com'),
            (3,'Mathew',1030,'mathew@gmail.com'),
            (4,'Smith',1030,'smith@gmail.com'),
            (5,'David',1030,'david@gmail.com');
		//-- Equi Join Using Three Tables
        create table balance (
			id int,
			account_num int,
			balance int);
			insert into balance values
			(1, 1030, 50000),
			(2, 2035, 230000),
			(3, 5564, 125000),
			(4, 4534, 80000),
			(5, 7648, 45000);
            
    select * from balance;
            CREATE TABLE cust_info (  
				account_no int,  
				mobile VARCHAR(15),  
				address VARCHAR(65)  
                
				);  
         INSERT INTO cust_info (account_no, mobile, address)  
			VALUES(1030, '598675498654', '777 Brockton Avenue, Abington MA 251'),   
				(2035, '698853747888', '337 Russell St, Hadley MA 103'),   
				(5564, '234456977555', '20 Soojian Dr, Leicester MA 154'),   
				(4534, '987656789666', '780 Lynnway, Lynn MA 19'),   
				(7648, '756489372222', '700 Oak Street, Brockton MA 23'); 
         select * from cust_info;    
         SELECT C.customer_name, C.account, B.balance, I.mobile   
			FROM customer3 AS C, balance AS B, cust_info AS I  
			WHERE C.account = B.account_num   
			AND B.account_num = I.account_no; 
/-- 10.MySQL Natural Join0---------------------------------------------------------------
		 SELECT cust. customer_name, bal.balance   
			FROM customer3 AS cust   
			NATURAL JOIN balance AS bal; 
         SELECT cust. customer_name, bal.balance   
			FROM customer3 AS cust   
			INNER JOIN balance AS bal   
			ON cust.id = bal.id;   
         SELECT * FROM customer3 NATURAL JOIN balance;  
        //-- Natural Join with WHERE Clause
        SELECT cust. customer_name, bal.balance   
			FROM customer3 AS cust   
			NATURAL JOIN balance AS bal  
			WHERE bal.balance > 50000; 
         //-- Natural Join Using Three Tables
          SELECT C.customer_name, C.account, B.balance, I.mobile   
			FROM customer3 AS C  
			NATURAL JOIN balance AS B  
			NATURAL JOIN cust_info AS I;
            
            
            CREATE TABLE t_school(
	 ID INT, School_Name VARCHAR(40), 
	 Number_Of_Students INT, 
	 Number_Of_Teachers INT,
	 Number_Of_Classrooms INT, 
	 EmailID VARCHAR(40));  
START TRANSACTION;   
select * from t_school;   
INSERT INTO t_school
(ID, School_Name, Number_Of_Students, Number_Of_Teachers, Number_Of_Classrooms, EmailID) 
	VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
	(2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"),
	 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"),
	 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"), 
	 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com");  
COMMIT;       
SET autocommit = 0;  
 START TRANSACTION;  
SAVEPOINT Insertion; 
UPDATE t_school 
	SET Number_Of_Students = 9050 
	WHERE ID = 5;
SELECT *FROM t_school;  
SAVEPOINT Updation;      
ROLLBACK TO Insertion; 
select * from t_school;

 CREATE TABLE customer_TCL(
     Customer_ID INT PRIMARY KEY, 
     Name VARCHAR(20), 
     Age INT, 
     Salary INT, 
     Salary_BankAccount VARCHAR(20)); 
  INSERT INTO customer_TCL(Customer_ID, Name, Age, Salary, Salary_BankAccount) 
      VALUES(1, "Aryan Jain", 51, 56000, "SBI"),
      (2, "Arohi Dixit", 21, 25000, "Axis"), 
      (3, "Vineet Garg", 24, 31000, "ICICI"), 
      (4, "Anuja Sharma", 26, 49000, "HDFC"),
      (5, "Deepak Kohli", 28, 65000, "SBI");  
SELECT *FROM customer_TCL; 
START TRANSACTION;   
SAVEPOINT Insertion;  
DELETE FROM customer_TCL WHERE Customer_ID = 5; 
SELECT *FROM customer_TCL; 
SAVEPOINT Deletion;  
ROLLBACK TO Insertion;
SELECT *FROM customer_TCL;
use cqa_105_data;
select * from emp;