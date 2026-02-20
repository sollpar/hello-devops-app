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
        stage('Run App') {
            steps {
                sh '''
                # Run Spring Boot app in the background on port 9090
                nohup java -jar target/hello-app-1.0.0.jar --server.port=9090 > app.log 2>&1 &

                # Wait until the app responds
                echo "Waiting for app to start on port 9090..."
                until curl -s http://localhost:9090 >/dev/null; do
                    sleep 1
                done
                echo "App is up and running!"
                curl http://localhost:9090
                '''
            }
        }
    }
}
