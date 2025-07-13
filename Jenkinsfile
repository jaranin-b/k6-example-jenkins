pipeline {
    agent {
        docker {
            image 'ubuntu:latest'
            args '-u root:root'
        }
    }
    stages {
        stage('Performance Testing') {
            steps {
                echo 'Installing k6'
                sh 'chmod +x setup_k6.sh'
                sh './setup_k6.sh'
                echo 'Running K6 performance tests...'
                sh 'k6 run loadtests/performance-test.js'
            }
        }
    }
}
