#!/bin/bash

## install Java 
sudo yum install java-1.8.0-openjdk-devel 

## Settng docket reposotory up 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## Install Docker Engine 
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Start Docker.
sudo systemctl start docker

# Enable 
sudo systemctl enable docker

## Verify that the Docker Engine installation is successful by running the hello-world image.
sudo docker run hello-world
sudo systemctl status docker

## Pulling Image and lunch Jfrog
sudo docker pull docker.bintray.io/jfrog/artifactory-oss

## check if it's download 
sudo docker images 

## Run JFrog Artifactory name as a Docker IMage 
sudo docker run -it -d -p 8081:8081 --name artifactory1 docker.bintray.io/jfrog/artifactory-oss
sudo docker run -it -d -p 8082:8082 --name artifactory2 docker.bintray.io/jfrog/artifactory-oss

## check if it running and Logs
sudo docker ps
sudo docker logs artifactory1
sudo docker logs artifactory2

## To remove conteneurs
sudo docker stop artifactory1
sudo docker rm artifactory1

sudo docker stop artifactory2
sudo docker rm artifactory2



