pipeline {
    agent any

    parameters {
        choice(
            choices: ['hello' , 'bye'],
            description: 'test choice',
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

        stage('call_parameter') {
            steps {
                echo "Choice: ${params.SELECT_CHOICE}"
            }
        }
        // stage('terraform validate') {
        //     steps {
        //         sh "terraform validate"
        //     }
        // }
        
        // stage('terraform fmt') {
        //     steps {
        //         sh "terraform fmt"
        //     }
        // }

        // stage('terraform plan') {
        //     steps {
        //         sh "terraform plan"
        //     }
        // }

        // stage('terraform apply') {
        //     steps {
        //         sh "terraform apply --auto-approve"
        //     }
        // }
        
    }
}