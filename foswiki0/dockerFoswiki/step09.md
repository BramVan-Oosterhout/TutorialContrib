 The standard Apache Foswiki CGI configuration will start the `perl` interpreter for each page request received.This introduces some overhead. The overhead can be avoided by running a daemon that provides Foswiki services using the `FastCGI` protocol.

 Instead of creating a new process for each request, `FastCGI` uses persistent processes to handle a series of requests. See: [FastCGI (Wikipedia)](https://en.wikipedia.org/wiki/FastCGI).

 Apache `mod_fcgid` provides this service It starts `foswiki.fcgi` as a daemon when the first request is received. Subsequent requests are handled by the already running daemon.

 The installation is done in `Dockerfile.foswiki.fcgi`{{open}}

### Foswiki `FastCGIEngineContrib`	

 Foswiki supports `FastCGI` through the [`FastCGIEngineContrib`](https://foswiki.org/Extensions/FastCGIEngineContrib). `FastCGIEngineContrib` is installed with the Foswiki core installation. The executable `foswiki.fcgi` is located in the `bin` directory: `docker exec -it foswiki /bin/bash -c 'ls /var/www/foswiki/bin'`{{execute}}

### libfcgi-perl and apache mod\_fcgid	

 These modules are installed in `line 3 - 5` in `Dockerfile.foswiki.fcgi`{{open}} `mod_fcgid` is dependent on `perl-fcgi`

### Apache - Foswiki configuration	

 The configuration file is generated with the Foswiki Apache config generator at <https://foswiki.org/Support/ApacheConfigGenerator>. Allow Symbolic Links and select the `FastCGI` runtime engine. Accept the defaults for he remaining options.

 The generated file is supplied as foswiki.fcgi.conf. You can compare this configuration with the standard foswiki.conf with: `diff foswiki.cgi.conf foswiki.fcgi.conf`{{execute}}

* The Alias declarations change the foswiki executable to the `foswiki.fcgi` executable.
* If `mod_fcgid` is enabled, there are some control parameters set. They make sure that the continuous running process plays nicely in the environment.
* The Files declaration defines the `foswiki.fcgi` script as an fcgi daemon.

 Make the fcgi configuration available in `line 7 - 11`.

 Build the image with: `docker build -t foswiki-fcgi -f Dockerfile.foswiki.fcgi . `{{execute}}

 Stop the running `foswiki` container: `docker stop foswiki`{{execute}}

 And start the container: `docker run -d --rm --name foswiki -p 443:443 foswiki-fcgi`{{execute}}

 The performance results for the `fcgi` configuration are in seconds. Baseline figures are in brackets. The performance scripts are repeated in the Solutions. And this time there is a significant difference with the `CGI` configuration.

|First|Second|Third|CGI|Url|
|-|
|0.54|0.15|0.15|0.59|`localhost`|
|2.05|1.91|1.95|2.27|`katacoda host`|
|0.68|0.58|0.75|1.07|[Pingdom](../../..)|

