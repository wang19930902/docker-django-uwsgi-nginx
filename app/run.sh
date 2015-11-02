#!/bin/bash

set -e

pip install -r /opt/django/app/requirements.txt

MODULE=${MODULE:-website}

sed -i "s#module=website.wsgi:application#module=${MODULE}.wsgi:application#g" /opt/django/uwsgi.ini

if [ ! -f "/opt/django/app/manage.py" ]
then
  echo "creating basic django project (module: ${MODULE})"
  django-admin.py startproject ${MODULE} /opt/django/app/
fi

exec /usr/bin/supervisord
