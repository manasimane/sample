pipeline{
  agent any

  tools{
    jdk 'jdk17'
  }
  
  stages{
    stage('checkout'){
      steps{
      checkout scm
      }
    }
    stage('Build'){
      steps{
      mvn clean package
    }
    }
  }
}
