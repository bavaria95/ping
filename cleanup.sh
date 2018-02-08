#!/bin/bash +e

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
    --namespace="ping-$BUILD_ID"
)

"${KUBECTL[@]}" delete -f configs/pods
"${KUBECTL[@]}" delete -f configs/deployments
"${KUBECTL[@]}" delete -f configs/services

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
)

"${KUBECTL[@]}" delete namespace "ping-$BUILD_ID"

rm -rf ping

exit 0
