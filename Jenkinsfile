pipeline{
  agent any
  
  parameters{
    choice(
      name: 'env',
      choices: ['dev', 'test', 'prod'],
      description: 'Choice the environment from dropdown'
    )
  }
    stages{
      stage('Build'){
        steps{
        echo "building the application"
        }
      }
      stage('test'){
        when{
          expression { params.env != 'prod'}
        }
        steps{
          echo "Running in test"
        }
      }
      stage('dev'){
        when{
          expression{ params.env == 'prod' }
        }
        steps{
          echo "running in dev"
        }
      }
    }
}
