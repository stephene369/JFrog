#!/bin/bash
# Upgrade to Java-8
sudo yum install java-1.8.0
sudo yum remove java-1.7.0-openjdk

## Setting up JAVA_HOMO 
JAVA_HOME=/usr/lib/jvm/



# Installing Artifactory
wget https://bintray.com/jfrog/artifactory-rpms/rpm -O bintray-jfrog-artifactory-rpms.repo
sudo mv bintray-jfrog-artifactory-rpms.repo /etc/yum.repos.d/
sudo yum install jfrog-artifactory-oss

# Setup Service
sudo chkconfig artifactory on
sudo service artifactory start
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8000
