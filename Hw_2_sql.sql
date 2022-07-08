/* 1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками*/
create table employees
(id serial primary key,
employe_name varchar(50) not null
);
insert into employees (employe_name)
values ('Barbara Reynolds'),
('Rose Perry'),
('Toni Phillips'),
('Kimberly Hayes'),
('Glenda Roberson'),
('Kimberly Jones'),
('Lori Woods'),
('Katherine Sullivan'),
('Lorraine Rodriguez'),
('Megan Harris'),
('Deborah Hernandez'),
('Mary Diaz'),
('Linda Bell'),
('Gail Alexander'),
('Barbara Chandler'),
('Linda Marshall'),
('Stella Stewart'),
('Clara Johnson'),
('Catherine Davis'),
('Bernice Jordan'),
('Carmen Smith'),
('Leona Horton'),
('Gladys Harper'),
('Stephanie Wong'),
('Helen Allen'),
('Olga Peters'),
('Nicole Jackson'),
('Jennie Lee'),
('Stacey Mitchell'),
('Amy Owen'),
('Wendy Jacobs'),
('Nina Peterson'),
('Anna Dixon'),
('Deborah Estrada'),
('Cindy Taylor'),
('Everett Oliver'),
('Ron Gonzalez'),
('Stephen Cain'),
('John Fox'),
('Charles Wolfe'),
('Todd Byrd'),
('Bradley Harris'),
('Thomas Lopez'),
('Charles Anderson'),
('Robert Thomas'),
('Todd Mason'),
('Richard Webb'),
('Juan Pope'),
('Chris Smith'),
('Patrick Black'),
('John Schwartz'),
('Gary Davis'),
('John Williams'),
('Charles Jones'),
('Richard Mitchell'),
('Jose Watson'),
('John Smith'),
('Leo Boyd'),
('Christopher Parker'),
('William Hall'),
('Terry Graves'),
('Melvin Fleming'),
('William Hughes'),
('David Richards'),
('Dennis Reyes'),
('Robert Kelly'),
('Gary Clark'),
('Michael Williamson'),
('Mark Brock'),
('Robert Davis');

/*2. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
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
- 2500
*/
create table salary (
id serial primary key,
monthly_salary int not null
);
insert into salary (monthly_salary)
values ('1000'),
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');


/*5. Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/

create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary (employee_id, salary_id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6,6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5),
(21, 6),
(22, 7),
(23, 8),
(24, 9),
(25, 10),
(26, 11),
(27, 12),
(28, 13),
(29, 14),
(30, 15),
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5),
(105, 6),
(106, 7),
(107, 8),
(108, 9),
(109, 10);

/*6.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
7.Поменять тип столба role_name с int на varchar(30)
8.Наполнить таблицу roles 20 строками
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
Senior Automation QA engineer
*/

create table roles (
id serial primary key,
role_name int not null unique
);

alter table roles alter column role_name type varchar (30);

insert into roles (role_name)
values ('Junior Python developer'),
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

/*9.Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
10. Наполнить таблицу roles_employee 40 строками:*/

create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
references employees (id),
foreign key (role_id)
references roles (id)
);
insert into roles_employee (employee_id, role_id)
values (1, 20),
(2, 19),
(3, 18),
(4, 17),
(5, 16),
(6, 15),
(7, 14),
(8, 13),
(9, 12),
(10, 11),
(11, 10),
(12, 9),
(13, 8),
(14, 7),
(15, 6),
(16, 5),
(17, 4),
(18, 3),
(19, 2),
(20, 1),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 11),
(32, 12),
(33, 13),
(34, 14),
(35, 15),
(36, 16),
(37, 17),
(38, 18),
(39, 19),
(40, 20);














d