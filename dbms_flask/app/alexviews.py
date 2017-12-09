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


	  # Complete the material
          params = (3,'12:02pm','2017-11-26',00,000 )
          sql = """
		INSERT INTO CompletesMaterial VALUES
		(?, ?, ?, ?);
		"""
          cursor.execute("INSERT INTO Authentication VALUES (?,?,?,?)", params)
          cursor.execute(sql, params)
          allrows = cursor.fetchall() 



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

