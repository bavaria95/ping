#!/bin/bash

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
    --namespace="ping-$BUILD_ID"
)

"${KUBECTL[@]}" apply -f configs/services

sleep 2

"${KUBECTL[@]}" apply -f configs/deployments

sleep 2

"${KUBECTL[@]}" apply -f configs/pods
