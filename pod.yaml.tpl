apiVersion: v1
kind: Pod
metadata:
  name: @@NAME@@-pod
spec:
  containers:
  - command: ["/bin/bash"]
    args: ["-c", "minion_nodes=@@NODES@@ && 
                    host=@@NAME@@ && 
                    FAILED=0 && 
                    for node in ${minion_nodes[@]}; do \
                      ping -c 1 \"$node-service\" > /dev/null 2>&1; \
                      if [ $? -ne 0 ]; then \
                        echo \"$host cannot connect to $node\"; \
                        FAILED=1; \
                      fi;
                    done && 

                    exit $FAILED
                    "
            ]
    image: tutum/curl
    name: @@NAME@@-pod
  restartPolicy: Never
