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
                echo "Bye"
            }
        }
        
        stage('read passwd') {
            steps {
                sh 'cat /etc/passwd'
            }
        }
        
    }
}