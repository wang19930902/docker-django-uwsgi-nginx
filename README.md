django-uwsgi-nginx
==================

docker image for django (uwsgi) & nginx
based off of debian:jessie

`docker build -t mywebapp .`

Example usage:
`docker run -p 80 -d -e MODULE=myapp mywebapp`

You can mount the application volume to run a specific application.  The default volume inside in the container is `/opt/django/app`.  Here is an example:
`docker run -p 80 -d -e MODULE=myapp -v /home/mbentley/myapp:/opt/django/app mywebapp`

By default, this just runs a default 'welcome to django' project.
