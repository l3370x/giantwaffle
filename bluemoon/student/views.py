from django.shortcuts import render

from student.models import *

def Home(request):

	return render(request,'home.html',{'username':request.user.username})
