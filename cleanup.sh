#!/bin/bash +e

kubectl delete -f configs/pods
kubectl delete -f configs/deployments
kubectl delete -f configs/services

exit 0
