pipeline {
    agent any

    environment {
        // Use Maven Docker image with Java 11 pre-installed
        MAVEN_IMAGE = "maven:3.9.6-eclipse-temurin-11"
        // Optional: Docker proxy settings if needed
        HTTP_PROXY = "http://vssrinfravr.connex.ro:3128/"
        HTTPS_PROXY = "http://vssrinfravr.connex.ro:3128/"
    }

    stages {
        stage('Checkout') {
            steps {
                git(
                    url: 'https://github.com/sollpar/hello-devops-app.git',
                    branch: 'main',
                    credentialsId: '1a91f5c4-c495-40d3-87ba-93bd4008033d'
                )
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.image(env.MAVEN_IMAGE).inside('-u root') {
                        sh 'mvn clean package'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image(env.MAVEN_IMAGE).inside('-u root') {
                        sh 'mvn test'
                    }
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    // Replace these with your Docker registry details
                    def imageName = "myapp:${env.BUILD_NUMBER}"
                    sh """
                        docker build -t ${imageName} .
                        # docker push ${imageName}  # Uncomment if pushing to registry
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy stage placeholder – add deployment commands here"
            }
        }
    }

    post {
        always {
            echo "Pipeline finished. Cleaning up if needed."
        }
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
