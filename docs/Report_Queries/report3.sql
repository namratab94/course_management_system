/*
List Questions asked for all courses,
 but display only visible questions related to materials
 in descending order, based on the number of likes.
*/
Select q.ID as QuestionID, q.QuestionText as QuestionText, c.Name as CourseName, count(q.ID) as Number_Like
From (Questions q 
inner join RelateToMaterial r on q.ID = r.QID
inner join Course c on c.ID = r.RCID)
left join LikesQuestion likeq on q.ID = likeq.QID
where q.IsVisible = 1
group by QuestionID
order by Number_like desc