
 Have a look at the graphs provided by Pingdom. Most of the time in the response is spent **Waiting** for the file to be delivered. That does not depend on the content or size of the file.

**For localhost:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://localhost/foswiki`{{execute}}

**For the Katacoda environment:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki`{{execute}}
