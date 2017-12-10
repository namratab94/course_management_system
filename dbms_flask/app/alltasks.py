def index():
    global db
    db.row_factory = sqlite3.Row
    with db:
      db = sqlite3.connect('project.db')
      cursor = db.cursor()
      sql = "select * from Enroll"
      cursor.execute(sql)
      allrows = cursor.fetchall()
      cursor.close()
      return flask.render_template('index.html',results=allrows)

def register_form():
  form = RegistrationForm()
  if flask.request.method == 'POST' and form.validate_on_submit():
    fname = form.fname.data
    lname = form.lname.data
    street = form.street.data
    city = form.city.data
    pcode = form.pcode.data
    country = form.country.data
    email = form.email.data
    password = form.password.data.encode('utf-8')
    global db
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
      salt = bcrypt.gensalt()
      hashed = bcrypt.hashpw(password, salt)
      params = (new_id, fname, lname, street, city, pcode, country, email, salt, hashed, 'NULL')
      cursor.execute("INSERT INTO User VALUES (?,?,?,?,?,?,?,?,?,?,?)", params)
      cursor.close()
      return 'Successfully Registered' +' '+ fname

  else:
    return flask.render_template('registration_form.html',form=form)

def admin_authenticate():
  global db
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

def task_c():
    form = TaskForm()
    if flask.request.method == 'POST':
        global db
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

    else:
        return flask.render_template('task_input_c.html', form=form)

def task_g():
    form = TaskgForm()
    if flask.request.method == 'POST':
      global db
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

    else:
        return flask.render_template('task_input_g.html', form=form)

def task_h():
    form = TaskForm()
    if flask.request.method == 'POST':
      global db
      db.row_factory = sqlite3.Row
      with db:
        cursor = db.cursor()
        sql = "SELECT \
            date, action, code as payment_confirmation, name as course_title, cost as course_cost \
            FROM \
            (SELECT \
            SID, CID, date, time, 'Enrollment' as action, code FROM Payment \
            UNION \
            SELECT \
            SID, CID, date, time, 'Completion' as action, NULL as code FROM CompletesCourse \
            )transactions \
            INNER JOIN  \
            Course AS c ON c.id=transactions.CID \
            WHERE \
            transactions.SID={} \
            ORDER BY date".format(int(flask.request.form['Input']))


        cursor.execute(sql)
        allrows = cursor.fetchall()
        cursor.close()
        return flask.render_template('task_h.html', results=allrows)

    else:
        return flask.render_template('task_input_h.html', form=form)

def report_a():
  if flask.request.method == 'GET':
    global db
    db.row_factory = sqlite3.Row
    with db:
      cursor = db.cursor()
      sql = "SELECT \
            StudentID, CourseID, StudentFirstName, StudentLastName, \
            sum(CoursePrice) as StudentCost \
            FROM \
            (SELECT \
                e.SID as StudentID, e.CID as CourseID, u.FName as StudentFirstName, \
                u.LName as StudentLastName, c.cost as CoursePrice \
            FROM \
                Enroll e INNER JOIN User u on e.SID = u.ID \
                INNER JOIN Course c on c.ID = e.CID \
            WHERE \
                c.Name LIKE 'Intro%' \
            ) \
            INNER JOIN Payment p on p.SID = StudentID and p.CID = CourseID \
            GROUP BY \
           StudentID \
           ORDER BY \
           StudentCost"
      cursor.execute(sql)
      allrows = cursor.fetchall()
      cursor.close()
      return flask.render_template('report_a.html', results=allrows)

def report_b():
  form = TaskForm()
  if flask.request.method == 'POST':
    global db
    db.row_factory = sqlite3.Row
    with db:
      cursor = db.cursor()
      sql = "SELECT \
        u.Country as Country, u.City as City, \
        cast(cast(count(en.CID) as \
                double)/cast(count(Isin.CID) as double) * 100 as varchar(20))+ '%' as \
        Ratio_Interest_Enroll, \
        cast(cast(count(comc.CID) as \
                double )/cast(count(en.CID) as double)* 100 as varchar(20)) + '%' as \
        Ratio_Enroll_complete\
        FROM\
        User u INNER JOIN IsInterest Isin on u.ID = Isin.SID\
        LEFT JOIN Enroll en on u.ID = en.SID and Isin.CID = en.CID\
        LEFT JOIN CompletesCourse comc on comc.SID = en.SID and comc.CID = en.CID\
        INNER JOIN Course c on c.ID = Isin.CID\
        WHERE \
        Country like '{}'\
        GROUP BY \
        City\
        ORDER BY\
        City DESC".format(str(flask.request.form['Input']))
      cursor.execute(sql)
      allrows = cursor.fetchall()
      cursor.close()
      return flask.render_template('report_b.html', results=allrows)

  else:
      return flask.render_template('report_input_b.html', form=form)
