 -- Note: The following submission demonstrates examples of parameterization
 -- for a few queries, as it will all be handled at the application level
 -- using Python.

 /*
 -- Task a] Register a new user 
*/

/* Insert a new user */
INSERT INTO User VALUES
(26, 'Rob', 'Barron', '10 Smith St.', 'Cambridge', '02139',
'USA', 'rbarron@example.com', NULL);

-- Using 
-- faculty_id = 26
-- f_title = 'Associate'
-- f_affiliation = 'WPI'
-- f_website = 'www.rbarron.com'

/* Insert a Faculty */
INSERT INTO Faculty VALUES
(26, 'Associate', 'WPI', 'www.rbarron.com');


/* Insert a admin */ 
INSERT INTO Admin VALUES
(26, 9, '2017-09-01', '10:00am');


/*****************************************************************************/

/*
-- Task b] As an administrator, authenticate a faculty user (based upon title/
affiliation/website/email) or fellow administrator
*/

INSERT INTO User VALUES
(27, 'Rob', 'Barron', '10 Smith St.', 'Cambridge', '02139', 'USA', 'rbarron@example.com', NULL);

INSERT INTO Faculty VALUES
(27, 'Associate', 'WPI', 'www.rob.com');

/* Query to find out which faculty need to be authenticated by an admin */
-- Using faculty_title = 'Associate'
SELECT 
	* 
FROM 
	Faculty WHERE Faculty.FID = (SELECT 
									Faculty.FID AS FID 
								FROM 
									Faculty LEFT JOIN Authentication ON Authentication.FID = Faculty.FID
								WHERE Authentication.AuthDate is NULL AND Faculty.Title = faculty_title);

/* Insert to Authentication table as faculty has a title */
INSERT INTO Authentication VALUES
(27, 9, '10-1-17', '10:00am');

/* The admin can be authenticated by another admin
	Here user Id with 9 is getting authenticated by user id 10*/

/* An new administrator is authenticated by an existing admin  */
INSERT INTO User VALUES
(28, 'Walter', 'White', '11Smith St.', 'Cambridge', '02139', 'USA', 'wwhite@example.com', NULL);

INSERT INTO Admin VALUES
(28, 10, '01-1-17', '10:00am');


/*****************************************************************************/

/*
-- Task c] Provide a categorized list of a student's courses (each with 
primary/secondary topics, ranked by average evaluation score): currently 
enrolled, completed, of interest
*/

/*Course user with user ID = 2 is interested in*/
-- Using userID = 2

SELECT 
	StudentID, StudentName, CourseName, PrimaryTopic, secondaryID AS 
	SecondaryID, Topic.Name AS SecondaryTopic, AverageScore
