/*The ratio of users transfer interested courses to enrolled courses, transfer enrolled courses to comleted courses
   Users must live in USA and result order by City (z-a)*/
SELECT u.Country as Country, u.City as City, 
       cast(cast(count(en.CID) as double)/cast(count(Isin.CID) as double) * 100 as varchar(20))+ '%' as Ratio_Interest_Enroll , 
       cast(cast(count(comc.CID) as double )/cast(count(en.CID) as double)* 100 as varchar(20)) + '%' as Ratio_Enroll_complete
from
User u Inner Join IsInterest Isin on u.ID = Isin.SID
left join Enroll en on u.ID = en.SID and Isin.CID = en.CID
left join CompletesCourse comc on comc.SID = en.SID and comc.CID = en.CID
inner join Course c on c.ID = Isin.CID
where Country like 'USA' 
group by City
order by  City desc