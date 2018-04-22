pipeline {
   agent {label 'jenkins_bu'}
      stages {
         stage('Create Jenkins Arcive') {
             sh '/root/.jenkins/workspace/Jenkins-Master-BU/create_tar_archive.sh'
    }
         stage('Add BUILD_NUMBER Suffix') {
            sh 'mv jenkins_6.tgz jenkins_6_${BUILD_NUMBER}.tgz'
    }
         stage('Upload Backup Arcive To Network Share') {
            sh 'pv jenkins_6_${BUILD_NUMBER}.tgz > /media/common/IT/jenkins_8/Server_6/jenkins_6_${BUILD_NUMBER}.tgz'
    }
         stage('Keep Backup Files Only For Latest 7 Days') {
            sh 'sshpass -f PW.txt ssh -tt -o StrictHostKeyChecking=no admin@yifileserver "find /share/Common/IT/jenkins_8/Server_6 -mtime +7 -type f | xargs rm -f"'
    }
         stage('Archive Inegrity Check') {
            catchError {sh '/root/.jenkins/workspace/Jenkins-Master-BU/md5-check.sh' }
            step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'igor.rabkin@xiaoyi.com', sendToIndividuals: true])
    }
         stage('Remove Original Archive File From Jenkins $HOME') {
          try {
            sh 'rm -f /root/.jenkins/workspace/Jenkins-Master-BU/jenkins_6_*'
                currentBuild.result = 'SUCCESS'
                   } catch (any) {
                currentBuild.result = 'FAILURE'
                   throw any //rethrow exception to prevent the build from proceeding
          } finally {
                 step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'igor.rabkin@xiaoyi.com', sendToIndividuals: true])
          }
     }
  }
}
