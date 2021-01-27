### _The plugin interface_
Foswiki capabilities are implemented as a collection of perl programs and modules that are executed on the server hardware
using a web server program to manage all incoming and outgoing messages.
The browser creates the messages sent to the web server and, on return, renders the html in the message received from the web server.
On the server, the main executable receives a message, processes it and returns a message. 

As part of the server side message processing, macros are extracted from the topic text and replaced by the expanded results.
Foswiki has implemented a mechanism whereby modules can "register" to perform the processing for particular macros.
These extensions are called plugins and can be downloaded from the Foswiki web site. The _System.InstalledPlugins_ topic lists the currently installed plugins. 

### _Plugin installation_
Plugins can be installed by a user with _admin_ rights using the _Extensions_ section on the 
[configure](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki/bin/configure) page.
We will use _FilterPlugin_ in the next steps, so we need to install that.

Select the _Install, update and remove_ tab in the section and search for the plugin you want to install.
When the plugin is found, you need to select the plugin and click install.
Foswiki will check if the plugin has dependencies on other plugins and if so, install those as well.
Foswiki will warn if there are _cpan_ dependencies, but not install those.
A record of the installation is kept here: `less -N /var/www/foswiki/working/logs/configure.log`{{execute}}

These logs include the observed dependency information. Check the logs and install all missing dependencies, before you use the plugin.

There are hundreds of plugins provided with Foswiki, and it is worthwhile to cast your eye over the list
on _foswiki.org_ in the [Extensions](https://foswiki.org/Extensions) web
as they provide solutions for many common and not so common applications.
In this section I will touch on a handful of common use plugins to illustrate the diversity and depth of functionality available. 



