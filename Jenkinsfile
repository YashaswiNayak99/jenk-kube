pipeline {
   agent any
   environment {
       registry = "magalixcorp/k8scicd"
       GOCACHE = "/tmp"
   }
   stages {
       stage('Build') {
           steps {
               sh 'docker build -t yashdock90/pytestimg .'
           }
       }
       stage('Publish') {
           environment {
               registryCredential = 'dockerhub-cred'
           }
           steps{
               script {
                   def appimage = docker.build registry + ":$BUILD_NUMBER"
                   docker.withRegistry( '', registryCredential ) {
                       appimage.push()
                       appimage.push('latest')
                   }
               }
           }
       }
       stage ('Deploy') {
           steps {
               script{
                   def image_id = registry + ":$BUILD_NUMBER"
                   sh "ansible-playbook  plays/deploy.yml --extra-vars \"image_id=${image_id}\""
               }
           }
       }
   }
}