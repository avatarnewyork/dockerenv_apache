#/bin/bash

yum -y install --disablerepo=webtatic \
    postfix \
    cyrus-sasl \
    cyrus-sasl-plain \
    mailx

yum clean all

mkfifo /var/spool/postfix/public/pickup

