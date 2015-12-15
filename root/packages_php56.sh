#/bin/bash

# ImageMagick
yum -y install \
    gcc \
    ImageMagick \
    ImageMagick-devel


yum -y install \
    php56w \
    php56w-common \
    php56w-cli \
    php56w-ldap \
    php56w-mbstring \
    php56w-pdo \
    php56w-soap \
    php56w-bcmath \
    php56w-intl \
    php56w-pear \
    php56w-mcrypt \
    php56w-opcache \
    php56w-mysql \
    php56w-devel \
    php56w-gd \
    php56w-pecl-memcache \
    php56w-pecl-memcached \
    php56w-pecl-imagick \
    php56w-pspell \
    php56w-snmp \
    php56w-xmlrpc \
    php56w-xml \
    php56w-process \
    php56w-pecl-xdebug \
    php56w-devel


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
