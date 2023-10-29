pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/wlcamargo/dev_jenkins.git']])
            }
        }

        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/wlcamargo/dev_jenkins'
                sh 'python3 ops.py'
            }
        }

        stage('Test') {
            steps {
                sh 'python3 -m pytest'
            }
        }
    }
}