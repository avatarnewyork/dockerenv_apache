FROM centos:centos6
#MAINTAINER Ushio Shugo <ushio.s@gmail.com>

# using epel
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm 
RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
Run yum -y update

# add composer lock file (prevent github timeouts)
ADD ./root/composer.lock /.composer/composer.lock

ADD ./root/packages.sh /packages.sh
RUN chmod 755 /packages.sh
RUN /packages.sh

# set time to EST5EDT
RUN ln -sf /usr/share/zoneinfo/EST5EDT /etc/localtime

# install postfix
ADD ./root/packages_postfix.sh /packages_postfix.sh
RUN chmod 755 /packages_postfix.sh
RUN /packages_postfix.sh

# postfix config
ADD ./root/etc/postfix/main.cf /etc/postfix/main.cf 
ADD ./root/etc/postfix/header_checks /etc/postfix/header_checks

# install php56
ADD ./root/packages_php56.sh /packages_php56.sh
RUN chmod 755 /packages_php56.sh
RUN /packages_php56.sh

# install nodejs packages
ADD ./root/packages_nodejs.sh /nodejs.sh
RUN chmod 755 /nodejs.sh
RUN /nodejs.sh

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Add Configs
ADD ./root/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./root/etc/php.ini /etc/php.ini
ADD ./root/etc/httpd/robots.txt /etc/httpd/robots.txt

# set default umask to 002
ADD ./root/etc/profile /etc/profile
ADD ./root/docker-umask-wrapper.sh /bin/docker-umask-wrapper.sh

RUN chmod u+x /bin/docker-umask-wrapper.sh

RUN chmod 755 /*.sh
RUN chmod 777 /var/lib/php/session

# Add php user
RUN usermod -g users apache

# Ensure composer is in our path
ENV COMPOSER_HOME /
ENV PATH /.composer/vendor/bin:$PATH

EXPOSE 80

CMD postconf -e "test = test"; postconf -e "smtp_sasl_password_maps = static:$POSTFIX_USER:$POSTFIX_PWD"; postconf -e "myhostname = $POSTFIX_HOSTNAME"; service postfix start; echo -e "\nxdebug.remote_host=$XDEBUG_CLIENT_IP" >> /etc/php.ini; /bin/docker-umask-wrapper.sh /usr/sbin/httpd -DFOREGROUND
