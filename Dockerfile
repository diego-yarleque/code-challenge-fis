FROM openjdk:8-jdk-alpine
RUN apk add --no-cache curl \
   && ./gradlew clean --no-daemon \
   && ./gradlew build --no-daemon
ADD build/libs/fischallenge-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8181
ENTRYPOINT ["java","-jar","/app.jar"]