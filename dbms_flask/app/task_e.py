import flask
from app import app
from .forms import *
import os
import sys
import sqlite3
import json
import bcrypt
import pdb

@app.route('/task_e', methods = ['GET','POST'])
def task_e():
	if flask.session.get('logged_in'):
		form = TaskEForm()
		if flask.request.method == 'POST':
			#from = Task()
			try:
				db = sqlite3.connect('project.db')
				db.row_factory = sqlite3.Row
				with db:
					cursor = db.cursor()
					sql = """
Select User.ID as UserID, 
	User.FName as FirstName, 
	User.LName as LastName, 
	Course.name as CourseName,
	Material.Name as MaterialName, 
	Material.ID as MaterialID,
	CompletesMaterial.time as CompleteTime, 
	'Complete' as Status
From Material
	Inner Join CompletesMaterial 
		on Material.CID = CompletesMaterial.CCID and Material.ID = CompletesMaterial.MID
	Inner Join Course on Course.ID = Material.CID
	Inner Join Enroll on Enroll.CID = Course.ID and Enroll.SID = CompletesMaterial.SID
	Inner Join User   on User.ID = Enroll.SID
Where CompletesMaterial.SID = {} AND Course.ID= {}

Union

Select 
	User.ID as UserID, 
	User.FName as FirstName, 
	User.LName as LastName, 
	Course.name as CourseName,
	Material.Name as MaterialName,
	Material.ID as MaterialID,
	CompletesMaterial.time as CompleteTime, 
	'UnComplete' as Status
From Material
	Left  Join CompletesMaterial 
		on Material.CID = CompletesMaterial.CCID and Material.ID = CompletesMaterial.MID
	Inner Join Course on Course.ID = Material.CID
	Left  Join Enroll  on Enroll.CID = Course.ID and Enroll.SID = CompletesMaterial.SID
	Inner Join User   on User.ID = Enroll.SID
Where Enroll.SID = {} and CompletesMaterial.time is Null AND Course.ID= {}
Order by Material.ID 
""".format(int(flask.request.form['InputUser']), int(flask.request.form['InputCourse']), int(flask.request.form['InputUser']),  int(flask.request.form['InputCourse']))
					
					cursor.execute(sql)
					allrows = cursor.fetchall()
					cursor.close()
					return flask.render_template('task_e.html', results=allrows)
				
			except sqlite3.Error as err:
				print("7777777777777777777777")
				flask.abort(500)
		else:
			print("888888888888888888888")
			return flask.render_template('task_input_e.html', form=form)
			
	else:
		return flask.render_template('login.html')	

				
	
	
