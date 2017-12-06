INSERT INTO User VALUES
(0,		'Alice',		'Wonder', 		'17 Elmer St.', 'Cambridge', '02139', 'USA', 'awonder@thor.com',	'1234', NULL),
(1,		'Bob',			'Smith',  		'90 John Ave.', 'Winthrop', '02152', 'USA', 'bsmith@example.com',	'password1234', NULL),
(2,		'Charlotte',	'Chambers', 	'34 Merry St.', 'Winthrop', '02153', 'USA', 'cchambers@plants.com',	'pa55word', NULL),
(3,		'Devin',		'Smith',  		'17 Light St.', 'Boston', '02155', 'USA', 'dsmith01@example.com',	'bunny', NULL),
(4,		'Evelyn',		'Adams',  		'55 Rivera St.', 'Rio', '15673', 'Brazil', 'eadamsbest@barbs.com','kdfjaweroifhi2830dc', NULL),
(5,		'Fiona',		'Levinson',  	        '17 Jenkins St.', 'Boston', '02155', 'USA', 'support@sample.com',	'ShortBicycleLeafMoleculeFuji', NULL),

/* Faculty */
(6,		'Gina',			'Smith',  		'55 Elmer St.', 'Cambridge', '02139', 'USA', 'gina_honorable@yahoo.com', 'password', NULL),
(7,		'Alex',			'Manuel',  		'17 First St.', 'Boston', '02155', 'USA', 'AMMH@example.com', 'ShortBicycleLeafMoleculeFuji', NULL),
(8,		'Katie',		'Johnson',  	        '36 Second St.', 'Boston', '02155', 'USA', 'kat_the_rat@gmail.com', 'dfj8204dfn2i03ghf', NULL),
(11,            'Kathy',                'Green',                '10 Plaintiff St.', 'Sommerville', '02138', 'USA', 'kathy_green@gmail.com', 'asdf24fRFED#23', NULL),
(12,            'Joe',                  'Tribiyani',            '17 Houston St.', 'NewYork', '10002', 'USA', 'joe_tribiyani@gmail.com', 'FDF234gfrasdfg', NULL),
(13,            'Michael',              'Scofield',             '20 Jersey St.', 'Boston', '02155', 'USA', 'michael_scofield@gmail.com', 'ShortBicycleLeafMoleculeFuji', NULL),
(14,            'Sara',                 'Tancredi',             '40 Willow St.', 'Boston', '02155', 'USA', 'sara_tancredi@gmail.com', 'passsssssss', NULL),
(15,            'Rachael',              'Green',                '100 Comm Ave.', 'Boston', '02155', 'USA', 'rachael_green@gmail.com', '190191', NULL),
(16,            'Ross',                 'Geller',               '85 Alliston St.', 'Boston', '02215', 'USA', 'ross_geller@gmail.com', '8878', NULL),
(17,            'Jeremy',               'Freudberg',            '90 College St.', 'Boston', '02155', 'USA', 'jeremy_freudberg@gmail.com', '555555555', NULL),

/* Admin and faculty */
(9,		'Jacob',		'Jacobson',  	        '58 Third St.', 'Montreal', '02155', 'Canada', 'jj@freeemails.com', 'abcd', NULL),
(10,	        'Martin',		'Martinson',	        '5 Elmer St.', 'Boston', '02155', 'USA', 'mars_curtain_seller@sellers.com', 'aaaaaa', NULL),
(18,            'John',                 'Martin',               '59 Elmer St.', 'Raleigh', '27513', 'USA', 'john_martin@monster.com', 'asdfasdfasdf', NULL),
(19,            'Arvind',               'Swamy',                '18 Peterborough', 'Malden', '02148', 'USA', 'arvind_swamy@gmail.com', 'myfaasdfjkasldfa', NULL),
(20,            'Lucas',                'Xuong',                '20 Lincon St.', 'Boston', '02155', 'USA', 'lucas_xuong@gmail.com', 'mrmagic', NULL),
(21,            'Rado',                 'Gates',                '15 Glen St.', 'Natick', '01760', 'USA', 'rado_gates@gmail.com', 'ddd', NULL),
(22,            'Chen',                 'Jashua',               '21 Judith Rd.', 'Natick', '01760', 'USA', 'chen_jashua@gmail.com', 'rerere', NULL),
(23,            'Monica',               'Sturrman',             '30 Beech Rd.', 'Brookline', '02445', 'USA', 'monica_sturrman@yahoo.com', 'FHU**$)FH#$F)Q@EDHShji', NULL),
(24,            'Lily',                 'Maverick',             '32 Brattle St.', 'Cambridge', '02139', 'USA', 'lily_maverick@rediff.com', 'masterofdisguise', NULL),
(25,            'Aditya',               'Veda',                 '98 East Broadway', 'South Boston', '02156', 'USA', 'aditya_veda@gmail.com', 'ffffffffffffffff', NULL);

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
(10, '207-613-9992'),
(11, '617-785-3210'),
(12, '218-612-1111'),
(13, '218-612-1112'),
(14, '218-612-1113'),
(15, '218-612-1114'),
(16, '218-612-1115'),
(17, '219-612-1116'),
(18, '219-612-2221'),
(19, '219-612-2223'),
(20, '214-615-1111'),
(21, '215-622-1444'),
(22, '215-633-1454'),
(24, '857-617-7630'),
(25, '857-545-1234');


