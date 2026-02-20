pipeline {
    agent any
    environment {
        JAVA_HOME = "/usr/local/java/jdk-11.0.21"
        MAVEN_HOME = "/usr/local/maven/apache-maven-3.9.6"
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/sollpar/hello-devops-app.git'
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
        stage('Deploy') {
            steps {
                echo 'Deploy stage (manual or scripted)'
            }
        }
    }
}
