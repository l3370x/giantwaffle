from django.conf.urls.defaults import *

urlpatterns = patterns('team.views',
			url(r'^create/$', 'create'),
			url(r'^home/$', 'teamDetails'),
			url(r'^delete/$', 'teamDelete'),
			url(r'^deleteReal/$', 'teamDeleteReal'),
			url(r'^all/$', 'allTeams'),
			url(r'^join/$', 'joinTeamRequest'),
			url(r'^update/$', 'update'),
			url(r'^leave/$', 'leave'),
			url(r'^leaveReal/$', 'leaveReal'),
			url(r'^allowJoin/$', 'allowJoinTeamRequest'),
			url(r'^(?P<username>\w+)$', 'userDetails'),
			)
