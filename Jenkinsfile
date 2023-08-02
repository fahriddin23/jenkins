pipeline {
    agent any

    stages {
        stage('Terraform init') {
            steps {
                sh 'cd terraform'
                sh 'terraform init'
            }
        }

        stage('pwd') {
            steps {
                dir('testfolder') {
                sh "pwd"
            }
        }
        }

        stage('whoami') {
            steps {
                sh "whoami"
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