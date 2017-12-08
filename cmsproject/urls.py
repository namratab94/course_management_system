from django.conf.urls import include, url
from django.contrib import admin

from . import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    # /user/ - list all users
    url(r'^user/$', views.list, name='list'),

    # /user/new - create a new user
    url(r'^user/$new', views.new, name='new'),

    # /user/uid/course
    url(r'^user/$(?P<user_id>[0-9]+)/course/$', views.course, name='course'),


    #url(r'^user/', include('tUser.urls')),


    #/user/uid/history - display a list of enrollment/payment/completion for specific student
    url(r'^user/$(?P<user_id>[0-9]+)/history', views.history, name='history'),
	


    #/user/<uid>/grant - form to authenticate faculty/admin
    url(r'^user/$(?P<grantor_id>[0-9]+)/grant/(?P<grantee_id>[0-9]+)', views.grant, name='grant'),


]



