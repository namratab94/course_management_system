[![Build Status](https://travis-ci.com/namratab94/course_management_system.svg?token=DHZaauRyh5MCfRFSXQbj&branch=master)](https://travis-ci.com/namratab94/course_management_system)

# DBMS - Project

## We are going to run this flask application in a virtual environment on your system.

## Prerequisites:
* Git
* Python
* Pip (a.k.a python-pip)

## Setting up the project
1. In your computer's terminal, clone this repository (and login to github if necessary):

For Ubuntu:
```
git clone https://github.com/namratab94/course_management_system.git
```

2. Install Virtual Environments on your local instance.

For Ubuntu:
```
sudo pip install virtualenv
```

3. Load the Flask virtual environment.

For Ubuntu:
```
virtualenv flask
```

4. Activate the flask environment.

For Ubuntu:
```
# Navigate to your course_management_system directory
flask/bin/activate
```

5. Then install the packages required for the flask application to run:

For Ubuntu:
```
# Navigate to the requirements file (cd ~course_management_system/dbms_project)
pip install -r requirements.txt
```

## Running the Project

1. To start the server at port 8888:
```
cd course_management_system/dbms_flask/
python main.py
```

2. Open your web browser and go to [localhost:8888](localhost:8888). The login credentials are: 
    * Username: Rado
    * Password: ddd