pipeline {
   agent {label 'jenkins_bu'}
      stages {
         stage('Make Scripts Executable') {
            steps {
             sh ' chmod u+x /root/.jenkins/workspace/Jenkins-Master-BU/create_tar_archive.sh'
             sh ' chmod u+x /root/.jenkins/workspace/Jenkins-Master-BU/md5-check.sh'
            }
    }
         stage('Create Jenkins Arcive') {
            steps {
             sh '/root/.jenkins/workspace/Jenkins-Master-BU/create_tar_archive.sh'
            }
    }
         stage('Add BUILD_NUMBER Suffix') {
            steps {
             sh 'mv jenkins_6.tgz jenkins_6_${BUILD_NUMBER}.tgz'
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
             sh '/root/.jenkins/workspace/Jenkins-Master-BU/md5-check.sh' }
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
