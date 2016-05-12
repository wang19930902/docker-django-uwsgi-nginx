django-uwsgi-nginx
==================

Docker example for django (uwsgi) & nginx
Based off of ubuntu:latest

Remove example project file
* manage.py
* mywebproject/
* requirements.txt

Add your project to ```./```

Then run command to change ```uwsgi``` setting:

`sed -i "s#module=mywebproject.wsgi:application#module=YOUR_MODULE_NAME.wsgi:application#g"  conf/uwsgi.ini`

Build docker image:

`docker build -t your-project-docker-name .`

Example usage:

`docker run -p 80 -d your-project-docker-name`

You can mount the application volume to run a specific application.  The default volume inside in the container is `/opt/django/`.  Here is an example:
`docker run -p 80 -d -v /home/mbentley/your-project-dir:/opt/django/ your-project-docker-name`

By default, this just runs a default 'welcome to django' project.
