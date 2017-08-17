#/bin/bash

# ImageMagick
yum -y install \
    gcc \
    ImageMagick \
    ImageMagick-devel

yum clean all

yum -y install \
    php71w \
    php71w-common \
    php71w-cli \
    php71w-ldap \
    php71w-mbstring \
    php71w-pdo \
    php71w-soap \
    php71w-bcmath \
    php71w-intl \
    php71w-pear \
    php71w-mcrypt \
    php71w-opcache \
    php71w-mysqlnd \
    php71w-devel \
    php71w-gd \
    php71w-pecl-memcache \
    php71w-pecl-memcached \
    php71w-pecl-imagick \
    php71w-phpdbg \
    php71w-pspell \
    php71w-snmp \
    php71w-xmlrpc \
    php71w-xml \
    php71w-process \
    php71w-pecl-xdebug \
    php71w-devel \
    php71w-phpdbg

yum clean all

# Solr - php7
yum -y install \
    curl-devel \
    libxml2-devel

yum clean all

# Solr
yes '' | pecl install -f solr-2.4.0
echo "extension=solr.so" > /etc/php.d/solr.ini

# Stats
yes '' | pecl install -f stats-2.0.3
echo "extension=stats.so" > /etc/php.d/stats.ini


# ssh / sftp - php7
yum -y install libssh2-devel
yum clean all
printf "\n" | pecl install -f ssh2-1.0
echo "extension=ssh2.so" > /etc/php.d/ssh2.ini

# Drush
wget -O /usr/bin/drush http://files.drush.org/drush.phar; chmod 755 /usr/bin/drush

# drupal console - https://drupalconsole.com/
cd /usr/local/bin; curl https://drupalconsole.com/installer -L -o drupal; chmod +x /usr/local/bin/drupal; drupal init --override

# OAuth - php7
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin; pecl install oauth-2.0.2
echo 'extension=oauth.so' > /etc/php.d/oauth.ini

# Composer
cd /usr/bin; /usr/bin/php -r "readfile('https://getcomposer.org/installer');" | php

# PHPUnit
COMPOSER_HOME=/.composer /usr/bin/php composer.phar global require --prefer-source "phpunit/phpunit=4.5.*"

# Selenium
COMPOSER_HOME=/.composer /usr/bin/php composer.phar global require --prefer-source "phpunit/phpunit-selenium": ">=1.2"

# wp-cli - wordpress cli
COMPOSER_HOME=/.composer /usr/bin/php composer.phar global require --prefer-source "wp-cli/wp-cli=0.21.1"
