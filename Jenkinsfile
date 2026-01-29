pipeline{
  
agent any
  
  stages{
    
    stage('Check_tools'){
      steps{
      sh '''
      java -version
      maven -version || true
      docker -version || true
      '''
      }
    }
    
  }
}
