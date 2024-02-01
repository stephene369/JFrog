#Default values
export ARTIFACTORY_HOME=/opt/jfrog/artifactory
export ARTIFACTORY_USER=artifactory
export JAVA_HOME=/usr/bin

export START_LOCAL_REPLICATOR=true

export START_LOCAL_MDS=true

export TOMCAT_HOME=/opt/jfrog/artifactory/tomcat
export ARTIFACTORY_PID=$ARTIFACTORY_HOME/run/artifactory.pid

export JAVA_OPTIONS="-server -Xms512m -Xmx2g -Xss256k -XX:+UseG1GC -XX:OnOutOfMemoryError=\"kill -9 %>
export JAVA_OPTIONS="$JAVA_OPTIONS -Djruby.compile.invokedynamic=false -Dfile.encoding=UTF8 -Dartdist>
# Timeout waiting for artifactory to start
# START_TMO=60
