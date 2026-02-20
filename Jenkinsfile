pipeline {
    agent any

    environment {
        MAVEN_HOME = "/usr/local/maven/apache-maven-3.9.6"
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
        JAVA_HOME = "/usr/local/java/jdk-11.0.21+9"
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
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
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo "Skip Docker stage, or run on Jenkins host that has Docker CLI"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy stage placeholder"
            }
        }
    }
}
