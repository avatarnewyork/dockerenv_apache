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

# install php55
ADD ./root/packages_php55.sh /packages_php55.sh
RUN chmod 755 /packages_php55.sh
RUN /packages_php55.sh

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Add Configs
ADD ./root/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./root/etc/php.ini /etc/php.ini

RUN chmod 755 /*.sh

# Add php user
RUN useradd -g users php

EXPOSE 80

CMD /usr/sbin/httpd -DFOREGROUND
