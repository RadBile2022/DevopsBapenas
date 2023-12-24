pipeline {
    agent any
    tools {
        maven 'mvn 3.5.0'
    }
    stages {
        stage ('Build Maven'){
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RadBile2022/devops-automation.git']])
                sh 'mvn clean install'
            }
        }
        stage ('Build docker image'){
            steps {
                script {
                    sh 'docker build -t radar511/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u radar511 -p ${dockerhubpwd}'
                    
                    sh 'docker push radar511/devops-integration'
                }
                    
                }
            }
        }
           
    }
}
