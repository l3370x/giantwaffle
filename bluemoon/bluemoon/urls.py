from django.conf.urls import patterns, include, url

from django.contrib import admin

admin.autodiscover()


urlpatterns = patterns('',
    url(r'^student/', include('student.urls')),
    url(r'^home/', include('student.urls')),
	url(r'^teacher/', include('teacher.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
	url(r'^', include('student.urls')),
)
