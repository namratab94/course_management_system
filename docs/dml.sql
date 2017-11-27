INSERT INTO User VALUES
(0,		'Alice',		'Wonder', 		'17 Elmer St.', 'Cambridge', '02139', 'USA', 'awonder@thor.com', NULL),
(1,		'Bob',			'Smith',  		'90 John Ave.', 'Winthrop', '02152', 'USA', 'bsmith@example.com', NULL),
(2,		'Charlotte',	        'Chambers', 	        '34 Merry St.', 'Winthrop', '02153', 'USA', 'cchambers@plants.com', NULL),
(3,		'Devin',		'Smith',  		'17 Light St.', 'Boston', '02155', 'USA', 'dsmith01@example.com', NULL),
(4,		'Evelyn',		'Adams',  		'55 Rivera St.', 'Rio', '15673', 'Brazil', 'eadamsbest@barbs.com', NULL),
(5,		'Fiona',		'Levinson',  	        '17 Jenkins St.', 'Boston', '02155', 'USA', 'support@sample.com', NULL),

/* Faculty */
(6,		'Gina',			'Smith',  		'55 Elmer St.', 'Cambridge', '02139', 'USA', 'gina_honorable@yahoo.com', NULL),
(7,		'Alex',			'Manuel',  		'17 First St.', 'Boston', '02155', 'USA', 'AMMH@example.com', NULL),
(8,		'Katie',		'Johnson',  	        '36 Second St.', 'Boston', '02155', 'USA', 'kat_the_rat@gmail.com', NULL),

/* Admin and faculty */
(9,		'Jacob',		'Jacobson',  	        '58 Third St.', 'Montreal', '02155', 'Canada', 'jj@freeemails.com', NULL),
(10,	        'Martin',		'Martinson',	        '5 Elmer St.', 'Boston', '02155', 'USA', 'mars_curtain_seller@sellers.com', NULL);

INSERT INTO ContactInfo VALUES
(0, '207-612-9990'),
(0, '207-612-9991'),
(1, '207-612-9992'),
(2, '207-612-9993'),
(2, '207-612-9994'),
(3, '207-612-9995'),
(4, '207-612-9996'),
(5, '207-612-9997'),
(6, '207-612-9998'),
(7, '207-612-9998'),
(8, '207-613-9990'),
(9, '207-613-9991'),
(10, '207-613-9992');

INSERT INTO Faculty VALUES
(6, 'Associate', 'WPI', 'www.professor1.com'),
(7, 'Associate', 'WPI', 'www.professor2.com'),
(8, '', '', 'www.professor3.com'),
(9, 'Associate', 'WPI', 'www.professor4.com'),
(10, 'Associate', 'WPI', 'www.professor5.com');

INSERT INTO Admin VALUES
(9, 10, '2017-10-01', '10:00am'),
(10, NULL, '2017-09-01', '10:00am');

INSERT INTO Authentication VALUES
(6, 10, '2017-10-01', '10:00am'),
(7, 9, '2017-10-01', '10:00am'),
(9, 10, '2017-10-01', '10:00am'),
(10, 10, '2017-10-01', '10:00am');

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
(9, 'History'),
(10,'Culture');

INSERT INTO Course VALUES
('Bioinstrumentation', NULL, 20, 	00, 			'2017-10-07', '9:00am', 'The first introduction to instrumentation of bio.', 0),
('Intro to CS', NULL, 10, 		01, 				'2017-10-01', '10:00am', 'Introduction to program design', 1),
('Intro to Mechanics', NULL, 10, 	02, 			'2017-10-01', '10:00am', 'Introduction to mechanics of systems', 2),
('Intro to Business', NULL, 10, 	03, 			'2017-10-02', '10:00am', 'Introduction to how businesses work', 3),
('Intro to Mathematics', NULL, 10, 	04, 			'2017-10-03', '10:00am', 'Introduction to higher mathematic theories.', 4),
('Intro to Medicine', NULL, 10, 	05, 			'2017-10-04', '10:00am', 'Introduction to medicine.', 5),
('Intro to Chemistry', NULL, 10, 	06, 			'2017-10-05', '10:00am', 'Introduction to the chemical processes that govern materials.', 6),
('Intro to Physics', NULL, 10, 		07, 			'2017-10-06', '10:00am', 'Introduction to physics and how the universe works.', 7),
('Intro to Electrical Engineering', NULL, 10, 08, 	'2017-10-07', '10:00am', 'Introduction to electrical engineering', 8),
('Intro to History', NULL, 10, 		09, 			'2017-10-07', '10:00am', 'Introduction to history', 9),
('Intro to Culture', NULL, 10, 		10, 			'2017-10-07', '10:00am', 'Introduction to world cultures', 10);

INSERT INTO Material VALUES
('background of bioinstrumentation', 		0, 00),
('background of computer science', 		0, 01),
('setting up computer science coding env', 	1, 01),
('creating your first program', 		2, 01),
('background of business', 			0, 03),
('Medicine Lecture 1', 				0, 05),
('Medicine Lecture 2: The Human Body', 		1, 05),
('Medicine Lecture 3: Chemical Agents', 	2, 05);

