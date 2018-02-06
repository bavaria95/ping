#!/bin/bash

minion_nodes=$(kubectl get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }')

for node in "${minion_nodes[@]}"; do
    sed -e "s/$$NAME$$/$node/g" service.yaml.tpl > "$node-service.yaml"
done

rm service.yaml.tpl
