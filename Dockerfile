FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY target/*.jar quiz-server.jar
ENTRYPOINT ["java", "-jar", "quiz-server.jar"]
EXPOSE 8080
