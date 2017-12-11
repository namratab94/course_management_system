import flask
from app import app
from .forms import *
from functools import wraps
import os
import sys
import sqlite3
import json
import bcrypt
import alltasks
from userroles import user_roles

user = ''
roles_user = []
db = ''
total_roles = ['student','faculty','admin']

#Decorator function to check if the task is executed by the authorised user
def required_roles(*role):
  def wrapper(f):
    @wraps(f)
    def wrapped(*args, **kwargs):
      for r in role:
        if r not in roles_user:
          return flask.redirect(flask.url_for('unauthorised'))
      return f(*args, **kwargs)
    return wrapped
  return wrapper


#Decorator function to check if the user is logged in before executing the task
def required_login(f):
  @wraps(f)
  def decorated_function(*args, **kwargs):
    if 'logged_in' not in flask.session: 
        return flask.render_template('login.html')

    return f(*args)
  return decorated_function

#Decorator function gets connection object to the sqlite3 database and throw an exception if there
#are any issues in connecting to it

def required_database(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
      try:
        global db
        db = sqlite3.connect('project.db')
      except sqlite3.Error as err:
          flask.abort(500)

      return f(*args, **kwargs)
    return decorated_function


#This task requires admin role, this will register a new user into the application.
@app.route('/register', methods=['GET','POST'])
@required_login
@required_database
@required_roles('admin')
def register_form():
  form = RegistrationForm()
  if flask.request.method == 'POST' and form.validate_on_submit():
    global db
    db.row_factory = sqlite3.Row
    fname = form.fname.data
    lname = form.lname.data
    street = form.street.data
    city = form.city.data
    pcode = form.pcode.data
    country = form.country.data
    email = form.email.data
    password = form.password.data.encode('utf-8')
    result = alltasks.register_form(db, fname, lname, street,city, pcode, country, email, password)
    return flask.render_template('registration_out.html', results=result)
  else:
    return flask.render_template('registration_form.html',form=form)

#This task will authorise a user to become faculty if he has title and affiliation
@app.route('/faculty_authenticate', methods=['GET'])
@required_login
@required_database
@required_roles('admin')
def faculty_authenticate():
  global db      
  db.row_factory = sqlite3.Row
  return flask.render_template('task_b.html',results=alltasks.faculty_authenticate(db))


#This task will authenticate a fellow user requested to become admin
@app.route('/admin_authenticate', methods=['GET', 'POST'])
@required_login
@required_database
@required_roles('admin')
def admin_authenticate():
  form = TaskbForm()
  if flask.request.method == 'POST':
    global db
    db.row_factory = sqlite3.Row
    return flask.render_template('task_b.html', results = alltasks.admin_authenticate(db, int(flask.request.form['InputID'])))
  else:
    return flask.render_template('task_input_b.html', form=form)


@app.route('/')
def home():
    if not flask.session.get('logged_in'):
        return flask.render_template('login.html')
    else:
        return flask.render_template('layout.html')


#This is the login page to the application
@app.route('/login', methods=['POST'])
@required_database
def login():
    global db
    db.row_factory = sqlite3.Row
    global user 
    user = flask.request.form['username']
    global roles_user 
    roles_user = user_roles[user]
    with db:
      cursor = db.cursor()
      sql = "select Salt, Hash, FName from User where FName = ?"
      params = [str(flask.request.form['username'])]
      cursor.execute(sql, params)
      allrows = cursor.fetchall()
 
    if allrows:
      salt = allrows[0][0].encode('utf-8')
      hashed = allrows[0][1].encode('utf-8')
      password = flask.request.form['password'].encode('utf-8')
      derived_hash = bcrypt.hashpw(password, salt)
    else:
      return flask.render_template('login.html')
 
    if flask.request.method == 'POST':
      if hashed == derived_hash:
          flask.session['logged_in'] = True
      else:
          flask.flash('wrong password')
    return home()


#Returns unauthorised exception when user is executing admin required tasks
@app.route("/unauthorised")
def unauthorised():
	return flask.render_template('unauthorised.html')

#logout implementation
@app.route("/logout")
def logout():
    flask.session['logged_in'] = False
    user = '' 
    return home()

#Task C implementation, with input as StudentID
@app.route('/task_c', methods = ['GET','POST'])
@required_login
@required_database
@required_roles('student')
def task_c():
    form = TaskForm()
    if flask.request.method == 'POST':
        global db
        return flask.render_template('task_c.html', results=alltasks.task_c_process(db, int(flask.request.form['Input'])))
    else:
        return flask.render_template('task_input_c.html', form=form)


#Task D implementation, with input studentId and courseId
@app.route('/task_d', methods = ['GET', 'POST'])
@required_login
@required_database
@required_roles('admin')
def task_d():
    form = TaskdForm()
    if flask.request.method == 'POST':
        global db
        db.row_factory = sqlite3.Row
        with db:
          response = alltasks.task_d(db, int(flask.request.form['InputStudentID']), int(flask.request.form['InputCourseID']))
          if response == 'Already Enrolled':
            return flask.render_template('enroll.html', result=response)
          elif response == 'Successfully Enrolled':
            return flask.render_template('enroll.html', result=response)
          else:
            return flask.render_template('enroll.html', result=response)
    else:
        return flask.render_template('task_input_d.html', form=form)


#Task E implementation, for a student enrolled in a course provides
#list materials, in order,inndicating the line of demarcation between completed/not completed
@app.route('/task_e', methods = ['GET', 'POST'])
@required_login
@required_database
@required_roles('admin')
def task_e():
    if flask.request.method == 'POST':
        global db
        db.row_factory = sqlite3.Row
        with db:
          sid = int(flask.request.form['InputStudentID'])
	  print("SID IS %s" % sid)
	  result = alltasks.task_e(db,sid)
          print("RESULT IS %s" % result)
          return flask.render_template('task_e.html', results=result)
    else:
        return flask.render_template('task_input_e.html', form=TaskeForm())


#Task F, Mark course material as having been completed by a student(possibly resulting in course completion)
@app.route('/task_f', methods = ['GET', 'POST'])
@required_login
@required_database
@required_roles('student')
def task_f():
    form = TaskfForm()
    if flask.request.method == 'POST':
        global db
        db.row_factory = sqlite3.Row
        uid = int(flask.request.form['InputUserID'])
        mid = int(flask.request.form['InputMaterialID'])
        cid = int(flask.request.form['InputCourseID'])
        response = alltasks.task_f(db,uid, mid, cid)
        return flask.render_template('task_f.html', results=response)
    else:
        return flask.render_template('task_input_f.html', form=form)


#This function implements task g, Provide a certificate of completion for a student (assuming 
#s/he has successfully completed all materials)
@app.route('/task_g', methods = ['GET','POST'])
@required_login
@required_database
@required_roles('student')
def task_g():
    form = TaskgForm()
    if flask.request.method == 'POST':
      global db
      db.row_factory = sqlite3.Row
      with db:
        return flask.render_template('task_g.html', results=alltasks.task_g(db, int(flask.request.form['Input1']), int(flask.request.form['Input2'])))

    else:
        return flask.render_template('task_input_g.html', form=form)


#This function implements task h, Provide an account history for a user: dates of 
#enrollment/completion for each course, amount paid (with confirmation code),
#and total spent.
@app.route('/task_h', methods = ['GET','POST'])
@required_login
@required_database
@required_roles('student')
def task_h():
    form = TaskForm()
    if flask.request.method == 'POST':
      global db
      db.row_factory = sqlite3.Row
      with db:
        return flask.render_template('task_h.html', results=alltasks.task_h(db, int(flask.request.form['Input'])))

    else:
        return flask.render_template('task_input_h.html', form=form)


#This function implements report query a
@app.route('/report_a', methods = ['GET'])
@required_login
@required_database
@required_roles('student')
def report_a():
  if flask.request.method == 'GET':     
    global db
    db.row_factory = sqlite3.Row
    with db:
      return flask.render_template('report_a.html', results=alltasks.report_a(db))


#This function implements report query b
@app.route('/report_b', methods = ['GET', 'POST'])
@required_login
@required_database
@required_roles('student')
def report_b():
  form = TaskForm()
  if flask.request.method == 'POST':
    global db
    db.row_factory = sqlite3.Row
    with db:
      return flask.render_template('report_b.html', results=alltasks.report_b(db, str(flask.request.form['Input'])))

  else:
      listOfCountries = getCountries(db);
      return flask.render_template('report_input_b.html', form=form, results=listOfCountries)



def getCountries(database):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
      sql = "SELECT DISTINCT User.Country FROM User"
      cursor.execute(sql)
      allrows = cursor.fetchall()
      for i in allrows:
         print i
      cursor.close()
      return allrows


#This function implements report query c
@app.route('/report_c', methods = ['GET','POST'])
@required_login
@required_database
@required_roles('student')
def report_c():
  global db
  db.row_factory = sqlite3.Row
  with db:
    return flask.render_template('report_c.html', results=alltasks.report_c(db))


#This function implements report query d
@app.route('/report_d', methods = ['GET','POST'])
@required_login
@required_database
@required_roles('student')
def report_d():
  form = ReportdForm()
  if flask.request.method == 'POST':
    global db
    db.row_factory = sqlite3.Row
    with db:
      cid = int(flask.request.form['InputCourseID'])
      mid = int(flask.request.form['InputMaterialID'])
      qNum = int(flask.request.form['InputQuestion_Number'])
      ans = int(flask.request.form['InputAnswser_to_Check'])
      return flask.render_template('report_d.html', results=alltasks.report_d(db, cid, mid, qNum, ans))

  else:
      return flask.render_template('report_input_d.html', form=form)


#This function implements report query e
@app.route('/report_e', methods = ['GET'])
@required_login
@required_database
@required_roles('student')
def report_e():
  global db
  db.row_factory = sqlite3.Row
  with db:
    return flask.render_template('report_e.html', results=alltasks.report_e(db))


#This function implements report query f
@app.route('/report_f', methods = ['GET'])
@required_login
@required_database
@required_roles('student')
def report_f():
  if flask.request.method == 'GET':
    global db
    db.row_factory = sqlite3.Row
    with db:
      return flask.render_template('report_f.html', results=alltasks.report_f(db))

