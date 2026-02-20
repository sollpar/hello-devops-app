pipeline {
    agent any
    environment {
        JAVA_HOME = "/usr/local/java/jdk-11.0.21"
        PATH = "${JAVA_HOME}/bin:/usr/local/maven/apache-maven-3.9.6/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sollpar/hello-devops-app.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
