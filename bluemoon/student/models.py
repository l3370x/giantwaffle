from django.db import models
from django.contrib.auth.models import User
from django import forms
from django.forms.models import ModelForm
from django.views.generic.edit import UpdateView


class Student(models.Model):
	def __unicode__(self):
		return self.user.username
	def name(self):
		return self.user.username
	user = models.ForeignKey(User, editable=False)
	email = models.EmailField(blank=True)
	nick = models.CharField(max_length=5, blank=True)
	

class StudentForm(forms.ModelForm):
	class Meta:
		model = Student

class LoginForm(forms.Form):
	username = forms.CharField(max_length=100)
	password = forms.CharField(widget=forms.PasswordInput(render_value=False), max_length=100)


class StudentChangePasswordForm(forms.Form):
	password = forms.CharField(widget=forms.PasswordInput(render_value=True), max_length=100)