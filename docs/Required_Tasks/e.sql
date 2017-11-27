/*Problem e  I seperate the result to two tables (complete/uncomplete material) 
to Student Bob has enrolled class*/

/*complete materials*/
select StudentID ,FirstName, LastName, CourseName, MaterialName, MaterialID, CourseID
from
(
select u.ID as StudentID, u.FName as FirstName, u.LName as LastName, c.ID as CourseID, c.name as CourseName, ma.Name as MaterialName, ma.ID as MaterialID
from 
user u inner join Enroll en on u.ID = en.SID
inner join Course c on c.ID = en.CID
inner join Material ma on ma.CID = c.ID
where u.ID = 1 
)
inner join CompletesMaterial comma on comma.CCID = CourseID and comma.MID = MaterialID
order by MaterialID


/*uncomplete materials*/
select StudentID ,FirstName, LastName, CourseName, MaterialName, MaterialID, CourseID
from
(
select u.ID as StudentID, u.FName as FirstName, u.LName as LastName, c.ID as CourseID, c.name as CourseName, ma.Name as MaterialName, ma.ID as MaterialID
from 
user u inner join Enroll en on u.ID = en.SID
inner join Course c on c.ID = en.CID
inner join Material ma on ma.CID = c.ID
where u.ID = 1 
)
inner join CompletesMaterial comma on comma.CCID = CourseID and comma.MID != MaterialID
order by MaterialID