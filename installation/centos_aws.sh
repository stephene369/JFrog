#!/bin/bash

## install Java 
yum install java-1.8.0-openjdk-devel 

## Settng docket reposotory up 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## Install Docker Engine 
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Start Docker.
sudo systemctl start docker

## Verify that the Docker Engine installation is successful by running the hello-world image.
sudo docker run hello-world
sudo systemctl status docker

## Pulling Image and lunch Jfrog
docker pull docker.bintray.io/jfrog/artifactory-oss

## check if it's download 
docker images 

## Run JFrog Artifactory name as a Docker IMage 
docker rn -it -d -p 8081:8081 --name artifactory docker.bintray.io/jfrog/artifactory-oss

## check if it running : 
docker ps


