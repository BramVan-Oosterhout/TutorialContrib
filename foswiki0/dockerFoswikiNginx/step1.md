Install the docker-foswiki image

`docker run -d --name foswiki -p 80:80 timlegge/docker-foswiki`{{execute}}

You need to configure the password for the admin user. We'll do that from the command line using the shell as described in the documentation

`docker exec -w /var/www/foswiki -it foswiki /bin/bash`{{execute}}

User registration requires  _data/.htpasswd_ to exist.

`touch data/.htpasswd`{{execute}}

Clear the foswiki cache

`pushd bin; ./view /Main/WebHome -refresh=all; popd`{{execute}}

Set the admin password

`tools/configure -save -set {Password}='password'`{{execute}}

In the Katacoda environment we also tell Foswiki NOT to use session IP matching.

`tools/configure -save -set {Sessions}{UseIPMatching}='0'`{{execute}}

We need to set the default url to https:...  Note that port 80 is explicit.

`tools/configure -save -set {DefaultUrlHost}='https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com'`{{execute}}

We need to force that url to be used in all constructions, especially redirects in rest calls:

`tools/configure -save -set {ForceDefaultUrlHost}='1'`{{execute}}

And we need to allow redirection to the katacoda http:... url.

`tools/configure -save -set {PermittedRedirectHostUrls}='http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com,http://localhost'`{{execute}}

Update nginx to allow Cross-Origin Resource Sharing (ajax needs it)

`sed -i '/server_name/a      add_header "Access-Control-Allow-Origin"  *;' /etc/nginx/conf.d/default.conf`{{execute}}

And reload the configuration

`/usr/sbin/nginx -s reload`{{execute}}

For the wiki workbench, set the default connector to dbcache:

`tools/configure -save -set {JQDataTablesPlugin}{DefaultConnector}='dbcache'`{{execute}}

And this is sufficient to get the wiki workbench going.
