FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "contact-backend-app.jar"]

EXPOSE 8080
