[![Build Status](https://travis-ci.com/namratab94/course_management_system.svg?token=DHZaauRyh5MCfRFSXQbj&branch=master)](https://travis-ci.com/namratab94/course_management_system)

# DBMS - Project

### Presentation Videos
* [Steps to Setup](https://youtu.be/zeQ39YhgZeo)
* [Demo](https://youtu.be/kLBtOrOzFjw)
* [Presentation](https://youtu.be/tozAT0Fex3o)


## How to Use:

## Prerequisites:
* Git
* Python
* Pip (a.k.a python-pip)

## Setting up the project


1. Check Prerequisites:

If you are on a Window's machine, please perform the following:
   * Install [MINGW](http://www.mingw.org/) if not already installed.
   * Install [Git](https://git-scm.com/) if not already installed.
   * Install [Python](https://www.python.org/) if not already installed.
   * Add the corresponding bin directories to your PATH variable if not already added.
   * Open MINGW.
   * Run git, python, and pip commands to verify installation.
   

If you are on a Mac or Ubuntu, install the prerequisites through your favorite package manager.


2. In your computer's terminal, clone this repository. This may require a github login.

```
git clone https://github.com/namratab94/course_management_system.git
```

3. Install Virtual Environments on your local instance.

For Ubuntu:
```
sudo pip install virtualenv
```

For Windows/Mac:
```
pip install virtualenv
```

4. Load the Flask virtual environment.
```
# Navigate to the course_management_system directory
virtualenv flask
```

5. Activate the flask environment.

For Ubuntu/Mac:
```
# Navigate to your course_management_system directory
flask/bin/activate
```

For Windows:
```
# Navigate to your course_management_system directory
flask/bin/activate.bat
```

6. Then install the packages required for the flask application to run:

For Mac/Windows:
```
# Navigate to the requirements file (cd ~course_management_system/dbms_project)
pip install -r requirements.txt
```

For Ubuntu:
```
# Navigate to the requirements file (cd ~course_management_system/dbms_project)
sudo pip install -r requirements.txt
```

## Running the Project

1. To start the server at port 8888:
```
# Navigate to your course_management_system/dbms_flask/ folder.
python main.py
```

2. Open your web browser and go to [localhost:8888](localhost:8888). 

This will load the login page. The login credentials of an admin are: 
* Username: Rado
* Password: ddd
