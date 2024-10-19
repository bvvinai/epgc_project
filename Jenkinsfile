pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS = credentials("dockerhub")
    }
    stages {
        stage('git') {
            agent {
                label "kmaster"
            }
            steps {
                script {
                    git'https://github.com/bvvinai/epgc_project.git'
                }
            }
        }
        stage('docker') {
            agent {
                label "kmaster"
            }
            steps {
                script {
                    sh 'sudo docker build /home/ubuntu/jenkins/workspace/job/ -t bvvinai/proj'
                    sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                    sh 'sudo docker push bvvinai/proj'
                }
            }
        }
        stage('kubernetes') {
            agent {
                label "kmaster"
            }
            steps {
                script {
                   // sh 'kubectl delete deploy my-deployment'
                    sh 'kubectl apply -f deployment.yml'
                   // sh 'kubectl delete service my-service'
                    sh 'kubectl apply -f service.yml'
                }
            }
        }
    }
}
