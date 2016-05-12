FROM ubuntu:latest

RUN (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git python python-dev python-setuptools nginx sqlite3 supervisor)
RUN (easy_install pip &&\
  pip install uwsgi)

ADD . /opt/django/

RUN (echo "daemon off;" >> /etc/nginx/nginx.conf &&\
  rm /etc/nginx/sites-enabled/default &&\
  ln -s /opt/django/conf/django.conf /etc/nginx/sites-enabled/ &&\
  ln -s /opt/django/conf/supervisord.conf /etc/supervisor/conf.d/ &&\
  chmod +x /opt/django/run.sh)

RUN pip install -r /opt/django/requirements.txt



VOLUME ["/opt/django/"]
EXPOSE 80
CMD ["/opt/django/run.sh"]
