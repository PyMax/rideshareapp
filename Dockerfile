FROM php:8.1-fpm

WORKDIR /var/www/app
RUN apt-get update && apt-get install -y\
	curl \
	zip \
	unzip \
	libxml2 \
	&& docker-php-ext-install pdo pdo_mysql mysqli

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . /var/www/app
RUN composer install --no-interaction