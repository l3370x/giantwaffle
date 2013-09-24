from student.models import Student
from django.contrib import admin

class StudentAdmin(admin.ModelAdmin):
  fieldsets = [
	('User Info', {'fields': ['user']}),
	('Twitch name', {'fields': ['twitchName']}),
	('Skype name', {'fields': ['skypeName']}),
	('email', {'fields': ['email']}),
  ]
  readonly_fields = ('user',)

admin.site.register(Student, StudentAdmin)

