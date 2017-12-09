import flask_wtf
import wtforms

class RegistrationForm(flask_wtf.Form):
  fname        = wtforms.TextField('First Name')
  lname        = wtforms.TextField('Last Name')
  street       = wtforms.TextField('Street')
  city         = wtforms.TextField('City')
  pcode        = wtforms.TextField('Pin Code')
  country      = wtforms.TextField('Country')
  email        = wtforms.TextField('Email') 
  submit = wtforms.SubmitField('Register User')

class DateForm(flask_wtf.Form):
  start_date = wtforms.DateField('Start Date', format='%m/%d/%Y', validators=[wtforms.validators.DataRequired()])
  end_date = wtforms.DateField('End Date', format='%m/%d/%Y', validators=[wtforms.validators.DataRequired()])
  submit = wtforms.SubmitField('Generate Report')

class TaskForm(flask_wtf.Form):
  Input = wtforms.TextField('Input')
  submit = wtforms.SubmitField('Submit')

class TaskgForm(flask_wtf.Form):
  Input1 = wtforms.TextField('Input1')
  Input2 = wtforms.TextField('Input2')
  submit = wtforms.SubmitField('Submit')

