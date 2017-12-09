/* Report Query 5 */
/*
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