echo "Timer here, waiting for wait.sh"
until [ -e wait.sh ]; do sleep 1; done
./wait.sh [[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
