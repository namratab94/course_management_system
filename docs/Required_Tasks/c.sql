/*I seperate the data to three charts about Bob interested, enrolled and completed*/
/*Problem C Course Bob interested*/
select StudentID, StudentName, CourseName, PrimaryTopic, secondaryID as SecondaryID, Topic.Name as SecondaryTopic, AverageScore
from
(
select  u.ID as StudentID, u.FName as StudentName, c.name as CourseName,t.Name as PrimaryTopic, sec.TID as secondaryID, AVG(comc.rating) as AverageScore
from
Course c inner join IsInterest isin on isin.CID = c.ID
inner join user u on u.ID = isin.SID
inner join Topic t on t.ID = c.primarytopic
left join Sec_Topic sec on sec.CID = c.ID
left join  CompletesCourse comc on comc.CID = c.ID 
where u.ID = 1
group by c.ID
order by AverageScore DESC
)
left join Topic on Topic.ID = secondaryID

/*Problem C Course Bob enrolled*/
select StudentID, StudentName, CourseName, PrimaryTopic, secondaryID as SecondaryID, Topic.Name as SecondaryTopic, AverageScore
from
(
select  u.ID as StudentID, u.FName as StudentName, c.name as CourseName,t.Name as PrimaryTopic, sec.TID as secondaryID, AVG(comc.rating) as AverageScore
from
Course c inner join Enroll en on en.CID = c.ID
inner join user u on u.ID = en.SID
inner join Topic t on t.ID = c.primarytopic
left join Sec_Topic sec on sec.CID = c.ID
left join  CompletesCourse comc on comc.CID = c.ID 
where u.ID = 1
group by c.ID
order by AverageScore DESC
)
left join Topic on Topic.ID = secondaryID

/*Problem C Course Bob completed*/
select StudentID, StudentName, CourseName, PrimaryTopic, secondaryID as SecondaryID, Topic.Name as SecondaryTopic, AverageScore
from
(
select  u.ID as StudentID, u.FName as StudentName, c.name as CourseName,t.Name as PrimaryTopic, sec.TID as secondaryID, AVG(comc.rating) as AverageScore
from
Course c inner join  CompletesCourse comc on comc.CID = c.ID 
inner join user u on u.ID = comc.SID
inner join Topic t on t.ID = c.primarytopic
left join Sec_Topic sec on sec.CID = c.ID
where u.ID = 1
group by c.ID
order by AverageScore DESC
)
left join Topic on Topic.ID = secondaryID