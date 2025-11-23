pipeline {
    agent any

    environment {
        IMAGE_NAME = "spring-boot-app"
        IMAGE_TAG  = "${BUILD_NUMBER}"   // auto-increment tag per Jenkins build
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Prepare WAR') {
            steps {
                // Rename WAR to ROOT.war for root context deployment
                bat 'copy target\\demoCICD-0.0.1-SNAPSHOT.war ROOT.war'
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Docker Run') {
            steps {
                bat '''
                for /F "tokens=*" %i in ('docker ps -q --filter "name=spring-boot-app"') do (
                    docker stop %i
                    docker rm %i
                )
                docker run -d --name spring-boot-app -p 8080:8080 %IMAGE_NAME%:%IMAGE_TAG%
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment successful! Access your app at http://localhost:8080/"
        }
        failure {
            echo "Deployment failed. Check Jenkins logs and Docker logs for details."
        }
    }
}
