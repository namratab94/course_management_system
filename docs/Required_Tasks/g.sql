/* g)  Provide a certificate of completion 
for a student 
(assuming s/he has successfully completed 
all materials)
*/

SELECT printf('Congratulations %s %s! You have completed the %s course on %s.',
		u.FName,
		u.LName,
		c.name,
		d.date) as certificate
FROM CompletesCourse AS d 
	INNER JOIN Course AS c ON c.id=d.cid
	INNER JOIN User AS u ON u.id=d.sid
	INNER JOIN Payment As p on u.id = p.sid
/* Assuming user is 2 and course is 0*/
WHERE d.SID=2 and p.cid = 0