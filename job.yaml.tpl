apiVersion: batch/v1
kind: Job
metadata:
  name: @@NAME@@
spec:
  template:
    metadata:
      name: @@NAME@@
    spec:
      containers:
      - command: ["/bin/bash"]
        args: ["-xmc", "nodes=@@NODES@@ && 
                        echo $nodes"
                ]
        image: tutum/curl
        name: @@NAME@@
