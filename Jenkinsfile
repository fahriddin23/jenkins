def userId = slackUserIdFromEmail('fahriddin24@gmail.com')

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
            when {
                expression { params.SELECT_CHOICE == "apply"}
            }
            steps {
                dir('terraform') {
                    sh "terraform ${params.SELECT_CHOICE} -auto-approve"
            }
        }
        }

        stage('terraform destroy') {
            when {
                expression { params.SELECT_CHOICE == "destroy"}
            }
            steps {
                dir('terraform') {
                    sh "terraform ${params.SELECT_CHOICE} -auto-approve"
            }
        }

        stage('notify infrabuild')
            steps {
                slackSend(color: "good", message: "<@userId> jenkins_pipeline status infrabuild successful ")
            }
        }
           
  }
 
//  post('Post Action') {
//     success {
//         echo '### Send Slack Notification ###'
//         slackSend(color: "good", message: "<@userId> jenkins_pipeline status nginx installed successfully ")
//     }
//     failure {
//         echo '### Send Slack Notification ###'
//         slackSend(color: "danger", message: "<@userId> jenkins_pipeline status failed please troubleshoot - Thanks ")
//     }
//     always {
//         echo '### Clean workspace ###'
//         cleanWs()
//  }
}
