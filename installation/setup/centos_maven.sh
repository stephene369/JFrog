#!/bin/bash

## Install git
sudo yum install git wget -y 

## Update system 
sudo yum update 

## Install java 
sudo yum install java-1.8.0-openjdk-devel

##   Download Apache maven and decompress
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar zxvf apache-maven-3.9.6-bin.tar.gz

## Configuration variable environement
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export M2_HOME=/opt/apache-maven-3.9.6
export MAVEN_HOME=/opt/apache-maven-3.9.6
export PATH=${M2_HOME}/bin:${PATH}' | sudo tee /etc/profile.d/maven.sh

## Make the file executable : 
sudo chmod +x /etc/profile.d/maven.sh

## Aply environment variables 
source /etc/profile.d/maven.sh

## Check version 
mvn -version

## To compile et project l go in the current directory and  :
sudo /opt/apache-maven-3.9.6/bin/mvn compile




