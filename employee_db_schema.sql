CREATE TABLE Departments (
    dept_no varchar(10) PRIMARY KEY,
    dept_name varchar(50)   NOT NULL
);

CREATE TABLE Titles (
    title_id varchar(10) PRIMARY KEY,
    title varchar(50)   NOT NULL
);

CREATE TABLE Employees (
    emp_no int PRIMARY KEY  NOT NULL,
    emp_title_id varchar(10)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex varchar(20)   NOT NULL,
    hire_date date   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)	
);


CREATE TABLE Department_Employees (
    emp_no int   NOT NULL,
    dept_no varchar(10)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),	
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Department_Managers (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),	
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)	
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)		
);

