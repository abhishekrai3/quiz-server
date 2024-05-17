# Stage 1: Build the application
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml /app/
COPY src /app/src/

# Package the application
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/quiz-server-0.0.1-SNAPSHOT.jar /app/quiz-server-0.0.1-SNAPSHOT.jar

# Specify the command to run on container start
CMD ["java", "-jar", "quiz-server-0.0.1-SNAPSHOT.jar"]
