apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: $$NAME$$
spec:
  replicas: 1
  template:
    metadata:
      labels:
        service: $$NAME$$
    spec:
      containers:
      - image: tutum/curl
        name: $$NAME$$
        args:
          - bash
          - -c
          - while true; do sleep 10; done
      restartPolicy: Always
      nodeSelector:
        kubernetes.io/hostname: $$NAME$$
status: {}
