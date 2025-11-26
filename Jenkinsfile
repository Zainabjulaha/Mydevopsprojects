pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDS = 'd9ee0f45-4631-4abb-91e5-103e39798967'   // DockerHub Credentials ID
        IMAGE = 'zainabjulaha/myflaskapp:latest'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Zainabjulaha/Mydevopsprojects.git',
                    credentialsId: 'ba21a80d-e4ac-41ef-b08f-56b2839a5341'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE}")
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDS}") {
                        docker.image("${IMAGE}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}

