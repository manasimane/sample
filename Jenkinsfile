pipeline{
  agent any
  environment{
    docker_hub = credentials('dockerhub_creds')
    image_name = "sample_name"
  }

  stages{
    stage("checkout"){
      steps{
        checkout scm
      }
    }
    stage("Build app"){
      steps{
        sh "mvn clean package"
      }
    }
    stage("Build image"){
      steps{
        sh "docker build -t $image_name:$BUILD_NUMBER ."
      }
    }
   stage("Login & Push") {
            steps {
                // This block is the most stable way to handle Docker Hub
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
                    sh "docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${USER}/${IMAGE_NAME}:${BUILD_NUMBER}"
                    sh "docker push ${USER}/${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }
    stage("Docker Logout"){
      steps{
        sh "docker logout"
      }
    }
  }
  post{
    always{
      sh "docker rmi $image_name:$BUILD_NUMBER || true"
    }
  }
}
