#/bin/bash

yum -y install \
mlocate \
openssh-server \
openssh-clients \
passwd \
pwgen \
httpd 

# drush requirements
yum -y install \
    wget \
    which \
    tar 
