-- Note: The following submission demonstrates examples of parameterization
 -- for a few queries, as it will all be handled at the application level
 -- using Python.

/*
Report a] Total Cost for students who have enrolled for a course and also
pay for the course WHERE course is at 'Intro' level
*/
SELECT 
	StudentID, CourseID, StudentFirstName, StudentLastName, 
	sum(CoursePrice) as StudentCost
FROM
	(SELECT 
		e.SID as StudentID, e.CID as CourseID, u.FName as StudentFirstName, 
		u.LName as StudentLastName, c.cost as CoursePrice
	FROM 
		Enroll e INNER JOIN User u on e.SID = u.ID
		INNER JOIN Course c on c.ID = e.CID
	WHERE 
		c.Name LIKE 'Intro%'
)
INNER JOIN Payment p on p.SID = StudentID and p.CID = CourseID
GROUP BY 
	StudentID
ORDER BY 
	StudentCost;


/*****************************************************************************/

/* Report b] 
The ratio of users transferring interested courses to enrolled courses, 
and enrolled courses to completed courses
Users must live in USA and cities should be ordered in descending order
 */
-- Using country_id = 'USA'
SELECT 
	u.Country as Country, u.City as City, 
	cast(cast(count(en.CID) as 
		double)/cast(count(Isin.CID) as double) * 100 as varchar(20))+ '%' as 
	Ratio_Interest_Enroll, 
	cast(cast(count(comc.CID) as 
		double )/cast(count(en.CID) as double)* 100 as varchar(20)) + '%' as 
	Ratio_Enroll_complete
FROM
	User u INNER JOIN IsInterest Isin on u.ID = Isin.SID
	LEFT JOIN Enroll en on u.ID = en.SID and Isin.CID = en.CID
	LEFT JOIN CompletesCourse comc on comc.SID = en.SID and comc.CID = en.CID
	INNER JOIN Course c on c.ID = Isin.CID
WHERE 
	Country = country_id
GROUP BY 
	City
ORDER BY
	City DESC;


/*****************************************************************************/

/* Report c]
List Questions asked for all courses, but display only visible
questions related to materials in descending order, based on
the number of likes.
*/
-- Using q_visible = 1
SELECT 
	q.ID as QuestionID, q.QuestionText as QuestionText, 
	c.Name as CourseName, count(q.ID) as Number_Like
FROM 
	(Questions q inner join RelateToMaterial r on q.ID = r.QID
	inner join Course c on c.ID = r.RCID)
	left join LikesQuestion likeq on q.ID = likeq.QID
WHERE 
	q.IsVisible = q_visible
GROUP BY 
	QuestionID
ORDER BY 
	Number_like DESC;


/*****************************************************************************/

/* Report d]
For Quizes, this query can be used to check a 
single answer to a single question.

GIVEN: 
* answer_to_check - the answer the student has provided
* material_id - the MID of the Question
* course_id - The CID of the Question
* question_number - The Number of the Question

RETURNS: 
* 1 if the answer has been stored as 'right' in the database,
* 0 otherwise
*/
-- Using
-- courseID = 1
-- materialID = 1
-- questionNo = 2
-- rightAnswer = 1

SELECT 
	MAX(Feedback='Right') as is_answer_correct
FROM 
	(SELECT 
		qq.MID as material_id, 
		qq.CID as course_id, 
		qq.NUMBER as question_number, 
		Text as question_text, 
		ID, 
		A_Text as answer_to_check,
		Feedback
	FROM 
		Quiz as q 
		INNER JOIN Quiz_Questions as qq ON (q.MID=qq.MID AND q.QCID=qq.CID)
		INNER JOIN Quiz_Answers as qa ON (q.MID=qa.MID AND q.QCID=qa.CID)
	WHERE 
		course_id=courseID 
		AND material_id=materialID 
		AND question_number=questionNo
		AND answer_to_check=rightAnswer
		
	ORDER BY 
		material_id, course_id, qq.NUMBER, ID
) SELECTed_answer;


/*****************************************************************************/

/* Report e]
Calculate the average amount of time it takes for students to complete a course
*/

SELECT 
	printf("%s %s", u.FName, u.LName) as student_name, c.name as course_name, 
	julianday(cc.date)-julianday(p.date) as days_spent_to_complete
FROM 
	User u
	LEFT JOIN Payment p ON p.CID=u.ID
	LEFT JOIN CompletesCourse cc ON cc.CID=u.ID
	INNER JOIN Course c ON p.CID=c.ID
GROUP BY 
	u.ID,p.CID
ORDER BY 
	u.FName, u.LName;


/*****************************************************************************/