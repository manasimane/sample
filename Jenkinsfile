pipeline{
  agent any
  environment{
    docker_hub = credentials('dockerhub_creds')
    image_name = "sample_name"
    app_server_ip = ""
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
    stage("Deploy to app server"){
      steps{
        sh '''
        ssh -o StrictHostKeyChecking=no ubuntu@$app_server_ip "
        docker pull $docker_hub_USR/$image_name:$BUILD_Number
        docker stop $my_app_container || true
        docker rm $my_app_container || true
        docker run -d --name my_app_container -p 8080:8081 $docker_hub_USR/$image_name:$BUILD_Number

        docker image prune -f
        docker logout
        "
        '''
      }
    }
    
  }
  
  post{
    always{
      sh """
      docker logout
      docker rmi $image_name:$BUILD_NUMBER || true
      docker rmi $docker_hub_USR/$image_name:$BUILD_Number
      """
    }
  }
}
