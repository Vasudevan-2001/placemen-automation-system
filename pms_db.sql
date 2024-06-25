create database pms;
use pms;
create table tbl_session(regno varchar(20),password varchar(20),email varchar(30));

create table tbl_student(regno varchar(20) primary key,name varchar(20),password varchar(20),confirm_password varchar(20),dob varchar(20),gender varchar(20),mobile varchar(20),email varchar(20),doj varchar(20),dept varchar(20),sslc varchar(20),hsc varchar(20),cgpa varchar(20),current_arrear varchar(20),history_of_arrear varchar(20),yop varchar(20));

create table tbl_company(id varchar(20) primary key,name varchar(200),about varchar(2000),job_desc varchar(2000),e_sslc varchar(20),e_hsc varchar(20),e_cgpa varchar(20),e_ca varchar(20),e_hoa varchar(20),drive_date varchar(20),location varchar(200),website varchar(200),campus varchar(20),dept varchar(500));

create table tbl_drive(regno varchar(20),student_name varchar(30),dept varchar(300),doj varchar(20),sslc varchar(20),hsc varchar(20),cgpa varchar(20),current_arrear varchar(20),history_arrear varchar(20),yop varchar(30),id varchar(20),cname varchar(300),drive_date varchar(20),resume varchar(50),status varchar(20),application_status varchar(30),drive_status varchar(20),campus_status varchar(30));

create table tbl_forum(qid varchar(20),question varchar(2000),answer varchar(2000));

create table tbl_alumni(id varchar(20) primary key,name varchar(30),dept varchar(100),passed_out varchar(20),status varchar(30),company_name varchar(500));

create table tbl_notification(nid varchar(20),date varchar(20),notification varchar(10000));