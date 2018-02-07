#!/bin/bash

minion_nodes=($(kubectl get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }'))

for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" service.yaml.tpl > "$node-service.yaml"
done

rm service.yaml.tpl


for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" deployment.yaml.tpl > "$node-deployment.yaml"
done

rm deployment.yaml.tpl


sed -i -e "s/@@NODES@@/(${minion_nodes[*]})/g" job.yaml.tpl

for node in ${minion_nodes[@]}; do
    sed -e "s/@@NAME@@/$node/g" job.yaml.tpl > "$node-job.yaml"
done

rm job.yaml.tpl