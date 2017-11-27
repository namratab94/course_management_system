/*List Questions asked for a course and display only visalbe questions
  decending order based on the number of likes*/
Select q.ID as QuestionID, q.QuestionText as QuestionText, c.Name as CourseName, count(q.ID) as Number_Like
From 
Questions q inner join RelateToMaterial r on q.ID = r.QID
inner join Course c on c.ID = r.RCID
inner join LikesQuestion likeq on q.ID = likeq.QID
where q.IsVisible = 1
group by CourseName
order by Number_like desc