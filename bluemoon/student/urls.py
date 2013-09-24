from django.conf.urls.defaults import *

urlpatterns = patterns('student.views',
			url(r'^student/$', 'studentHome'),
			url(r'^$', 'startPage'),
			url(r'^auth/login/$', 'login'),
			url(r'^auth/logout/$', 'logout'),
			)
