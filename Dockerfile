# Use official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven config and download dependencies
COPY pom.xml .
RUN apt-get update && apt-get install -y maven && mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the app
RUN mvn package -DskipTests

# Run the JAR
CMD ["java", "-jar", "target/my-java-app-1.0-SNAPSHOT.jar"]
