pipeline {
    agent {
        docker {
            image 'grafana/k6:latest'
        }
    }
    stages {
        stage('Performance Testing') {
            steps {
                echo 'Running K6 performance tests...'
                sh 'k6 run loadtests/performance-test.js'
            }
        }
    }
}
