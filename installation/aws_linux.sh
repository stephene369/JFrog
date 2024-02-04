
### Install Docker

#updating amazon linux patches
sudo yum update -y

## installing docker engine
sudo amazon-linux-extras install docker -y

## starting docker service
sudo service docker start

## Adding user ec2-user to docker group
sudo usermod -a -G docker ec2-user

## enabling docker service
sudo chkconfig docker on#Reboot the EC2 instance
docker info

## Download Artifactory Docker image
sudo docker pull docker.bintray.io/jfrog/artifactory-oss:latest

## Display docker images
sudo docker images

## Create Data Directory
## Create data directory on host system to ensure data used on container is persistent.
sudo mkdir -p /jfrog/artifactory
sudo chown -R 1030 /jfrog/

## Start JFrog Artifactory container
sudo docker run --name artifactory -d -p 8081:8081 -p 8082:8082 -v /jfrog/artifactory:/var/opt/jfrog/artifactory \
docker.bintray.io/jfrog/artifactory-oss:latest

## Run artifactory as service
sudo sh -c 'echo "
[Unit]
Description=Setup Systemd script for Artifactory Container
After=network.target
[Service]
Restart=always
ExecStartPre=-/usr/bin/docker kill artifactory
ExecStartPre=-/usr/bin/docker rm artifactory
ExecStart=/usr/bin/docker run --name artifactory -p 8081:8081 -p 8082:8082 \
  -v /jfrog/artifactory:/var/opt/jfrog/artifactory \
  docker.bintray.io/jfrog/artifactory-oss:latest
ExecStop=-/usr/bin/docker kill artifactory
ExecStop=-/usr/bin/docker rm artifactory
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/artifactory.service'

#Reload Systemd
sudo systemctl daemon-reload

#Then start Artifactory container with systemd.
sudo systemctl start artifactory

#Enable it to start at system boot.
sudo systemctl enable artifactory

#Check whether Artifactory Service is running
sudo systemctl status artifactory

## Access Artifactory Web Interface
http://server_ip:8081/
# You should see Artifactory welcome page.





