django-uwsgi-nginx
==================

docker example for django (uwsgi) & nginx
based off of ubuntu:latest

remove example project file
* manage.py
* mywebapp/
* mywebproject/
* requirements.txt

add your project to ```./```

`docker build -t your-project-docker-name .`

Example usage:

`docker run -p 80 -d -e MODULE=your-project-name your-project-docker-name`

You can mount the application volume to run a specific application.  The default volume inside in the container is `/opt/django/`.  Here is an example:
`docker run -p 80 -d -e MODULE=your-project-name -v /home/mbentley/your-project-dir:/opt/django/ your-project-docker-name`

By default, this just runs a default 'welcome to django' project.
