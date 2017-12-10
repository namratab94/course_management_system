import flask
from app import app
from .forms import *
import os
import sys
import sqlite3
import json
import bcrypt
import pdb 

import task_f
import task_e

@app.route('/enroll', methods=['GET'])
def index():
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
          return flask.render_template('index.html',results=allrows)

      except sqlite3.Error as err: 
          flask.abort(500)

    else:
        return flask.render_template('login.html')

@app.route('/register', methods=['GET','POST'])
def register_form():
    if flask.session.get('logged_in'):    
        form = RegistrationForm()
        if flask.request.method == 'POST' and form.validate_on_submit():
          fname = form.fname.data
          lname = form.lname.data
          street = form.street.data
          city = form.city.data
          pcode = form.pcode.data
          country = form.country.data
          email = form.email.data
    
          try:
            db = sqlite3.connect('project.db')
            db.row_factory = sqlite3.Row
            with db:
              cursor = db.cursor()
              sql = "select * from user"
              cursor.execute(sql)
              allrows = cursor.fetchall()
              ids = []
              for value in allrows:
                ids.append(value[0])
              new_id = ids[len(ids) -1] + 1
              params = (new_id, fname, lname, street, city, pcode, country, email, 'NULL')
              cursor.execute("INSERT INTO User VALUES (?,?,?,?,?,?,?,?,?)", params)
              cursor.close()
              return 'Successfully Registered'

          except sqlite3.Error as err:
              print("Error connecting to db: {}".format(err))
        
        else:
            return flask.render_template('registration_form.html',form=form)

    else:
        return flask.render_template('login.html')         

@app.route('/authenticate', methods=['GET'])
def admin_authenticate():
    if flask.session.get('logged_in'):   
      try:
        db = sqlite3.connect('project.db')
        db.row_factory = sqlite3.Row
        with db:
          cursor = db.cursor()
          sql = "select * from faculty"
          cursor.execute(sql)
          allrows = cursor.fetchall()
          ids = set() 
          for faculty in allrows:
              if faculty[1] and faculty[2]:
                  ids.add(faculty[0])

          aids = set()
          sql = "select * from Authentication"
          cursor.execute(sql)
          allrows = cursor.fetchall()
          for auth in allrows:
              aids.add(auth[0])
       
          intersection = ids.intersection(aids)
          for fid in intersection:
              ids.remove(fid)
      
          for fid in ids:
              params = (fid, 9, '2017-10-01', '10:00am')
              cursor.execute("INSERT INTO Authentication VALUES (?,?,?,?)", params)
      
          cursor.close()
          return "Sucessfully Authenticated a faculty with ID = {}".format(fid)
       
      except sqlite3.Error as err:
          flask.abort(500)

    else:
        return flask.render_template('login.html')

@app.route('/')
def home():
    #flask.session['logged_in'] = False 
    if not flask.session.get('logged_in'):
        return flask.render_template('login.html')
    else:
        return flask.render_template('layout.html')

@app.route('/login', methods=['POST'])
def login():
    admins = ['Jacob','Martin','John','Arvind','Lucas','Rado','Chen','Monica','Lily','Aditya']
    db = sqlite3.connect('project.db')
    db.row_factory = sqlite3.Row
    with db:
      cursor = db.cursor()
      sql = "select Salt, Hash, FName from User where FName = '{}'".format(flask.request.form['username'])
      cursor.execute(sql)
      allrows = cursor.fetchall()
 
    if allrows:
        salt = allrows[0][0].encode('utf-8')
        hashed = allrows[0][1].encode('utf-8')
        password = flask.request.form['password'].encode('utf-8')
        derived_hash = bcrypt.hashpw(password, salt)
    else:
        return flask.render_template('login.html')
 
    if flask.request.method == 'POST':
        if flask.request.form['username'] in admins:
            if hashed == derived_hash:
                flask.session['logged_in'] = True
            else:
                flask.flash('wrong password')
    return home()

@app.route("/logout")
def logout():
    flask.session['logged_in'] = False
    return home()

@app.route('/task_c', methods = ['GET','POST'])
def task_c():
    form = TaskForm()
    if flask.session.get('logged_in'):
      if flask.request.method == 'POST':
        #form = Task()
        try:
          db = sqlite3.connect('project.db')
          db.row_factory = sqlite3.Row
          with db:
            cursor = db.cursor()
            sql = "Select StudentID, CourseName, PrimaryTopic, SecondaryTopic, Rate, Status\
                 From\
(Select Course.ID as CourseID, Course.name as CourseName, AVG(CompletesCourse.rating) as Rate,Topic.Name as PrimaryTopic, SecondaryTopic\
	From  COURSE\
    Left Join CompletesCourse ON Course.ID = CompletesCourse.CID\
    Left Join Topic ON Course.primaryTopic = Topic.ID \
    INNER JOIN \
   (Select Course.ID as CourseID, Group_concat(Topic.Name) as SecondaryTopic\
    From Course\
    Left Join Sec_Topic on Sec_Topic.CID = Course.ID\
	Left Join Topic ON Sec_Topic.TID = Topic.ID\
	Group by Course.ID)  As a\
	on a.CourseID = Course.ID\
	Group by CourseID) As b\
	Inner Join \
   (Select\
        User.ID as StudentID, CID as CourseID,'complete' as Status\
    From User\
    Inner Join CompletesCourse ON User.ID = CompletesCourse.SID\
    Where\
        User.ID = {} Union Select\
        User.ID as StudentID, CID as CourseID, 'interest' as Status\
    From User\
    Inner Join IsInterest ON User.ID = IsInterest.SID\
    Where\
        User.ID = {} Union Select\
        User.ID as StudentID, CID as CourseID, 'enroll' as Status\
    From User\
    Inner Join Enroll on User.ID = Enroll.SID\
    Where User.ID = {}) As c\
	on c.CourseID = b.CourseID\
	order by Rate Desc".format(int(flask.request.form['Input']), int(flask.request.form['Input']), int(flask.request.form['Input']))

            cursor.execute(sql)
            allrows = cursor.fetchall()
            cursor.close()
            return flask.render_template('task_c.html', results=allrows)
        
        except sqlite3.Error as err:
          flask.abort(500)
      else:
        return flask.render_template('user_input.html', form=form)

    else:
        return flask.render_template('login.html')

@app.route('/task_g', methods = ['GET','POST'])
def task_g():
    form = TaskgForm()
    if flask.session.get('logged_in'):
      if flask.request.method == 'POST':
        #form = Task()
        try:
          db = sqlite3.connect('project.db')
          db.row_factory = sqlite3.Row
          with db:
            cursor = db.cursor()
            sql = "SELECT printf('Congratulations %s %s! You have completed the %s course on %s.', \
		u.FName, \
		u.LName, \
		c.name, \
		d.date) AS certificate \
                FROM \
		CompletesCourse AS d \
		INNER JOIN Course AS c ON c.id=d.cid \
		INNER JOIN User AS u ON u.id=d.sid \
		INNER JOIN Payment As p on u.id = p.sid \
        	WHERE \
		d.SID = {} AND c.ID = {}".format(int(flask.request.form['Input1']),int(flask.request.form['Input2']))
             

            cursor.execute(sql)
            allrows = cursor.fetchall()
            cursor.close()
            return flask.render_template('task_g.html', results=allrows)

        except sqlite3.Error as err:
          flask.abort(500)
      else:
        return flask.render_template('task_input_g.html', form=form)

    else:
        return flask.render_template('login.html')
