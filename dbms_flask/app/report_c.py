@app.route('/report_c', methods = ['GET','POST'])
def report_c():
	form = Reportform()
	if flask.session.get('logged_in'):
		if flask.request.method == 'POST':
			#from = Task()
			try:
				db = sqlite3.connect('project.db')
				db.row_factory = sqlite3.Row
				with db:
					cursor = db.cursor()
					sql = """ SELECT/ 
	q.ID as QuestionID, q.QuestionText as QuestionText,/ 
	c.Name as CourseName, count(q.ID) as Number_Like/
FROM/
	(Questions q inner join RelateToMaterial r on q.ID = r.QID/
	inner join Course c on c.ID = r.RCID)/
	left join LikesQuestion likeq on q.ID = likeq.QID/
WHERE/ 
	q.IsVisible = 1/
GROUP BY/ 
	QuestionID/
ORDER BY/ 
	Number_like DESC;""" 
					cursor.execute(sql)
					allrows = cursor.fetchall()
					cursor.close()
					return flask.render_template('report_c.html', results=allrows)
				
				except sqlite3.Error as err:
					flask.abort(500)
			else:
				return flask.render_template('user_input.html', form=form)
				
		else:
			return flask.render_template('login.html')	