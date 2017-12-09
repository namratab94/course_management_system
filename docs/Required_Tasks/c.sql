/*Course user with user ID = 1 is interested in*/

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
	u.ID = 1
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;


/*Course user with user ID = 1 is enrolled in*/

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
	u.ID = 1
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;


/*Course user with user ID = 1 has completed*/

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
	u.ID = 1
GROUP BY 
	c.ID
ORDER BY 
	AverageScore DESC
)
LEFT JOIN Topic on Topic.ID = secondaryID;