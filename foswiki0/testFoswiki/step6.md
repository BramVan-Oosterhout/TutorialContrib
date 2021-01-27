Now that you have a working configuration, let's look at some performance measures.
Firefox and IE both support a development environment, which includes a performance indicator.
Press F12 and you will get a console at the bottom of your display.
On the _Network_ tab, select HTML. On the right hand side is a panelThat shows duration of the interaction.

Access System.WebHome and record the download time. Today I took 5 readings and got: 1929, 2022, 1814, 1955 and 1824 ms. You can refresh to get another reading.
Make sure the Firefox cache is disabled so you will measure rendering and download time. Not retrieval from cache.

The performance can easily be improved by some additional implementations.

## FastCGI
Instead of creating a new process for each request, FastCGI uses persistent processes to handle a series of requests.
See: [Wikipedia](https://en.wikipedia.org/wiki/FastCGI).

### Foswiki FastCGIEngineContrib
Foswiki supports FastCGI through the [FastCGIEngineContrib](https://foswiki.org/Extensions/FastCGIEngineContrib).
FastCGIEngineContrib is installed with the Foswiki core installation. The executable `foswiki.fcgi` is in the `bin` directory:
`ls /var/www/foswiki/bin`{{execute}}

### cpan libfcgi-perl
To use it, yuo may need to install the libcgi-perl module from cpan with: 
`apt-get install libfcgi-perl`{{execute}}

The Katacoda environment has that module already installed.

### Apache mod_fcgid
mod_fcgid is not installed with apache 2.4.18. So we need to install it with:
`apt-get install libapache2-mod-fcgid`{{execute}}
You get a message _which may or may not be relevant_
```
apache2_invoke: Enable module fcgid
logger: socket /dev/log: Connection refused
```

### Apache - Foswiki configuration
The configuration file is generated with the Foswiki Apache config generator at https://foswiki.org/Support/ApacheConfigGenerator.
The generated file is supplied as `foswiki.fcgi.conf`. You can compare this configuration with the standard `foswiki.conf` with:
`diff /etc/apache2/conf-available/foswiki.conf foswiki.fcgi.conf`{{execute}}
*   The Alias declarations change the foswiki executable to the `foswiki.fcgi` executable. 
*   If mod_fcgi is enabled, there are some control parameters set. They make sure that the continuous running process plays nicely in the environment.
*   The Files declaration defines the foswiki.fcgi script as an fcgi daemon.

Make the fcgi configuration available with `mv foswiki.fcgi.conf /etc/apache2/conf-available/.`{{execute}}


### Activate the new configuration
Replace the `foswiki.conf` with the `foswiki.fcgi.conf` through:
*   `a2disconf foswiki`{{execute}}
*   `a2enconf foswiki.fcgi`{{execute}}

and restart the apache server: `service apache2 restart`{{execute}}

### Results
You can repeat the measurements yuo performed on the retrieval of System.WebHome. I took 5 measurements and got:
2384, 1537, 1598, 1553, 1541 ms. The first time the foswiki executable gets loaded: `ps -f -C perl`{{execute}}
So we gained around 400 ms per retrieval on this platform.