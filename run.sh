#!/bin/bash

set -e

# Do somethings need
# Such as: python manage.py migrate

# start website
exec /usr/bin/supervisord