FROM
(SELECT 
	u.ID AS StudentID, u.FName AS StudentName, c.name AS CourseName,t.Name AS
	PrimaryTopic, sec.TID AS secondaryID, AVG(comc.rating) AS AverageScore
FROM
	Course c INNER JOIN IsInterest isin on isin.CID = c.ID
	INNER JOIN user u on u.ID = isin.SID
	INNER JOIN Topic t on t.ID = c.primarytopic
	LEFT JOIN Sec_Topic sec on sec.CID = c.ID
	LEFT JOIN  CompletesCourse comc on comc.CID = c.ID 
WHERE 
	u.ID = userID
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;


/*Course user with user ID = 2 is enrolled in*/
-- Using userID = 2

SELECT StudentID, StudentName, CourseName, PrimaryTopic, secondaryID AS 
SecondaryID, Topic.Name AS SecondaryTopic, AverageScore
FROM
(SELECT
	u.ID AS StudentID, u.FName AS StudentName, c.name AS CourseName,t.Name AS
	PrimaryTopic, sec.TID AS secondaryID, AVG(comc.rating) AS AverageScore
FROM
	Course c INNER JOIN Enroll en on en.CID = c.ID
	INNER JOIN user u on u.ID = en.SID
	INNER JOIN Topic t on t.ID = c.primarytopic
	LEFT JOIN Sec_Topic sec on sec.CID = c.ID
	LEFT JOIN  CompletesCourse comc on comc.CID = c.ID 
WHERE 
	u.ID = userID
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;


/*Course user with user ID = 2 has completed*/
-- Using userID = 2

SELECT 
	StudentID, StudentName, CourseName, PrimaryTopic, secondaryID AS 
	SecondaryID, Topic.Name AS SecondaryTopic, AverageScore
FROM
(SELECT
	u.ID AS StudentID, u.FName AS StudentName, c.name AS CourseName,
	t.Name AS PrimaryTopic, sec.TID AS secondaryID,
	AVG(comc.rating) AS AverageScore
FROM
	Course c INNER JOIN  CompletesCourse comc on comc.CID = c.ID 
	INNER JOIN user u on u.ID = comc.SID
	INNER JOIN Topic t on t.ID = c.primarytopic
	LEFT JOIN Sec_Topic sec on sec.CID = c.ID
WHERE
	u.ID = userID
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;


/*****************************************************************************/

/*
 -- Task d] Enroll a student in a course
*/

/* Enrolling a student into course with taking student_id and course_id as input */
-- Using student_id = 5, course_id1 = 04, course_id2 = 05
INSERT INTO Enroll VALUES
(student_id, course_id1),
(student_id,course_id2);


/*****************************************************************************/

/*
 -- Task e] For a student enrolled in a course, list materials, in order,
 indicating the line of demarcation between completed/not completed
*/

/*List of course materials completed by the student with the user ID = 1*/
-- Using user_id = 1
SELECT DISTINCT
	StudentID ,FirstName, LastName, CourseName, MaterialName, 
	MaterialID, CourseID
FROM
(SELECT 
	u.ID as StudentID, u.FName as FirstName, u.LName as LastName,
	c.ID as CourseID, c.name as CourseName, ma.Name as MaterialName,
	ma.ID as MaterialID
FROM 
	user u INNER JOIN Enroll en on u.ID = en.SID
	INNER JOIN Course c on c.ID = en.CID
	INNER JOIN Material ma on ma.CID = c.ID
WHERE 
	u.ID = user_id 
)
INNER JOIN CompletesMaterial comma on comma.CCID = CourseID AND 
comma.MID = MaterialID
ORDER BY 
	MaterialID;


/*List of course materials that have not been completed by the student with the
user ID = 1*/
-- Using user_id = 1
SELECT DISTINCT
	StudentID ,FirstName, LastName, CourseName, MaterialName,
	MaterialID, CourseID
FROM
(SELECT 
	u.ID as StudentID, u.FName as FirstName, u.LName as LastName, 
	c.ID as CourseID, c.name as CourseName, ma.Name as MaterialName,
	ma.ID as MaterialID
FROM 
	user u INNER JOIN Enroll en on u.ID = en.SID
	INNER JOIN Course c on c.ID = en.CID
	INNER JOIN Material ma on ma.CID = c.ID
WHERE 
	u.ID = user_id
)
INNER JOIN CompletesMaterial comma on comma.CCID = CourseID AND 
comma.MID != MaterialID
ORDER BY 
	MaterialID;


/*****************************************************************************/

/*
 -- Task f] Mark course material as having been completed by a student 
 (possibly resulting in course completion)
*/

/* SID 3, MID 00, CCID 000 */
INSERT INTO CompletesMaterial VALUES
(3, '12:02pm', '2017-11-26', 0, 08),
(3, '01:02pm', '2017-11-26', 1, 08),
(3, '02:02pm', '2017-11-26', 2, 08);


/* we mark course completion with a separate query here: */
INSERT INTO CompletesCourse VALUES
(3, '02:02pm', '2017-11-26', 08, NULL, NULL);


/*****************************************************************************/

/*
 -- Task g] Provide a certificate of completion for a student (assuming 
 s/he has successfully completed all materials)
*/
-- Using user_id = 1 and course_id = 0
SELECT printf('Congratulations %s %s! You have completed the %s course on %s.',
		u.FName,
		u.LName,
		c.name,
		d.date) AS certificate
FROM 
	CompletesCourse AS d 
	INNER JOIN Course AS c ON c.id=d.cid
	INNER JOIN User AS u ON u.id=d.sid
	INNER JOIN Payment As p on u.id = p.sid
WHERE 
	d.SID=user_id AND c.ID = course_id;


/*****************************************************************************/

/*
 -- Task h] Provide an account history for a user: dates of 
 enrollment/completion for each course, amount paid (with confirmation code),
 and total spent.
*/
-- Using student_id = 2
SELECT 
	date, action, code as payment_confirmation, name as course_title, cost as course_cost
FROM 
	(SELECT 
		SID, CID, date, time, 'Enrollment' as action, code FROM Payment
	UNION 
	SELECT 
		SID, CID, date, time, 'Completion' as action, NULL as code FROM CompletesCourse
	) transactions
	INNER JOIN 
	Course AS c ON c.id=transactions.CID
WHERE 
	transactions.SID=student_id
ORDER BY 
	date;


/* To get the total sum */
-- Using student_id = 2
SELECT 
	SUM(cost) as total_spent
FROM 
	(SELECT
		SID, CID, date, time, 'Enrollment' as action, code FROM Payment
	UNION 
	SELECT 
		SID, CID, date, time, 'Completion' as action, NULL as code FROM CompletesCourse
	) transactions
	INNER JOIN 
	Course AS c ON c.id=transactions.CID
WHERE 
	transactions.SID=student_id
ORDER BY 
	date;


/*****************************************************************************/