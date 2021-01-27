## Provide access to Foswiki for www-data (Apache).

Create a non version specific access point: `ln /var/www/Foswiki-2.1.6 /var/www/foswiki`{{execute}} !!! consider mv!!!

And change the file owner and group `chown -H -R www-data:www-data /var/www/foswiki`{{execute}}

## Configure the Apache server.

Generate the Apache configuration for Foswiki using the
[Foswiki configuration generator](https://foswiki.org/Support.ApacheConfigGenerator) on foswiki.org.
generate the configuration for Foswiki 2.x and Apache 2.4. For this installation you can use all the default settings.

The configuration generator the contents of the generated foswiki.conf file.
You can copy the text and paste it in the /etc/apache2/conf-available/foswiki.conf file:
`cat > /etc/apache2/conf-available/foswiki.conf`{{execute}}
Finish with a CTL-D

You can see what is configured using:
`grep -v '#' /etc/apache2/conf-available/foswiki.conf | grep -v '^$' | less`{{execute}}
Note that there is no Virtual host. Foswiki is available on port 80 in directory foswiki.
Enable the configuration with `a2enconf foswiki`{{execute}} and start apache with
`service apache2 restart`{{execute}}.

The Foswiki bootstrap page is now available at
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki

Bootstrap is explained in the next section.

