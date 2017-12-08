from django.conf.urls import url

from . import views

urlpatterns = [

    # /user/ - list all users
    url(r'^$', views.list, name='list'),

    # /user/new - create a new user
    url(r'^$/new', views.new, name='new'),

    # /user/uid/course
    url(r'^(?P<user_id>[0-9]+)/course/$', views.course, name='course'),


    #url(r'^user/', include('tUser.urls')),





]
