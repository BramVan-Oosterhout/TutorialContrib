until [[ -e wait.sh && -x wait.sh ]]; do sleep 1; done
./wait.sh [[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
