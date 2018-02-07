#!/bin/bash

rm -rf configs

mkdir configs


minion_nodes=($(kubectl get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }'))

mkdir configs/services
for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" service.yaml.tpl > "configs/services/$node-service.yaml"
done

mkdir configs/deployments
for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" deployment.yaml.tpl > "configs/deployments/$node-deployment.yaml"
done

mkdir configs/pods
sed -i -e "s/@@NODES@@/(${minion_nodes[*]})/g" pod.yaml.tpl

for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" pod.yaml.tpl > "configs/pods/$node-pod.yaml"
done
