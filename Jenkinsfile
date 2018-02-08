node ('master') {
    git poll: true, url: 'git@github.com:bavaria95/ping.git'

    withCredentials([file(credentialsId: 'K8S_CA', variable: 'K8S_CA'),
               file(credentialsId: 'K8S_CERT', variable: 'K8S_CERT'),
               file(credentialsId: 'K8S_CONFIG', variable: 'K8S_CONFIG'),
               file(credentialsId: 'K8S_KEY', variable: 'K8S_KEY')]) {
        try {
            stage('Init') {
                def initStatus = sh returnStatus: true, script: '''
                    ./init.sh
                '''

                if (initStatus != 0) {
                    currentBuild.result = 'FAILURE'
                    error "Init phase failed"
                    sleep 2
                }
            }

            stage('Start') {
                sh '''
                    ./start.sh
                '''
            }

            stage('Ping') {
                def pingStatus = sh returnStatus: true, script: '''
                    ./check_availability.sh
                '''

                if (pingStatus != 0) {
                    currentBuild.result = 'FAILURE'
                    stage('Logs') {
                        sh '''
                            ./logs.sh
                        '''
                    error "Ping phase failed"
                    sleep 2
                    }
                }
                else {
                    currentBuild.result = 'SUCCESS'
                }
            }
        }
        finally {
            sh '''
                ./cleanup.sh
            '''
        }
    }
}
