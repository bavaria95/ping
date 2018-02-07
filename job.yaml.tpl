apiVersion: batch/v1
kind: Job
metadata:
  name: @@NAME@@-job
spec:
  template:
    metadata:
      name: @@NAME@@-job
    spec:
      containers:
      - command: ["/bin/bash"]
        args: ["-xmc", "nodes=@@NODES@@ && 
                        echo $nodes"
                ]
        image: tutum/curl
        name: @@NAME@@-job
      restartPolicy: Never
