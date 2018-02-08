#!/bin/bash

pod_exit_code() {
    local terminated_jsonpath='{.status.containerStatuses[0].state.terminated.exitCode}'
    kubectl \
        get \
            pod \
            $1 \
            --show-all \
            --output "jsonpath=$terminated_jsonpath"
}


minion_nodes=($(kubectl get nodes | tail -n +2 | grep -v 'master' | awk '{ print $1 }'))


for (( i=1; i<=60; i++ )); do
    ALL_FINISHED=1
    ALL_FINISHED_SUCCESSFULLY=1
    for node in ${minion_nodes[@]}; do
        EXITCODE="$(pod_exit_code ${node}-pod | grep "^..*$")"

        if [ -z "$EXITCODE" ]; then
            ALL_FINISHED=0
            ALL_FINISHED_SUCCESSFULLY=0
        else
            if [ "$EXITCODE" -ne 0 ]; then
                ALL_FINISHED_SUCCESSFULLY=0
            fi
        fi
    done

    if [ "$ALL_FINISHED_SUCCESSFULLY" -eq 1 ]; then
        exit 0
    fi

    if [ "$ALL_FINISHED" -eq 1 ]; then
        break
    fi

    sleep 2
done

exit 1
