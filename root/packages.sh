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
    gcc

# drush requirements
yum -y install \
    wget \
    which \
    tar 

