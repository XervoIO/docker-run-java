#!/bin/bash
set -e
set -x

TEMP_DIR=/tmp
TMPDIR=/tmp
TMP_DIR=/tmp

add-apt-repository ppa:openjdk-r/ppa
apt-get update

apt-get install -y --force-yes wget openjdk-7-jdk openjdk-8-jdk

TOMCAT_7=7.0.61
TOMCAT_8=8.0.21

mkdir -p /opt/tomcat

cd /opt/tomcat
wget https://archive.apache.org/dist/tomcat/tomcat-7/v$TOMCAT_7/bin/apache-tomcat-$TOMCAT_7.tar.gz
tar -xvzf apache-tomcat-$TOMCAT_7.tar.gz
rm apache-tomcat-$TOMCAT_7.tar.gz
mv apache-tomcat* $TOMCAT_7

wget https://archive.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_8/bin/apache-tomcat-$TOMCAT_8.tar.gz
tar -xvzf apache-tomcat-$TOMCAT_8.tar.gz
rm apache-tomcat-$TOMCAT_8.tar.gz
mv apache-tomcat* $TOMCAT_8

# Set default to Java 8.
echo 2 | update-alternatives --config java

# Give the mop user read access.
chmod -R a+r /opt/tomcat
