pipeline{
  
agent any
  
  stages{
    
    stage('Build'){
      steps{
      echo " building application"   
      sh '''
      mvn clean package
      '''
      }
    }
    
  }
}
