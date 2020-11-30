FROM openjdk:8-jdk-alpine
WORKDIR /opt
ADD build/libs/*.jar /app.jar
EXPOSE 8181
ENTRYPOINT ["java", "-jar","app.jar"]