FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
ADD . /var/www/html/
ENTRYPOINT apache2ctl -D FOREGROUND
