pipeline {
    agent any
    tools {
        maven 'Maven3'   // matches the name in Global Tool Config
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                bat 'scp target/demoCICD-0.0.1-SNAPSHOT.war C:\\JavaProject\\MyWorkSpace\\Deployment'
            }
        }
    }
}
