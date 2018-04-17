#!groovy

pipeline {
  agent {label 'jenkins'}
    stages {
        stage('Change directory to Jenkins Home') {
            steps {
                sh 'cd /var/lib/jenkins'
            }
        }
        stage('Create arcive and add timestamp suffix') {
            steps {
                 sh 'tar cvpzf jenkins_11_`date +%Y-%m-%-d---%H-%M-%S`.tgz . --exclude='./workspace'' 
            }
        }
        stage('Copy backup arcive to the network share') {
            steps {
                 sh 'sshpass -f PW.txt scp -o StrictHostKeyChecking=no ~/jenkins_11_*.tgz admin@yifileserver:/share/Common/IT/jenkins_8/Server_11'
            }
        }
        stage('Keep backup with latest 7 days') {
            steps {
                 sh 'sshpass -f PW.txt ssh -tt -o StrictHostKeyChecking=no admin@yifileserver "find /share/Common/IT/jenkins_8/Server_11 -mtime +7 -type f | xargs rm -f"'
            }
        }
        stage('Remove the original archive file') {
            steps {
                 sh 'find . -type f -name "jenkins_11_*.tgz" -exec rm -f {} \;'
            }
        }
    }
}
