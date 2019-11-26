pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo 'Building ...'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing ...'
            }
        }

        stage('Deploy') {
            steps {
                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/before-installation.sh'
                }

                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/installation.sh'
                }

                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/after-installation.sh'
                }
            }
        }
    }
}