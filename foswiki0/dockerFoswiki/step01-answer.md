
 If you have completed this scenarion previously and saved the image at Docker Hub, you can use it now by executing:

`docker pull bramvanoosterhout/kcfoswiki:0.1`{{execute}}

 Notice how much faster this is than building from the Dockerfile.

 After you have pulled the image you can start an instance in a container.

`docker run -d --rm --name foswiki -p 443:443 bramvanoosterhout/kcfoswiki:0.1`{{execute}}

 The running container will accept requests through https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki. User Id is `admin` and Password is `password`.
