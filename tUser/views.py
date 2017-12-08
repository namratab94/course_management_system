from django.http import HttpResponse


def list(request):
    page = "List of all the users: (hint, it's empty right now)"
    return HttpResponse(page)

def new(request):
    return HttpResponse("Creating a new user! Please fill out the form below.")

