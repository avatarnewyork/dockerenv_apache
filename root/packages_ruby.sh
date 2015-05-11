#!/bin/bash

# install req software
yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel 
yum -y install libyaml-devel libffi-devel openssl-devel make
yum -y install bzip2 autoconf automake libtool bison iconv-devel

# import the gpg key
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

# install rvm
curl -L get.rvm.io | bash -s stable

# setup rvm env
source /etc/profile.d/rvm.sh

# install ruby 2.1.2
rvm install 2.1.2

# use ruby 2.1.2 as default

rvm use 2.1.2 --default
