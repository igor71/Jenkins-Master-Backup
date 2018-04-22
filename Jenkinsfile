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
         
  }
}
