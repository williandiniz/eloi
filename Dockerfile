FROM php:8.1-apache

ENV BUILD_ENV=${BUILD_ENV:-dev}

RUN apt update -y &&\
    apt install nano -y &&\
    apt-get install libldb-dev libldap2-dev  -y

RUN apt install curl -y

WORKDIR /var/www/html

COPY .apache/. /etc/apache2/

RUN chmod -R 777 /var/www/html
RUN a2ensite webapi
RUN a2enmod rewrite
EXPOSE 8080
USER 1001
RUN service apache2 restart
