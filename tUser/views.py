from django.http import HttpResponse


def index(request, user_id):
    page = "Welcome to the Trainly.io dashboard,  user %s." % user_id
    return HttpResponse(page)

def detail(request, user_id, course_id):
    return HttpResponse("You're looking at detial of user %s." % user_id)

