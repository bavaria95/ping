apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    service: @@NAME@@-service
  name: @@NAME@@-service
spec:
  clusterIP: None
  ports:
  - name: headless
    port: 55555
    targetPort: 0
  selector:
    service: @@NAME@@-service
status:
  loadBalancer: {}
