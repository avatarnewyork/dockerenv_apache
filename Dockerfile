FROM centos:centos6
#MAINTAINER Ushio Shugo <ushio.s@gmail.com>

# using epel
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm 
RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
Run yum -y update

ADD ./root/packages.sh /packages.sh
RUN chmod 755 /packages.sh
RUN /packages.sh

# install postfix
ADD ./root/packages_postfix.sh /packages_postfix.sh
RUN chmod 755 /packages_postfix.sh
RUN /packages_postfix.sh

# postfix config
ADD ./root/etc/postfix/main.cf /etc/postfix/main.cf 
ADD ./root/etc/postfix/header_checks /etc/postfix/header_checks

# install php55
ADD ./root/packages_php55.sh /packages_php55.sh
RUN chmod 755 /packages_php55.sh
RUN /packages_php55.sh

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

EXPOSE 80 25

CMD postconf -e "smtp_sasl_password_maps = static:$POSTFIX_USER:$POSTFIX_PWD"; postconf -e "myhostname = $POSTFIX_HOSTNAME"; service postfix start; /bin/docker-umask-wrapper.sh /usr/sbin/httpd -DFOREGROUND
