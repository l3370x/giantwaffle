from django.conf.urls.defaults import *

urlpatterns = patterns('student.views',
			url(r'^student/$', 'Home'),
			url(r'^home/$', 'Home'),
			url(r'^$', 'Home'),
			url(r'^auth/login/$', 'login'),
			url(r'^auth/logout/$', 'logout'),
			url(r'^auth/create/$', 'create'),
			)
