# Use lightweight OpenJDK 11 base image
FROM openjdk:11-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven build artifact
COPY target/hello-app-1.0.0.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java","-jar","app.jar"]
