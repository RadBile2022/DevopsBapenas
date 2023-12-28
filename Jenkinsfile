pipeline {
    agent any
    tools {
        maven 'mvn 3.9'
    }
    stages {
        stage ('Build Maven'){
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RadBile2022/devops-bapenas.git']])
                sh 'mvn clean install'
            }
        }
        stage ('Build docker image'){
            steps {
                script {
                    sh 'sudo docker build -t radar511/java-book .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'sudo docker login -u radar511 -p ${dockerhubpwd}'
                    
                    sh 'sudo docker push radar511/java-book'
                }
                    
                }
            }
        }
           
    }
}
