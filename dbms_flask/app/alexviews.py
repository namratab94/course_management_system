import flask
from app import app
from .forms import *
import os
import sys
import sqlite3
import json
import bcrypt
import pdb 



@app.route('/completeMaterial', methods=['GET'])
def task_f_completeMaterial():
    if flask.session.get('logged_in'):
      try:
        db = sqlite3.connect('project.db')
        db.row_factory = sqlite3.Row
        with db:
          cursor = db.cursor()

	  userParam = 3
	  courseParam = 2


	  # Complete the material
	  #TODO: use current date and time
          params = (userParam,'12:02pm','2017-11-26',00,000 )
          sql = """
		INSERT INTO CompletesMaterial VALUES
		(?, ?, ?, ?);
		"""
          cursor.execute(sql, params)
          materialRows = cursor.fetchall() 

	# Check if all materials for the course are complete
          params = (userParam, courseParam )
          sql = """
Select COUNT(*)
From Material
	Left  Join CompletesMaterial 
		on Material.CID = CompletesMaterial.CCID and Material.ID = CompletesMaterial.MID
	Inner Join Course on Course.ID = Material.CID
	Left  Join Enroll  on Enroll.CID = Course.ID and Enroll.SID = CompletesMaterial.SID
	Inner Join User   on User.ID = Enroll.SID
Where Enroll.SID = {} and CompletesMaterial.time is Null AND Course.ID= {}
		"""
          cursor.execute(sql, params)
          numberMaterialsLeft = cursor.fetchall()

	 # if numberMaterialsLeft > 0
	#	 results = true

	  #else 


	# Check if all materials for the course are complete
          params = (userParam, courseParam )
          sql = """
Select COUNT(*)
From Material
	Left  Join CompletesMaterial 
		on Material.CID = CompletesMaterial.CCID and Material.ID = CompletesMaterial.MID
	Inner Join Course on Course.ID = Material.CID
	Left  Join Enroll  on Enroll.CID = Course.ID and Enroll.SID = CompletesMaterial.SID
	Inner Join User   on User.ID = Enroll.SID
Where Enroll.SID = {} and CompletesMaterial.time is Null AND Course.ID= {}
		"""
          cursor.execute(sql, params)
          numberMaterialsLeft = cursor.fetchall()
   



          cursor.close()
          return flask.render_template('task_f_completeMaterial.html',results=allrows)

# if course is completed
#
#INSERT INTO CompletesCourse VALUES
# (3, '12:02pm', '2017-11-26', 000, NULL, NULL);
#
#
      except sqlite3.Error as err: 
          flask.abort(500)

    else:
        return flask.render_template('login.html')

