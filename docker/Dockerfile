FROM ubuntu:22.04

ARG UID=1001
ENV TZ=Europe/Madrid

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN adduser -u $UID --disabled-password --gecos '' devuser

RUN apt-get update -y \
    && apt-get install -y git acl openssl openssh-client wget zip curl gcc make perl vim htop \ 
    libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev \ 
    apache2 php-mysql php-curl php-tidy php-gd php-cli php-pear php-pgsql php-dev libapache2-mod-php \
    php-mbstring apache2-dev

RUN apt-get upgrade -y

RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load 

RUN mkdir -p /var/www/html/php
RUN mkdir -p /home/devuser/config
RUN mkdir -p /home/devuser/temp

RUN ln -s /home/devuser/config/2023-php.conf  /etc/apache2/sites-enabled/2023-php.conf

# Install and update composer
RUN curl https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

EXPOSE 80

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]