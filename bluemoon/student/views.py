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
from teacher.models import *
from teacher.views import *
from news.models import *

def startPage(request):
	if request.user.is_authenticated():
		return Home(request)
	return login(request)

def Home(request):
	allNews = News.objects.all()
	return render(request, 'home.html', {'allNews':allNews})

def logout(request):
	django.contrib.auth.logout(request)
	return startPage(request)

def login(request):
	if request.method == 'GET':
		form = LoginForm()
		return render_to_response('auth/login.html', {'form':form},
								  context_instance = RequestContext(request))

	if request.method == 'POST':
		form = LoginForm(request.POST)
		if not form.is_valid():
			return render_to_response('auth/login.html', {'form':form},
								  context_instance = RequestContext(request))

		user = authenticate(username = request.POST['username'],
							password = request.POST['password'])
		if user is None:
			return render_to_response('auth/login.html',
									  {'form':form,
									   'error': 'Invalid username or password'},
									  context_instance = RequestContext(request))
		django.contrib.auth.login(request, user)
		return student2Home(request, user)
	
def create(request):
	d = {}
	if request.method == 'GET':
		form = django.contrib.auth.forms.UserCreationForm()
		return render_to_response('student/create.html', {'form':form},
								  context_instance = RequestContext(request))

	if request.method == 'POST':
		form = django.contrib.auth.forms.UserCreationForm(request.POST)
		if not form.is_valid():
			return render_to_response('student/create.html', {'form':form},
								  context_instance = RequestContext(request))

		try:
			u = User.objects.get(username = request.POST['username'])
			d['error'] = 'Username already taken'
			d['form'] = form
			return render_to_response('student/create.html', d, context_instance = RequestContext(request))
		except User.DoesNotExist:
			pass


		userO = form.save()
		person = Student.objects.create(user = userO, twitchName = "",
											skypeName = "",
											email = "")
		auth_user = authenticate(username=request.POST['username'],password=request.POST['password1'])
		if auth_user is not None:
			django.contrib.auth.login(request, auth_user)
			return Home(request)
		return render_to_response('student/create.html', d, context_instance = RequestContext(request))


@login_required
def student2Home(request, studentUser):
	theStudent = Student.objects.get(user = studentUser.id)
	return redirect('/', {'theStudent':theStudent})
