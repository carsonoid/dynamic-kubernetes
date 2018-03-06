#!/bin/bash

. demo-magic.sh -n

clear

kubectl plugin kubenodes
wait
echo
pe "kubectl get nodes -l nodetype-general=true"
wait
echo
pe "kubectl get nodes -l nodetype-spot=true"
wait

