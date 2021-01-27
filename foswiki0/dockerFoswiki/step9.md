 Instead of creating a new process for each request, [FastCGI](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/FastCGI?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep09 "Create this topic") uses persistent processes to handle a series of requests. See: [Wikipedia](https://en.wikipedia.org/wiki/FastCGI).

 The installation is done in `Dockerfile.foswiki.fcgi`{{open}}

### Foswiki [FastCGIEngineContrib](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/FastCGIEngineContrib?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep09 "Create this topic")	

 Foswiki supports [FastCGI](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/FastCGI?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep09 "Create this topic") through the [FastCGIEngineContrib](https://foswiki.org/Extensions/FastCGIEngineContrib). [FastCGIEngineContrib](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/FastCGIEngineContrib?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep09 "Create this topic") is installed with the Foswiki core installation. The executable `foswiki.fcgi` is located in the `bin` directory: `ls /var/www/foswiki/bin`{{execute}}

### libfcgi-perl and apache mod\_fcgi	

 These modules are installed in `line 3 - 5`

### Apache mod\_fcgid	

`mod_fcgid` is dependent on `perl-fcgi`

### Apache - Foswiki configuration	

 The configuration file is generated with the Foswiki Apache config generator at <https://foswiki.org/Support/ApacheConfigGenerator>. The generated file is supplied as foswiki.fcgi.conf. You can compare this configuration with the standard foswiki.conf with: `diff /etc/apache2/conf-available/foswiki.conf foswiki.fcgi.conf`{{execute}}

* The Alias declarations change the foswiki executable to the `foswiki.fcgi` executable.
* If mod\_fcgi is enabled, there are some control parameters set. They make sure that the continuous running process plays nicely in the environment.
* The Files declaration defines the `foswiki.fcgi` script as an fcgi daemon.

 Make the fcgi configuration available in `line 7 - 11`

### Results	

 You can repeat the measurements yuo performed on the retrieval of [System](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System/WebHome). I took 5 measurements and got: 2384, 1537, 1598, 1553, 1541 ms. The first time the foswiki executable gets loaded: `ps -f -C perl`{{execute}} So we gained around 400 ms per retrieval on this platform.

## Saving the docker image	

 You can save the image as build to Docker Hub if you have registered. You need to:

* login: `docker login -u bramvanoosterhout --password-stdin`{{execute}}
* find the `IMAGE-ID`: `docker images | more`{{execute}}
* tag the image: `docker tag {IMAGE-ID} bramvanoosterhout/kcfoswiki:0.1`{{execute}}
* push the image: `docker push bramvanoosterhout/kcfoswiki:0.1`{{execute}}

 Once it is saved, you can use it anywhere with: `docker pull bramvanoosterhout/kcfoswiki:0.1`{{execute}}

