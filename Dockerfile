FROM php:8.1-fpm

RUN apt-get update && apt-get install -y\
	curl \
	zip \
	unzip;

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . .
RUN composer install --no-interaction