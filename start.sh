#!/bin/bash

kubectl apply -f configs/services

sleep 2

kubectl apply -f configs/deployments

sleep 2

kubectl apply -f configs/pods
