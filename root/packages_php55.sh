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
    php55w-pecl-memcached \
    php55w-pecl-imagick \
    php55w-pspell \
    php55w-snmp \
    php55w-xmlrpc \
    php55w-xml \
    php55w-process \
    php55w-pecl-xdebug \
    php55w-devel

# ImageMagick
yum -y install \
    gcc \
    ImageMagick \
    ImageMagick-devel

/usr/bin/pecl install imagick

echo "extension=imagick.so" > /etc/php.d/imagick.ini


# Solr
yum -y install \
    curl-devel \
    libxml2-devel

yes '' | pecl install -f solr

echo "extension=solr.so" > /etc/php.d/solr.ini


# ssh / sftp
yum -y install libssh2-devel
printf "\n" | pecl install -f ssh2
echo "extension=ssh2.so" > /etc/php.d/ssh2.ini

# Drush
wget -O /usr/bin/drush http://files.drush.org/drush.phar; chmod 755 /usr/bin/drush

# Xdebug

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
