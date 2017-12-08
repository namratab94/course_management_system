# For SQL Queries
from django.db import connection



def test():
	return "HI"


# Insert User
def taskA_user():
	query="""
	INSERT INTO User VALUES
	(26, 'Rob', 'Barron', '10 Smith St.', 'Cambridge', '02139',
	'USA', 'rbarron@example.com', NULL);
	"""

	with connection.cursor() as cursor:
		cursor.execute(query)
		row = cursor.fetchone()
		
	return row

# Insert Faculty
def taskA_faculty():
	#-- Using 
	#-- faculty_id = 26
	#-- f_title = 'Associate'
	#-- f_affiliation = 'WPI'
	#-- f_website = 'www.rbarron.com'
	query="""
	INSERT INTO Faculty VALUES
	(26, 'Associate', 'WPI', 'www.rbarron.com');
	"""

	with connection.cursor() as cursor:
		cursor.execute(query)
		row = cursor.fetchone()
		
	return row


# Insert Admin
def taskA_admin():
	query="""
	INSERT INTO Admin VALUES
	(26, 9, '2017-09-01', '10:00am');
	"""

	with connection.cursor() as cursor:
		cursor.execute(query)
		row = cursor.fetchone()
		
	return row


