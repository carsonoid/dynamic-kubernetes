#!/bin/bash

. demo-magic.sh -n

clear

pe "cat demo-funcs.sh"
. demo-funcs.sh
wait
pe "create_all_pods"
wait
pe "pods"
