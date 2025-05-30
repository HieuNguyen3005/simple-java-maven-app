pipeline {
    agent {
      kubernetes {
        yaml """
          apiVersion: v1
          kind: Pod
          spec:
            containers:
            - name: jnlp
              image: hieunguyen2k/jenkins-agent-docker:latest
              tty: true
        """
      }
    }
    tools {
        maven 'MAVEN3.9'
    }
    environment {
        IMAGE_NAME = 'hieunguyen3005/my-java-app'
        VERSION = "1.0.${BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Verify Docker') {
            steps {
                sh 'docker version'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
    post {
        success {
            echo "Docker image pushed: $IMAGE_NAME:$VERSION"
        }
    }
}

    agent {
        kubernetes {
        yaml """
    apiVersion: v1
    kind: Pod
    spec:
    containers:
    - name: jnlp
        image: yourdockerhub/jenkins-agent-docker:latest
        tty: true
    """
        }
    }