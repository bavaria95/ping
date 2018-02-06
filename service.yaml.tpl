apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    service: $$NAME$$
  name: $$NAME$$
spec:
  clusterIP: None
  ports:
  - name: headless
    port: 55555
    targetPort: 0
  selector:
    service: $$NAME$$
status:
  loadBalancer: {}
