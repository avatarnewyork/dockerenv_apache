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
    php55w-pecl-xdebug \
    php55w-devel

# ssh / sftp
yum -y install libssh2-devel

printf "\n" | pecl install -f ssh2

echo "extension=ssh2.so" > /etc/php.d/ssh2.ini

# Drush
pear channel-discover pear.drush.org
pear install drush/drush
pear install --alldeps Console_Table

# Xdebug
pecl install xdebug

# OAuth
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin; pecl install oauth
echo 'extension=oauth.so' > /etc/php.d/oauth.ini

# Composer
cd /usr/bin; php -r "readfile('https://getcomposer.org/installer');" | php

# PHPUnit
COMPOSER_HOME=/.composer composer.phar global require "phpunit/phpunit=4.5.*"

# Selenium
COMPOSER_HOME=/.composer composer.phar global require "phpunit/phpunit-selenium": ">=1.2"

# wp-cli - wordpress cli
COMPOSER_HOME=/.composer composer.phar global require "wp-cli/wp-cli"
