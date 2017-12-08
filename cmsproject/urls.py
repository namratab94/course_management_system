from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^user/', include('tUser.urls')),
    url(r'^admin/', admin.site.urls),
]

