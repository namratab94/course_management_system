
INSERT INTO Contact VALUES
(0, '207-612-9990'),
(0, '207-612-9991'),
(1, '207-612-9992'),
(2, '207-612-9993'),
(2, '207-612-9994'),
(3, '207-612-9995'),
(4, '207-612-9996'),
(5, '207-612-9997'),
(6, '207-612-9998'),
(7, '207-612-9998');

INSERT INTO Users VALUES
(0,		'Alice',		'Wonder', 		'17 Elmer St.', 'Cambridge', '02139', 'USA', 'awonder@thor.com', NULL),
(1,		'Bob',			'Smith',  		'90 John Ave.', 'Winthrop', '02152', 'USA', 'bsmith@example.com', NULL),
(2,		'Charlotte',	'Chambers', 	'34 Merry St.', 'Winthrop', '02153', 'USA', 'cchambers@plants.com', NULL),
(3,		'Devin',		'Smith',  		'17 Light St.', 'Boston', '02155', 'USA', 'dsmith01@example.com', NULL),
(4,		'Evelyn',		'Adams',  		'55 Rivera St.', 'Rio', '15673', 'Brazil', 'eadamsbest@barbs.com', NULL),
(5,		'Fiona',		'Levinson',  	'17 Jenkins St.', 'Boston', '02155', 'USA', 'support@sample.com', NULL),

/* Faculty: */
(6,		'Gina',			'Smith',  		'55 Elmer St.', 'Cambridge', '02139', 'USA', 'gina_honorable@yahoo.com', NULL),
(7,		'Alex',			'Manuel',  		'17 First St.', 'Boston', '02155', 'USA', 'AMMH@example.com', NULL),
(8,		'Katie',		'Johnson',  	'36 Second St.', 'Boston', '02155', 'USA', 'kat_the_rat@gmail.com', NULL),

/* Admin and faculty */
(9,		'Jacob',		'Jacobson',  	'58 Third St.', 'Montreal', '02155', 'Canada', 'jj@freeemails.com', NULL),
(10,	'Martin',		'Martinson',	'5 Elmer St.', 'Boston', '02155', 'USA', 'mars_curtain_seller@sellers.com', NULL);


INSERT INTO Teach VALUES
(6, 00),
(7, 01),
(8, 02),
(9, 03),
(10, 04),
(6, 05),
(7, 06),
(8, 07),
(9, 08),
(10, 09),
(6, 10),
(7, 00),
(7, 02);

INSERT INTO Admin VALUES
('10:00am', '10-1-17', 9, 10);



INSERT INTO Faculty VALUES
(6, 'Associate', 'WPI', 'www.professor1.com', 10, '10-1-17', '10:00am'),
(7, 'Associate', 'WPI', 'www.professor2.com', 9, '10-1-17', '10:00am'),
(8, 'Associate', 'WPI', 'www.professor3.com', 9, '10-1-17', '10:00am'),
(9, 'Associate', 'WPI', 'www.professor4.com', 10, '10-1-17', '10:00am'),
(10, 'Associate', 'WPI', 'www.professor5.com', 10, '10-1-17', '10:00am');


INSERT INTO Interest VALUES
(1, 00),
(1, 01),
(1, 02),
(2, 03),
(2, 04),
(2, 05),
(3, 06),
(4, 07),
(5, 08),
(6, 09),
(7, 10),
(8, 00),
(9, 01),
(10,02);

INSERT INTO Enroll VALUES
(1, 00),
(1, 01),
(1, 02),
(2, 03),
(2, 04),
(2, 05);

INSERT INTO Payment VALUES
(1, 00),
(1, 01),
(2, 00),
(2, 03),
(2, 05);



