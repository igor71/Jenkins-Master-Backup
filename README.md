# Jenkins-Master-Backup
Jenkins Master Backup PipeLine Job can be used in two different ways

1-st -- >> Jenkins Pipeline (example in Pipline Script file)

The code will be stored in Jenkins master itself -->> Configure -->> Pipline Script

The pipeline job will run on Jenkins master istance under workspace/<Job-Name> folder

In order to make job success need to create folder with exact Job Name at workspace/ prior to running the job

add put inside follwing files from this Repo:

PW.txt

create_tar_archive.sh

md5-check.sh

2-nd -->> Jenkins Declarative Pipeline

The Code will be stored and managed in github Repo (web or local) -- >> Pipline script from SCM

All code and files will be cloned into workspace -->> JobName directory from github Repo

