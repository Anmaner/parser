FROM php:8.0-cli

RUN apt-get update && apt-get install -y libmcrypt-dev mariadb-client wget unzip \
    && docker-php-ext-install pdo_mysql pcntl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet

WORKDIR /app