from django.http import HttpResponse
from django.template import loader


def list(request):
    page = "List of all the users: (hint, it's empty right now)"
    latest_user_list = [{'id': 0, 'name': "jerry"}, {'id': 1, 'name': "tim"}]

    # I made a template at cmsproject/templates/tUser/list.html
    template = loader.get_template('tUser/list.html')

    context = {
	'latest_user_list': latest_user_list,
    }
    return HttpResponse(template.render(context, request))




def new(request):
    return HttpResponse("Creating a new user! Please fill out the form below.")


def history(request, user_id):
    return HttpResponse("Here is the history of transactions for user %s." % user_id)


def grant(request, grantor_id, grantee_id):
    return HttpResponse("User %s authenticating user %s." % (grantor_id,grantee_id))

def course(request, user_id):
    return HttpResponse("Displaying all courses for user %s." % user_id)
