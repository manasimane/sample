pipeline{
  
agent any
  
  stages{
    
    stage('Check_tools'){
      steps{
      sh '''
      java -version
      mvn -version || true
      docker --version || true
      '''
      }
    }
    
  }
}
