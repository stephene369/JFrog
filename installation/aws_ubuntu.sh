#!/bin/bash


##Change Host Name to Artifactory
sudo hostnamectl set-hostname Artifactory

##Update Ubuntu OS
sudo apt update


##Add JFrog Artifactory APT repository
echo "deb https://releases.jfrog.io/artifactory/artifactory-debs xenial main" | sudo tee -a /etc/apt/sources.list.d/artifactory.list


##Import repository GPG key by running the following commands
curl -fsSL  https://releases.jfrog.io/artifactory/api/gpg/key/public|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/artifactory.gpg


## Update the package
sudo apt update

## Install Artifactory
sudo apt install jfrog-artifactory-oss -y


## Start Artifactory 
sudo systemctl start artifactory.service

##3 Create symbolic link
sudo systemctl enable artifactory.service


## Check whether Artifactory is running?
sudo systemctl status artifactory.service

## You can also check the logs
sudo tail -f /var/opt/jfrog/artifactory/log/artifactory-service.log

## Check if service is running locally on 8081 port
curl localhost:8081


