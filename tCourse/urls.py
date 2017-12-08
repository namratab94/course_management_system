from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    # ex: /dashboard/
    url(r'^$', views.index, name='index'),
    # ex: /dashboard/5/
    url(r'^(?P<user_id>[0-9]+)/$', views.detail, name='detail')
]
