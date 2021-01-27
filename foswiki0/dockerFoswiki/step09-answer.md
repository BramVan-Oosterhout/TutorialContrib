
 The first access on localhost is 400ms longer than the ones that follow. The 400ms is the time taken by the starting of the `foswiki.fcgi` daemon.

**For localhost:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://localhost/foswiki`{{execute}}

**For the Katacoda environment:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki`{{execute}}
