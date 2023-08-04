def userId = slackUserIdFromEmail('fahriddin24@gmail.com')
def userIdAdmin = slackUserIdFromEmail('tuba_7655@icloud.com')
def userIdAdmin2 = slackUserIdFromEmail('Burkanov.es@gmail.com')

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
        }

        stage('terraform apply') {
            steps {
                dir('terraform') {
                    sh "terraform ${params.SELECT_CHOICE} -auto-approve"
            }
        }
        }
           
  }
 
 post('Post Action') {
    success {
        echo '### Send Slack Notification ###'
        slackSend(color: "good", message: "<@$userId> jenkins_pipeline passed successfully")
    }
    failure {
        echo '### Send Slack Notification ###'
        slackSend(color: "danger", message: "<@$userIdAdmin> and <@$userIdAdmin2> jenkins_pipeline status failed please troubleshoot - Thanks")
    }
 }
}