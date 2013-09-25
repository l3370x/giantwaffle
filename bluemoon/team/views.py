from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, Http404
from django.template import RequestContext
from django.shortcuts import render_to_response
import django.contrib.auth
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.shortcuts import redirect
from django.http import HttpResponseRedirect
from django.shortcuts import render

from student.models import *

@login_required
def teamDetails(request):
	stud = Student.objects.get(user=request.user.id)
	noTeam = stud.myTeam is None
	if noTeam:
		stud.myTeam = None
		return render(request,'team/deleted.html',{})
	team = stud.myTeam
	return render(request,'team/home.html',{'team':team})

@login_required
def teamDelete(request):
	stud = Student.objects.get(user=request.user.id)
	noTeam = stud.myTeam is None
	if noTeam:
		return render(request,'team/deleted.html',{})
	team = stud.myTeam
	if team.teamLeader == stud:
		ss = Student.objects.filter(myTeam=team)
		for s in ss:
			s.myTeam = None
		team.delete()
		noTeam = True
		return render(request,'team/deleted.html',{'noTeam':noTeam})
	return teamDetails(request)
		
		
def create(request):
	d = {}
	if request.method == 'GET':
		form = CreateTeamForm()
		return render_to_response('team/create.html',{'form':form},context_instance = RequestContext(request))
	if request.method == 'POST':
		form = CreateTeamForm(request.POST)
		if not form.is_valid():
			return render_to_response('team/create.html',{'form':form},context_instance = RequestContext(request))
		try:
			u = Team.objects.get(name = request.POST['teamName'])
			d['error'] = 'Team name already taken'
			d['form'] = form
			return render_to_response('team/create.html', d, context_instance = RequestContext(request))
		except Team.DoesNotExist:
			pass
		
		currentStud = Student.objects.get(user=request.user.id)
		newTeam = Team.objects.create(teamLeader=currentStud,name=request.POST['teamName'],captain="",helm="",weapons="",science="",engineering='',comms='')
		currentStud.myTeam = newTeam
		currentStud.save()
		return teamDetails(request)
