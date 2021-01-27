 In this Scenario you will build a Docker image supporting an Apache/Foswiki installation for use in a Katacoda scenario. The Scenario compares the performance five different configurations. They are:

|Environment|Supports|
|-|
|CGI|The out of the box Foswiki install with the standard CGI configuration file. This isllustrates the standard performance.|
|CGI-gz|The CGI environment, with support for the delivery of the pre-zipped .js and .css files. This will reduce the volume of data to be transported to render the page|
|PageOpt|The CGI environment with the `PageOptimizerPlugin` configured. This will reduce the number of files to be requested to render the page. 1 .js and 1 .css file|
|CGI-deflate|The CGI environment with the Apache `mod_deflate` enabled. This will reduce the volume of data to be transported to render the page|
|FCGI|The foswiki install with the Fast cgi cofiguration file and Apache mod\_fcgid= installed|

 Once you have built the container, you can run it. Since the Katacoda environment is already a container, you will be accessing your Foswiki as `https://[[katacoda ...com]]/foswiki`. In other words, the access method uses ssl.

 You can access Foswiki using regular http on port 80. But that creates many side effects, because you are then using [Cross-Origin-Resource-Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS). The side effects are associated with Ajax requests and cookies and affect login and edit. The standards in this area (CORS) are still evolving (Nov 2020) and the work arounds rather awkward.

 To avoid these issues in the Katacoda environment it is easier to configure the web server to support the https protocol. The protocol requires an `ssl` certificate and for the course this is implemented through a [self-signed certificate](https://en.wikipedia.org/wiki/Self-signed_certificate). That reduces the number of work arounds and works reliably. So for the tutorial, you must start the container with port 443 (https) listening. If you use the container outside the Katacoda environment it will work on port 80 and you won't need the self signed certificates.

 The Katacoda training environment is somewhat out of the ordinary. This setup installs Foswiki, listening at port 80 for the http protocol. Access is through the katacoda-services host, which is accessible with the https protocol. This leads to a mixed access scenario, which is by default not allowed in modern browsers. For Firefox you need to turn off all mixed content checking in [about:config](https://docs.sdl.com/LiveContent/content/en-US/SDL%20Web-v5/GUID-A96F0612-53DE-4E35-AE09-48D57146D6E4)

**Please note** that you are `root` on the server. If you are not a user with root privileges, some commands will need to be \`sudo'ed\`.
