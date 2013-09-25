from django.db import models
from django.contrib.auth.models import User
from django import forms


class Student(models.Model):
	def __unicode__(self):
		return self.user.username
	def name(self):
		return self.user.username
	user = models.ForeignKey(User, editable=False)
	twitchName = models.CharField(max_length=50, blank=True)
	skypeName = models.CharField(max_length=50, blank=True)
	myTeam = models.ForeignKey('Team',editable=False, blank=True, null=True,on_delete=models.SET_NULL)
	email = models.EmailField(blank=True)
	

class StudentForm(forms.ModelForm):
	class Meta:
		model = Student

class LoginForm(forms.Form):
	username = forms.CharField(max_length=100)
	password = forms.CharField(widget=forms.PasswordInput(render_value=False), max_length=100)

class CreateUserForm(forms.Form):
	username = forms.CharField(max_length=100)
	twitchName = forms.CharField(max_length=50,required=False)
	skypeName = forms.CharField(max_length=50,required=False)
	email = forms.EmailField(max_length=100)
	password = forms.CharField(widget=forms.PasswordInput(render_value=False), max_length=100)
	confirm = forms.CharField(widget=forms.PasswordInput(render_value=False), max_length=100)
	


class StudentChangePasswordForm(forms.Form):
	password = forms.CharField(widget=forms.PasswordInput(render_value=True), max_length=100)

class Team(models.Model):
	def __unicode__(self):
		return self.name
	def name(self):
		return self.name
	teamLeader = models.ForeignKey(Student, editable=False)
	name = models.CharField(max_length=50)
	captain = models.CharField(max_length=50,blank = True)
	helm = models.CharField(max_length=50,blank = True)
	weapons = models.CharField(max_length=50,blank = True)
	science = models.CharField(max_length=50,blank = True)
	engineering = models.CharField(max_length=50,blank = True)
	comms = models.CharField(max_length=50,blank = True)

class TeamForm(forms.ModelForm):
	class Meta:
		model = Team

class CreateTeamForm(forms.Form):
   teamName = forms.CharField(max_length=50)
