FROM centos:centos5
#MAINTAINER Ushio Shugo <ushio.s@gmail.com>

# using epel
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
Run yum -y update

ADD ./root/packages.sh /packages.sh
RUN chmod 755 /packages.sh
RUN /packages.sh

# install php51
ADD ./root/packages_php.sh /packages_php.sh
RUN chmod 755 /packages_php.sh
RUN /packages_php.sh

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Add Configs
ADD ./root/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./root/etc/php.ini /etc/php.ini
ADD ./root/etc/httpd/robots.txt /etc/httpd/robots.txt
RUN mkdir /etc/httpd/vhosts.d

# ZendOptimizer
Add ./root/ZendOptimizer.so /usr/lib64/php/modules/ZendOptimizer.so

RUN chmod 755 /*.sh
RUN chmod 777 /var/lib/php/session

EXPOSE 80

CMD /usr/sbin/httpd -DFOREGROUND
