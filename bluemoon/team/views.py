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
def leave(request):
	return render(request,'team/confirmLeave.html',{})

@login_required
def leaveReal(request):
	if request.method == 'POST':
		user = User.objects.get(username=request.user)
		stud = Student.objects.get(user=user)
		team = stud.myTeam
		if(team.captain == user.username):
			team.captain = ""
		if(team.helm == user.username):
			team.helm = ""
		if(team.weapons == user.username):
			team.weapons = ""
		if(team.science == user.username):
			team.science = ""
		if(team.engineering == user.username):
			team.engineering = ""
		if(team.comms == user.username):
			team.comms = ""
		team.save()
		stud.myTeam = None
		stud.save()
	return allTeams(request)

@login_required
def update(request):
	if request.method == 'POST':
		user = User.objects.get(username=request.user)
		stud = Student.objects.get(user=user)
		team = Team.objects.get(teamLeader=stud)
		if team.teamLeader != stud:
			return teamDetails(request)
		if request.POST['position'] == 'captain':
			team.captain = request.POST['drop']
		if request.POST['position'] == 'helm':
			team.helm = request.POST['drop']
		if request.POST['position'] == 'weapons':
			team.weapons = request.POST['drop']
		if request.POST['position'] == 'science':
			team.science = request.POST['drop']
		if request.POST['position'] == 'engineering':
			team.engineering = request.POST['drop']
		if request.POST['position'] == 'comms':
			team.comms = request.POST['drop']
		team.save()
		return teamDetails(request)
	return teamDetails(request)
	
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
		teamMembers = Student.objects.filter(myTeam=team)
		return render(request,'team/home.html',{'myTeam':team,'teamLeader':teamLeader,'requests':myRequests,'teamMembers':teamMembers})
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
		try:
			team = Team.objects.get(id=request.POST['team'])
		except Team.DoesNotExist:
			return render(request,'team/missing.html')
		user = User.objects.get(id=request.POST['user'])
		stud = Student.objects.get(user=user)
		d = {}
		d['team']=team
		d['stud']=stud
		check = Request.objects.filter(fk_team=team,fk_student=stud)
		if not check:
			newR = Request.objects.create(fk_team=team,fk_student=stud)
			return render(request,'team/requestSubmit.html',d)
		return render(request,'team/alreadyRequested.html',d)
	if request.method == 'GET':
		return allTeams(request)

@login_required
def userDetails(request,username="noone"):
	try:
		user = User.objects.get(username=username)
	except User.DoesNotExist:
		return render(request,'user/noone.html',{'fakename':username})
	stud = Student.objects.get(user=user)
	return render(request,'user/detail.html',{'stud':stud})
	
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
		d['myTeam']=newTeam
		return render(request,'team/createSuccess.html',d)
