# code-challenge-fis

# Jenkins Installation steps

1. Create a custom jenkins container as follows:

    ```
    FROM jenkins/jenkins:lts
    USER root
    RUN apt-get -y update && \
        apt-get install -y bash curl openrc git
    RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
      && tar xzvf docker-17.04.0-ce.tgz \
      && mv docker/docker /usr/local/bin \
      && rm -r docker docker-17.04.0-ce.tgz
    USER jenkins
    EXPOSE 8080
    ```
   
2. Build the docker image as follows:
    
    ```
    docker build -t jenkins .
    ```

3. Based on previous built image, run a docker container as follows:

    ```
    docker run -d --name=jenkins -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins:latest
    ```
   
   ### NOTE
   The idea of this previous step is to use a volume for persist jenkins configuration and history.
   Also, to be able to execute docker commands inside a dockerized jenkins program.

---
# Jenkins configuration

* This step is customize and depends on each user.

---

# Repository & General Information

* Project Repo

    ```
    https://github.com/diego-yarleque/code-challenge-fis
    ```
  
* DockerHub Location

    ```
    https://hub.docker.com/repository/docker/dryloayza/code-challenge
    ```
  
* Pipeline Steps

    ![img](jenkins-pipeline.png)

* Pipeline Logs

    Pipeline logs are inside the code-challenge-fis repository. The file name is:

   ```
    jenkins-logs.txt
   ```
