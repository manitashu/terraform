pipeline {

    agent {
        node { label 'workstation' }
    }

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Pick a terraform action')
    }

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