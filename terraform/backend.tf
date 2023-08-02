terraform {
  backend "s3" {
    bucket         = "tf-backend-fahriddin"
    key            = "jenkins/jenkins_pipeline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-backend-lock"
  }
}
