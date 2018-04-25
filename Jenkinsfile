pipeline {
   agent {label 'jenkins_bu'}
      stages {
          stage('Creating Workspace Folder in Jenkins UI') {
            steps {
                echo 'Execute Grovy Script Code'

                script {
                    def Foldername = Jenkins-Master-BU;          
                    def theString = "<a href='http://server-6:8080/jenkins/job" + Foldername + "/" + BUILD_NUMBER + "/execution/node/server-6/'>Workspace</a>";
                    manager.addShortText(theString, "blue", "white", "0px", "white");
                    manager.createSummary("green.gif").appendText("<h1>" + theString + "</h1>", false, false, false, "blue");
                }
            }
    }
         stage('Create Jenkins Arcive') {
            steps {
             sh '''#!/bin/bash -xe
             cd /root/.jenkins
             tar cpzf jenkins_6_${BUILD_NUMBER}.tgz . --warning=no-file-changed --exclude="./workspace" || ( export ret=$?; [[ $ret -eq 1 ]] || exit "$ret" )
             mv jenkins_6_${BUILD_NUMBER}.tgz $WORKSPACE
                '''
            }
    }
         stage('Upload Backup Arcive To Network Share') {
            steps {
             sh 'pv jenkins_6_${BUILD_NUMBER}.tgz > /media/common/IT/jenkins_8/Server_6/jenkins_6_${BUILD_NUMBER}.tgz'
            }
    }
         stage('Keep Backup Files Only For Latest 7 Days') {
            steps {
             sh 'sshpass -f PW.txt ssh -tt -o StrictHostKeyChecking=no admin@yifileserver "find /share/Common/IT/jenkins_8/Server_6 -mtime +7 -type f | xargs rm -f"'
            }
    }
         stage('Archive Inegrity Check') {
            steps {
             sh '''#!/bin/bash -xe
                   md5sum /media/common/IT/jenkins_8/Server_6/jenkins_6_${BUILD_NUMBER}.tgz > jenkins_6_${BUILD_NUMBER}.tgz.md5
                   md5sum -c jenkins_6_${BUILD_NUMBER}.tgz.md5 
                       if [ "$?" != "0" ]; then
                          echo "SHA1 changed! Security breach? Job Will Be Marked As Failed!!!"
                          exit -1
                       fi
                 ''' 
            }
    }
         stage('Remove Original Archive File From Jenkins $HOME') {
            steps {
                  sh 'rm -f /root/.jenkins/workspace/Jenkins-Master-BU/jenkins_6_*'
            }
     }
}      
         post {
            always {
               script {
                  if (currentBuild.result == null) {
                     currentBuild.result = 'SUCCESS' 
                  }
               }
               step([$class: 'Mailer',
                     notifyEveryUnstableBuild: true,
                     recipients: "igor.rabkin@xiaoyi.com",
                     sendToIndividuals: true])
            }
         } 
}
