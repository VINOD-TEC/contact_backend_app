pipeline {
    agent any
    
    tools{
        maven "Maven-3.9.12"
    }    

    stages {
        stage('Git Clone') {
            steps {
               git branch: 'main', url: 'https://github.com/VINOD-TEC/contact_backend_app.git'
            }
        }
        stage('Maven Build'){
            steps{
             sh 'mvn clean package'
            }
        }
        stage('Docker Image'){
            steps{
             sh 'docker build -t vinodpa/contact-backend-app .'
            }
        }
        stage('Docker Image push'){
            steps{
            withCredentials([string(credentialsId: 'docker_pwd', variable: 'docker_pwd')]) {
                   sh 'docker login -u ashokit -p ${docker_pwd}'
                   sh 'docker push vinodpa/contact-backend-app'
            }
            }
        }
        stage('k8s deployment'){
            steps{
             sh 'kubectl apply -f Deployment.yml'
            }
        }        
    }
}
