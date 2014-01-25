from django.conf.urls import *

urlpatterns = patterns('student.views',
			url(r'^student/$', 'Home'),
			url(r'^home/$', 'Home'),
			url(r'^$', 'Home'),
			url(r'^auth/login/$', 'login'),
			url(r'^login/$', 'login'),
			url(r'^auth/logout/$', 'logout'),
			url(r'^auth/create/$', 'create'),
			)
