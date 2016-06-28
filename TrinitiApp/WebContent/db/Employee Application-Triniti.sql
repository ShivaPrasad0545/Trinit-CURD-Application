
/***********MY-SQL*****************/
/*1.create Database */ create database UserDB;
/*2.use created DB*/ use UserDB;
/*3.create a table */ create table employee(employeeID int(5), employeeName varchar(50), emailid varchar(100), salary double(8,2), constraint emp_id PRIMARY KEY(employeeID));
/*4.add auto increment constraint for employeeId*/
				alter table employee modify employeeID int not null AUTO_INCREMENT;
				
/***********Oracle****************/
/*1.create a table */ create table employee(employeeID int(5), employeeName varchar(50), emailid varchar(100), salary double(8,2), constraint emp_id PRIMARY KEY(employeeID));

/* NOTES: For AUTO INCRMENT of employeeID we need to create sequence in oracle
   ->Syntax:
		Create sequence sequence_name start with value
		increment by value
		minvalue value
		maxvalue value;
   ->example:
  		 Create sequence emp_sequence start with 1
		increment by 1
		minvalue 1
		maxvalue 10000;
		
   -> Insert Statment should be like below:
   insert into emp (employeeID,employeeName,emailid,salary) values(emp_sequence.nextval,'JOHN','Johnson@triniti.com',10000); 
   
 */
/*2. create sequence*/
 Create sequence emp_sequence start with 1
		increment by 1
		minvalue 1
		maxvalue 10000;
				
				