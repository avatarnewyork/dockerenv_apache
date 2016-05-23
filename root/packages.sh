#/bin/bash

yum -y install \
    git \
    mlocate \
    openssh-server \
    openssh-clients \
    passwd \
    pwgen \
    httpd \
    unzip \
    gcc \
    make \
    mysql55w

yum clean all

# drush requirements
yum -y install \
    wget \
    which \
    tar 

yum clean all

