pipeline {
   environment {
     FOO = "foo"
   }

   agent {label 'jenkins'}
   stages {
       stage("first") {
           sh "echo ${FOO}"
       }
   }
}
