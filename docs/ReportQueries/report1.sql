/*Total Cost for students who have enrolled course and do payment on the course and course level is 'Intro Level'*/
Select StudentID, CourseID, StudentFirstName, StudentLastName, sum(CoursePrice) as StudentCost
From(
Select e.SID as StudentID, e.CID as CourseID, u.FName as StudentFirstName, u.LName as StudentLastName, c.cost as CoursePrice
From 
Enroll e inner join User u on e.SID = u.ID
inner join Course c on c.ID = e.CID
where c.Name like 'Intro%'
)
inner join Payment p on p.SID = StudentID and p.CID = CourseID
group by StudentID
order by StudentCost