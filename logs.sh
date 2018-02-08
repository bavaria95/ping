#!/bin/bash

minion_nodes=($(kubectl get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }'))

for node in ${minion_nodes[@]}; do
    OUTPUT=$(kubectl logs ${node-pod})
    echo $OUTPUT
done
