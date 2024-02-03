!#bin/bash 

## Update PAckages 
sudo apt update

## install maven
sudo apt install maven -y

## Check version 
mvn --version

sudo apt install openjdk-8-jdk -y

echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export M2_HOME=/opt/apache-maven-3.9.6
export MAVEN_HOME=/opt/apache-maven-3.9.6
export PATH=${M2_HOME}/bin:${PATH}' | sudo tee /etc/profile.d/maven.sh

## Make the file executable : 
sudo chmod +x /etc/profile.d/maven.sh

## Aply environment variables 
source /etc/profile.d/maven.sh

