pipeline {
    agent { label 'server2' }

    stages {

        stage('Build') {
            steps {
                echo 'Building ...'
                sh 'npm install --prefix main/'
                sh 'npm run-script build --prefix main/'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing ...'
            }
        }

        stage('Deploy') {
            steps {

                timeout (time: 2, unit: 'MINUTES') {
                    sh 'chmod 775 ./scripts/*'
                }

                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/before-installation.sh'
                }

                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/installation.sh'
                }

                timeout (time: 5, unit: 'MINUTES') {
                    sh 'sudo ./scripts/after-installation.sh'
                }

                timeout (time: 2, unit: 'MINUTES') {
                    sh 'rm -rf ./*'
                }
            }
        }
    }
}