pipeline {
  agent any

  environment {
    DOCKER_USER = "amudhanvignesh"
    CREDS = "dockerhub-creds"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Docker Login') {
      steps {
        withCredentials([usernamePassword(credentialsId: CREDS, usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo "$PASS" | docker login -u "$USER" --password-stdin'
        }
      }
    }

    stage('Build & Push') {
      steps {
        script {
          def envName = (env.BRANCH_NAME == "dev") ? "dev" : "prod"
          sh "./build.sh ${envName}"
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          def envName = (env.BRANCH_NAME == "dev") ? "dev" : "prod"
          def tag = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
          def image = "${DOCKER_USER}/${envName}:${tag}"
          sh "./deploy.sh ${image}"
        }
      }
    }
  }
}