INSERT INTO Faculty VALUES
(6, 'Associate', 'WPI', 'www.professor1.com'),
(7, 'Associate', 'WPI', 'www.professor2.com'),
(8, '', '', 'www.professor3.com'),
(9, 'Associate', 'WPI', 'www.professor4.com'),
(10, 'Associate', 'WPI', 'www.professor5.com'),
(11, 'Associate', 'WPI', 'www.professor6.com'),
(12, 'Professor', 'NEU', 'www.professor7.com'),
(13, 'Assistant', 'NEU', 'www.professor8.com'),
(14, 'Associate', 'BU', 'www.professor9.com'),
(15, 'Associate', 'BU', 'www.professor10.com'),
(16, 'Sr.Associate', 'WPI', 'www.professor11.com'),
(17, 'Sr.Assistant', 'WPI', 'www.professor12.com'),
(18, 'Associate', 'NEU', 'www.professor13.com'),
(19, 'Professor', 'HU', 'www.professor14.com'),
(20, 'Professor', 'MIT', 'www.professor15.com'),
(21, 'Associate', 'NCSU', 'www.professor16.com'),
(22, 'Associate', 'WPI', 'www.professor17.com'),
(23, 'Associate', 'WPI', 'www.professor18.com'),
(24, 'Professor', 'NEU', 'www.professor19.com'),
(25, 'Assistant', 'NEU', 'www.professor20.com');

INSERT INTO Admin VALUES
(9, 10, '2017-10-01', '10:00am'),
(10, NULL, '2017-09-01', '10:00am'),
(18, 10, '2017-10-01', '10:00am'),
(19, 9, '2017-10-01', '10:00am'),
(20, 10, '2017-10-01', '10:00am'),
(21, 18, '2017-10-01', '10:00am'),
(22, 9, '2017-10-01', '10:00am'),
(23, 10, '2017-10-01', '10:00am'),
(24, 18, '2017-10-01', '10:00am'),
(25, 10, '2017-10-01', '10:00am');

INSERT INTO Authentication VALUES
(6, 10, '2017-10-01', '10:00am'),
(7, 9, '2017-10-01', '10:00am'),
(9, 10, '2017-10-01', '10:00am'),
(10, 10, '2017-10-01', '10:00am'),
(11, 10, '2017-10-01', '10:00am'),
(12, 9, '2017-10-01', '10:00am'),
(13, 9, '2017-10-01', '10:00am'),
(14, 10, '2017-10-01', '10:00am'),
(15, 10, '2017-10-01', '10:00am'),
(16, 9, '2017-10-01', '10:00am'),
(17, 10, '2017-10-01', '10:00am'),
(18, 9, '2017-10-01', '10:00am'),
(19, 10, '2017-10-01', '10:00am'),
(20, 9, '2017-10-01', '10:00am'),
(21, 9, '2017-10-01', '10:00am'),
(22, 10, '2017-10-01', '10:00am'),
(23, 9, '2017-10-01', '10:00am'),
(24, 10, '2017-10-01', '10:00am'),
(25, 10, '2017-10-01', '10:00am');

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
('application of bioinstrumentation',           1, 00),
('research in bioinstrumentation',              2, 00),
('background of computer science', 		0, 01),
('setting up computer science coding env', 	1, 01),
('creating your first program', 		2, 01),
('background of business', 			0, 03),
('principles of business',                      1, 03),
('case-study in business',                      2, 03),
('Medicine Lecture 1', 				0, 05),
('Medicine Lecture 2: The Human Body', 		1, 05),
('Medicine Lecture 3: Chemical Agents', 	2, 05),
('Basic operations in math',                    0, 04),
('practice problems in math',                   1, 04),
('applications of math',                        2, 04),
('what is chemistry',                           0, 06),
('periodic table',                              1, 06),
('applications of chemistry',                   2, 06),
('Basic physics',                               0, 07),
('principle concepts in physics',               1, 07),
('applications of physics',                     2, 07),
('What is electrical engineering',              0, 08),
('basic concepts of electrical engineering',    1, 08),
('applications of electrical engineering',      2, 08),
('what is history',                             0, 09),
('historic monuments',                          1, 09),
('how to preserve history',                     2, 09),
('what is culture',                             0, 10),
('types of culture',                            1, 10),
('how to preserve culture',                     2, 10);

