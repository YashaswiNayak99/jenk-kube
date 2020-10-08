pipeline {
   agent any
   environment {
       registry = "yashdock90/jenks-kube-test"
   }
   stages {
       stage('Build') {
           steps {
               sh 'docker build -t pytestimg .'
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
                   sh "ansible-playbook  plays/playbook.yaml --extra-vars \"image_id=${image_id}\" -e \"ansible_python_interpreter=/usr/bin/python3\""
               }
           }
       }
   }
}