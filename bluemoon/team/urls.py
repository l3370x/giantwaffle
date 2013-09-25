from django.conf.urls.defaults import *

urlpatterns = patterns('team.views',
			url(r'^create/$', 'create'),
			url(r'^home/$', 'teamDetails'),
			url(r'^delete/$', 'teamDelete'),
			url(r'^all/$', 'allTeams'),
			url(r'^join/$', 'joinTeamRequest'),
			)
