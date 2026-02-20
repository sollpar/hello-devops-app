pipeline {
    agent any
    environment {
        JAVA_HOME = "/usr/local/java/jdk-11.0.21+9"
        MAVEN_HOME = "/usr/local/maven/apache-maven-3.9.6"
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sollpar/hello-devops-app.git'
            }
        }
        stage('Build') {
            steps {
                sh '''
                echo "JAVA_HOME=$JAVA_HOME"
                java -version
                mvn -version
                mvn clean package
                '''
            }
        }
        stage('Package Spring Boot App') {
    steps {
        sh 'mvn clean package spring-boot:repackage'
    }
}
    }
}
