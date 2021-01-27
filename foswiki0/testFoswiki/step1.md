## Check the environment.

What is the host name? `hostname`{{execute}}

Is the apache server running? `ps -C apache2`{{execute}}

Which Apache version is installed? `/usr/sbin/apache2 -v`{{execute}}

Does it serve the default page? `curl http://host01`{{execute}}

Click the Foswiki tab to open the browser window and view the Apache2 Ubuntu default page.
Press F12 to open the browser development console and check the performance of the retrieval of this page.
Refresh a few times. I get 734, 723, 731, 721, 729 ms to render the html.

## Download the software and install.

Download the current release from github.

`curl -L -o /tmp/Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz`{{execute}}

Install foswiki in /var/www

`tar -C /var/www -xf /tmp/Foswiki-2.1.6.tgz`{{execute}}

### Inspect what is installed
You installed all Foswiki software under /var/www in a directory Foswiki-2.1.6. `tree -d -u -p -L 3 /var/www/`{{execute}}
Foswiki has a very extensive directory structure. The top levels are important for the administrator to recognise.
Notice that the tree is owned by root. World access is limited to read only.
Apache will only write files that are owned by www-data or in group www-data.

We will configure Foswiki for Apache access in the next step.
