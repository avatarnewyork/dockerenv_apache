#/bin/bash

yum -y install --skip-broken \
    postfix \
    cyrus-sasl \
    cyrus-sasl-plain \
    mailx

