pipeline {
    agent any

    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
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
                sh "terraform plan"
            }
        }

        stage('terraform apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
        
    }
}