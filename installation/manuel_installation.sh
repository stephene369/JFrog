#!/bin/bash
# Upgrade to Java-8
sudo yum install java-1.8.0-openjdk* -y
sudo yum remove java-1.7.0-openjdk

## Setting up JAVA_HOMO 
JAVA_HOME=/usr/lib/jvm/



# Installing Artifactory
## wget -O artifactory.zip https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-<VERSION>.zip
wget -O artifactory.zip https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
sudo apt-get install unzip
unzip artifactory.zip -d /opt
mv /opt/artifactory-oss-<VERSION> /opt/artifactory


# Setup Service
sudo chkconfig artifactory on
sudo service artifactory start
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8000
