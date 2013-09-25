from django.conf.urls import *

urlpatterns = patterns('team.views',
			url(r'^create/$', 'create'),
			url(r'^home/$', 'teamDetails'),
			url(r'^delete/$', 'teamDelete'),
			url(r'^deleteReal/$', 'teamDeleteReal'),
			url(r'^all/$', 'allTeams'),
			url(r'^join/$', 'joinTeamRequest'),
			url(r'^update/$', 'update'),
			url(r'^mySettings/$', 'editSettings'),
			url(r'^leave/$', 'leave'),
			url(r'^leaveReal/$', 'leaveReal'),
			url(r'^allowJoin/$', 'allowJoinTeamRequest'),
			url('^details/(?P<team>[\w|\W]+)$', 'showTeam'),
			url(r'^(?P<username>\w+)$', 'userDetails'),
			)