INSERT INTO Topic VALUES
(0, 'Biology'),
(1, 'Computer Science'),
(2, 'Mechanics'),
(3, 'Business'),
(4, 'Mathematics'),
(5, 'Medicine'),
(6, 'Chemistry'),
(7, 'Physics'),
(8, 'Electrical Engineering'),
(9, 'History),
(10, 'Culture');



INSERT INTO Sec_topic VALUES
(8, 01),
(9, 10),
(10, 09);

INSERT INTO Courses VALUES
('Bioinstrumentation', NULL, 20, 	00, '11-21-17', '9:00am', 'The first introduction to instrumentation of bio.', 0),
('Intro to CS', NULL, 10, 			01, '10-1-17', '10:00am', 'Introduction to program design', 1),
('Intro to Mechanics', NULL, 10, 	02, '10-2-17', '10:00am', 'Introduction to mechanics of systems', 2),
('Intro to Business', NULL, 10, 	03, '10-3-17', '10:00am', 'Introduction to how businesses work', 3),
('Intro to Mathematics', NULL, 10, 	04, '10-4-17', '10:00am', 'Introduction to higher mathematic theories.', 4),
('Intro to Medicine', NULL, 10, 	05, '10-5-17', '10:00am', 'Introduction to medicine.', 5),
('Intro to Chemistry', NULL, 10, 	06, '10-6-17', '10:00am', 'Introduction to the chemical processes that govern materials.', 6),
('Intro to Physics', NULL, 10, 		07, '10-7-17', '10:00am', 'Introduction to physics and how the universe works.', 7),
('Intro to Electrical Engineering', NULL, 10, 08, '10-1-17', '10:00am', 'Introduction to electrical engineering', 8),
('Intro to History', NULL, 10, 		09, '11-1-17', '10:00am', 'Introduction to history', 9),
('Intro to Culture', NULL, 10, 		10, '11-1-17', '10:00am', 'Introduction to world cultures', 10);



INSERT INTO Material VALUES
('background of bioinstrumentation', 		0, 00),

('background of computer science', 			0, 01),
('setting up computer science coding env', 	1, 01),
('creating your first program', 			2, 01),

('background of business', 					0, 03),

('Medicine Lecture 1', 						0, 05),
('Medicine Lecture 2: The Human Body', 		1, 05),
('Medicine Lecture 3: Chemical Agents', 	2, 05);


INSERT INTO Post VALUES
("Welcome to your first assignment in biology. Please click accept to receive credit for reading this.", 0, 00);

INSERT INTO Link VALUES
('https://youtube.com/jdfkash', 			TRUE, 0, 01),
('https://youtube.com/jdfdfasdfasddddd', 	TRUE, 1, 01),
('https://github.com/jdfkacdddd', 			false, 2, 01),
('https://youtube.com/jdbusinessddd', 		TRUE, 0, 03);

INSERT INTO Download VALUES
('https://examples.com/01', 1024, 'pdf', 0, 05),
('https://examples.com/02', 1024, 'pdf', 1, 05),
('https://examples.com/03', 2048, 'pdf', 2, 05);


INSERT INTO MaterialsComplete VALUES
(1, '8:00pm', '11-20-17', 0, 00),
(1, '8:00pm', '11-20-17', 0, 01),
(2, '8:00pm', '11-20-17', 0, 03),
(2, '8:00pm', '11-20-17', 0, 05);


INSERT INTO CourseComplete VALUES
(2, '8:00pm', '11-20-17', 00, 'This was a really fast course - please add more materials.', 1),
(5, '3:00pm', '11-19-17', 03, 'Fast course! Awesome.', 1);




/* Questions */

INSERT INTO Questions VALUES
('Why is business important?', 1000, 1, 'Please reconsider this course.'),
('Are we going to have more materials?', 1001, 0, 'Yes, we have forgotten to add the rest.');


INSERT INTO ASK VALUES
(1, 1000),
(2, 1001);

INSERT INTO Likes VALUES
(1, 1000),
(2, 1000);

INSERT INTO Relate VALUES
(1001, 0, 00),
(1000, 0, 00);

INSERT INTO Answers VALUES
(1000, 7),
(1000, 7);
