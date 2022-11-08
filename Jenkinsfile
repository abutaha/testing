pipeline {
    agent any

    stages {
        stage('CloneGitRepository') {
            steps {
                git branch: 'main', url: 'https://github.com/abutaha/testing.git'
            }
        }
        stage('CreateDockerContainer') {
            steps {
                sh "docker image build -t myfinalsite:from-pipeline-v1.0 ."
            }
        }
        stage('RunContainer') {
            steps {
                sh "docker container run -it -d --rm --name mysiteapp myfinalsite:from-pipeline-v1.0"                
            }
        }
        stage('StopContainer') {
            steps {
                sh "docker container kill mysiteapp"
            }
        }
    }
}
