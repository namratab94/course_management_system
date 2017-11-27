/*Problem e  I seperate the result to two tables (complete/uncomplete material) 
to Student Bob has enrolled class*/

/*List of course materials completed by the student with the user ID = 1*/
SELECT 
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
	u.ID = 1 
)
INNER JOIN CompletesMaterial comma on comma.CCID = CourseID AND 
comma.MID = MaterialID
ORDER BY 
	MaterialID;


/*List of course materials that have not been completed by the student with the
user ID = 1*/
SELECT 
	StudentID ,FirstName, LastName, CourseName, MaterialName, MaterialID, CourseID
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
	u.ID = 1 
)
INNER JOIN CompletesMaterial comma on comma.CCID = CourseID AND 
comma.MID != MaterialID
ORDER BY 
	MaterialID;