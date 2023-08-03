pipeline {
    agent any

    parameters {
        choice(
            choices: ['apply' , 'destroy'],
            description: 'Terraform action',
            name: 'SELECT_CHOICE'
        )
    }
    stages {
        stage('Terraform init') {
            steps {
                dir('terraform') {
                sh 'terraform init'
            }
        }
        }

        stage('pwd') {
            steps {
                dir('testfolder') {
                sh "pwd"
            }
        }
        }

        stage('terraform validate') {
            steps {
                sh "terraform validate"
            }
        }
        
        stage('terraform fmt') {
            steps {
                sh "terraform fmt"
            }
        }

        stage('terraform plan') {
            steps {
                dir('terraform') {
                    sh "terraform plan"
            }
        }

        stage('terraform apply') {
            steps {
                dir('terraform') {
                    sh "terraform ${params.SELECT_CHOICE} -auto-approve"
            }
        }
    }
        stage('notify-slack') {
          steps {
          script {
              slackSend(color: "good", message: " Freddy jenkins_pipeline passed successfully")
            }
      }
    }
}
}
}