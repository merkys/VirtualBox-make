#!/bin/bash

locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales

sudo apt-get install -y subversion

mkdir src
cd src

svn co svn://www.crystallography.net/cod-tools --depth empty
cd cod-tools
svn up --depth infinity trunk
cd trunk

source dependencies/Ubuntu-12.04/install.sh
make tests --ignore-errors
