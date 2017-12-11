import sqlite3
import os
import sys
import json
import bcrypt
import alltasks
from userroles import user_roles



# Task A
def register_form(database, fname, lname, street, city, pcode, country, email, password):
    with database:
      cursor = database.cursor()
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

# Task B

def  faculty_authenticate(database):
  with database:
    cursor = database.cursor()
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
     
    if ids:
      a = ids.pop()
      params = (a, 9, '2017-10-01', '10:00am')
      cursor.execute("INSERT INTO Authentication VALUES (?,?,?,?)", params)
      cursor.close()
      return "Successfully Authenticated a faculty with ID = {}".format(a)

    else:
      return "There isn't any user that needs to be authenticated as faculty"


def admin_authenticate(database, a):
  with database:
    cursor = database.cursor()
    aids = set()
    sql = "select * from Admin"
    cursor.execute(sql)
    allrows = cursor.fetchall()
    for item in allrows:
      if a == item[0]:
        return "You are already an admin"

    params = (a, 9, '2017-10-01', '10:00am')
    cursor.execute("INSERT INTO Admin VALUES (?,?,?,?)", params)
    cursor.close()
    return "Sucessfully authorised User:ID = {} as admin".format(a)

# Task C
def task_c_process(database,studentID):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
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
        User.ID = ? Union Select\
        User.ID as StudentID, CID as CourseID, 'interest' as Status\
    From User\
    Inner Join IsInterest ON User.ID = IsInterest.SID\
    Where\
        User.ID = ? Union Select\
        User.ID as StudentID, CID as CourseID, 'enroll' as Status\
    From User\
    Inner Join Enroll on User.ID = Enroll.SID\
    Where User.ID = ?) As c\
        on c.CourseID = b.CourseID\
        order by Rate Desc"

      params = [int(studentID),int(studentID),int(studentID)] 
      cursor.execute(sql, params)
      allrows = cursor.fetchall()
      cursor.close()
      return allrows


# Task D
def task_d(database, a, b):
    with database:
      cursor = database.cursor()
      params = (a,b)
      try:
        cursor.execute("SELECT * from Enroll")
        allrows = cursor.fetchall()
        for item in allrows:
          if item[0] == a and item[1] == b:
            return "Already Enrolled" 
        
        cursor.execute("INSERT INTO ENROLL VALUES (?,?)", params)
        return 'Successfully Enrolled'
      except:
        'Unable to Enroll'


