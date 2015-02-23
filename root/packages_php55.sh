#/bin/bash

yum -y install \
    php55w \
    php55w-common \
    php55w-cli \
    php55w-ldap \
    php55w-mbstring \
    php55w-pdo \
    php55w-soap \
    php55w-bcmath \
    php55w-intl \
    php55w-pear \
    php55w-mcrypt \
    php55w-opcache \
    php55w-mysql \
    php55w-devel \
    php55w-gd \
    php55w-pecl-memcache \
    php55w-pecl-imagick \
    php55w-pspell \
    php55w-snmp \
    php55w-xmlrpc \
    php55w-xml \
    php55w-process \
    php55w-pecl-xdebug

# Drush
pear channel-discover pear.drush.org
pear install drush/drush
pear install --alldeps Console_Table

# Xdebug
pecl install xdebug

# Composer
cd /usr/bin; php -r "readfile('https://getcomposer.org/installer');" | php

# PHPUnit
composer.phar global require "phpunit/phpunit=4.5.*"

# Selenium
composer.phar global require "phpunit/phpunit-selenium": ">=1.2"