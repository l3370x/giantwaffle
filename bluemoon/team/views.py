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
from request.models import *
from student.models import *

@login_required
def allowJoinTeamRequest(request):
	if request.method == 'POST':
		team = Team.objects.get(id=request.POST['team'])
		user = User.objects.get(id=request.POST['user'])
		stud = Student.objects.get(user=user)
		if Student.objects.get(user=request.user.id).myTeam != team:
			return allTeams(request)
		d = {}
		d['team']=team
		d['stud']=stud
		stud.myTeam = team
		stud.save()
		reqs = Request.objects.filter(fk_student=stud)
		for r in reqs:
			r.delete()
		return render(request,'team/requestAccepted.html',d)
	if request.method == 'GET':
		return allTeams(request)

@login_required
def teamDetails(request):
	stud = Student.objects.get(user=request.user.id)
	noTeam = stud.myTeam is None
	if noTeam:
		stud.myTeam = None
		return render(request,'team/deleted.html',{})
	team = stud.myTeam
	teamLeader = stud == team.teamLeader
	if teamLeader:
		requests = Request.objects.filter(fk_team=team)
		myRequests = []
		for r in requests:
			toAdd = Student.objects.filter(id=r.fk_student.id)
			for rr in toAdd:
				myRequests.append(rr)
		return render(request,'team/home.html',{'myTeam':team,'teamLeader':teamLeader,'requests':myRequests})
	return render(request,'team/home.html',{'myTeam':team,'teamLeader':teamLeader})

@login_required
def teamDelete(request):
	stud = Student.objects.get(user=request.user.id)
	noTeam = stud.myTeam is None
	return render(request,'team/confirmDelete.html',{'noTeam':noTeam})

@login_required
def teamDeleteReal(request):
	stud = Student.objects.get(user=request.user.id)
	noTeam = stud.myTeam is None
	if noTeam:
		return render(request,'team/deleted.html',{})
	team = stud.myTeam
	if team.teamLeader == stud:
		team.delete()
		noTeam = True
		return render(request,'team/deleted.html',{'noTeam':noTeam})
	return teamDetails(request)

def allTeams(request):
	d = {}
	d['teams']=Team.objects.all()
	try:
		stud = Student.objects.get(user=request.user.id)
	except Student.DoesNotExist:
		#NOT LOGGED IN
		d['loggedIn']=False
		return render(request,'team/all.html',d)
	noTeam = stud.myTeam is None
	if noTeam:
		d['loggedIn']=True
		d['noTeam']=True
		d['teamLeader']=False
		d['me']=stud
		return render(request,'team/all.html',d)
	d['loggedIn']=True
	d['noTeam']=False
	d['teamLeader']=stud == stud.myTeam.teamLeader
	return render(request,'team/all.html',d)

@login_required
def joinTeamRequest(request):
	if request.method == 'POST':
		team = Team.objects.get(id=request.POST['team'])
		user = User.objects.get(id=request.POST['user'])
		stud = Student.objects.get(user=user)
		d = {}
		d['team']=team
		d['stud']=stud
		newR = Request.objects.create(fk_team=team,fk_student=stud)
		return render(request,'team/requestSubmit.html',d)
	if request.method == 'GET':
		return allTeams(request)

@login_required
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
