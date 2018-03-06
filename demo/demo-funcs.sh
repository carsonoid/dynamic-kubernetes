#!/bin/bash

# list all pods
pods() { kubectl get po -o wide; }

# Create the etl pods
create_etl_pods() { kubectl run etl --image=nginx -l workload=etl --requests=cpu=1 --replicas=5; }

# Create the queue worker pods
create_queue_pods() { kubectl run queue --image=nginx -l workload=queue --requests=cpu=1 --replicas=5; }

# Create the service pods
create_service_pods() { kubectl run service --image=nginx -l workload=service --requests=cpu=500m --replicas=4; }

create_all_pods() {
create_etl_pods
create_queue_pods
create_service_pods
}
