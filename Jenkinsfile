pipeline {
    agent any
    environment {
        JAVA_HOME = "/usr/local/java/jdk-11.0.21+9"
        MAVEN_HOME = "/usr/local/maven/apache-maven-3.9.6"
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
        APP_PORT = "9090"
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
        stage('Run and Test App') {
            steps {
                sh '''
                    # Run Spring Boot app in background
                    nohup java -jar target/hello-app-1.0.0.jar --server.port=$APP_PORT > app.log 2>&1 &
                    APP_PID=$!

                    # Wait until the app responds
                    echo "Waiting for app to start on port $APP_PORT..."
                    until curl -s http://localhost:$APP_PORT >/dev/null; do
                        sleep 1
                    done

                    echo "App is up and running!"
                    
                    # Test endpoint
                    curl http://localhost:$APP_PORT

                    # Stop the app after testing
                    kill $APP_PID
                    echo "App stopped."
                '''
            }
        }
    }
    post {
        always {
            echo "Pipeline finished."
        }
    }
}
