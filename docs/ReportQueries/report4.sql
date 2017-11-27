/* Report Query 1

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

REPORT QUERY SCORE: 6 pt total, calculated like so:
	1 pt <- 3 Tables Joined
	0 pt <- Inner joins only
	1 pt <- 1 subquery
	0 pt <- no union/intersections
	1 pt <- aggregate function used (MAX)
	0 pt <- no grouping used.
	0 pt <- Ordering but not necessary
	1 pt <- four WHERE conditions
	1 pt <- non-aggregate equality operator in SELECT
	1 pt <- strong motivation (we need this for quizes...)


*/
SELECT MAX(Feedback='Right') as is_answer_correct
FROM (
	SELECT qq.MID as material_id, 
	qq.CID as course_id, 
	qq.NUMBER as question_number, 
	Text as question_text, 
	ID, 
	A_Text as answer_to_check,
	Feedback
	FROM Quiz as q 
		INNER JOIN Quiz_Questions as qq ON (q.MID=qq.MID AND q.QCID=qq.CID)
		INNER JOIN Quiz_Answers as qa ON (q.MID=qa.MID AND q.QCID=qa.CID)
	WHERE 
	
		/* TYhese four attributes are inputs and should
		be parametrized. */
		course_id=1 
		AND material_id=1 
		AND question_number=2
		AND answer_to_check=1
		
	ORDER BY material_id, course_id, qq.NUMBER, ID
) selected_answer;