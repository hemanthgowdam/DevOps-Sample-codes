pipeline {
agent any
  stages {
    stage(SCM-Github){
      steps {
         checkout scm: [
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/Org_name/repo_name.git']]
                ]

            }
        }
  stage (Build) {
    steps { 
        sh 'mvn clean build'
      }
  }
  stage (Automated-Tests) {
    steps {
        sh 'mvn test'
    }
    post-test {
      always {
        sucess {
          echo "Test is successfull"
        }
        failure {
          echo "Test is failed, cannot start deployment"
        }
      }
    }
  }
            
  stage (Deploy to EC2) {
    steps {
      sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
                    sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
                    sh 'aws configure set region YOUR_AWS_REGION'
    }
      sshagent(['your-ssh-credentials-id']) {
                            ssh -o StrictHostKeyChecking=no "ec2-user@your-ec2-instance-public-ip"
                                cd /path/to/your/application
                                git pull origin main
      }
  }
    
    
