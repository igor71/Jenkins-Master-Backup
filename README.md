# Jenkins-Master-Backup
Jenkins Master Backup PipeLine Job can be used in two different ways

1-st -- >> Jenkins Pipeline (example in Pipline Script file)

The code will be stored in Jenkins master itself -->> Configure -->> Pipline Script

The pipeline job will run on Jenkins master istance under workspace/<Job-Name> folder

In order to make job success need to create folder with exact Job Name at workspace/ prior to running the job

add put inside follwing file from this Repo: PW.txt


2-nd -->> Jenkins Declarative Pipeline

The Code will be stored and managed in github Repo (web or local) -- >> Pipline script from SCM

All code and files will be cloned into workspace -->> JobName directory from github Repo

Note, files md5-check.sh & create_tar_archive.sh posted as example, all code running within Jenkins file or within Pipline script on Jenkins.
############################Backap Restoration Procedure####################################

1. ssh to jenkins docker

2. cd /root/.jenkins or /var/lib/jenkins

3. ls | grep -v workspace | xargs rm -rf

4. pv /media/common/IT/jenkins_8/Server_6/jenkins_6_13.tgz > ./jenkins_6_13.tgz

5. pv jenkins_6_13.tgz | tar xhpzf - -C $PWD

6. http://<jenkins-ip-adress>:8080/jenkins/restart or http://<jenkins-ip-adress>:8080/restart

#############################################################################################
