pipeline{
  agent any

  environment{
    app_name : 'sample_app'
    container_name : 'sample_app_container'
  }

  stages{

    stage("checkout"){
      steps{checkout scm}
    }

    stage("build"){
      steps{ sh "mvn clean package"}
    }

    stage("Archive Artifact"){
      steps{
        archiveArtifacts artifacts : 'target/ *.jar' , fingerprint : true
      }
    }

    stage("docker build"){
      steps{
        sh '''
        docker stop $container_name || true
        docker rm $container_name || true
        docker run -d -p 8080:8080 --name $container_name $image_name : $build_number
        '''
      }
    }
  }

  post{
    always{
      echo "Pipeline ran successfully"
    }
  }
}
