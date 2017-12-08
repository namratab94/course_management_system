from django.http import HttpResponse


def list(request):
    page = "List of all the users: (hint, it's empty right now)"
    return HttpResponse(page)

def new(request):
    return HttpResponse("Creating a new user! Please fill out the form below.")

def course(request, user_id):
    return HttpResponse("Displaying all courses for user %s." % user_id)
