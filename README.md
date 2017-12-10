[![Build Status](https://travis-ci.com/namratab94/course_management_system.svg?token=DHZaauRyh5MCfRFSXQbj&branch=master)](https://travis-ci.com/namratab94/course_management_system)

# DBMS - Project

## We are going to run this flask application in a virtual environment on your system.

1. Preparation:
  a. Install [git](https://git-scm.com/downloads), Python, and pip if not already installed.
  b. In your computer's terminal, clone this repository (and login to github if necessary):
     ```
     git clone https://github.com/namratab94/course_management_system.git
     cd course_management_system
     ```
 

2. Install flask on your local instance.
```
sudo pip install virtualenv
```

3. Give a name to the virtual environment.
```
virtualenv flask
```

4. Activate the flask environment.
```
# Navigate to your course_management_system directory
flask/bin/activate
```

5. Then install the packages required for the flask application to run:
```
# Navigate to the requirements file (cd ~course_management_system/dbms_project)
pip install -r requirements.txt
```

6. To start the server at port 8888:
```
python main.py
```

7. Open your web browser and go to [localhost:8888](localhost:8888).
  a. The login credentials are 
    * Username: Rado
    * Password: ddd
