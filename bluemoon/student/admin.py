from student.models import Student
from django.contrib import admin

class StudentAdmin(admin.ModelAdmin):
  fieldsets = [
	('User Info', {'fields': ['user']}),
	('email', {'fields': ['email']}),
	('nick', {'fields': ['nick']}),
  ]
  readonly_fields = ('user',)

admin.site.register(Student, StudentAdmin)