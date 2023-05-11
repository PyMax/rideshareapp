FROM php:8.1-fpm

WORKDIR /var/www/app
RUN apt-get update && apt-get install -y\
	curl \
	zip \
	unzip;

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . /var/www/app
RUN composer install --no-interaction