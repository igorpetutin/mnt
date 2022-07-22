
#1
aws ecs register-task-definition --cli-input-json file://./cadvisor-node-exporter-definition.json --region us-west-2
aws ecs register-task-definition --cli-input-json file://./prometheus-grafana-definition.json --region us-west-2

#2
aws ecs create-service --cluster MyWorkingCluster --service-name cadvisor-node-exporter --task-definition cadvisor-node-exporter-definition:1 --launch-type EC2 --scheduling-strategy DAEMON --region us-west-2

#3
aws ecs run-task --cluster MyWorkingCluster --task-definition prometheus-grafana-definition:1  --region us-west-2
