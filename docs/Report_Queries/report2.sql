/*
The ratio of users transferring interested courses to enrolled courses, 
and enrolled courses to completed courses
Users must live in USA and cities should be ordered in descending order
country_id = 'USA'
 */
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