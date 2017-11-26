/*
h)  Provide an account history for a user:  
* dates of enrollment/completion for each course, 
* amount paid (with confirmation code), 
* and total spent.
*/

SELECT date, action, code as payment_confirmation, name as course_title, cost as course_cost
FROM (  SELECT SID, CID, date, time, 'Enrollment' as action, code FROM Payment
		UNION 
		SELECT SID, CID, date, time, 'Completion' as action, NULL as code FROM CompletesCourse
		) transactions
	INNER JOIN 
	Course AS c ON c.id=transactions.CID
/* Assuming SID = 2 */
WHERE transactions.SID=2
ORDER BY date;


/* To get the total sum: */
SELECT SUM(cost) as total_spent
FROM (  SELECT SID, CID, date, time, 'Enrollment' as action, code FROM Payment
		UNION 
		SELECT SID, CID, date, time, 'Completion' as action, NULL as code FROM CompletesCourse
		) transactions
	INNER JOIN 
	Course AS c ON c.id=transactions.CID
/* Assuming SID = 2 */
WHERE transactions.SID=2
ORDER BY date;

 






