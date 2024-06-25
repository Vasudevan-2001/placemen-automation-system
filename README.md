# Placement automation system
Overview
This project is a web-based application designed to automate the placement process for students in an educational institution. It utilizes JSP (JavaServer Pages), CSS, HTML, JavaScript for the front-end, and MySQL for the database management system.

## Features
Student Registration: Allows students to register their profiles including personal details, academic records, and skills.
Company Registration: Enables companies to register with details such as company profile, job requirements, etc.
Placement Management: Facilitates the management of placement drives, scheduling interviews, and tracking student placements.
Admin Panel: Provides administrators with functionalities to manage student and company databases, monitor placements, and generate reports.

## Technologies Used
  Front-end: HTML, CSS, JavaScript
  Back-end: JSP (JavaServer Pages)
  Database: MySQL
  Additional Tools: Bootstrap (optional, for responsive design)

## Prerequisites
  Ensure you have a Java development environment set up.
  MySQL database installed and running.
  Web server (e.g., Apache Tomcat) for deploying JSP pages.
## Setup Instructions
Database Setup:
  Create a MySQL database named placement_system.
  Import the provided SQL schema (placement_system.sql) to create necessary tables.

## Project Configuration:

Clone the repository to your local machine.
Configure database connection parameters in WEB-INF/web.xml file.

## Deployment:
  Deploy the project to your Java web server (e.g., Apache Tomcat).
  Access the application using http://localhost:8080/placement-system (assuming default Tomcat port).

## Usage
Students: Register, update profiles, view job listings, apply for jobs, and track application status.
Companies: Register, post job listings, view student profiles, schedule interviews, and manage placements.
Admins: Manage student and company databases, oversee placement processes, generate reports.
