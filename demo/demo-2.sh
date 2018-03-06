#!/bin/bash

. demo-magic.sh -n

. demo-funcs.sh

clear

for f in yaml/services-nag.yaml yaml/jobs-nag.yaml yaml/services-par.yaml yaml/etl-jobs-par.yaml yaml/queue-jobs-par.yaml;do 
clear
pe "cat $f"
wait
pe "kubectl create -f $f"
sleep 2
wait
done

./demo-1.sh
