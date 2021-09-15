pipeline {
    agent any

    stages {

        stage('Terraform INIT') {
            steps {
            sh 'cd roboshop-shell-scripting ; terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
            sh '''
            cd roboshop-shell-scripting
            terraform apply -auto-approve
            '''
            }
        }

    }
}