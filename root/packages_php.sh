#/bin/bash

yum --exclude=php53\* -y install \
    php \
    php-cli \
    php-ldap \
    php-mbstring \
    php-pdo \
    php-soap \
    php-bcmath \
    php-common \
    php-intl \
    php-pear \
    php-mcrypt \
    php-mysql \
    php-devel \
    php-gd \
    php-pecl-memcache \
    php-pspell \
    php-snmp \
    php-xmlrpc \
    php-xml       

# ImageMagick
yum -y install \
    gcc \
    make \
    ImageMagick \
    ImageMagick-devel

/usr/bin/pecl install imagick

echo "extension=imagick.so" > /etc/php.d/imagick.ini

# Solr - not supported in php51
yum -y install \
    curl-devel \
    libxml2-devel

#yes '' | pecl install -f solr
#echo "extension=solr.so" > /etc/php.d/solr.ini

# Drush
pear channel-discover pear.drush.org
pear install drush/drush
pear install --alldeps Console_Table