# Task E
def task_e(db, userParam):
	db.row_factory = sqlite3.Row
	with db:
		cursor = db.cursor()
	  	params = [userParam, userParam ]
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
					on Material.CID = CompletesMaterial.CCID 
						and Material.ID = CompletesMaterial.MID
				Inner Join Course on Course.ID = Material.CID
				Inner Join Enroll on Enroll.CID = Course.ID 
						and Enroll.SID = CompletesMaterial.SID
				Inner Join User   on User.ID = Enroll.SID
			Where Enroll.SID = ?

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
					on Material.CID = CompletesMaterial.CCID 
						and Material.ID = CompletesMaterial.MID
				Inner Join Course on Course.ID = Material.CID
				Left  Join Enroll  on Enroll.CID = Course.ID 
						and Enroll.SID = CompletesMaterial.SID
				Inner Join User   on User.ID = Enroll.SID
			Where Enroll.SID = ? and CompletesMaterial.time is Null 
			Order by Status, Material.Name;
	"""
		cursor.execute(sql, params)
		allrows = cursor.fetchall()
		cursor.close()
		return allrows
	

# Task F

def task_f(db, userParam, materialParam, courseParam):
	db.row_factory = sqlite3.Row
	with db:
	  cursor = db.cursor()

	  # Complete the material
	  params = (userParam,'12:02pm','2017-11-26',materialParam,courseParam )
	  sql = """
		INSERT INTO CompletesMaterial VALUES
		(?, ?, ?, ?, ?);
		"""
	  cursor.execute(sql, params)

	# Check if all materials for the course are complete
	  params = (userParam, courseParam )
	  sql = """
		Select COUNT(*)
		From Material
			Left  Join CompletesMaterial 
				on Material.CID = CompletesMaterial.CCID 
					and Material.ID = CompletesMaterial.MID
			Inner Join Course 
				on Course.ID = Material.CID
			Left  Join Enroll  
				on Enroll.CID = Course.ID 
					and Enroll.SID = CompletesMaterial.SID
			Inner Join User   on User.ID = Enroll.SID
		Where Enroll.SID = ? and CompletesMaterial.time is Null AND Course.ID= ?
		"""
	  cursor.execute(sql, params)
	  numberMaterialsLeft = cursor.fetchall()


	  if numberMaterialsLeft < 1:
		# Check if all materials for the course are complete
		  params = (userParam, courseParam )
		  sql = """
			INSERT INTO CompletesCourse VALUES
			(?, '12:02pm','2017-11-26', ?, NULL, NULL);
			"""
		  cursor.execute(sql, params)


	  cursor.close()
	  return numberMaterialsLeft

# Report G

def task_g(database, a, b):
  with database:
    cursor = database.cursor()
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
                d.SID = ? AND c.ID = ?"

    params = [a,b]
    cursor.execute(sql,params)
    allrows = cursor.fetchall()
    cursor.close()
    return allrows

# Report H

def task_h(database, studentID):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
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
            transactions.SID=? \
            ORDER BY date"

      params = [studentID]
      cursor.execute(sql,params)
      allrows = cursor.fetchall()
      cursor.close()
      return allrows

# Report A


def report_a(database):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
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
      return allrows




# Report B


def report_b(database, a):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
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
        Country like ?\
        GROUP BY \
        City\
        ORDER BY\
        City DESC"

      params = [a]
      cursor.execute(sql, params)
      allrows = cursor.fetchall()
      cursor.close()
      return allrows



# Report C

def report_c(database):
	database = sqlite3.connect('project.db')
	database.row_factory = sqlite3.Row
	with database:
		cursor = database.cursor()
		sql = """ 
			SELECT
				q.ID as QuestionID, 
				q.QuestionText as QuestionText, 
				c.Name as CourseName, 
				count(q.ID) as Number_Like
			FROM
				(Questions q 
				inner join RelateToMaterial r on q.ID = r.QID
				inner join Course c on c.ID = r.RCID)
				left join LikesQuestion likeq on q.ID = likeq.QID
			WHERE q.IsVisible = 1
			GROUP BY QuestionID
			ORDER BY Number_like DESC;
			""" 
		cursor.execute(sql)
		allrows = cursor.fetchall()
		cursor.close()
		return allrows
	
# Report D

def report_d(database, cid, mid, qNum, answerToCheck):
	database = sqlite3.connect('project.db')
	database.row_factory = sqlite3.Row
	with database:
		cursor = database.cursor()
		sql = """
			SELECT MAX(Feedback='Right') as is_answer_correct
			FROM
				(SELECT
					qq.MID as material_id,
					qq.CID as course_id,
					qq.NUMBER as question_number,
					Text as question_text,
					ID,
					A_Text as answer_to_check,
					Feedback
				FROM
					Quiz as q
					INNER JOIN Quiz_Questions as qq 
						ON (q.MID=qq.MID AND q.QCID=qq.CID)
					INNER JOIN Quiz_Answers as qa 
						ON (q.MID=qa.MID AND q.QCID=qa.CID)
				WHERE
					course_id=?
					AND material_id=?
					AND question_number=?
					AND answer_to_check=?
				ORDER BY
					material_id, course_id, qq.NUMBER, ID
			) SELECTed_answer;
			"""

                params = [cid,mid,qNum,answerToCheck]
		cursor.execute(sql, params)
		allrows = cursor.fetchall()
		cursor.close()
		return allrows
			 

# Report E

def report_e(database):
	database = sqlite3.connect('project.db')
	database.row_factory = sqlite3.Row
	with database:
		cursor = database.cursor()
		sql = """
			SELECT 
				printf("%s %s", u.FName, u.LName) as student_name, c.name as course_name, 
				julianday(cc.date)-julianday(p.date) as days_spent_to_complete
			FROM 
				User u
				LEFT JOIN Payment p ON p.CID=u.ID
				LEFT JOIN CompletesCourse cc ON cc.CID=u.ID
				INNER JOIN Course c ON p.CID=c.ID
			GROUP BY 
				u.ID,p.CID
			ORDER BY 
				u.FName, u.LName;
			"""

		cursor.execute(sql)
		allrows = cursor.fetchall()
		cursor.close()
		return allrows
			 

       
# Report F

def report_f(database):
    database.row_factory = sqlite3.Row
    with database:
      cursor = database.cursor()
      sql = "SELECT \
        Course_Name, Question, Answer, MAX(no_of_likes) AS Likes,\
       (User.FName || ' ' || User.FName) AS PostedBy\
       FROM\
      (\
      (SELECT\
            COUNT(LikesQuestion.QID) AS no_of_likes,\
            Questions.QuestionText AS Question,\
            Questions.Answer AS Answer,\
            Course.name AS Course_Name,\
            Questions.ID AS QID\
        FROM \
            ((Questions INNER JOIN RelateToMaterial ON Questions.ID = RelateToMaterial.QID)\
            INNER JOIN Course ON RelateToMaterial.RCID = Course.ID)\
            INNER JOIN LikesQuestion ON Questions.ID = LikesQuestion.QID\
            GROUP BY Questions.ID\
                    ) q1\
       INNER JOIN Ask ON q1.QID = Ask.QID)\
       INNER JOIN User ON Ask.SID = User.ID\
       GROUP BY\
                Course_Name\
       ORDER BY\
                Course_Name ASC,  Likes DESC"
      cursor.execute(sql)
      allrows = cursor.fetchall()
      cursor.close()
      return allrows

