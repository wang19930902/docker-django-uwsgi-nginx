FROM ubuntu:latest

RUN (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git python python-dev python-setuptools nginx sqlite3 supervisor)
RUN (easy_install pip &&\
  pip install uwsgi)

ADD . /opt/django/

RUN (echo "daemon off;" >> /etc/nginx/nginx.conf &&\
  rm /etc/nginx/sites-enabled/default &&\
  ln -s /opt/django/django.conf /etc/nginx/sites-enabled/ &&\
  ln -s /opt/django/supervisord.conf /etc/supervisor/conf.d/)




VOLUME ["/opt/django/app"]
EXPOSE 80
CMD ["/opt/django/app/run.sh"]
