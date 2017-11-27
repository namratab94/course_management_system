/*
Total Cost for students who have enrolled course and do payment on the course and course level is 'Intro Level'
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