pipeline {
    agent any
    tools {
        maven 'Maven3'   // matches the name in Global Tool Config
    }
    environment {
        DOCKER_IMAGE = "spring-boot-app"
    }

    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%BUILD_NUMBER% ."
            }
        }

stage('Run in Docker Desktop') {
    steps {
        bat '''
        for /f "tokens=*" %%i in ('docker ps -q --filter "name=spring-boot-app"') do (
            docker stop %%i
            docker rm %%i
        )
        docker run -d --name spring-boot-app -p 8080:8080 %DOCKER_IMAGE%:%BUILD_NUMBER%
        '''
    }
}
    }
    post {
        success {
            echo "Spring Boot app is running locally in Docker Desktop (Windows)!"
        }
    }

}
