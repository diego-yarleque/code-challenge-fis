FROM openjdk:8-jdk-alpine
EXPOSE 8181
RUN mkdir -p /app/
ADD build/libs/fischallenge-0.0.1-SNAPSHOT.jar /app/fischallenge.jar
ENTRYPOINT ["java","-jar","/app/fischallenge.jar"]