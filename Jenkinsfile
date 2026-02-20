pipeline {
    agent any

    environment {
        APP_NAME = "hello-app"
        IMAGE_NAME = "hello-app:${env.BUILD_NUMBER}"
        MAVEN_HOME = "/opt/maven" // adjust if Maven is installed elsewhere
        PATH = "${env.MAVEN_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/sollpar/hello-devops-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Run Maven locally
                sh "${env.MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage('Test') {
            steps {
                sh "${env.MAVEN_HOME}/bin/mvn test"
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image from Dockerfile in repo
                    docker.build("${IMAGE_NAME}", ".")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove old container if exists
                    sh "docker stop ${APP_NAME} || true"
                    sh "docker rm ${APP_NAME} || true"
                    // Run new container
                    sh "docker run -d --name ${APP_NAME} -p 8080:8080 ${IMAGE_NAME}"
                }
            }
        }
    }
}