INSERT INTO Teach VALUES
(6, 00, '2017-10-01', '9:00am'),
(7, 01, '2017-10-02', '10:00am'),
(8, 02, '2017-10-03', '10:00am'),
(9, 03, '2017-10-04', '10:00am'),
(11, 04, '2017-10-05', '10:00am'),
(12, 05, '2017-10-06', '10:00am'),
(13, 06, '2017-10-07', '10:00am'),
(14, 07, '2017-10-08', '10:00am'),
(15, 08, '2017-10-09', '10:00am'),
(16, 09, '2017-10-01', '10:00am'),
(17, 10, '2017-10-02', '10:00am'),
(18, 00, '2017-10-03', '10:00am'),
(19, 02, '2017-10-04', '10:00am');

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
(3, 06),
(3, 07),
(3, 08),
(4, 09),
(4, 10),
(4, 00),
(5, 01),
(5, 02),
(5, 03),
(0, 04),
(0, 05),
(0, 06);

INSERT INTO Payment VALUES
(1, 00, '123xyz', '2017-06-09', '10:00am'),
(1, 01, '123abc', '2017-06-10', '10:00am'),
(2, 03, '456abc', '2017-06-11', '10:00am'),
(2, 04, '456xyz', '2017-06-12', '10:00am'),
(2, 05, '781abc', '2017-06-09', '10:00am'),
(3, 07, '444fdf', '2017-06-09', '10:00am'),
(4, 09, '637sgv', '2017-06-09', '10:00am'),
(5, 01, '342fff', '2017-06-09', '10:00am'),
(0, 05, '789eee', '2017-06-09', '10:00am'),
(3, 08, '190bhb', '2017-06-09', '10:00am');

INSERT INTO Sec_topic VALUES
(8, 01),
(9, 10),
(10, 09),
(2, 04),
(4, 02),
(5, 06),
(7, 07),
(8, 08),
(9, 09),
(1, 03);

INSERT INTO Post VALUES
("Welcome to your first assignment in biology. Please click accept to receive credit for reading this.", 0, 00),
("Welcome to your first assignment in program design. Please click accept to receive credit for reading this.", 0, 01),
("Welcome to your first assignment in how business work. Please click accept to receive credit for reading this.", 0, 03),
("Welcome to your first assignment in higher mathematic theroies. Please click accept to receive credit for reading this.", 0, 04),
("Welcome to your first assignment in medecine. Please click accept to receive credit for reading this.", 0, 05),
("Welcome to your first assignment in chemical processes that govern materials. Please click accept to receive credit for reading this.", 0, 06),
("Welcome to your first assignment in how the universe works. Please click accept to receive credit for reading this.", 0, 07),
("Welcome to your first assignment in electrical engineering. Please click accept to receive credit for reading this.", 0, 08),
("Welcome to your first assignment in Intro to history. Please click accept to receive credit for reading this.", 0, 09),
("Welcome to your first assignment in Intro to world culture. Please click accept to receive credit for reading this.", 0, 10);

