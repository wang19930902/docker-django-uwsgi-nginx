#!/bin/bash

set -e

pip install -r /opt/django/requirements.txt

MODULE=${MODULE:-mywebproject}

sed -i "s#module=mywebproject.wsgi:application#module=${MODULE}.wsgi:application#g" /opt/django/conf/uwsgi.ini

exec /usr/bin/supervisord
