FROM php:8.2-apache AS builder

WORKDIR /var/www

RUN apt-get update \
    && apt-get install -y dos2unix

COPY entrypoint.sh /

RUN dos2unix /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY www/ .

RUN docker-php-ext-install mysqli

ENTRYPOINT ["/entrypoint.sh"]