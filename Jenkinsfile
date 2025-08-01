// pipeline {
//     agent any
//     stages {
//         stage('Performance Testing') {
//             steps {
//                 echo 'Running K6 performance tests...'
//                 sh 'k6 run loadtests/performance-test.js'
//             }
//         }
//     }
// }

pipeline {
    agent any

    environment {
        K6_PATH = '/opt/homebrew/bin/k6' 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/jaranin-b/k6-example-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'export PATH=$PATH:/opt/homebrew/bin && npm install' 
            }
        }

        // stage('Run Load Test') {
        //     steps {
        //         sh '${K6_PATH} run scenarios/loadTest.js'
        //     }
        // }

        // stage('Run Stress Test') {
        //     steps {
        //         sh '${K6_PATH} run scenarios/stressTest.js'
        //     }
        // }

        stage('Check K6') {
            steps {
                sh 'echo $K6_PATH'
                sh '$K6_PATH version'
            }
        }

        stage('Run Performance Test') {
            steps {
                sh 'mkdir -p reports'
                sh '${K6_PATH} run loadtests/performance-test.js --out json=reports/result.json'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/*.json', fingerprint: true
        }
    }
}
