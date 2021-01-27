 With a _Dockerfile_ in place, you can build the image with

`docker build -t kcbase -f Dockerfile.foswiki.base . `{{execute}}

 From this base image we can build varios configurations of foswiki. Let's start with the regulaar CGI one. We use the Dockerfile.foswiki.cgi starting from the `base` image:

```

FROM kcbase

WORKDIR /usr/local/apache2/conf

# Configure the httpd server for foswiki
COPY foswiki.cgi.conf extra/.
RUN sed -i '/# Supplemental configuration/a Include conf/extra/foswiki.cgi.conf' /usr/local/apache2/conf/httpd.conf

```

`docker build -t foswiki-cgi -f Dockerfile.foswiki.cgi . `{{execute}}

 And start it with: `docker run -d --name foswiki -p 443:443 foswiki-cgi `{{execute}}

 Run Foswiki with https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki

 You can make changes to the Dockerfile using the editor and rebuild the image. To use the updated image, you must:

  * stop the running container: `docker stop foswiki`{{execute}}
  * remove the container: `docker rm foswiki`{{execute}}
  * and then start the container again: `docker run -d --name foswiki -p 443:443 kcfoswiki`{{execute}}

 You can save the image as build to Docker Hub if you have registered. You need to:

  * login: `docker login -u bramvanoosterhout --password-stdin`{{execute}}
  * find the `IMAGE-ID`: `docker images | more`{{execute}}
  * tag the image: `docker tag {IMAGE-ID} bramvanoosterhout/kcfoswiki:0.1`{{execute}}
  * push the image: `docker push bramvanoosterhout/kcfoswiki:0.1`{{execute}}

 Once it is saved, you can use it anywhere with: `docker pull bramvanoosterhout/kcfoswiki:0.1`{{execute}}

