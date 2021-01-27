 With a base _Dockerfile_ in place, you can build the image with

`docker build -t kcbase -f Dockerfile.foswiki.base . `{{execute}}

 From this base image we can build various configurations of Foswiki. Let's start with the regular CGI one. We use the `Dockerfile.foswiki.cgi`{{open}} starting from the `base` image: `FROM kcbase` (`line 1`).

 To create the `foswiki.cgi.conf`{{open}} file, you can use the Foswiki [Apache config generator](https://foswiki.org/Support.ApacheConfigGenerator). Allow symbolic links and use the default for all other settings. Copy the file to the image and include it in the Apache configuration file (`line 6 - 7`)

 Build the Foswiki CGI image with `docker build -t foswiki-cgi -f Dockerfile.foswiki.cgi . `{{execute}}

 And start the Foswiki container with: `docker run -d --rm --name foswiki -p 443:443 foswiki-cgi`{{execute}}

 Run Foswiki with https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki

 You can make changes to the _Dockerfile_ using the editor and rebuild the image. To use the updated image, you must:

  * stop the running container: `docker stop foswiki`{{execute}}
  * remove the container: `docker rm foswiki`{{execute}}

    * This is not required when you run the container with the `-rm` option

  * and then start the container again: `docker run -d --rm --name foswiki -p 443:443 foswiki-cgi`{{execute}}

