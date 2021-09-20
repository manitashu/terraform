pipeline {
    agent any

    stages {

        stage('Terraform INIT') {
            steps {
            sh 'cd roboshop-shell-scripting ; terraform init'
            }
        }

        stage('Terraform Apply') {
          when {
            environment name: 'ACTION', value: 'apply'
          }
          steps {
            sh '''
              cd roboshop-shell-scripting
              terraform apply -auto-approve
            '''
          }
        }

        stage('Terraform Destroy') {
            steps {
            sh '''
            cd roboshop-shell-scripting
            terraform destroy -auto-approve
            '''
            }
        }

    }
}