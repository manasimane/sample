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
    stage("Login Dockerhub"){
      steps{
        sh "echo $docker_hub_PSW | docker login -u $docker_hub_USR --password-stdin"
      }
    }
    stage("tag & push image to docker hub"){
      steps{
        sh """
        docker tag $image_name:$BUILD_NUMBER $docker_hub_USR/$image_name:$BUILD_NUMBER
        docker push $docker_hub_USR/$image_name:$BUILD_NUMBER
        """
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
