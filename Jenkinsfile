pipeline{
  
agent any
  
  parameters{
    choice (name: my_env, choices: ['dev', 'test', 'prod'], 
           description: "Select enviornment for deployment")
  }
  
  stages{
    
    stage('Build'){
      steps{
      echo "Building the application"
      }
    }

    stage('Dev'){
       when{
          expression{ params.my_env == 'dev'} 
        }
      steps{
        echo "Deplying to dev"
      }
    }

    stage('prod'){
       when {
          expression {params.my_env == 'prod' }
        }
      steps{
       input message : "Type yes to proceed or else no"
        echo "Deploying to prod"
      }
    }
    
  }
}
