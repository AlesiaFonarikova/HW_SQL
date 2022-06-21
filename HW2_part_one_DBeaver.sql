/*Создать таблицу employees
- id. serial, primary key,
- employee_name. varchar(50), not null
Наполнить таблицу employee 70 строками.*/

CREATE TABLE employees(
id serial PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL
);

INSERT INTO employees (employee_name)
VALUES  ('Marian Barnes'),
		('Kimberly Nguyen'),
		('John Hines'),
		('Brent Torres'),
		('Stacy Smith'),
		('William Russell'),
		('Jose Carr'),
		('Laura Price'),
		('Betty Griffin'),
		('Vivian Carson'),
		('Linda Fuller'),
		('Steven Mack'),
		('Mattie Ortiz'),
		('Mildred Johnson'),
		('John Harris'),
		('James Hall'),
		('Timothy Reed'),
		('Ruby Allison'),
		('Patrick Knight'),
		('Julie Turner'),
		('William Moore'),
		('Erika Ford'),
		('Peggy Williams'),
		('Francisco Taylor'),
		('Michele Ray'),
		('Angela Garcia'),
		('Jennifer Hawkins'),
		('Barbara Olson'),
		('Jamie Mason'),
		('Barbara Fitzgerald'),
		('Calvin Davis'),
		('Terry Banks'),
		('Cheryl Phillips'),
		('William Banks'),
		('Julie Williams'),
		('Geraldine Norton'),
		('Julie Rogers'),
		('Lloyd Fernandez'),
		('Gladys Morton'),
		('Anthony Cooper'),
		('Angela Young'),
		('Diane Smith'),
		('Jonathan Cooper'),
		('Cheryl Jackson'),
		('Mary Flowers'),
		('Willard Green'),
		('Sara Swanson'),
		('Anthony Hubbard'),
		('Robert Smith'),
		('Barbara Williams'),
		('Tony Hudson'),
		('Daniel Carlson'),
		('Maureen Nguyen'),
		('Darlene Brown'),
		('Cheryl Hughes'),
		('Kevin Allen'),
		('Virginia Cummings'),
		('Robert Scott'),
		('Gloria Sims'),
		('William Fleming'),
		('Marie Johnson'),
		('Bobbie Medina'),
		('Mark White'),
		('Kathy Walker'),
		('Robert Warren'),
		('Clarence Hamilton'),
		('Victoria Alvarez'),
		('Amanda Howell'),
		('Ben Owens'),
		('Aaron Dunn');
		
/*Создать таблицу salary
- id. serial, primary key,
- monthly_salary. int, not null
Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500*/
	
CREATE TABLE salary(
id serial PRIMARY KEY,
monthly_salary INT NOT NULL
);

INSERT INTO salary (monthly_salary)
VALUES  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

/*Создать таблицу employee_salary
- id. serial, primary key,
- employee_id. int, not null, unique
- salary_id. int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/

CREATE TABLE employee_salary(
id serial PRIMARY KEY,
employee_id INT NOT NULL UNIQUE,
salary_id INT NOT NULL
);

INSERT INTO employee_salary (employee_id,salary_id)
VALUES  (1,9), 
		(3,8),
		(5,7),
		(57,6),
		(9,5),
		(62,4),
		(4,3),
		(58,2),
		(6,1),
		(12,15),
		(14,14),
		(16,13),
		(18,12),
		(20,11),
		(13,10),
		(15,1),
		(19,2),
		(21,3),
		(45,4),
		(27,5),
		(22,6),
		(24,7),
		(48,8),
		(49,9),
		(31,10),
		(33,11),
		(65,12),
		(39,13),
		(54,14),
		(32,15),
		(73,3),
		(81,4),
		(88,6),
		(77,9),
		(71,11),
		(85,12),
		(90,14),
		(91,15),
		(82,2),
		(72,13);

/*Создать таблицу roles
- id. serial, primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:
Junior Python developer
Middle Python developer
Senior Python developer
Junior Java developer
Middle Java developer
Senior Java developer
Junior JavaScript developer
Middle JavaScript developer
Senior JavaScript developer
Junior Manual QA engineer
Middle Manual QA engineer
Senior Manual QA engineer
Project Manager
Designer
HR
CEO
Sales manager
Junior Automation QA engineer
Middle Automation QA engineer
Senior Automation QA engineer*/
	
CREATE TABLE roles(
id serial PRIMARY KEY,
role_name INT NOT NULL UNIQUE
);

ALTER TABLE roles
ALTER COLUMN role_name TYPE VARCHAR(30);

INSERT INTO roles(role_name)
VALUES  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

/*Создать таблицу roles_employee
- id. serial, primary key,
- employee_id. int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками*/

CREATE TABLE roles_employee(
id serial PRIMARY KEY,
employee_id INT NOT NULL UNIQUE,
role_id INT NOT NULL,
	FOREIGN KEY (employee_id)
		REFERENCES employees(id),
	FOREIGN KEY (role_id)
		REFERENCES roles(id)
);

INSERT INTO roles_employee(employee_id,role_id)
VALUES  (1,2),
		(3,4),
		(5,6),
		(7,8),
		(9,10),
		(11,12),
		(13,14),
		(15,16),
		(17,18),
		(19,20),
		(21,1),
		(24,3),
		(27,5),
		(30,7),
		(33,9),
		(36,11),
		(39,13),
		(42,15),
		(45,17),
		(48,19),
		(51,3),
		(54,6),
		(57,9),
		(60,12),
		(63,15),
		(66,18),
		(69,1),
		(2,4),
		(4,6),
		(6,8),
		(8,10),
		(10,12),
		(12,14),
		(14,16),
		(16,18),
		(18,20),
		(22,3),
		(25,15),
		(29,18),
		(32,7);


