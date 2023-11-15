FROM devilbox/php-fpm-8.0:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
        zlib1g-dev \
		#libicu52 \
        libicu-dev \
		libpng-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt4 \
		libmcrypt-dev \
		libtool \
		libwebp-dev \
		libzip-dev \
	&& docker-php-ext-install \
		intl \
		zip \
		exif \
		gd \
		pdo_mysql \
        mysqli \
		#mcrypt \
	&& docker-php-ext-enable \
		opcache \
		pdo_mysql \
        mysqli \
	&& apt-get purge -y \
		zlib1g-dev \
		libicu-dev \
		libpng-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
	&& apt-get clean all

RUN docker-php-ext-install sysvsem
RUN docker-php-ext-enable sysvsem

RUN docker-php-ext-install pcntl
RUN docker-php-ext-enable pcntl

RUN docker-php-ext-install shmop
RUN docker-php-ext-enable shmop

RUN apt-get update && apt-get install -y libpq-dev
#RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pgsql
#RUN docker-php-ext-enable
#RUN ln -s /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
#RUN sed -i -e 's/;extension=pgsql/extension=pgsql/' /usr/local/etc/php/php.ini
#RUN sed -i -e 's/;extension=pdo_pgsql/extension=pdo_pgsql/' /usr/local/etc/php/php.ini

#RUN docker-php-ext-install pdo pdo_pgsql pgsql
#RUN ln -s /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN apt-get update \
    && apt-get install -y \
        librabbitmq-dev \
        libssh-dev \
    && pecl install amqp \
    && docker-php-ext-enable amqp

RUN mkdir /var/php/
RUN mkdir /var/php/log

EXPOSE 9003

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet

WORKDIR /app