INSERT INTO Link VALUES
('https://youtube.com/qwewq',                   1, 1, 00),
('https://youtube.com/jdfdfasdfasddddd', 	1, 1, 01),
('https://youtube.com/frohgorrthortea',         1, 1, 03),
('https://youtube.com/qerijwqiorj',             1, 1, 04),
('https://youtube.com/kfjgttpajaf',             1, 1, 05),
('https://youtube.com/ooiqjeroqur',             1, 1, 06),
('https://youtube.com/poqpreqiw',               0, 1, 07),
('https://youtube.com/pqrehbfqrg',              1, 1, 08),
('https://youtube.com/jngnnertn',               1, 1, 09),
('https://youtube.com/jnwrtqiutrwagjoaga',      1, 1, 10);

INSERT INTO File VALUES
('https://examples.com/01', 1024, 'pdf', 2, 00),
('https://examples.com/02', 1024, 'pdf', 2, 01),
('https://examples.com/04', 1024, 'pdf', 2, 03),
('https://examples.com/05', 1024, 'pdf', 2, 04),
('https://examples.com/06', 1024, 'pdf', 2, 05),
('https://examples.com/07', 1024, 'pdf', 2, 06),
('https://examples.com/08', 1024, 'pdf', 2, 07),
('https://examples.com/09', 1024, 'pdf', 2, 08),
('https://examples.com/10', 1024, 'pdf', 2, 09),
('https://examples.com/11', 1024, 'pdf', 2, 10);

INSERT INTO CompletesMaterial VALUES
(1, '8:00pm', '2017-11-20', 0, 00),
(1, '9:00pm', '2017-11-20', 1, 00),
(1, '10:00pm','2017-11-20', 2, 00),
(1, '8:00pm', '2017-11-21', 0, 01),
(1, '9:00pm', '2017-11-21', 1, 01),
(1, '10:00pm','2017-11-21', 2, 01),
(2, '8:00pm', '2017-11-23', 0, 03),
(2, '9:00pm', '2017-11-23', 1, 03),
(2, '10:00pm','2017-11-23', 2, 03),
(2, '8:00pm', '2017-11-24', 0, 04),
(2, '9:00pm', '2017-11-24', 1, 04),
(2, '10:00pm', '2017-11-24',2, 04),
(3, '8:00pm', '2017-11-21', 0, 06),
(3, '9:00pm', '2017-11-21', 1, 06),
(3, '10:00pm','2017-11-21', 2, 06),
(3, '8:00pm', '2017-11-24', 0, 07),
(3, '9:00pm', '2017-11-24', 1, 07),
(3, '10:00pm','2017-11-24', 2, 07),
(4, '8:00pm', '2017-11-20', 0, 09),
(4, '9:00pm', '2017-11-21', 1, 09),
(4, '10:00pm', '2017-11-22',2, 09),
(4, '8:00pm', '2017-11-24', 0, 10),
(4, '9:00pm', '2017-11-24', 1, 10),
(4, '10:00pm','2017-11-24', 2, 10),
(5, '8:00pm', '2017-11-22', 0, 01),
(5, '9:00pm', '2017-11-22', 1, 01),
(5, '10:00pm', '2017-11-22',2, 01),
(0, '8:00pm', '2017-11-22', 0, 04),
(0, '9:00pm', '2017-11-23', 1, 04),
(0, '10:00pm', '2017-11-23',2, 04),
(0, '8:00pm', '2017-11-24', 0, 05),
(0, '9:00pm', '2017-11-24', 1, 05),
(0, '10:00pm', '2017-11-24',2, 05);

INSERT INTO CompletesCourse VALUES
(1, '10:00pm', '2017-20-11', 00, 'This was a really fast course - please add more materials.', 1),
(1, '10:00pm', '2017-21-11', 01, 'Slides not good, need to be more explanatory', 1),
(2, '10:00pm', '2017-23-11', 03, 'Fast course! Awesome.', 1),
(2, '10:00pm', '2017-24-11', 04, 'Slow course', 0),
(3, '10:00pm', '2017-21-11', 06, 'Good course.!', 1),
(3, '10:00pm', '2017-24-11', 07, 'Slides not self explanatory course.!', 0),
(4, '10:00pm', '2017-22-11', 09, 'Material need to be more detailed..!', 0),
(4, '10:00pm', '2017-24-11', 10, 'Really great course..!', 1),
(5, '10:00pm', '2017-22-11', 01, 'More therotical....can add more practical assignments',0),
(0, '10:00pm', '2017-23-11', 04, 'Material need to be more detailed..!', 0),
(0, '10:00pm', '2017-24-11', 05, 'Fantastic course and excellent professor', 1);

