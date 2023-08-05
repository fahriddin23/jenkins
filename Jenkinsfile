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
                script {
                    dir('terraform') {
                        sh "terraform ${params.SELECT_CHOICE} -auto-approve"
                        script {
                            def tf_output = sh(returnStdout: true, script: """terraform output instance_private_ip | tr -d '"' """)
                            env.IP_ADDR = "${tf_output}"
                            echo "${tf_output}"
                        }
                    }
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
        }

        stage('notify infrabuild') {
            steps {
                slackSend(color: "good", message: " <@$userId> jenkins_pipeline status infrabuild successful ")
            }
        }

        stage('read-tf-output') {
            steps {
                script {
                // Reading the Terraform output from the environment variable in stage "tf-apply"
                echo "The Terraform output in stage tf-apply is: ${IP_ADDR}"
        }
      }
    }
        stage('SSH Remote-host') {
            when {
                expression { params.SELECT_CHOICE == "apply" }
            }
            steps {
                sleep(time: 2, unit: 'MINUTES')
                sh 'ssh -o StrictHostKeyChecking=accept-new -tt ubuntu@${IP_ADDR} "sudo apt install nginx -y"'
      }
    }
  }
 
 post('Post Action') {

    always {
        echo '### Clean workspace ###'
        cleanWs()
 }
}
}
