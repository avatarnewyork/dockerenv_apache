#!/bin/bash

yum -y install \
    php \
    php-common \
    php-cli \
    php-ldap \
    php-mbstring \
    php-pdo \
    php-soap \
    php-bcmath \
    php-intl \
    php-pear \
    php-pecl-apc \
    php-mcrypt \
    php-mysql \
    php-devel \
    php-gd \
    php-pecl-memcache \
    php-pecl-memcached \
    php-pecl-imagick \
    php-pspell \
    php-snmp \
    php-xmlrpc \
    php-xml \
    pcre-devel \
    php-pecl-oauth \
    php-process \
    php-pecl-xdebug 


# ssh / sftp
yum -y install libssh2-devel

printf "\n" | pecl install -f ssh2

echo "extension=ssh2.so" > /etc/php.d/ssh2.ini

yum -y install \
    curl-devel \
    libxml2-devel

yes '' | pecl install -f solr

echo "extension=solr.so" > /etc/php.d/solr.ini

# Drush
wget -O /usr/bin/drush http://files.drush.org/drush.phar; chmod 755 /usr/bin/drush

# Composer
cd /usr/bin; /usr/bin/php -dzend_extension=xdebug.so -r "readfile('https://getcomposer.org/installer');" | php

# PHPUnit
COMPOSER_HOME=/.composer /usr/bin/php -dzend_extension=xdebug.so composer.phar global require --prefer-source "phpunit/phpunit=4.5.*"

# Selenium
COMPOSER_HOME=/.composer /usr/bin/php -dzend_extension=xdebug.so composer.phar global require --prefer-source "phpunit/phpunit-selenium": ">=1.2"

# wp-cli - wordpress cli
COMPOSER_HOME=/.composer /usr/bin/php -dzend_extension=xdebug.so composer.phar global require --prefer-source "wp-cli/wp-cli=0.21.1"
