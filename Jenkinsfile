pipeline {
    agent any

    environment {
        APP_NAME = "hello-app"
        IMAGE_NAME = "hello-app:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repo
                git url: 'https://github.com/sollpar/hello-devops-app.git', branch: 'main'
            }
        }

        stage('Build') {
            agent {
                docker {
                    image 'maven:3.9.1-eclipse-temurin-11'
                    args '-v /var/jenkins_home/.m2:/root/.m2' // optional Maven cache
                }
            }
            steps {
                // Build the app with Maven
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            agent {
                docker {
                    image 'maven:3.9.1-eclipse-temurin-11'
                    args '-v /var/jenkins_home/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image of your app
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove old container if exists
                    sh "docker stop ${APP_NAME} || true"
                    sh "docker rm ${APP_NAME} || true"

                    // Run the new container
                    sh "docker run -d --name ${APP_NAME} -p 8080:8080 ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
