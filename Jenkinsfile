pipeline{
  
agent any
  
  stages{
    
    stage('Build'){
      steps{
      echo "Building the application"
      }
    }
    
  }
  post{
    success { echo "Ran successfully" }
    failure { echo "Failed pipeline" }
    always { echo "Ran anyways"}
  }
}
