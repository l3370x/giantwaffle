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

def startPage(request):
	if request.user.is_authenticated():
		return studentHome(request)
	return login(request)

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

@login_required
def studentHome(request):
	try:
		theStudent = Student.objects.get(user = request.user.id)
	except Student.DoesNotExist:
		return redirect('/', {})
	myClasses = theStudent.classes.all()
	return render(request, 'student/studentHome.html', {'theStudent':theStudent, 'myClasses':myClasses})

@login_required
def student2Home(request, studentUser):
	theStudent = Student.objects.get(user = studentUser.id)
	return redirect('/student', {'theStudent':theStudent})