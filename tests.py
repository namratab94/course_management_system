import sys

'''
This file will contain the tests necessary to perform continuous integration
of the system during development and is used by Travis-ci to perform checks 
during each build.
'''

# Dummy test to setup Travis CI.

a = 2
b = 3
assert a+b == 5