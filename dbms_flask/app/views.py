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
import pdb 

user = ''
roles_user = []
db = ''
total_roles = ['student','faculty','admin']

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

def required_login(f):
  @wraps(f)
  def decorated_function(*args, **kwargs):
    if 'logged_in' not in flask.session: 
        return flask.redirect(flask.url_for('login'))

    return f(*args)
  return decorated_function

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

@app.route('/enroll', methods=['GET'])
@required_login
@required_database
def index():
    global db
    db.row_factory = sqlite3.Row
    with db:
      return flask.render_template('index.html',results=alltasks.index_process(db))
 

@app.route('/register', methods=['GET','POST'])
@required_login
@required_database
@required_roles('admin')
def register_form():
  form = RegistrationForm()
  if flask.request.method == 'POST' and form.validate_on_submit():
    global db
    db.row_factory = sqlite3.Row
    alltasks.register_form(db)
  else:
    return flask.render_template('registration_form.html',form=form)

@app.route('/authenticate', methods=['GET'])
@required_login
@required_database
@required_roles('admin')
def admin_authenticate():
  global db      
  db.row_factory = sqlite3.Row
  alltasks.admin_authenticate(db)
      
@app.route('/')
def home():
    if not flask.session.get('logged_in'):
        return flask.render_template('login.html')
    else:
        return flask.render_template('layout.html')

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
      if hashed == derived_hash:
          flask.session['logged_in'] = True
      else:
          flask.flash('wrong password')
    return home()

@app.route("/unauthorised")
def unauthorised():
  return flask.render_template('unauthorised.html')

@app.route("/logout")
def logout():
    flask.session['logged_in'] = False
    user = '' 
    return home()

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
      return flask.render_template('report_input_b.html', form=form)
    

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