INSERT INTO Teach VALUES
(6, 00, '2017-10-01', '9:00am'),
(7, 01, '2017-10-02', '10:00am'),
(8, 02, '2017-10-03', '10:00am'),
(9, 03, '2017-10-04', '10:00am'),
(10,04, '2017-10-05', '10:00am'),
(6, 05, '2017-10-06', '10:00am'),
(7, 06, '2017-10-07', '10:00am'),
(8, 07, '2017-10-08', '10:00am'),
(9, 08, '2017-10-09', '10:00am'),
(10,09, '2017-10-01', '10:00am'),
(6, 10, '2017-10-02', '10:00am'),
(7, 00, '2017-10-03', '10:00am'),
(7, 02, '2017-10-04', '10:00am');

INSERT INTO IsInterest VALUES
(1, 00),
(1, 01),
(1, 02),
(2, 03),
(2, 04),
(2, 05),
(3, 06),
(3, 03),
(3, 04),
(4, 02),
(4, 03),
(4, 05),
(5, 04),
(5, 02);

INSERT INTO Enroll VALUES
(1, 00),
(1, 01),
(1, 02),
(2, 03),
(2, 04),
(2, 05),
(3, 04),
(4, 05),
(5, 02);

INSERT INTO Payment VALUES
(1, 00, '123xyz', '2017-06-09', '10:00am'),
(1, 01, '123abc', '2017-06-10', '10:00am'),
(2, 00, '456abc', '2017-06-11', '10:00am'),
(2, 03, '456xyz', '2017-06-12', '10:00am'),
(2, 05, '781abc', '2017-06-09', '10:00am');

INSERT INTO Sec_topic VALUES
(8, 01),
(9, 10),
(10, 09);

INSERT INTO Post VALUES
("Welcome to your first assignment in biology. Please click accept to receive credit for reading this.", 0, 00);

INSERT INTO Link VALUES
('https://youtube.com/jdfkash', 		1, 0, 01),
('https://youtube.com/jdfdfasdfasddddd', 	1, 1, 01),
('https://github.com/jdfkacdddd', 		0, 2, 01),
('https://youtube.com/jdbusinessddd', 		1, 0, 03);

INSERT INTO File VALUES
('https://examples.com/01', 1024, 'pdf', 0, 05),
('https://examples.com/02', 1024, 'pdf', 1, 05),
('https://examples.com/03', 2048, 'pdf', 2, 05);

INSERT INTO CompletesMaterial VALUES
(1, '8:00pm', '2017-11-20', 0, 00),
(1, '8:00pm', '2017-11-21', 0, 01),
(2, '8:00pm', '2017-11-22', 0, 03),
(2, '8:00pm', '2017-11-23', 0, 05);

INSERT INTO CompletesCourse VALUES
(2, '8:00pm', '2017-20-11', 00, 'This was a really fast course - please add more materials.', 1),
(5, '3:00pm', '2017-20-11', 03, 'Fast course! Awesome.', 1);

/* Questions */

INSERT INTO Questions VALUES
('Why is business important?', 1000, 1, 'Please reconsider this course.'),
('Are we going to have more materials?', 1001, 0, 'Yes, we have forgotten to add the rest.');

INSERT INTO Ask VALUES
(1, 1000),
(2, 1001);

INSERT INTO LikesQuestion VALUES
(1, 1000),
(2, 1000);

INSERT INTO RelateToMaterial VALUES
(0, 1000, 00),
(0, 1001, 00);

INSERT INTO Answers VALUES
(1000, 7),
(1001, 7);

INSERT INTO Quiz VALUES
(0, 01, 5),
(1, 01, 5),
(2, 01, 5);

INSERT INTO Quiz_Questions VALUES
(0, 01, 1, 'What is coding env'),
(0, 01, 2, 'Describe steps involved in setting up coding env'),
(1, 01, 1, 'Write a basic schema to write a sample program'),
(1, 01, 2, 'Write a hello world program'),
(2, 01, 1, 'What is business'),
(2, 01, 2, 'Key factors for evaluating business model');

INSERT INTO Quiz_Answers VALUES
(0, 01, 1, 1, 1, 'Wrong'),
(0, 01, 1, 2, 2, 'Wrong'),
(0, 01, 1, 3, 3, 'Right'),
(0, 01, 2, 1, 1, 'Wrong'),
(0, 01, 2, 2, 2, 'Right'),
(1, 01, 1, 1, 1, 'Right'),
(1, 01, 1, 2, 2, 'Wrong'),
(1, 01, 2, 1, 1, 'Right'),
(1, 01, 2, 2, 2, 'Wrong'),
(1, 01, 2, 3, 3, 'Wrong'),
(2, 01, 1, 1, 1, 'Right'),
(2, 01, 1, 2, 2, 'Wrong'),
(2, 01, 1, 3, 3, 'Wrong'),
(2, 01, 2, 1, 1, 'Right'),
(2, 01, 2, 2, 2, 'Wrong');


