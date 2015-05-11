FROM centos:centos6
#MAINTAINER Ushio Shugo <ushio.s@gmail.com>

# using epel
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
Run yum -y update

ADD ./root/packages.sh /packages.sh
RUN chmod 755 /packages.sh
RUN /packages.sh

# install php53
ADD ./root/packages_php.sh /packages_php.sh
RUN chmod 755 /packages_php.sh
RUN /packages_php.sh

# install nodejs packages
ADD ./root/packages_nodejs.sh /nodejs.sh
RUN chmod 755 /nodejs.sh
RUN /nodejs.sh

# set time to EST5EDT
RUN ln -sf /usr/share/zoneinfo/EST5EDT /etc/localtime

# install postfix
ADD ./root/packages_postfix.sh /packages_postfix.sh
RUN chmod 755 /packages_postfix.sh
RUN /packages_postfix.sh

# postfix config
ADD ./root/etc/postfix/main.cf /etc/postfix/main.cf 
ADD ./root/etc/postfix/header_checks /etc/postfix/header_checks
RUN postconf -e 'relayhost = [smtp.mailgun.org]:587'
RUN postconf -e 'smtp_sasl_auth_enable = yes'

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Add Configs
ADD ./root/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./root/etc/php.ini /etc/php.ini
ADD ./root/etc/php.d/apc.ini /etc/php.d/apc.ini
Add ./root/etc/httpd/robots.txt /etc/httpd/robots.txt

# set default umask to 002
RUN echo "umask 002"$'\n' >> /etc/sysconfig/httpd
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
