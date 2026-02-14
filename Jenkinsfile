pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                git branch: 'dev', url: 'https://github.com/vigneshkumar-ops/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-dev .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker tag react-dev amudhanvignesh/react-dev'
                sh 'docker push amudhanvignesh/react-dev'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 80:80 react-dev'
            }
        }
    }
}
