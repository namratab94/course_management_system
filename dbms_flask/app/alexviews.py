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
          sql = "select * from Enroll"
          cursor.execute(sql)
          allrows = cursor.fetchall() 
          cursor.close()
          return flask.render_template('task_f_completeMaterial.html',results=allrows)

      except sqlite3.Error as err: 
          flask.abort(500)

    else:
        return flask.render_template('login.html')

