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
    mysql55w

# drush requirements
yum -y install \
    wget \
    which \
    tar 

