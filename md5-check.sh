#! /bin/bash

# Network archive integrity check

md5sum /media/common/IT/jenkins_8/Server_6/jenkins_6_${BUILD_NUMBER}.tgz > jenkins_6_${BUILD_NUMBER}.tgz.md5

md5sum -c jenkins_6_${BUILD_NUMBER}.tgz.md5 

if [ "$?" != "1" ]; then
   echo "SHA1 changed! Security breach? Job Will Be Marked As Failed!!!"
   exit -1
fi
