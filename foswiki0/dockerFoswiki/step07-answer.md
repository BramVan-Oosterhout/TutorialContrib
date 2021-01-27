
 Build the `foswiki-cgi` image with: `docker build -t foswiki-cgi -f Docker.foswiki.cgi . `{{execute}}

 The results don't change much from the baseline, because the response times for the static elements are determined by the **Wait** time. Most static elements are retrieved in parallel. So whether you retrieve one file or a dozen, the wait time varies marginally.

 So why would you use `PageOptimizerPlugin`? When you read articles about web page performance, there is generally a recommendation to reduce the number of files downloaded per transaction. The rationale is not related to the server side performance. But browsers need to have all `css` before they can render the page. And all `js` is required if there is a script to be executed at startup. Getting all `css` together may therefor improve the user experience at the client end. At the server there will be little difference.

**For localhost:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://localhost/foswiki`{{execute}}

**For the Katacoda environment:**

* `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki`{{execute}}
