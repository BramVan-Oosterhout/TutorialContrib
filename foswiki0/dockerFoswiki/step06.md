 When you use [Pingdom](https://tools.pingdom.com/#!/) to inspect the network traffic, you will notice that there is one `html` object returned, followed by multiple stylesheets (`css`), javascripts (`js`) and images. Although the `css` and `js` files are small, they take some time to fully transmit. Compressing these text files can reduce the transmission time and improve the performance of the web site.

 Foswiki is shipped with pre-compressed files out of the box. Since not all browsers treat these files reliably, the facility is not switched on by default. It can be easily configured in the Foswiki configuration file. A modified configuration file is provided in `foswiki.cgi-gz.conf`{{open}}.

 The changes can be seen with: `diff foswiki.cgi.conf foswiki.cgi-gz.conf`{{execute}} Changes are in the access to files in the `pub` directory::

* Access to `.css` is redirected to `.css.gz`
* Access to `.js` is redirected to `.js.gz`
* Symbolic links can be followed (required for redirect)

 Implement these configuration changes by:

* building the new docker container from `Dockerfile.foswiki.cgi-gz`{{open}}: `docker build -t foswiki-cgi-gz -f Dockerfile.foswiki.cgi-gz . `{{execute}}
* stopping the running foswiki image: `docker stop foswiki`{{execute}}
* starting a new image: `docker run -d --rm --name foswiki -p 443:443 foswiki-cgi-gz`{{execute}}

 The configuration provides the following performance results. Baseline figures are in the `CGI` collumn. (The scripts are repeated in the Solutions).

|First|Second|Third|CGI|Url|
|-|
|0.62|0.59|0.58|0.59|`localhost`|
|2.16|2.13|2.22|2.27|`katacoda host`|
|1.04|1.09|1.05|1.07|[Pingdom](../../..)|

 The results are disappointingly similar. Why would that be?

