FROM openjdk:11
WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn
COPY src src

RUN ./mvnw package
COPY ./target/*.jar ./sampleApp.jar
ENTRYPOINT [ "java", "-jar", "sampleApp.jar" ]