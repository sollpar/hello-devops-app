pipeline {
    agent any
    environment {
        APP_NAME = "hello-app"
        IMAGE_NAME = "hello-app:${env.BUILD_NUMBER}"
    }
    stages {
        stage('Checkout') {
            steps { git url: 'https://github.com/sollpar/hello-devops-app.git', branch: 'main' }
        }
        stage('Build') { steps { sh 'mvn clean package' } }
        stage('Test') { steps { sh 'mvn test' } }
        stage('Docker Build') { steps { script { docker.build("${IMAGE_NAME}") } } }
        stage('Deploy') {
            steps {
                script {
                    sh "docker stop ${APP_NAME} || true"
                    sh "docker rm ${APP_NAME} || true"
                    sh "docker run -d --name ${APP_NAME} -p 8080:8080 ${IMAGE_NAME}"
                }
            }
        }
    }
}
