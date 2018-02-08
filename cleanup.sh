#!/bin/bash +e

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
)

"${KUBECTL[@]}" delete -f configs/pods
"${KUBECTL[@]}" delete -f configs/deployments
"${KUBECTL[@]}" delete -f configs/services

exit 0
