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
                sh 'tar cvpzf jenkins_11_`date +%Y-%m-%-d---%H-%M-%S`.tgz . --exclude='./workspace' '
            }
        }
    }
}
