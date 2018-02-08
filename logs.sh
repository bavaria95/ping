#!/bin/bash

KUBECTL=(
    /var/lib/jenkins/kubectl
    --kubeconfig=$K8S_CONFIG
)

minion_nodes=($("${KUBECTL[@]}" get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }'))

for node in ${minion_nodes[@]}; do
    OUTPUT=$("${KUBECTL[@]}" logs ${node-pod})
    echo $OUTPUT
done
