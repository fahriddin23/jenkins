pipeline {
    agent any

    stages {
        stage('print Hello') {
            steps {
                echo 'Hello World'
            }
        }
        
        stage('print bye') {
            steps {
                echo "Byee"
            }
        }
        
        stage('verify terraform') {
            steps {
                sh "terraform -v"
            }
        }
        
    }
}