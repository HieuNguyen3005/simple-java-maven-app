pipeline {
    agent any
    tools {
        maven 'MAVEN3.9' // Tên trùng với tên đã cấu hình trong Jenkins
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}