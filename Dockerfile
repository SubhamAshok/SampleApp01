FROM maven:3-eclipse-temurin-11
EXPOSE 8081
WORKDIR /app/

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn
COPY src src
COPY wait-for-it.sh .

RUN mvn -DskipTests clean package
RUN cp ./target/*.jar ./sampleApp.jar
RUN chmod 777 ./sampleApp.jar

ENTRYPOINT [ "./wait-for-it.sh", "mysqldb:3307", "--", "java", "-jar", "sampleApp.jar" ]

# FROM openjdk:11
# EXPOSE 8081
# WORKDIR /app

# COPY pom.xml .
# COPY mvnw .
# COPY .mvn .mvn
# COPY src src


# RUN ./mvnw clean package
# COPY ./target/*.jar ./sampleApp.jar
# ENTRYPOINT [ "java", "-jar", "sampleApp.jar" ]

# ==============================
# Oracle Java 7 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java7
#

# Pull base image.
# FROM alpine as build

# ARG MAVEN_VERSION=4.0.0-alpha-2
# ARG USER_HOME_DIR="/root"
# ARG BASE_URL=https://apache.osuosl.org/maven/maven-4/${MAVEN_VERSION}/binaries


# # Install Java.
# RUN apk --update --no-cache add openjdk11 curl

# RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
#  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
#  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
#  && rm -f /tmp/apache-maven.tar.gz \
#  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# ENV MAVEN_HOME /usr/share/maven
# ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# # Define working directory.
# WORKDIR /data

# # Define commonly used JAVA_HOME variable
# ENV JAVA_HOME /usr/lib/jvm/default-jvm/

# # Define default command.
# CMD ["mvn", "--version"]

# #RUN apt-get install mvn
# COPY pom.xml .
# COPY mvnw .
# COPY .mvn .mvn
# COPY src src

# RUN mvn clean install -Dskip.unit-tests=true -Dskip.integration-tests=true -Dskip.end-to-end-tests=true
# COPY ./target/*.jar ./sampleApp.jar
# ENTRYPOINT ["java", "-jar", "sampleApp.jar"]