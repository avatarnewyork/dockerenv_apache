#/bin/bash

yum -y install --disablerepo=webtatic \
    postfix \
    cyrus-sasl \
    cyrus-sasl-plain \
    mailx

