pipeline {
    agent any
    stages {
        stage ('Checkout & Clone repository') {
            steps {
                checkout scm
            }
        }
        stage ('Build Artifact') {
            steps {
                sh './gradlew clean build'
            }
        }
        stage ('Build docker image') {
            steps {
                sh 'docker build -t dryloayza/code-challenge:${BUILD_NUMBER} .'
            }
        }
        stage ('Push docker image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker push dryloayza/code-challenge:${BUILD_NUMBER}'
                }
            }
        }
        stage('Docker deploy'){
            steps {
                sh 'docker run -itd --name=fis-challenge -p 8181:8181 dryloayza/code-challenge:${BUILD_NUMBER}'
            }
        }
        stage('Curl spring boot app'){
            steps {
                sh 'curl http://localhost:8181'
            }
        }
    }
}