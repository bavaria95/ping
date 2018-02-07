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
        args: ["-xmc", "minion_nodes=@@NODES@@ && 
                        host=@@NAME@@ && 
                        FAILED=0 && 
                        for node in ${minion_nodes[@]}; do \
                          ping -c 1 \"$node\"; \
                          if [ $? -ne 0 ]; then \
                            echo \"$host cannot connect to $node\"; \
                            FAILED=1; \
                          fi;
                        done && 

                        exit $FAILED
                        "
                ]
        image: tutum/curl
        name: @@NAME@@-job
      restartPolicy: Never
