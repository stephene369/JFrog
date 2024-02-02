## install JAVA 
sudo dnf install java-11-amazon-corretto-devel
sudo export JAVA_HOME=/usr/lib/jvm/java-11-openjdk


### 
sudo rpm --import https://releases.jfrog.io/artifactory/api/gpg/key/public

sudo vim /etc/yum.repos.d/jfrog.repo 

"""

[artifactory]
name=artifactory 
baseurl=https://releases.jfrog.io/artifactory/artifactory-rpms/
enabled=1
gpgcheck=1
gpgkey=https://releases.jfrog.io/artifactory/api/gpg/key/public

"""

sudo yum update
sudo yum install jfrog-artifactory-oss


## See all the varaible.
source /etc/environment