/* Questions */

INSERT INTO Questions VALUES
('Why is business important?', 1000, 1, 'Please reconsider this course.'),
('Are we going to have more materials?', 1001, 0, 'Yes, we have forgotten to add the rest.'),
('Any requirements for laptop to be considered?', 1002, 1, 'Just minimum requirements.'),
('Limit on the courses to register.?', 1003, 1, 'Can register any number of courses'),
('Question related to physics.?', 1004, 1, 'Sure.! An appropriate faculty answers your question'),
('Question related to chemistry', 1005, 1, 'Sure.! An appropriate faculty answers your question'),
('Question related to math', 1006, 1, 'Sure.! An appropriate faculty answers your question'),
('Question related to culture', 1007, 1, 'Sure.! An appropriate faculty answers your question'),
('Question related to history', 1008, 1, 'Sure.! An appropriate faculty answers your question'),
('Question related to pogramming', 1009, 1, 'Sure.! An appropriate faculty answers your question');

INSERT INTO Ask VALUES
(1, 1000),
(2, 1001),
(3, 1002),
(4, 1003),
(3, 1004),
(0, 1005),
(2, 1006),
(4, 1007),
(4, 1008),
(1, 1009);

INSERT INTO LikesQuestion VALUES
(1, 1000),
(2, 1000),
(2, 1001),
(4, 1002),
(5, 1002),
(9, 1002),
(8, 1002),
(0, 1003),
(5, 1003),
(3, 1004),
(0, 1005),
(2, 1006),
(4, 1007),
(4, 1008),
(1, 1009);

INSERT INTO RelateToMaterial VALUES
(0, 1000, 00),
(0, 1001, 00),
(1, 1002, 01),
(2, 1003, 01),
(1, 1004, 07),
(0, 1005, 06),
(2, 1006, 04),
(1, 1007, 10),
(2, 1008, 09),
(0, 1009, 01);

INSERT INTO Answers VALUES
(1000, 7),
(1001, 7),
(1002, 6),
(1003, 10),
(1004, 09),
(1005, 13),
(1006, 11),
(1007, 17),
(1008, 16),
(1009, 7);

INSERT INTO Quiz VALUES
(0, 01, 5),
(1, 01, 5),
(0, 03, 5),
(0, 04, 5),
(0, 05, 5),
(0, 06, 5),
(0, 07, 5),
(0, 08, 5),
(0, 09, 5),
(0, 10, 5);

INSERT INTO Quiz_Questions VALUES
(0, 01, 1, 'first question'),
(0, 01, 2, 'second question'),
(1, 01, 1, 'first question'),
(1, 01, 2, 'second question'),
(0, 03, 1, 'first question'),
(0, 03, 2, 'second question'),
(0, 04, 1, 'first question'),
(0, 04, 2, 'second question'),
(0, 05, 1, 'first question'),
(0, 05, 2, 'second question');

INSERT INTO Quiz_Answers VALUES
(0, 01, 1, 1, 1, 'Wrong'),
(0, 01, 1, 2, 2, 'Wrong'),
(0, 01, 1, 3, 3, 'Right'),
(0, 01, 2, 1, 1, 'Wrong'),
(0, 01, 2, 2, 2, 'Right'),
(0, 01, 2, 3, 3, 'Right'),
(1, 01, 1, 1, 1, 'Wrong'),
(1, 01, 1, 2, 2, 'Right'),
(1, 01, 2, 1, 1, 'Wrong'),
(1, 01, 2, 2, 2, 'Right'),
(0, 03, 1, 1, 1, 'Right'),
(0, 03, 1, 2, 2, 'Wrong'),
(0, 03, 2, 1, 1, 'Wrong'),
(0, 03, 2, 2, 2, 'Right'),
(0, 04, 1, 1, 1, 'Wrong'),
(0, 04, 1, 2, 2, 'Right'),
(0, 04, 2, 1, 1, 'Wrong'),
(0, 04, 2, 2, 2, 'Right'),
(0, 05, 1, 1, 1, 'Wrong'),
(0, 05, 1, 2, 2, 'Right'),
(0, 05, 2, 1, 1, 'Wrong'),
(0, 05, 2, 2, 2, 'Right');
