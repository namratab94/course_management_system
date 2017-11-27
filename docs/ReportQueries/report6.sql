/* Report Query 4 */
/*

Shows how long students take to complete courses.

GIVEN: Nothing
RETURNS: a list of all students, and the average amount of time they spend to complete a course.

*/

SELECT printf("%s %s", u.FName, u.LName) as student_name,AVG(julianday(cc.date)-julianday(p.date)) as days_spent_to_complete
FROM User u
	LEFT JOIN Payment p ON p.CID=u.ID
	LEFT JOIN CompletesCourse cc ON cc.CID=u.ID
GROUP BY u.ID;

