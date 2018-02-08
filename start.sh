#!/bin/bash

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
)

"${KUBECTL[@]}" apply -f configs/services

sleep 2

"${KUBECTL[@]}" apply -f configs/deployments

sleep 2

"${KUBECTL[@]}" apply -f configs/pods
