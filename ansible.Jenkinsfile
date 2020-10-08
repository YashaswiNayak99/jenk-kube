pipeline {
   agent any
   stages {
       stage ('Deploy') {
           steps {
               ansiblePlaybook(
                playbook: 'plays/playbook.yaml',
                extraVars: [
                    image_id: 'yashdock90/jenks-kube-test:latest',
                    ansible_python_interpreter: '/usr/bin/python3'
                ])
           }
       }
   }
}